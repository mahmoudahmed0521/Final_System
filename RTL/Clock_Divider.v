module INT_CLK_DIV (
    input  wire       REF_CLK,
    input  wire       RST,
    input  wire       CLK_EN,
    input  wire [7:0] DIV_RATIO,
    output wire       O_DIV_CLK // <--- Changed from reg to wire
);

    reg       div_clk_reg;
    reg [7:0] counter;
    reg       odd_flag;

    wire [7:0] N          = DIV_RATIO >> 1;
    wire       CLK_DIV_EN = CLK_EN && (DIV_RATIO > 8'd1);

    always @(posedge REF_CLK or negedge RST) begin
        if (!RST) begin
            counter     <= 8'd0;
            div_clk_reg <= 1'b0;
            odd_flag    <= 1'b0;
        end 
        else if (CLK_DIV_EN) begin
            case (DIV_RATIO[0])
                1'b0: begin // EVEN
                    if (counter >= N - 1'b1) begin
                        counter     <= 8'd0;
                        div_clk_reg <= ~div_clk_reg;
                    end else begin
                        counter     <= counter + 8'd1;
                    end
                end

                1'b1: begin // ODD
                    if (!odd_flag) begin
                        if (counter >= N - 1'b1) begin
                            counter     <= 8'd0;
                            div_clk_reg <= ~div_clk_reg;
                            odd_flag    <= 1'b1;
                        end else begin
                            counter     <= counter + 8'd1;
                        end
                    end else begin
                        if (counter >= N) begin
                            counter     <= 8'd0;
                            div_clk_reg <= ~div_clk_reg;
                            odd_flag    <= 1'b0;
                        end else begin
                            counter     <= counter + 8'd1;
                        end
                    end
                end
            endcase
        end 
        else begin
            counter     <= 8'd0;
            div_clk_reg <= 1'b0;
            odd_flag    <= 1'b0;
        end
    end

    // BYPASS LOGIC: When DIV_RATIO <= 1, pass REF_CLK directly
    assign O_DIV_CLK = (CLK_EN) ? ((DIV_RATIO <= 8'd1) ? REF_CLK : div_clk_reg) : 1'b0;

endmodule