module SYS_TOP #(
    parameter DATA_WIDTH    = 8,
    parameter RF_ADDR       = 4,
    parameter ALU_OUT_WIDTH = 16,
    parameter ALU_FUN_WIDTH = 4
)(
    // =========================================================================
    // Primary Inputs
    // =========================================================================
    input  wire REF_CLK,
    input  wire UART_CLK,
    input  wire RST_N,
    input  wire UART_RX_IN,

    // =========================================================================
    // Primary Outputs
    // =========================================================================
    output wire UART_TX_O,
    output wire parity_error,
    output wire framing_error
);

    // =========================================================================
    // Internal Wires
    // =========================================================================

    // -------------------------------------------------------------------------
    // Synchronized Resets
    // -------------------------------------------------------------------------
    wire SYNC_UART_RST;
    wire SYNC_REF_RST;


    // -------------------------------------------------------------------------
    // Register File Interconnects
    // -------------------------------------------------------------------------
    wire [DATA_WIDTH-1:0] Operand_A;
    wire [DATA_WIDTH-1:0] Operand_B;
    wire [DATA_WIDTH-1:0] UART_Config;
    wire [DATA_WIDTH-1:0] DIV_RATIO;

    wire [DATA_WIDTH-1:0] RF_RdData;
    wire                  RF_RdData_VLD;


    // -------------------------------------------------------------------------
    // ALU / Clock Gating Interconnects
    // -------------------------------------------------------------------------
    wire                  ALU_CLK;
    wire [ALU_OUT_WIDTH-1:0] ALU_OUT;
    wire                  ALU_OUT_VLD;


    // -------------------------------------------------------------------------
    // SYS_CTRL Interconnects
    // -------------------------------------------------------------------------
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


    // -------------------------------------------------------------------------
    // Clock Divider / UART Clock Interconnects
    // -------------------------------------------------------------------------
    wire [DATA_WIDTH-1:0] DIV_RATIO_RX;

    wire UART_TX_CLK;
    wire UART_RX_CLK;


    // -------------------------------------------------------------------------
    // UART RX Interconnects
    // -------------------------------------------------------------------------
    wire [DATA_WIDTH-1:0] UART_RX_OUT;
    wire                  UART_RX_V_OUT;

    wire [DATA_WIDTH-1:0] UART_RX_SYNC;
    wire                  UART_RX_V_SYNC;


    // -------------------------------------------------------------------------
    // UART TX Interconnects
    // -------------------------------------------------------------------------
    wire [DATA_WIDTH-1:0] UART_TX_SYNC;
    wire                  UART_TX_V_SYNC;

    wire                  UART_TX_Busy;
    wire                  UART_TX_Busy_PULSE;


    // -------------------------------------------------------------------------
    // FIFO Interconnects
    // -------------------------------------------------------------------------
    wire [DATA_WIDTH-1:0] FIFO_RD_DATA;
    wire                  FIFO_FULL;
    wire                  FIFO_EMPTY;


    // =========================================================================
    // 1. Reset Synchronizers
    // =========================================================================

    // -------------------------------------------------------------------------
    // REF_CLK Domain Reset
    // -------------------------------------------------------------------------
    RST_SYNC u_RST_SYNC_REF (
        .CLK      (REF_CLK),
        .RST      (RST_N),
        .SYNC_RST (SYNC_REF_RST)
    );


    // -------------------------------------------------------------------------
    // UART_CLK Domain Reset
    // -------------------------------------------------------------------------
    RST_SYNC u_RST_SYNC_UART (
        .CLK      (UART_CLK),
        .RST      (RST_N),
        .SYNC_RST (SYNC_UART_RST)
    );


    // =========================================================================
    // 2. Data Synchronizer
    //    UART_RX -> REF_CLK Domain
    // =========================================================================

    Data_sync #(
        .BUS_WIDTH  (DATA_WIDTH),
        .NUM_STAGES (2)
    ) u_Data_sync (
        .Unsync_bus   (UART_RX_OUT),
        .bus_enable   (UART_RX_V_OUT),
        .CLK          (REF_CLK),
        .RST          (SYNC_REF_RST),
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
        .RST        (SYNC_REF_RST),
        .CLK        (REF_CLK),
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
        .CLK       (REF_CLK),
        .CLK_EN    (CLKG_EN),
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
        .RST       (SYNC_REF_RST),
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
        .CLK          (REF_CLK),
        .RST          (SYNC_REF_RST),

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
    //    REF_CLK Domain -> UART_TX_CLK Domain
    // =========================================================================

    ASYNC_FIFO #(
        .DATA_WIDTH (DATA_WIDTH),
        .ADDR_WIDTH (3)
    ) u_ASYNC_FIFO (

        // ---------------------------------------------------------------------
        // Write Domain
        // ---------------------------------------------------------------------
        .W_CLK   (REF_CLK),
        .W_RST   (SYNC_REF_RST),
        .W_INC   (UART_TX_VLD),
        .WR_DATA (UART_TX_IN),
        .FULL    (FIFO_FULL),

        // ---------------------------------------------------------------------
        // Read Domain
        // ---------------------------------------------------------------------
        .R_CLK   (UART_TX_CLK),
        .R_RST   (SYNC_UART_RST),
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
        .REF_CLK   (UART_CLK),
        .RST       (SYNC_UART_RST),
        .CLK_EN    (CLKDIV_EN),
        .DIV_RATIO (DIV_RATIO),
        .O_DIV_CLK (UART_TX_CLK)
    );


    // =========================================================================
    // 10. RX Clock Divider
    // =========================================================================

    INT_CLK_DIV u_RX_CLK_DIV (
        .REF_CLK   (UART_CLK),
        .RST       (SYNC_UART_RST),
        .CLK_EN    (CLKDIV_EN),
        .DIV_RATIO (DIV_RATIO_RX),
        .O_DIV_CLK (UART_RX_CLK)
    );


    // =========================================================================
    // 11. Pulse Generator
    // =========================================================================

    PULSE_GEN u_PULSE_GEN (
        .clk       (UART_TX_CLK),
        .rst       (SYNC_UART_RST),
        .lvl_sig   (UART_TX_Busy),
        .pulse_sig (UART_TX_Busy_PULSE)
    );


    // =========================================================================
    // 12. UART TOP
    // =========================================================================

    UART_TOP #(
        .DATA_WIDTH (DATA_WIDTH)
    ) u_UART_TOP (
        .RX_CLK    (UART_RX_CLK),
        .TX_CLK    (UART_TX_CLK),
        .RST_N     (SYNC_UART_RST),

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