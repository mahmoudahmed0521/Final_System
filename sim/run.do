
# Quit current simulation if running
quit -sim

# Create and map the work library
vlib work
vmap work work

# Compile all RTL files in the filelist (-sv enables SystemVerilog)
vlog -v -f fileList.f

# Load top module with full signal visibility for waveforms
vsim -voptargs=+acc work.SYS_TOP_tb

# Load waveform file (using relative path)
if {[file exists wave.do]} {
    do wave.do
}

# Run simulation
run -all