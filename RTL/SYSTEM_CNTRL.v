module SYS_CTRL #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 4
)(
    input  wire                  CLK,
    input  wire                  RST,

    input  wire [15:0]           ALU_OUT,
    input  wire                  OUT_Valid,

    input  wire [DATA_WIDTH-1:0] RdData,
    input  wire                  RdData_Valid,

    input  wire [DATA_WIDTH-1:0] RX_P_Data,
    input  wire                  RX_D_VLD,

    input  wire                  FIFO_FULL,

    output reg  [3:0]            ALU_FUN,
    output reg                   EN,
    output reg                   CLK_EN,

    output reg  [ADDR_WIDTH-1:0] Address,
    output reg                   WrEN,
    output reg                   RdEn,
    output reg  [DATA_WIDTH-1:0] WrData,

    output reg  [DATA_WIDTH-1:0] TX_P_Data,
    output reg                   TX_D_VLD,

    output wire                  clk_div_en
);

    localparam [7:0] OPC_RFWR   = 8'hAA;
    localparam [7:0] OPC_RFRD   = 8'hBB;
    localparam [7:0] OPC_ALUOP  = 8'hCC;
    localparam [7:0] OPC_ALUNOP = 8'hDD;

    localparam [4:0] S_IDLE            = 5'd0;

    // Strict specification: AA, ADDRESS, DATA
    localparam [4:0] S_RFWR_ADDR       = 5'd1;
    localparam [4:0] S_RFWR_DATA       = 5'd2;
    localparam [4:0] S_RFWR_EXECUTE    = 5'd3;

    localparam [4:0] S_RFRD_ADDR       = 5'd4;
    localparam [4:0] S_RFRD_EXECUTE    = 5'd5;
    localparam [4:0] S_RFRD_WAIT       = 5'd6;
    localparam [4:0] S_RFRD_TX         = 5'd7;

    localparam [4:0] S_ALU_A           = 5'd8;
    localparam [4:0] S_ALU_B           = 5'd9;
    localparam [4:0] S_ALU_FUN         = 5'd10;
    localparam [4:0] S_ALU_WR_A        = 5'd11;
    localparam [4:0] S_ALU_WR_B        = 5'd12;
    localparam [4:0] S_ALU_EXECUTE     = 5'd13;
    localparam [4:0] S_ALU_WAIT        = 5'd14;

    localparam [4:0] S_ALUNOP_FUN      = 5'd15;
    localparam [4:0] S_ALUNOP_EXECUTE  = 5'd16;

    localparam [4:0] S_ALU_TX_LOW      = 5'd17;
    localparam [4:0] S_ALU_TX_HIGH     = 5'd18;

    reg [4:0] state;
    reg [4:0] next_state;

    reg [DATA_WIDTH-1:0] data_reg;
    reg [ADDR_WIDTH-1:0] addr_reg;

    reg [DATA_WIDTH-1:0] alu_a_reg;
    reg [DATA_WIDTH-1:0] alu_b_reg;
    reg [DATA_WIDTH-1:0] alu_fun_reg;

    reg [15:0]           alu_res_reg;
    reg [DATA_WIDTH-1:0] rd_data_reg;

    assign clk_div_en = 1'b1;

    //============================================================
    // State and data registers
    //============================================================
