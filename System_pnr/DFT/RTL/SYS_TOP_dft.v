module SYS_TOP_dft #(
    parameter DATA_WIDTH    = 8,
    parameter RF_ADDR       = 4,
    parameter ALU_OUT_WIDTH = 16,
    parameter ALU_FUN_WIDTH = 4
)(
    // Functional ports
    input  wire REF_CLK,
    input  wire UART_CLK,
    input  wire RST_N,
    input  wire UART_RX_IN,
    output wire UART_TX_O,
    output wire parity_error,
    output wire framing_error,

    // Scan ports (rename to match your handout if they differ)
    input  wire scan_clk,
    input  wire scan_rst,
    input  wire test_mode,
    input  wire SE,
    input  wire [2:0] SI,
    output wire [2:0] SO
);

    // -------------------------------------------------------------------------
    // Internal wires (same as SYS_TOP)
    // -------------------------------------------------------------------------
    wire SYNC_UART_RST;
    wire SYNC_REF_RST;

    wire [DATA_WIDTH-1:0] Operand_A;
    wire [DATA_WIDTH-1:0] Operand_B;
    wire [DATA_WIDTH-1:0] UART_Config;
    wire [DATA_WIDTH-1:0] DIV_RATIO;
    wire [DATA_WIDTH-1:0] RF_RdData;
    wire                  RF_RdData_VLD;

    wire                     ALU_CLK;
    wire [ALU_OUT_WIDTH-1:0] ALU_OUT;
    wire                     ALU_OUT_VLD;

    wire [ALU_FUN_WIDTH-1:0] ALU_FUN;
    wire                     ALU_EN;
    wire                     CLKG_EN;
    wire [RF_ADDR-1:0]       RF_Address;
    wire                     RF_WrEn;
    wire                     RF_RdEn;
    wire [DATA_WIDTH-1:0]    RF_WrData;
    wire [DATA_WIDTH-1:0]    UART_TX_IN;
    wire                     UART_TX_VLD;
    wire                     CLKDIV_EN;

    wire [DATA_WIDTH-1:0] DIV_RATIO_RX;
    wire UART_TX_CLK;
    wire UART_RX_CLK;

    wire [DATA_WIDTH-1:0] UART_RX_OUT;
    wire                  UART_RX_V_OUT;
    wire [DATA_WIDTH-1:0] UART_RX_SYNC;
    wire                  UART_RX_V_SYNC;

    wire [DATA_WIDTH-1:0] UART_TX_SYNC;
    wire                  UART_TX_V_SYNC;
    wire                  UART_TX_Busy;
    wire                  UART_TX_Busy_PULSE;

    wire [DATA_WIDTH-1:0] FIFO_RD_DATA;
    wire                  FIFO_FULL;
    wire                  FIFO_EMPTY;

    // -------------------------------------------------------------------------
    // DFT muxes: test_mode = 1 selects the scan clock / scan reset
    // -------------------------------------------------------------------------
    wire REF_CLK_M;        // REF_CLK domain
    wire UART_CLK_M;       // UART_CLK domain (also feeds the dividers)
    wire UART_TX_CLK_M;    // divided TX clock
    wire UART_RX_CLK_M;    // divided RX clock
    wire REF_RST_M;        // REF domain reset
    wire UART_RST_M;       // UART domain reset

    assign REF_CLK_M     = test_mode ? scan_clk : REF_CLK;
    assign UART_CLK_M    = test_mode ? scan_clk : UART_CLK;
    assign UART_TX_CLK_M = test_mode ? scan_clk : UART_TX_CLK;
    assign UART_RX_CLK_M = test_mode ? scan_clk : UART_RX_CLK;

    assign REF_RST_M     = test_mode ? scan_rst : SYNC_REF_RST;
    assign UART_RST_M    = test_mode ? scan_rst : SYNC_UART_RST;

    // =========================================================================
    // 1. Reset Synchronizers
    // =========================================================================
    RST_SYNC u_RST_SYNC_REF (
        .CLK      (REF_CLK_M),
        .RST      (RST_N),
        .SYNC_RST (SYNC_REF_RST)
    );

    RST_SYNC u_RST_SYNC_UART (
        .CLK      (UART_CLK_M),
        .RST      (RST_N),
        .SYNC_RST (SYNC_UART_RST)
    );

    // =========================================================================
    // 2. Data Synchronizer
    // =========================================================================
    Data_sync #(
        .BUS_WIDTH  (DATA_WIDTH),
        .NUM_STAGES (2)
    ) u_Data_sync (
        .Unsync_bus   (UART_RX_OUT),
        .bus_enable   (UART_RX_V_OUT),
        .CLK          (REF_CLK_M),
        .RST          (REF_RST_M),
        .sync_bus     (UART_RX_SYNC),
        .enable_pulse (UART_RX_V_SYNC)
    );

    // =========================================================================
    // 3. Register File
    // =========================================================================
    REG_FILE #(
        .ADDR_WIDTH (RF_ADDR),
        .DATA_WIDTH (DATA_WIDTH)
    ) u_REG_FILE (
        .RD_EN      (RF_RdEn),
        .WR_EN      (RF_WrEn),
        .RST        (REF_RST_M),
        .CLK        (REF_CLK_M),
        .ADDRESS    (RF_Address),
        .WR_DATA    (RF_WrData),
        .RD_DATA    (RF_RdData),
        .RdData_VLD (RF_RdData_VLD),
        .REG0       (Operand_A),
        .REG1       (Operand_B),
        .REG2       (UART_Config),
        .REG3       (DIV_RATIO)
    );

    // =========================================================================
    // 4. Clock Gating
    // =========================================================================
    CLK_GATE u_CLK_GATE (
        .CLK       (REF_CLK_M),
        .CLK_EN    (CLKG_EN | test_mode),
        .GATED_CLK (ALU_CLK)
    );

    // =========================================================================
    // 5. ALU
    // =========================================================================
    ALU #(
        .OPER_WIDTH (DATA_WIDTH),
        .OUT_WIDTH  (ALU_OUT_WIDTH)
    ) u_ALU (
        .A         (Operand_A),
        .B         (Operand_B),
        .EN        (ALU_EN),
        .ALU_FUN   (ALU_FUN),
        .CLK       (ALU_CLK),
        .RST       (REF_RST_M),
        .ALU_OUT   (ALU_OUT),
        .OUT_VALID (ALU_OUT_VLD)
    );

    // =========================================================================
    // 6. SYS_CTRL
    // =========================================================================
    SYS_CTRL #(
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (RF_ADDR)
    ) u_SYS_CTRL (
        .CLK          (REF_CLK_M),
        .RST          (REF_RST_M),
        .ALU_OUT      (ALU_OUT),
        .OUT_Valid    (ALU_OUT_VLD),
        .RdData       (RF_RdData),
        .RdData_Valid (RF_RdData_VLD),
        .RX_P_Data    (UART_RX_SYNC),
        .RX_D_VLD     (UART_RX_V_SYNC),
        .FIFO_FULL    (FIFO_FULL),
        .ALU_FUN      (ALU_FUN),
        .EN           (ALU_EN),
        .CLK_EN       (CLKG_EN),
        .Address      (RF_Address),
        .WrEN         (RF_WrEn),
        .RdEn         (RF_RdEn),
        .WrData       (RF_WrData),
        .TX_P_Data    (UART_TX_IN),
        .TX_D_VLD     (UART_TX_VLD),
        .clk_div_en   (CLKDIV_EN)
    );

    // =========================================================================
    // 7. Asynchronous FIFO
    // =========================================================================
    ASYNC_FIFO #(
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (3)
    ) u_ASYNC_FIFO (
        .W_CLK   (REF_CLK_M),
        .W_RST   (REF_RST_M),
        .W_INC   (UART_TX_VLD),
        .WR_DATA (UART_TX_IN),
        .FULL    (FIFO_FULL),
        .R_CLK   (UART_TX_CLK_M),
        .R_RST   (UART_RST_M),
        .R_INC   (UART_TX_Busy_PULSE),
        .RD_DATA (FIFO_RD_DATA),
        .EMPTY   (FIFO_EMPTY)
    );

    // =========================================================================
    // 8. Clock Divider MUX
    // =========================================================================
    CLKDIV_MUX #(
        .WIDTH (DATA_WIDTH)
    ) u_CLKDIV_MUX (
        .IN  (UART_Config[7:2]),
        .OUT (DIV_RATIO_RX)
    );

    // =========================================================================
    // 9. TX Clock Divider
    // =========================================================================
    INT_CLK_DIV u_TX_CLK_DIV (
        .REF_CLK   (UART_CLK_M),
        .RST       (UART_RST_M),
        .CLK_EN    (CLKDIV_EN),
        .DIV_RATIO (DIV_RATIO),
        .O_DIV_CLK (UART_TX_CLK)
    );

    // =========================================================================
    // 10. RX Clock Divider
    // =========================================================================
    INT_CLK_DIV u_RX_CLK_DIV (
        .REF_CLK   (UART_CLK_M),
        .RST       (UART_RST_M),
        .CLK_EN    (CLKDIV_EN),
        .DIV_RATIO (DIV_RATIO_RX),
        .O_DIV_CLK (UART_RX_CLK)
    );

    // =========================================================================
    // 11. Pulse Generator
    // =========================================================================
    PULSE_GEN u_PULSE_GEN (
        .clk       (UART_TX_CLK_M),
        .rst       (UART_RST_M),
        .lvl_sig   (UART_TX_Busy),
        .pulse_sig (UART_TX_Busy_PULSE)
    );

    // =========================================================================
    // 12. UART TOP
    // =========================================================================
    UART_TOP #(
        .DATA_WIDTH (DATA_WIDTH)
    ) u_UART_TOP (
        .RX_CLK    (UART_RX_CLK_M),
        .TX_CLK    (UART_TX_CLK_M),
        .RST_N     (UART_RST_M),
        .RX_IN     (UART_RX_IN),
        .TX_OUT    (UART_TX_O),
        .PRESCALE  (UART_Config[7:2]),
        .PAR_EN    (UART_Config[0]),
        .PAR_TYP   (UART_Config[1]),
        .TX_P_DATA (FIFO_RD_DATA),
        .F_EMPTY   (FIFO_EMPTY),
        .RX_P_DATA (UART_RX_OUT),
        .RX_D_VLD  (UART_RX_V_OUT),
        .PAR_ERR   (parity_error),
        .STP_ERR   (framing_error),
        .TX_BUSY   (UART_TX_Busy)
    );

endmodule