###################################################################
########################### Clean Up ##############################
###################################################################

# Clear design memory if re-running in active dc_shell session
remove_design -all

########################### Define Top Module ############################

set top_module SYS_TOP_dft

##################### Define Working Library Directory ######################

define_design_lib work -path ./work

############################# Formality Setup File ##########################

set_svf $top_module.svf

################## Design Compiler Library Setup ######################

puts "###########################################"
puts "#        Setting Design Libraries         #"
puts "###########################################"

# Add all standard cell and RTL directories to search path

lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/DFT/std_cells
lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/DFT/RTL
lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/DFT

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

## Standard Cell libraries
set target_library [list $SSLIB $TTLIB $FFLIB]

## Link libraries
set link_library [list * $SSLIB $TTLIB $FFLIB]

######################## Reading RTL Files #################################

puts "###########################################"
puts "#              Reading RTL Files          #"
puts "###########################################"

# Read all .v files
set rtl_files [glob /mnt/hgfs/Shared_Folder/SYSTEM/DFT/RTL/*.v]

foreach f $rtl_files {
    analyze -format verilog -library work $f
}
###################### Defining Toplevel ###################################

elaborate $top_module
current_design $top_module

#################### Linking All Design Parts #########################
puts "###############################################"
puts "######## Linking All The Design Parts ########"
puts "###############################################"

link

#################### Checking Design Consistency #########################
puts "###############################################"
puts "######## Checking Design Consistency ##########"
puts "###############################################"

check_design

#################### Define Design Constraints #########################
puts "###############################################"
puts "############ Design Constraints #### ##########"
puts "###############################################"

source ./cons_dft.tcl

###################### Mapping and Optimization ########################
puts "###############################################"
puts "########## Initial Mapping & Optimization #####"
puts "###############################################"

compile -scan

#################### Configure Scan Chains #########################
puts "###############################################"
puts "############ Configure Scan Chains ############"
puts "###############################################"

set_scan_configuration -clock_mixing no_mix \
                       -style multiplexed_flip_flop \
                       -replace true \
                       -max_length 100

########################## Define DFT Signals ##########################

set_dft_signal -port scan_clk  -type ScanClock   -view existing_dft  -timing {30 60}
set_dft_signal -port scan_rst  -type Reset       -view existing_dft  -active_state 0
set_dft_signal -port test_mode -type Constant    -view existing_dft  -active_state 1
set_dft_signal -port test_mode -type TestMode    -view spec          -active_state 1
set_dft_signal -port SE        -type ScanEnable  -view spec          -active_state 1 -usage scan
set_dft_signal -port SI        -type ScanDataIn  -view spec
set_dft_signal -port SO        -type ScanDataOut -view spec

############################# Create Test Protocol #######################

# Preclock Measure Protocol timing variables
set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

create_test_protocol

###################### Pre-DFT Design Rule Checking #######################

dft_drc -verbose

############################# Preview DFT ##############################

preview_dft -show scan_summary

############################# Insert DFT ##############################

insert_dft
compile -scan -incremental

###################### Post-DFT Design Rule Checking #######################

dft_drc -verbose -coverage_estimate

##################### Close Formality Setup File ###########################

set_svf -off

#############################################################################
# Write Out Files & Reports
#############################################################################

# Create target output directories automatically
file mkdir netlists sdf sdc reports

write_file -format ddc -hierarchy -output netlists/$top_module.ddc
write_file -format verilog -hierarchy -output netlists/$top_module.v
write_sdf sdf/$top_module.sdf
write_sdc -nosplit sdc/$top_module.sdc

####################### Reporting ##########################################

report_area -hierarchy > reports/area.rpt
report_power -hierarchy > reports/power.rpt
report_timing -delay_type min > reports/hold.rpt
report_timing -delay_type max > reports/setup.rpt
report_clock -attributes > reports/clocks.rpt
