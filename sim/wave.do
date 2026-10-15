onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/REF_CLK
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/UART_CLK
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/RST_N
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/UART_RX_IN
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/UART_TX_O
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/parity_error
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/framing_error
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/rx_data
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/alu_result
add wave -noupdate -group TOP_MODULE -radix hexadecimal /SYS_TOP_tb/errors
add wave -noupdate -group RF_WR -radix hexadecimal /SYS_TOP_tb/rf_write/addr
add wave -noupdate -group RF_WR -radix hexadecimal /SYS_TOP_tb/rf_write/data
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/CLK
add wave -noupdate -group REG_FILE -color {Cornflower Blue} -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/RD_EN
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/WR_EN
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/RST
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/ADDRESS
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/WR_DATA
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/RD_DATA
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/RdData_VLD
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/REG0
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/REG1
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/REG2
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/REG3
add wave -noupdate -group REG_FILE -radix hexadecimal /SYS_TOP_tb/DUT/u_REG_FILE/I
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/CLK
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RST
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/ALU_OUT
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/OUT_Valid
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RdData
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RdData_Valid
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RX_P_Data
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RX_D_VLD
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/FIFO_FULL
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/ALU_FUN
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/EN
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/CLK_EN
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/Address
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/WrEN
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/RdEn
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/WrData
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/TX_P_Data
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/TX_D_VLD
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/clk_div_en
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/state
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/next_state
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/data_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/addr_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/alu_a_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/alu_b_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/alu_fun_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/alu_res_reg
add wave -noupdate -group SYS_CTRL -radix hexadecimal /SYS_TOP_tb/DUT/u_SYS_CTRL/rd_data_reg
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/CLK
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/RST
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/DATA_VALID
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/PAR_EN
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/PAR_TYP
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/P_DATA
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/TX_OUT
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/BUSY
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/SER_EN
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/SER_DONE
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/SER_DATA
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/PAR_BIT
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/MUX_SEL
add wave -noupdate -group UART_TX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_tx/LOAD
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/CLK
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/RST
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/RX_IN
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/Prescale
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/PAR_EN
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/PAR_TYP
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/P_DATA
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/data_valid
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/par_err
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/stp_err
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/dat_samp_en
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/deser_en
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/strt_chk_en
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/par_chk_en
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/stp_chk_en
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/enable
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/sample_valid
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/sampled_bit
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/strt_glitch
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/edge_cnt
add wave -noupdate -group UART_RX -radix hexadecimal /SYS_TOP_tb/DUT/u_UART_TOP/u_uart_rx/bit_cnt
add wave -noupdate -expand -group ALU_NO_OP -radix hexadecimal /SYS_TOP_tb/alu_no_op/fun
add wave -noupdate -expand -group ALU_NO_OP -radix hexadecimal /SYS_TOP_tb/alu_no_op/expected
add wave -noupdate -expand -group RF_RD -radix hexadecimal /SYS_TOP_tb/rf_read/addr
add wave -noupdate -expand -group RF_RD -radix hexadecimal /SYS_TOP_tb/rf_read/expected
add wave -noupdate -group ALU_OP -radix hexadecimal -childformat {{{/SYS_TOP_tb/alu_with_op/expected[15]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[14]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[13]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[12]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[11]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[10]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[9]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[8]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[7]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[6]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[5]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[4]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[3]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[2]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[1]} -radix binary} {{/SYS_TOP_tb/alu_with_op/expected[0]} -radix binary}} -subitemconfig {{/SYS_TOP_tb/alu_with_op/expected[15]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[14]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[13]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[12]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[11]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[10]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[9]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[8]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[7]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[6]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[5]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[4]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[3]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[2]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[1]} {-radix binary} {/SYS_TOP_tb/alu_with_op/expected[0]} {-radix binary}} /SYS_TOP_tb/alu_with_op/expected
add wave -noupdate -group ALU_OP -radix hexadecimal /SYS_TOP_tb/alu_with_op/a
add wave -noupdate -group ALU_OP -radix hexadecimal /SYS_TOP_tb/alu_with_op/b
add wave -noupdate -group ALU_OP -radix hexadecimal /SYS_TOP_tb/alu_with_op/fun
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/A
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/B
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/EN
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/ALU_FUN
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/CLK
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/RST
add wave -noupdate -expand -group ALU -radix decimal /SYS_TOP_tb/DUT/u_ALU/ALU_OUT
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/OUT_VALID
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/ALU_OUT_Comb
add wave -noupdate -expand -group ALU -radix hexadecimal /SYS_TOP_tb/DUT/u_ALU/OUT_VALID_Comb
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1054642218 ps} 0} {{Cursor 2} {4393310689 ps} 0} {{Cursor 3} {2154368900 ps} 0}
quietly wave cursor active 2
configure wave -namecolwidth 151
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits us
update
WaveRestoreZoom {4393248639 ps} {4393571361 ps}
