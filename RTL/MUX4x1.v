module MUX4x1(
    input wire START_BIT,
    input wire STOP_BIT,
    input wire SER_DATA,
    input wire PAR_BIT,
   
  
    input wire    [2:0] MUX_SEL,
    
    output reg TX_OUT
    );

always @(*) begin
    case (MUX_SEL)
        3'b000: TX_OUT = START_BIT;
        3'b001: TX_OUT = STOP_BIT;
        3'b010: TX_OUT = SER_DATA;
        3'b011: TX_OUT = PAR_BIT;
        default: TX_OUT = 1'b1;
    endcase

 end

  
endmodule

