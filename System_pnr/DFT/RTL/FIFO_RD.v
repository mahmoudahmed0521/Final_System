//=============================================================
// FIFO_RD.v
// Generates the FIFO read address and the EMPTY flag.
// Mirror image of FIFO_WR: binary counter internally, Gray-coded
// pointer (rptr) sent across to the write clock domain.
//=============================================================
module FIFO_RD #(
    parameter ADDR_WIDTH = 3
)(
    input                            rclk,
    input                            rrst_n,     // active-low async reset
    input                            rinc,
    input      [ADDR_WIDTH:0]        rq2_wptr,   // write pointer, synced into rclk domain (Gray)
    output     [ADDR_WIDTH-1:0]      raddr,
    output reg [ADDR_WIDTH:0]        rptr,       // Gray read pointer, sent to write domain
    output reg                       rempty
);

    reg [ADDR_WIDTH:0] rbin;
    reg [ADDR_WIDTH:0] rbin_next;
    reg [ADDR_WIDTH:0] rptr_next;
    reg                rempty_next;
    reg                read_allowed;

    assign raddr = rbin[ADDR_WIDTH-1:0];

    // A read only actually happens if the module asked for one
    // AND the FIFO is not already empty.
    always @(*) begin
        if (rinc == 1'b1 && rempty == 1'b0)
            read_allowed = 1'b1;
        else
            read_allowed = 1'b0;
    end

    // Next value of the plain binary counter
    always @(*) begin
        if (read_allowed == 1'b1)
            rbin_next = rbin + 1'b1;
        else
            rbin_next = rbin;
    end

    // Binary -> Gray conversion for the pointer that crosses domains
    always @(*) begin
        rptr_next = (rbin_next >> 1) ^ rbin_next;
    end

    always @(posedge rclk or negedge rrst_n) begin
        if (rrst_n == 1'b0) begin
            rbin <= 0;
            rptr <= 0;
        end else begin
            rbin <= rbin_next;
            rptr <= rptr_next;
        end
    end

    // EMPTY when the next read pointer equals the synced write pointer exactly
    always @(*) begin
        if (rptr_next == rq2_wptr)
            rempty_next = 1'b1;
        else
            rempty_next = 1'b0;
    end

    always @(posedge rclk or negedge rrst_n) begin
        if (rrst_n == 1'b0)
            rempty <= 1'b1;
        else
            rempty <= rempty_next;
    end

endmodule