always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        state       <= S_IDLE;
        data_reg    <= {DATA_WIDTH{1'b0}};
        addr_reg    <= {ADDR_WIDTH{1'b0}};
        alu_a_reg   <= {DATA_WIDTH{1'b0}};
        alu_b_reg   <= {DATA_WIDTH{1'b0}};
        alu_fun_reg <= {DATA_WIDTH{1'b0}};
        alu_res_reg <= 16'h0000;
        rd_data_reg <= {DATA_WIDTH{1'b0}};
    end
    else begin
        state <= next_state;

        // Combined conditions for addr_reg
        if (((state == S_RFWR_ADDR) || (state == S_RFRD_ADDR)) && RX_D_VLD)
            addr_reg <= RX_P_Data[ADDR_WIDTH-1:0];

        if ((state == S_RFWR_DATA) && RX_D_VLD)
            data_reg <= RX_P_Data;

        if ((state == S_ALU_A) && RX_D_VLD)
            alu_a_reg <= RX_P_Data;

        if ((state == S_ALU_B) && RX_D_VLD)
            alu_b_reg <= RX_P_Data;

        // Combined conditions for alu_fun_reg
        if (((state == S_ALU_FUN) || (state == S_ALUNOP_FUN)) && RX_D_VLD)
            alu_fun_reg <= RX_P_Data;

        if ((state == S_RFRD_WAIT) && RdData_Valid)
            rd_data_reg <= RdData;

        if ((state == S_ALU_WAIT) && OUT_Valid)
            alu_res_reg <= ALU_OUT;
    end
end

    //============================================================
    // Next-state logic
    //============================================================

    always @(*) begin
        next_state = state;

        case (state)
            S_IDLE: begin
                if (RX_D_VLD) begin
                    case (RX_P_Data)
                        OPC_RFWR:   next_state = S_RFWR_ADDR;
                        OPC_RFRD:   next_state = S_RFRD_ADDR;
                        OPC_ALUOP:  next_state = S_ALU_A;
                        OPC_ALUNOP: next_state = S_ALUNOP_FUN;
                        default:    next_state = S_IDLE;
                    endcase
                end
            end

            // AA, ADDRESS, DATA
            S_RFWR_ADDR: begin
                if (RX_D_VLD)
                    next_state = S_RFWR_DATA;
            end

            S_RFWR_DATA: begin
                if (RX_D_VLD)
                    next_state = S_RFWR_EXECUTE;
            end

            S_RFWR_EXECUTE:
                next_state = S_IDLE;

            // BB, ADDRESS
            S_RFRD_ADDR: begin
                if (RX_D_VLD)
                    next_state = S_RFRD_EXECUTE;
            end

            S_RFRD_EXECUTE:
                next_state = S_RFRD_WAIT;

            S_RFRD_WAIT: begin
                if (RdData_Valid)
                    next_state = S_RFRD_TX;
            end

            S_RFRD_TX: begin
                if (!FIFO_FULL)
                    next_state = S_IDLE;
            end

            // CC, A, B, FUN
            S_ALU_A: begin
                if (RX_D_VLD)
                    next_state = S_ALU_B;
            end

            S_ALU_B: begin
                if (RX_D_VLD)
                    next_state = S_ALU_FUN;
            end

            S_ALU_FUN: begin
                if (RX_D_VLD)
                    next_state = S_ALU_WR_A;
            end

            S_ALU_WR_A:
                next_state = S_ALU_WR_B;

            S_ALU_WR_B:
                next_state = S_ALU_EXECUTE;

            S_ALU_EXECUTE:
                next_state = S_ALU_WAIT;

            S_ALU_WAIT: begin
                if (OUT_Valid)
                    next_state = S_ALU_TX_LOW;
            end

            // DD, FUN
            S_ALUNOP_FUN: begin
                if (RX_D_VLD)
                    next_state = S_ALUNOP_EXECUTE;
            end

            S_ALUNOP_EXECUTE:
                next_state = S_ALU_WAIT;

            S_ALU_TX_LOW: begin
                if (!FIFO_FULL)
                    next_state = S_ALU_TX_HIGH;
            end

            S_ALU_TX_HIGH: begin
                if (!FIFO_FULL)
                    next_state = S_IDLE;
            end

            default:
                next_state = S_IDLE;
        endcase
    end

    //============================================================
    // Output logic
    //============================================================

    always @(*) begin
        ALU_FUN   = 4'h0;
        EN        = 1'b0;
        CLK_EN    = 1'b0;

        Address   = {ADDR_WIDTH{1'b0}};
        WrEN      = 1'b0;
        RdEn      = 1'b0;
        WrData    = {DATA_WIDTH{1'b0}};

        TX_P_Data = {DATA_WIDTH{1'b0}};
        TX_D_VLD  = 1'b0;

        case (state)
            S_RFWR_EXECUTE: begin
                WrEN    = 1'b1;
                Address = addr_reg;
                WrData  = data_reg;
            end

            S_RFRD_EXECUTE: begin
                RdEn    = 1'b1;
                Address = addr_reg;
            end

            S_ALU_WR_A: begin
                WrEN    = 1'b1;
                Address = {ADDR_WIDTH{1'b0}};
                WrData  = alu_a_reg;
            end

            S_ALU_WR_B: begin
                WrEN    = 1'b1;
                Address = {{(ADDR_WIDTH-1){1'b0}}, 1'b1};
                WrData  = alu_b_reg;
            end

            S_ALU_EXECUTE,
            S_ALUNOP_EXECUTE: begin
                ALU_FUN = alu_fun_reg[3:0];
                CLK_EN  = 1'b1;
                EN      = 1'b1;
            end

            S_ALU_WAIT: begin
                ALU_FUN = alu_fun_reg[3:0];
                CLK_EN  = 1'b1;
            end

            S_RFRD_TX: begin
                if (!FIFO_FULL) begin
                    TX_P_Data = rd_data_reg;
                    TX_D_VLD  = 1'b1;
                end
            end

            S_ALU_TX_LOW: begin
                if (!FIFO_FULL) begin
                    TX_P_Data = alu_res_reg[7:0];
                    TX_D_VLD  = 1'b1;
                end
            end

            S_ALU_TX_HIGH: begin
                if (!FIFO_FULL) begin
                    TX_P_Data = alu_res_reg[15:8];
                    TX_D_VLD  = 1'b1;
                end
            end
        endcase
    end

endmodule
