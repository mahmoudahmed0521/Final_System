module DF_SYNC #(
    parameter WIDTH = 4
)(
    input                       dest_clk,
    input                       dest_rst_n,   // active-low async reset
    input      [WIDTH-1:0]      async_in,
    output reg [WIDTH-1:0]      sync_out
);
 
    reg [WIDTH-1:0] sync_ff1;
 
    always @(posedge dest_clk or negedge dest_rst_n) begin
        if (!dest_rst_n) begin
            sync_ff1 <= {WIDTH{1'b0}};
            sync_out <= {WIDTH{1'b0}};
        end else begin
            sync_ff1 <= async_in;
            sync_out <= sync_ff1;
        end
    end
 
endmodule
