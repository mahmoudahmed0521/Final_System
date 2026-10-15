module parity_check (
      input   wire CLK,
    input   wire RST,
    input  wire       par_chk_en,
    input  wire       strt_chk_en,
    input  wire       PAR_TYP,
    input  wire [7:0] data,
    input  wire       sampled_bit,
    output reg       par_err
);
// we need to compare the recv_par_bit with the expectewd one

reg exp_par_bit;
always@(*)
  begin
    exp_par_bit = 1'b0;
  if (par_chk_en)
     begin
        case(PAR_TYP)
           1'b0 :  begin exp_par_bit = ^(data) ;end
            1'b1 :  begin exp_par_bit = ~^(data) ;end
        endcase
      end

end

always@(posedge CLK or negedge RST)
 begin 
   if(!RST) begin   par_err <= 1'b0; end
     
        else if(strt_chk_en) begin
      par_err <= 1'b0;
      end
     
  else if(par_chk_en) begin
      par_err <= !(exp_par_bit == sampled_bit);
      end

  end
endmodule
