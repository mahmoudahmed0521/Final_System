module UART_TX_TOP (
    input  wire       CLK,
    input  wire       RST,
    input  wire       DATA_VALID,
    input  wire       PAR_EN,
    input  wire       PAR_TYP,
    input  wire [7:0] P_DATA,

    output wire      TX_OUT,
    output wire       BUSY
);

    wire       SER_EN;
    wire       SER_DONE;
    wire       SER_DATA;
    wire       PAR_BIT;
    wire [2:0] MUX_SEL;
    wire       LOAD;

    // Do NOT write: assign LOAD = DATA_VALID;

    FSM U_FSM (
        .DATA_VALID (DATA_VALID),
        .PAR_EN     (PAR_EN),
        .SER_DONE   (SER_DONE),
        .RST        (RST),
        .CLK        (CLK),
        .MUX_SEL    (MUX_SEL),
        .BUSY       (BUSY),
        .LOAD       (LOAD),
        .SER_EN     (SER_EN)
    );

    SERIALIZER U_SERIALIZER (
        .CLK      (CLK),
        .RST      (RST),
        .LOAD     (LOAD),
        .P_DATA   (P_DATA),
        .SER_EN   (SER_EN),
        .SER_DONE (SER_DONE),
        .SER_DATA (SER_DATA)
    );

    Parity_Calc U_PARITY (
        .CLK        (CLK),
        .RST        (RST),
        .LOAD       (LOAD),
        .P_DATA     (P_DATA),
       /* .DATA_VALID (DATA_VALID),*/
        .PAR_TYP    (PAR_TYP),
        .PAR_BIT    (PAR_BIT)
    );

    MUX4x1 U_MUX (
        .START_BIT (1'b0),
        .STOP_BIT  (1'b1),
        .SER_DATA  (SER_DATA),
        .PAR_BIT   (PAR_BIT),
        
        .MUX_SEL   (MUX_SEL),
        .TX_OUT    (TX_OUT)
    );

endmodule
