`timescale 1ns/1ps

module SYS_TOP_tb;

    // =========================================================================
    // Parameters
    // =========================================================================
    localparam REF_PERIOD  = 20.0;        // 50 MHz
    localparam UART_PERIOD = 271.267;     // 3.6864 MHz
    localparam BIT_PERIOD  = 8680.56;     // 115200 baud (UART_CLK / 32)

    // Commands
    localparam RF_WR_CMD  = 8'hAA;
    localparam RF_RD_CMD  = 8'hBB;
    localparam ALU_W_OP   = 8'hCC;
    localparam ALU_W_NOP  = 8'hDD;

    // ALU functions  ** adjust to YOUR ALU_FUN encoding **
    localparam ADD = 4'b0000;
    localparam SUB = 4'b0001;
    localparam MUL = 4'b0010;
    localparam DIV = 4'b0011;

    // =========================================================================
    // Signals
    // =========================================================================
    reg  REF_CLK;
    reg  UART_CLK;
    reg  RST_N;
    reg  UART_RX_IN;
    wire UART_TX_O;
    wire parity_error;
    wire framing_error;

    reg [7:0]  rx_data;      // last frame received from the DUT
    reg [15:0] alu_result;   // two frames combined
    integer    errors;

    // =========================================================================
    // DUT
    // =========================================================================
    SYS_TOP DUT (
        .REF_CLK       (REF_CLK),
        .UART_CLK      (UART_CLK),
        .RST_N         (RST_N),
        .UART_RX_IN    (UART_RX_IN),
        .UART_TX_O     (UART_TX_O),
        .parity_error  (parity_error),
        .framing_error (framing_error)
    );

    // =========================================================================
    // Clocks
    // =========================================================================
    initial REF_CLK = 0;
    always #(REF_PERIOD/2) REF_CLK = ~REF_CLK;

    initial UART_CLK = 0;
    always #(UART_PERIOD/2) UART_CLK = ~UART_CLK;

    // =========================================================================
    // Tasks
    // =========================================================================

    // Send one UART frame to the DUT: start, 8 data bits (LSB first),
    // even parity, stop
    task send_frame (input [7:0] data);
        integer i;
        begin
            UART_RX_IN = 1'b0;                  // start
            #(BIT_PERIOD);
            for (i = 0; i < 8; i = i + 1) begin // data
                UART_RX_IN = data[i];
                #(BIT_PERIOD);
            end
            UART_RX_IN = ^data;                 // even parity
            #(BIT_PERIOD);
            UART_RX_IN = 1'b1;                  // stop
            #(BIT_PERIOD);
        end
    endtask

    // Receive one UART frame from the DUT (samples in the middle of each bit)
    task receive_frame (output [7:0] data);
        integer i;
        begin
            @(negedge UART_TX_O);               // start bit
            #(BIT_PERIOD/2);
            for (i = 0; i < 8; i = i + 1) begin
                #(BIT_PERIOD);
                data[i] = UART_TX_O;
            end
            #(BIT_PERIOD);                      // parity bit
            if (UART_TX_O !== ^data) begin
                $display("  ERROR: TX parity wrong");
                errors = errors + 1;
            end
            #(BIT_PERIOD);                      // stop bit
            if (UART_TX_O !== 1'b1) begin
                $display("  ERROR: TX stop bit wrong");
                errors = errors + 1;
            end
        end
    endtask

    // Compare and print PASS/FAIL
    task check (input [15:0] got, input [15:0] expected);
        begin
            if (got === expected)
                $display("  PASS: got 0x%h", got);
            else begin
                $display("  FAIL: got 0x%h, expected 0x%h", got, expected);
                errors = errors + 1;
            end
        end
    endtask

    // RF write: CMD, Addr, Data -> no response from the DUT
    task rf_write (input [7:0] addr, input [7:0] data);
        begin
            send_frame(RF_WR_CMD);
            send_frame(addr);
            send_frame(data);
        end
    endtask

    // RF read: CMD, Addr -> expect the data back
    task rf_read (input [7:0] addr, input [7:0] expected);
        begin
            send_frame(RF_RD_CMD);
            send_frame(addr);
            receive_frame(rx_data);
            check(rx_data, expected);
        end
    endtask

    // ALU with operands: CMD, A, B, FUN -> 2 result frames (LSB first)
    task alu_with_op (input [7:0] a, input [7:0] b, input [3:0] fun,
                      input [15:0] expected);
        begin
            send_frame(ALU_W_OP);
            send_frame(a);
            send_frame(b);
            send_frame({4'b0, fun});
            receive_frame(alu_result[7:0]);
            receive_frame(alu_result[15:8]);
            check(alu_result, expected);
        end
    endtask

    // ALU without operands: CMD, FUN -> uses the A/B already in REG0/REG1
    task alu_no_op (input [3:0] fun, input [15:0] expected);
        begin
            send_frame(ALU_W_NOP);
            send_frame({4'b0, fun});
            receive_frame(alu_result[7:0]);
            receive_frame(alu_result[15:8]);
            check(alu_result, expected);
        end
    endtask

    // =========================================================================
    // Test sequence
    // =========================================================================
    initial begin
        errors     = 0;
        UART_RX_IN = 1'b1;      // idle
        RST_N      = 1'b0;
        #(5 * REF_PERIOD);
        RST_N      = 1'b1;
        #(20 * REF_PERIOD);

        // ---------------------------------------------------------------
        $display("TEST 1: configuration (REG2, REG3)");
        // REG2 = {prescale 32, parity type 0, parity enable 1} = 0x81
        rf_write(8'h02, 8'h81);
        // REG3 = division ratio 32
        rf_write(8'h03, 8'h20);

        // ---------------------------------------------------------------
        $display("TEST 2: RF write then read back");
        rf_write(8'h05, 8'hA5);
        rf_read (8'h05, 8'hA5);
        rf_write(8'h10, 8'h3C);
        rf_read (8'h10, 8'h3C);

        // ---------------------------------------------------------------
        $display("TEST 3: ALU with operands (A = 5, B = 3)  ADD-SUB-MULT-DIV");
        alu_with_op(8'd5, 8'd3, ADD, 16'd8);
        alu_with_op(8'd5, 8'd3, SUB, 16'd2);
        alu_with_op(8'd5, 8'd3, MUL, 16'd15);
        alu_with_op(8'd6, 8'd3, DIV, 16'd2);

        // ---------------------------------------------------------------
        $display("TEST 4: ALU without operands (A = 6, B = 3 still in REG0/REG1)  ADD-SUB");
        alu_no_op(ADD, 16'd9);
        alu_no_op(SUB, 16'd3);

        // ---------------------------------------------------------------
        $display("TEST 5: UART error flags");
        if (parity_error || framing_error) begin
            $display("  FAIL: parity_error = %b, framing_error = %b",
                      parity_error, framing_error);
            errors = errors + 1;
        end else
            $display("  PASS: no parity/framing errors");

        // ---------------------------------------------------------------
        if (errors == 0) $display("ALL TESTS PASSED");
        else             $display("%0d ERROR(S)", errors);
        $finish;
    end

 
    // Watchdog
    initial begin
        #50_000_000;
        $display("TIMEOUT");
        $finish;
    end

endmodule