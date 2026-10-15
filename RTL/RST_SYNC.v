module RST_SYNC #(parameter  NUM_STAGES = 3 )
                  (
input   wire    RST,
input   wire    CLK,

output  reg     SYNC_RST


);

// internal regs
reg [NUM_STAGES-1 : 0]  sync_reg;
//   1st always block for multi stage sync
    always@(posedge CLK or negedge RST)
    begin
        if(!RST)  sync_reg <= 'b0;
        else begin
            sync_reg <= {RST, sync_reg[NUM_STAGES-1:1]};
        end
    end
    //   2nd always block for output RST
    always@(posedge CLK or negedge RST)
    begin
        if(!RST)  SYNC_RST <= 'b0;
        else begin
            SYNC_RST <= sync_reg[0];
        end
    end

endmodule

