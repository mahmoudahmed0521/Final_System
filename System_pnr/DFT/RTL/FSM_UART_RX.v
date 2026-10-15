module uart_rx_fsm (
    input  wire CLK,
    input  wire RST,
    input  wire RX_IN,
    input  wire PAR_EN,

    input  wire       sample_valid,
   /* input  wire       sampled_bit,*/
    input  wire       strt_glitch,
    input  wire       par_err,
    input  wire       stp_err,
    input  wire [3:0] bit_cnt,

    output reg dat_samp_en,
    output reg deser_en,
    output reg strt_chk_en,
    output reg par_chk_en,
    output reg stp_chk_en,
    output reg enable,

    output reg data_valid
);

// IN SOURCE DOMAIN:

// Connect bus_enable_reg to Data_sync input
   
       localparam IDLE   = 3'b000;
       localparam START  = 3'b001;
      localparam  DATA   = 3'b011;
      localparam  PARITY = 3'b111;
       localparam STOP   = 3'b110;


    reg 	[2:0] 		Current_st;
    reg 	[2:0]	Next_st;

    reg parity_error;

    //==================================================
    // Current State Register
    //==================================================

    always @(posedge CLK or negedge RST)
    begin
        if (!RST)
            Current_st <= IDLE;
        else
            Current_st <= Next_st;
    end

    //==================================================
    // Parity Error Register
    //==================================================

    always @(posedge CLK or negedge RST)
    begin
        if (!RST)
            parity_error <= 1'b0;

        else if (Current_st == IDLE)
            parity_error <= 1'b0;

        else if ((Current_st == PARITY) && sample_valid)
            parity_error <= par_err;
    end

    //==================================================
    // Next State Logic
    //==================================================

    always @(*)
    begin
        Next_st = Current_st;

        dat_samp_en = 1'b0;
        deser_en    = 1'b0;
        strt_chk_en = 1'b0;
        par_chk_en  = 1'b0;
        stp_chk_en  = 1'b0;
        enable      = 1'b0;
        data_valid  = 1'b0;

        case (Current_st)

            //==================================================
            // IDLE
            //==================================================

            IDLE:
            begin
                if (RX_IN == 1'b0)
                begin
                    dat_samp_en = 1'b1;
                    enable      = 1'b1;
                    Next_st     = START;
                end
            end

            //==================================================
            // START
            //==================================================

            START:
            begin
                dat_samp_en = 1'b1;
                enable      = 1'b1;
                deser_en = 1'b0;

                if (sample_valid)
                begin
                    strt_chk_en = 1'b1;

                    if (strt_glitch)
                        Next_st = IDLE;
                    else
                        Next_st = DATA;
                end
            end

            //==================================================
            // DATA
            //==================================================

            DATA:
            begin
                dat_samp_en = 1'b1;
                enable      = 1'b1;

                if (sample_valid)
                begin
                    deser_en = 1'b1;

                    if (bit_cnt == 4'd9)
                    begin
                        if (PAR_EN)
                            Next_st = PARITY;
                        else
                            Next_st = STOP;
                    end
                end
            end

            //==================================================
            // PARITY
            //==================================================

            PARITY:
            begin
                dat_samp_en = 1'b1;
                enable      = 1'b1;

                if (sample_valid)
                begin
                    par_chk_en = 1'b1;
                    Next_st    = STOP;
                end
            end

            //==================================================
            // STOP
            //==================================================

            STOP:
            begin
                dat_samp_en = 1'b1;
                enable      = 1'b1;

                if (sample_valid)
                begin
                     enable     = 1'b0;
                    stp_chk_en = 1'b1;

                    if (!parity_error && !stp_err)
                        data_valid = 1'b1;

                    Next_st = IDLE;
                end
            end

            //==================================================
            // DEFAULT
            //==================================================

            default:
            begin
                Next_st = IDLE;
            end

        endcase
    end

endmodule
