module stop_check (
    input  wire CLK,
    input  wire RST,
    input  wire stp_chk_en,
    input  wire strt_chk_en,
    input  wire sampled_bit,
    output reg  stp_err
);

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            stp_err <= 1'b0;
        end else if (stp_chk_en) begin
            stp_err <= (sampled_bit != 1'b1);
        end else if (strt_chk_en) begin
            stp_err <= 1'b0; // Clear error on frame start
        end
    end

endmodule
