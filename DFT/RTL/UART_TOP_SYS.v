module UART_TOP #(  parameter DATA_WIDTH     = 8)
    (
    input  wire       RX_CLK,      // UART_CLK: used by UART_RX
    input  wire       TX_CLK,      // divided clock: from CLK_DIV
    input  wire       RST_N,

    input  wire       RX_IN,
    output wire       TX_OUT,


    //   Configration register
    input  wire [5:0] PRESCALE,
    input  wire       PAR_EN,
    input  wire       PAR_TYP,

    // From Async FIFO
    input  wire [DATA_WIDTH-1:0] TX_P_DATA,
    input  wire       F_EMPTY,

    // To Data_Sync
    output wire [DATA_WIDTH-1:0] RX_P_DATA,
    output wire       RX_D_VLD,

    output wire       PAR_ERR,
    output wire       STP_ERR,
    output wire       TX_BUSY
);



    UART_TX_TOP u_uart_tx (
        .CLK        (TX_CLK),
        .RST        (RST_N),
        .DATA_VALID (~F_EMPTY),
        .PAR_EN     (PAR_EN),
        .PAR_TYP    (PAR_TYP),
        .P_DATA     (TX_P_DATA),
        .TX_OUT     (TX_OUT),
        .BUSY       (TX_BUSY)
    );

    UART_RX_TOP u_uart_rx (
        .CLK        (RX_CLK),
        .RST        (RST_N),
        .RX_IN      (RX_IN),
        .Prescale   (PRESCALE),
        .PAR_EN     (PAR_EN),
        .PAR_TYP    (PAR_TYP),
        .P_DATA     (RX_P_DATA),
        .data_valid (RX_D_VLD),
        .par_err    (PAR_ERR),
        .stp_err    (STP_ERR)
    );




endmodule
