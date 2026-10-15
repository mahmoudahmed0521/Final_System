module strt_check (
    input  wire strt_chk_en,
    input  wire sampled_bit,
    output reg strt_glitch
);

always@(*)
begin
  
  case (strt_chk_en) 
    1'b1 : strt_glitch = sampled_bit;
    1'b0 : strt_glitch = 1'b0;
    default : strt_glitch = 1'b0;
  endcase
end
endmodule