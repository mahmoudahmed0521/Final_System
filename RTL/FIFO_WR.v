module FIFO_WR #(
    parameter ADDR_WIDTH = 3
)(
    input                            wclk,
    input                            wrst_n,     // active-low async reset
    input                            winc,
    input      [ADDR_WIDTH:0]        wq2_rptr,   // read pointer, synced into wclk domain (Gray)
    output     [ADDR_WIDTH-1:0]      waddr,
    output reg [ADDR_WIDTH:0]        wptr,       // Gray write pointer, sent to read domain
    output reg                       wfull
);
 
    reg  [ADDR_WIDTH:0] wbin;
    wire [ADDR_WIDTH:0] wbin_next;
    wire [ADDR_WIDTH:0] wptr_next;
    wire                wfull_next;
 
    // Binary counter — only advances on a valid (non-full) write
    assign wbin_next = wbin + (winc & ~wfull);
    assign waddr     = wbin[ADDR_WIDTH-1:0];
 
    // Binary -> Gray conversion for the pointer that crosses domains
    assign wptr_next = (wbin_next >> 1) ^ wbin_next;
 
    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n) begin
            wbin <= {(ADDR_WIDTH+1){1'b0}};
            wptr <= {(ADDR_WIDTH+1){1'b0}};
        end else begin
            wbin <= wbin_next;
            wptr <= wptr_next;
        end
    end
 
    // FULL when the next write pointer equals the synced read pointer
    // with the two MSBs inverted (classic Gray-code full detection —
    // this is what distinguishes "full" from "empty" despite rptr == wptr in both cases)
    assign wfull_next = (wptr_next == {~wq2_rptr[ADDR_WIDTH:ADDR_WIDTH-1],
                                         wq2_rptr[ADDR_WIDTH-2:0]});
 
    always @(posedge wclk or negedge wrst_n) begin
        if (!wrst_n)
            wfull <= 1'b0;
        else
            wfull <= wfull_next;
    end
 
endmodule
 