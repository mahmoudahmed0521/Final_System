###################################################################

# Created by write_sdc on Fri Oct 9 07:01:12 2026

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_RX_IN]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports SE]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[2]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[1]}]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports {SI[0]}]
set_load -pin_load 0.1 [get_ports UART_TX_O]
set_load -pin_load 0.1 [get_ports parity_error]
set_load -pin_load 0.1 [get_ports framing_error]
set_load -pin_load 0.1 [get_ports {SO[2]}]
set_load -pin_load 0.1 [get_ports {SO[1]}]
set_load -pin_load 0.1 [get_ports {SO[0]}]
set_case_analysis 1 [get_ports test_mode]
create_clock [get_ports REF_CLK]  -period 20  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLK]
create_clock [get_ports UART_CLK]  -period 271.267  -waveform {0 135.634}
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLK]
create_generated_clock [get_pins u_CLK_GATE/GATED_CLK]  -name ALU_CLK  -source [get_ports REF_CLK]  -divide_by 1
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
create_generated_clock [get_pins u_RX_CLK_DIV/O_DIV_CLK]  -name RX_CLK  -source [get_ports UART_CLK]  -divide_by 1
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
create_generated_clock [get_pins u_TX_CLK_DIV/O_DIV_CLK]  -name TX_CLK  -source [get_ports UART_CLK]  -divide_by 32
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
create_clock [get_ports scan_clk]  -name SCAN_CLK  -period 100  -waveform {0 50}
set_clock_uncertainty -setup 0.2  [get_clocks SCAN_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks SCAN_CLK]
set_clock_transition -min -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -min -rise 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -rise 0.05 [get_clocks SCAN_CLK]
set_false_path   -from [get_ports RST_N]
set_false_path   -from [get_cells u_RST_SYNC_UART/SYNC_RST_reg]  -to [get_ports UART_TX_O]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[2]}]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[1]}]
set_input_delay -clock SCAN_CLK  20  [get_ports {SI[0]}]
set_input_delay -clock SCAN_CLK  20  [get_ports SE]
set_input_delay -clock RX_CLK  54.2535  [get_ports UART_RX_IN]
set_output_delay -clock TX_CLK  1736.11  [get_ports UART_TX_O]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[2]}]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[1]}]
set_output_delay -clock SCAN_CLK  20  [get_ports {SO[0]}]
set_output_delay -clock RX_CLK  54.2535  [get_ports parity_error]
set_output_delay -clock RX_CLK  54.2535  [get_ports framing_error]
set_clock_groups -asynchronous -name REF_CLK_1 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLK] [get_clocks RX_CLK] [get_clocks TX_CLK]] -group [get_clocks SCAN_CLK]
