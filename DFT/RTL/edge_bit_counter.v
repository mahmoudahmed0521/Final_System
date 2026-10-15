module edge_bit_counter (
    input  wire       CLK,
    input  wire       RST,
    input  wire [5:0] Prescale,
    input  wire       enable,

    output reg  [5:0] edge_cnt,
    output reg  [3:0] bit_cnt
);

/// we have 2 counters :
/// edge counter : from 0 to prescale-1
/// bit counter : from 0 to 9 or 10 based on frame length received from the tx


    always @(posedge CLK or negedge RST)
    begin
        if (!RST)
        begin
            edge_cnt        <= 6'd0;
            bit_cnt         <= 4'd0;
            
        end

        else if (enable)
        begin
          // check if we are at the end of bit
              if(edge_cnt == (Prescale- 6'd1)) 
                begin
                  edge_cnt <= 6'b0;
                  bit_cnt <=  bit_cnt + 4'b1;
                end
              else  /// i have not finished the bit yet!!!
                begin
                  edge_cnt <= edge_cnt + 6'b1;
                end
        end
      else // we are idle so everything is cleared
      begin
        edge_cnt <= 6'b0;
        bit_cnt  <= 4'b0;
        end

        
    end

endmodule
