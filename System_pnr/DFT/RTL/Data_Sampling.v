module data_sampling (
    input  wire       CLK,
    input  wire       RST,
    input  wire       RX_IN,
    input  wire [5:0] Prescale,
    input  wire       dat_samp_en,
    input  wire [5:0] edge_cnt,

    output reg        sample_valid,
    output reg        sampled_bit
);

    reg [1:0] sampled_ones;

    wire [5:0] mid;

    assign mid = Prescale >> 1;

    always @(posedge CLK or negedge RST)
    begin
        if (!RST)
        begin
            sampled_ones <= 2'd0;
            sampled_bit  <= 1'b1;
            sample_valid <= 1'b0;
        end

       

             else if (dat_samp_en)
            begin
                 sample_valid <= 1'b0;
                // Take three samples around the middle
                if ((edge_cnt == mid - 6'd1) ||
                    (edge_cnt == mid)       ||
                    (edge_cnt == mid + 6'd1))
                begin
                    sampled_ones <= sampled_ones + RX_IN;
                end

                // End of UART bit period:
                // generate the majority-voted result
               else if (edge_cnt == Prescale - 6'd1)
                begin
                    sampled_bit  <= (sampled_ones  >= 2'd2);
                    sample_valid <= 1'b1;
                    sampled_ones <= 2'd0;
                end
            end

            else
            begin
                sampled_ones <= 2'd0;
            // Default: sample_valid is a one-clock pulse
            sample_valid <= 1'b0;
            end
        
    end

endmodule
