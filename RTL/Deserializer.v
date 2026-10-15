module deserializer (
    input  wire       CLK,
    input  wire       RST,         
    input  wire       deser_en,     
    input  wire       sample_valid,
    input  wire       sampled_bit,
    output reg  [7:0] P_DATA
);
 

    always @(posedge CLK or negedge RST) begin
        if (!RST)
            P_DATA <= 8'd0;
        else if (deser_en && sample_valid)
            P_DATA <= {sampled_bit, P_DATA[7:1]};
    end
 
endmodule