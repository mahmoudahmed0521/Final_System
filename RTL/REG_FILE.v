module REG_FILE # ( parameter ADDR_WIDTH = 4,
                    parameter DATA_WIDTH = 8,
                    parameter DEPTH       = (1 << ADDR_WIDTH))
(
  input     wire    RD_EN,
  input     wire    WR_EN,  
  input     wire    RST,
  input     wire    CLK,
  input     wire    [ADDR_WIDTH-1 : 0]    ADDRESS,  
  input     wire    [DATA_WIDTH-1 : 0]   WR_DATA,
  output    reg     [DATA_WIDTH-1 : 0]  RD_DATA,
  output   reg                       RdData_VLD,
  output   wire   [DATA_WIDTH-1:0]  REG0,
  output   wire   [DATA_WIDTH-1:0]  REG1,
  output   wire   [DATA_WIDTH-1:0]  REG2,
  output   wire   [DATA_WIDTH-1:0]  REG3
  );
  
 // Register File
    reg [DATA_WIDTH-1:0] RF [DEPTH-1 : 0];

    integer I;

    always @(posedge CLK or negedge RST) begin

        if (!RST) begin
          	 RdData_VLD <= 1'b0 ;
	          RD_DATA     <= 'b0 ;
            // Reset all registers
      for (I=0 ; I < DEPTH ; I = I +1)
        begin
		 if(I==2)
          RF[I] <= 'b10000001 ;
		 else if (I==3) 
          RF[I] <= 'b00100000 ;
         else
          RF[I] <= 'b0 ;		 
        end
     end

        else if (RD_EN && !WR_EN) begin

            // Read
            RD_DATA <= RF[ADDRESS];
            RdData_VLD <= 1'b1 ;

        end

        else if (WR_EN && !RD_EN) begin

            // Write
            RF[ADDRESS] <= WR_DATA;

        end
           else
     begin
	   RdData_VLD <= 1'b0 ;
     end	

    end

assign REG0 = RF[0] ;
assign REG1 = RF[1] ;
assign REG2 = RF[2] ;
assign REG3 = RF[3] ;


endmodule                                                             