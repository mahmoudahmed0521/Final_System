###################################################################
# SYS_TOP_capture.sdc - Scan Capture Mode
###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA

# Mode Settings
set_case_analysis 1 [get_ports test_mode]
set_case_analysis 0 [get_ports SE]

# Driving Cells & Loads
set_driving_cell -lib_cell BUFX2M -pin Y [get_ports UART_RX_IN]

set_load -pin_load 0.1 [get_ports UART_TX_O]
set_load -pin_load 0.1 [get_ports parity_error]
set_load -pin_load 0.1 [get_ports framing_error]

# Clocks
create_clock [get_ports scan_clk] -name SCAN_CLK -period 100 -waveform {0 50}
set_clock_uncertainty -setup 0.2 [get_clocks SCAN_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks SCAN_CLK]
set_clock_transition -min -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -fall 0.05 [get_clocks SCAN_CLK]
set_clock_transition -min -rise 0.05 [get_clocks SCAN_CLK]
set_clock_transition -max -rise 0.05 [get_clocks SCAN_CLK]

create_clock [get_ports REF_CLK] -period 20 -waveform {0 10}
set_clock_uncertainty -setup 0.2 [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks REF_CLK]
set_clock_transition -min -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.05 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.05 [get_clocks REF_CLK]
set_clock_transition -max -rise 0.05 [get_clocks REF_CLK]

create_clock [get_ports UART_CLK] -period 271 -waveform {0 135.5}
set_clock_uncertainty -setup 0.2 [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks UART_CLK]
set_clock_transition -min -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.05 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.05 [get_clocks UART_CLK]
set_clock_transition -max -rise 0.05 [get_clocks UART_CLK]

# Generated Internal Clocks (-add flag included)
create_generated_clock [get_pins u_CLK_GATE/GATED_CLK] -name ALU_CLK -source [get_ports REF_CLK] -master_clock REF_CLK -divide_by 1 -add
set_clock_uncertainty -setup 0.2 [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks ALU_CLK]

create_generated_clock [get_pins u_RX_CLK_DIV/O_DIV_CLK] -name RX_CLK -source [get_ports UART_CLK] -master_clock UART_CLK -divide_by 1 -add
set_clock_uncertainty -setup 0.2 [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks RX_CLK]

create_generated_clock [get_pins u_TX_CLK_DIV/O_DIV_CLK] -name TX_CLK -source [get_ports UART_CLK] -master_clock UART_CLK -divide_by 32 -add
set_clock_uncertainty -setup 0.2 [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1 [get_clocks TX_CLK]

# False Paths for Shift Ports and Resets
set_false_path -from [get_ports RST_N]
set_false_path -from [get_ports scan_rst]
set_false_path -from [get_ports {SI[2]}]
set_false_path -from [get_ports {SI[1]}]
set_false_path -from [get_ports {SI[0]}]
set_false_path -to [get_ports {SO[2]}]
set_false_path -to [get_ports {SO[1]}]
set_false_path -to [get_ports {SO[0]}]

# Path Groups
group_path -name INOUT -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST_N] [get_ports UART_RX_IN]] -to [list [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]
group_path -name INREG -from [list [get_ports REF_CLK] [get_ports UART_CLK] [get_ports RST_N] [get_ports UART_RX_IN]]
group_path -name REGOUT -to [list [get_ports UART_TX_O] [get_ports parity_error] [get_ports framing_error]]

# Delays
set_input_delay -clock RX_CLK 54.2 [get_ports UART_RX_IN]
set_output_delay -clock TX_CLK 1734.4 [get_ports UART_TX_O]
set_output_delay -clock RX_CLK 54.2 [get_ports parity_error]
set_output_delay -clock RX_CLK 54.2 [get_ports framing_error]

# Clock Groups
set_clock_groups -asynchronous -name REF_CLK_1 \
  -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] \
  -group [list [get_clocks UART_CLK] [get_clocks TX_CLK] [get_clocks RX_CLK]] \
  -group [get_clocks SCAN_CLK]
