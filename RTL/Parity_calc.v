module Parity_Calc(
      input wire CLK,
      input wire RST,
      input wire LOAD,
      input wire [7:0] P_DATA,
      /*input wire DATA_VALID,*/
      input wire PAR_TYP,
      output reg PAR_BIT
);

///Internal Regs
   
    /*reg           PAR_TYP_REG; reg [7 : 0]   DATA_REG;*/
    
always@(posedge CLK or negedge RST)
begin
  if(!RST)
    begin 
      
	PAR_BIT <= 1'b0;
      /*PAR_TYP_REG <=  1'b0; DATA_REG <= 8'b0;*/
    end
  else if(LOAD)
    begin
      
    /*  PAR_TYP_REG <=  PAR_TYP;  DATA_REG <= P_DATA;*/ 
    case(PAR_TYP)
    1'b0 :  begin PAR_BIT <= ^(P_DATA) ;end
    1'b1 :  begin PAR_BIT <= ~^(P_DATA) ;end
    endcase
    end
end
endmodule
