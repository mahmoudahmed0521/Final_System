
####################################################################################
# Constraints
####################################################################################

set_fix_multiple_port_nets \
    -all \
    -buffer_constants \
    -feedthroughs


# ----------------------------------------------------------------------------
# Clock Periods
# ----------------------------------------------------------------------------

set REF_CLK_PER   20
set UART_CLK_PER  [expr 1000.0/3.6864]
set ALU_CLK_PER   $REF_CLK_PER
set RX_CLK_PER    $UART_CLK_PER
set TX_CLK_PER    [expr $UART_CLK_PER*32]

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW  0.1
set CLK_RISE       0.05
set CLK_FALL       0.05


# ----------------------------------------------------------------------------
# Clock Pins
# ----------------------------------------------------------------------------

set ALU_CLK_PIN u_CLK_GATE/GATED_CLK
set RX_CLK_PIN  u_RX_CLK_DIV/O_DIV_CLK
set TX_CLK_PIN  u_TX_CLK_DIV/O_DIV_CLK


# ----------------------------------------------------------------------------
# Master Clocks
# ----------------------------------------------------------------------------

create_clock \
    -name REF_CLK \
    -period $REF_CLK_PER \
    -waveform "0 [expr $REF_CLK_PER/2]" \
    [get_ports REF_CLK]

create_clock \
    -name UART_CLK \
    -period $UART_CLK_PER \
    -waveform "0 [expr $UART_CLK_PER/2]" \
    [get_ports UART_CLK]


# ----------------------------------------------------------------------------
# Generated Clocks
# ----------------------------------------------------------------------------

create_generated_clock \
    -name ALU_CLK \
    -source [get_ports REF_CLK] \
    -divide_by 1 \
    [get_pins $ALU_CLK_PIN]

create_generated_clock \
    -name RX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 1 \
    [get_pins $RX_CLK_PIN]

create_generated_clock \
    -name TX_CLK \
    -source [get_ports UART_CLK] \
    -divide_by 32 \
    [get_pins $TX_CLK_PIN]


# ---- Scan clock ----
set SCAN_CLK_PER 100

create_clock -name SCAN_CLK -period $SCAN_CLK_PER \
    -waveform "0 [expr $SCAN_CLK_PER/2]" [get_ports scan_clk]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks SCAN_CLK]
set_clock_uncertainty -hold  $CLK_HOLD_SKEW  [get_clocks SCAN_CLK]
set_clock_transition -rise $CLK_RISE [get_clocks SCAN_CLK]
set_clock_transition -fall $CLK_FALL [get_clocks SCAN_CLK]
set_dont_touch_network [get_clocks SCAN_CLK]
set_dont_touch_network [get_ports scan_rst]

# ---- Scan I/O delays (20% of scan period) ----
set_input_delay  [expr 0.2*$SCAN_CLK_PER] -clock SCAN_CLK [get_ports {SI[*] SE}]
set_output_delay [expr 0.2*$SCAN_CLK_PER] -clock SCAN_CLK [get_ports SO[*]]

# ---- Driving cell / load ----
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c \
    -lib_cell BUFX2M -pin Y [get_ports {SI[*] SE}]
set_load 0.1 [get_ports SO[*]]




# ---- Run timing in scan mode ----
set_case_analysis 1 [get_port test_mode]


# ----------------------------------------------------------------------------
# Clock Collections
# ----------------------------------------------------------------------------

set ALL_CLKS [get_clocks {
    REF_CLK
    UART_CLK
    ALU_CLK
    RX_CLK
    TX_CLK
}]

set MASTER_CLKS [get_clocks {
    REF_CLK
    UART_CLK
}]


# ----------------------------------------------------------------------------
# Clock Uncertainty
# ----------------------------------------------------------------------------

set_clock_uncertainty \
    -setup $CLK_SETUP_SKEW \
    $ALL_CLKS

set_clock_uncertainty \
    -hold $CLK_HOLD_SKEW \
    $ALL_CLKS


# ----------------------------------------------------------------------------
# Clock Transition
# ----------------------------------------------------------------------------

set_clock_transition \
    -rise $CLK_RISE \
    $MASTER_CLKS

set_clock_transition \
    -fall $CLK_FALL \
    $MASTER_CLKS


# ----------------------------------------------------------------------------
# Don't Touch Clock / Reset Networks
# ----------------------------------------------------------------------------

set_dont_touch_network $ALL_CLKS

set_dont_touch_network \
    [get_ports RST_N]


# ----------------------------------------------------------------------------
# Clock Relationship
# ----------------------------------------------------------------------------
# REF_CLK/ALU_CLK and UART_CLK/RX_CLK/TX_CLK are asynchronous domains.
#
# RX_CLK and TX_CLK are generated from UART_CLK, therefore they remain
# related to UART_CLK.

set_clock_groups \
    -asynchronous \
    -group [get_clocks {
        REF_CLK
        ALU_CLK
    }] \
    -group [get_clocks {
        UART_CLK
        RX_CLK
        TX_CLK
    }] \
 -group [get_clocks SCAN_CLK]



# ----------------------------------------------------------------------------
# Reset Timing Exceptions
# ----------------------------------------------------------------------------
# Reset is a control signal and should not be analyzed as normal
# synchronous functional data.
#
# The synchronized reset signal is also excluded from normal timing
# analysis to prevent the reset-control path from being evaluated as
# a functional TX data path.

set_false_path \
    -from [get_ports RST_N]

set_false_path \
    -from [get_cells u_RST_SYNC_UART/SYNC_RST_reg] \
    -to   [get_ports UART_TX_O]


# ----------------------------------------------------------------------------
# Input / Output Delays
# ----------------------------------------------------------------------------

set in_delay_rx  [expr 0.2*$RX_CLK_PER]
set out_delay_tx [expr 0.2*$TX_CLK_PER]
set out_delay_rx [expr 0.2*$RX_CLK_PER]


# ----------------------------------------------------------------------------
# RX Input
# ----------------------------------------------------------------------------

set_input_delay \
    $in_delay_rx \
    -clock RX_CLK \
    [get_ports UART_RX_IN]


# ----------------------------------------------------------------------------
# TX Output
# ----------------------------------------------------------------------------

set_output_delay \
    $out_delay_tx \
    -clock TX_CLK \
    [get_ports UART_TX_O]


# ----------------------------------------------------------------------------
# RX Status Outputs
# ----------------------------------------------------------------------------

set_output_delay \
    $out_delay_rx \
    -clock RX_CLK \
    [get_ports parity_error]

set_output_delay \
    $out_delay_rx \
    -clock RX_CLK \
    [get_ports framing_error]


# ----------------------------------------------------------------------------
# Driving Cell
# ----------------------------------------------------------------------------

set_driving_cell \
    -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c \
    -lib_cell BUFX2M \
    -pin Y \
    [get_ports UART_RX_IN]


# ----------------------------------------------------------------------------
# Output Load
# ----------------------------------------------------------------------------

set_load 0.1 [get_ports UART_TX_O]

set_load 0.1 [get_ports parity_error]

set_load 0.1 [get_ports framing_error]


# ----------------------------------------------------------------------------
# Operating Conditions
# ----------------------------------------------------------------------------

set_operating_conditions \
    -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
    -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" \
    -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" \
    -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

