module UART_RX_TOP  #(parameter DATA_WIDTH = 8) (
    input  wire       CLK,
    input  wire       RST,
    input  wire       RX_IN,
    input  wire [5:0] Prescale,
    input  wire       PAR_EN,
    input  wire       PAR_TYP,

    output wire [DATA_WIDTH-1:0] P_DATA,
    output wire       data_valid,
    output wire       par_err,
    output wire       stp_err
);

    //////////////////////////////////////////////////////
    // Internal Control & Data Signals
    //////////////////////////////////////////////////////
    wire       dat_samp_en;
    wire       deser_en;
    wire       strt_chk_en;
    wire       par_chk_en;
    wire       stp_chk_en;
    wire       enable;

    wire       sample_valid;
    wire       sampled_bit;

    wire       strt_glitch;

    wire [5:0] edge_cnt;
    wire [3:0] bit_cnt;

//     /// 2 ff sync as RX_in is async to the uart
//     reg rx_sync_1, rx_sync_2;

// always @(posedge CLK or negedge RST) begin
//     if (!RST) begin
//         rx_sync_1 <= 1'b1; // Idle state for UART RX is High (1)
//         rx_sync_2 <= 1'b1;
//     end else begin
//         rx_sync_1 <= RX_IN;
//         rx_sync_2 <= rx_sync_1;
//     end
// end

    //////////////////////////////////////////////////////
    // UART RX FSM
    //////////////////////////////////////////////////////
    uart_rx_fsm U_UART_RX_FSM (
        .CLK          (CLK),
        .RST          (RST),
        .RX_IN        (RX_IN),
        .PAR_EN       (PAR_EN),
        .sample_valid (sample_valid),
        /*.sampled_bit  (sampled_bit),*/
        .strt_glitch  (strt_glitch),
        .par_err      (par_err),
        .stp_err      (stp_err),
        .bit_cnt      (bit_cnt),

        .dat_samp_en  (dat_samp_en),
        .deser_en     (deser_en),
        .strt_chk_en  (strt_chk_en),
        .par_chk_en   (par_chk_en),
        .stp_chk_en   (stp_chk_en),
        .enable       (enable),
        .data_valid   (data_valid)
    );

    //////////////////////////////////////////////////////
    // EDGE / BIT COUNTER
    //////////////////////////////////////////////////////
    edge_bit_counter U_EDGE_BIT_COUNTER (
        .CLK       (CLK),
        .RST       (RST),
        .Prescale  (Prescale),
        .enable    (enable),
        .edge_cnt  (edge_cnt),
        .bit_cnt   (bit_cnt)
    );

    //////////////////////////////////////////////////////
    // DATA SAMPLING
    //////////////////////////////////////////////////////
    data_sampling U_DATA_SAMPLING (
        .CLK          (CLK),
        .RST          (RST),
        .RX_IN        (RX_IN),
        .Prescale     (Prescale),
        .dat_samp_en  (dat_samp_en),
        .edge_cnt     (edge_cnt),
        .sample_valid (sample_valid),
        .sampled_bit  (sampled_bit)
    );

    //////////////////////////////////////////////////////
    // START BIT CHECK
    //////////////////////////////////////////////////////
    strt_check U_STRT_CHECK (
        .strt_chk_en (strt_chk_en),
        .sampled_bit (sampled_bit),
        .strt_glitch (strt_glitch)
    );

    //////////////////////////////////////////////////////
    // DESERIALIZER
    //////////////////////////////////////////////////////
    deserializer U_DESERIALIZER (
        .CLK          (CLK),
        .RST          (RST),
        .deser_en     (deser_en),
        .sample_valid (sample_valid),
        .sampled_bit  (sampled_bit),
        .P_DATA       (P_DATA)
    );

    //////////////////////////////////////////////////////
    // PARITY CHECK 
    //////////////////////////////////////////////////////
    parity_check U_PARITY_CHECK (
        .CLK         (CLK),         
        .RST         (RST),         
        .par_chk_en  (par_chk_en),
        .PAR_TYP     (PAR_TYP),
        .data        (P_DATA),
        .sampled_bit (sampled_bit), 
        .strt_chk_en(strt_chk_en),
        .par_err     (par_err)
    );

    //////////////////////////////////////////////////////
    // STOP BIT CHECK
    //////////////////////////////////////////////////////
stop_check U_STOP_CHECK (
        .CLK         (CLK),
        .RST         (RST),
        .stp_chk_en  (stp_chk_en),
        .strt_chk_en (strt_chk_en), 
        .sampled_bit (sampled_bit),
        .stp_err     (stp_err)
    );
endmodule

