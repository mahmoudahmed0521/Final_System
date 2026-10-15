module SERIALIZER (
    input  wire       CLK,
    input  wire       RST,
    input  wire       LOAD,
    input  wire [7:0] P_DATA,
    input  wire       SER_EN,

    output wire       SER_DONE,
    output wire       SER_DATA
);

    reg [7:0] shift_reg;
    reg [2:0] counter;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            shift_reg <= 8'hFF;
            counter   <= 3'd0;
        end
        else if (LOAD) begin
            shift_reg <= P_DATA;
            counter   <= 3'd0;
        end
        else if (SER_EN && !SER_DONE) begin
            shift_reg <= {1'b1, shift_reg[7:1]};
            counter   <= counter + 1'b1;
        end
    end

    assign SER_DATA = shift_reg[0];
    assign SER_DONE = (counter == 3'd7);

endmodule