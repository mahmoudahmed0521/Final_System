module FIFO_MEM_CNTRL #(
    parameter DATA_WIDTH = 8,
    parameter ADDR_WIDTH = 3
)(
    // Write port
    input  wire                  wclk,
    input  wire                  winc_valid,
    input  wire [ADDR_WIDTH-1:0] waddr,
    input  wire [DATA_WIDTH-1:0] wdata,

    // Read port
    input  wire                  rclk,
    input  wire                  rrst_n,
    input  wire                  rinc_valid,
    input  wire [ADDR_WIDTH-1:0] raddr,
    output wire [DATA_WIDTH-1:0] rdata
);

    localparam DEPTH = 1 << ADDR_WIDTH;

    reg [DATA_WIDTH-1:0] mem [0:DEPTH-1];

    // Synchronous write port
    always @(posedge wclk) begin
        if (winc_valid)
            mem[waddr] <= wdata;
    end

    // Combinational read port (first-word-fall-through):
    // the word at the read pointer is visible as soon as EMPTY is low.
    // A pop only advances raddr, it does not load the data.
    assign rdata = mem[raddr];

endmodule