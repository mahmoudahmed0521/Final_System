module FSM (
    input  wire       DATA_VALID,
    input  wire       PAR_EN,
    input  wire       SER_DONE,
    input  wire       RST,
    input  wire       CLK,

    output reg [2:0] MUX_SEL,
    output reg       BUSY,
    output reg       LOAD,
    output reg       SER_EN
);

    localparam IDLE   = 3'b000;
    localparam START  = 3'b001;
    localparam DATA   = 3'b010;
    localparam PARITY = 3'b011;
    localparam STOP   = 3'b111;

    reg [2:0] current_st;
    reg [2:0] next_st;

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            current_st <= IDLE;
        else
            current_st <= next_st;
    end

    always @(*) begin
        next_st = current_st;

        case (current_st)
            IDLE: begin
                if (DATA_VALID)
                    next_st = START;
            end

            START:  next_st = DATA;

            DATA: begin
                if (SER_DONE) begin
                    if (PAR_EN)
                        next_st = PARITY;
                    else
                        next_st = STOP;
                end
            end

            PARITY: next_st = STOP;
            STOP:   next_st = IDLE;

            default: next_st = IDLE;
        endcase
    end

    always @(*) begin
        BUSY    = 1'b0;
        LOAD    = 1'b0;
        SER_EN  = 1'b0;
        MUX_SEL = 3'b111;

        case (current_st)
            IDLE: begin
                MUX_SEL = 3'b111;
            end

            START: begin
                BUSY    = 1'b1;
                LOAD    = 1'b1;
                MUX_SEL = 3'b000;
            end

            DATA: begin
                BUSY    = 1'b1;
                MUX_SEL = 3'b010;

                if (!SER_DONE)
                    SER_EN = 1'b1;
            end

            PARITY: begin
                BUSY    = 1'b1;
                MUX_SEL = 3'b011;
            end

            STOP: begin
                BUSY    = 1'b1;
                MUX_SEL = 3'b001;
            end

            default: begin
                BUSY    = 1'b0;
                LOAD    = 1'b0;
                SER_EN  = 1'b0;
                MUX_SEL = 3'b111;
            end
        endcase
    end

endmodule