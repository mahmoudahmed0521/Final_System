module ASYNC_FIFO #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)(
    // Write domain
    input  wire                  W_CLK,
    input  wire                  W_RST,      // active-low reset
    input  wire                  W_INC,
    input  wire [DATA_WIDTH-1:0] WR_DATA,
    output wire                  FULL,

    // Read domain
    input  wire                  R_CLK,
    input  wire                  R_RST,      // active-low reset
    input  wire                  R_INC,
    output wire [DATA_WIDTH-1:0] RD_DATA,
    output wire                  EMPTY
);

    // RST_SYNC already produces active-low synchronized resets.
    // Do not invert these signals.
    wire wrst_n;
    wire rrst_n;

    wire [ADDR_WIDTH:0]   wptr;
    wire [ADDR_WIDTH:0]   rptr;
    wire [ADDR_WIDTH:0]   wq2_rptr;
    wire [ADDR_WIDTH:0]   rq2_wptr;
    wire [ADDR_WIDTH-1:0] waddr;
    wire [ADDR_WIDTH-1:0] raddr;

    wire winc_valid;
    wire rinc_valid;

    assign wrst_n =  W_RST;
    assign rrst_n =  R_RST;

    assign winc_valid = W_INC && !FULL;
    assign rinc_valid = R_INC && !EMPTY;

    DF_SYNC #(
        .WIDTH(ADDR_WIDTH + 1)
    ) sync_r2w (
        .dest_clk   (W_CLK),
        .dest_rst_n (wrst_n),
        .async_in   (rptr),
        .sync_out   (wq2_rptr)
    );

    DF_SYNC #(
        .WIDTH(ADDR_WIDTH + 1)
    ) sync_w2r (
        .dest_clk   (R_CLK),
        .dest_rst_n (rrst_n),
        .async_in   (wptr),
        .sync_out   (rq2_wptr)
    );

    FIFO_WR #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_fifo_wr (
        .wclk     (W_CLK),
        .wrst_n   (wrst_n),
        .winc     (W_INC),
        .wq2_rptr (wq2_rptr),
        .waddr    (waddr),
        .wptr     (wptr),
        .wfull    (FULL)
    );

    FIFO_RD #(
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_fifo_rd (
        .rclk     (R_CLK),
        .rrst_n   (rrst_n),
        .rinc     (R_INC),
        .rq2_wptr (rq2_wptr),
        .raddr    (raddr),
        .rptr     (rptr),
        .rempty   (EMPTY)
    );

    FIFO_MEM_CNTRL #(
        .DATA_WIDTH(DATA_WIDTH),
        .ADDR_WIDTH(ADDR_WIDTH)
    ) u_fifo_mem_cntrl (
        .wclk       (W_CLK),
        .winc_valid (winc_valid),
        .waddr      (waddr),
        .wdata      (WR_DATA),

        .rclk       (R_CLK),
        .rrst_n     (rrst_n),
        .rinc_valid (rinc_valid),
        .raddr      (raddr),
        .rdata      (RD_DATA)
    );

endmodule
