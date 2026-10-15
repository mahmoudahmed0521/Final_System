####################################################################################
#                           Define Top Module
####################################################################################

set top_module SYS_TOP


####################################################################################
#                           Working Library
####################################################################################

define_design_lib work -path ./work


####################################################################################
#                           Formality Setup File
####################################################################################

set_svf $top_module.svf


####################################################################################
#                           Design Compiler Libraries
####################################################################################

puts "###########################################"
puts "#      Setting Design Libraries            #"
puts "###########################################"


# ---------------- Search paths ----------------

lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/std_cells
lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/RTL
lappend search_path /mnt/hgfs/Shared_Folder/SYSTEM/SYN


# ---------------- Standard cell libraries ----------------

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"


# ---------------- Target / Link libraries ----------------

set target_library [list \
    $SSLIB \
    $TTLIB \
    $FFLIB \
]


set link_library [list \
    * \
    $SSLIB \
    $TTLIB \
    $FFLIB \
]


####################################################################################
#                           Reading RTL Files
####################################################################################

puts "###########################################"
puts "#             Reading RTL Files           #"
puts "###########################################"


set file_format verilog

set RTL_DIR "/mnt/hgfs/Shared_Folder/SYSTEM/RTL"

set RTL_FILES [glob -nocomplain "$RTL_DIR/*.v"]


if {[llength $RTL_FILES] == 0} {
    puts "ERROR: No RTL files found in $RTL_DIR"
    exit 1
}


# Analyze all RTL files

foreach f [lsort $RTL_FILES] {

    puts "ANALYZING: $f"

    analyze \
        -format $file_format \
        -library work \
        $f
}


####################################################################################
#                           Elaborate Top Level
####################################################################################

elaborate $top_module

current_design $top_module


####################################################################################
#                           Link Design
####################################################################################

puts "###############################################"
puts "######## Linking All The Design Parts ########"
puts "###############################################"

link


####################################################################################
#                           Check Design
####################################################################################

puts "###############################################"
puts "######## Checking Design Consistency #########"
puts "###############################################"

check_design


####################################################################################
#                           Design Constraints
####################################################################################

puts "###############################################"
puts "############ Design Constraints ##############"
puts "###############################################"

source ./cons.tcl




####################################################################################
#                           Mapping & Optimization
####################################################################################

puts "###############################################"
puts "########## Mapping & Optimization ############"
puts "###############################################"

compile
report_timing -attributes > reports/timing_attributes.rpt


####################################################################################
#                           Close Formality File
####################################################################################

set_svf -off


####################################################################################
#                           Create Output Directories
####################################################################################

file mkdir netlists
file mkdir sdf
file mkdir sdc
file mkdir reports


####################################################################################
#                           Write Output Files
####################################################################################

write_file \
    -format verilog \
    -hierarchy \
    -output netlists/$top_module.v


write_file \
    -format ddc \
    -hierarchy \
    -output netlists/$top_module.ddc


write_sdf \
    sdf/$top_module.sdf


write_sdc \
    -nosplit \
    sdc/$top_module.sdc


####################################################################################
#                           Reports
####################################################################################

puts "###############################################"
puts "################## Reports ####################"
puts "###############################################"


# ---------------- Area ----------------

report_area \
    -hierarchy \
    > reports/area.rpt


# ---------------- Power ----------------

report_power \
    -hierarchy \
    > reports/power.rpt


# ---------------- Hold ----------------

report_timing \
    -delay_type min \
    > reports/hold.rpt


# ---------------- Setup ----------------

report_timing \
    -delay_type max \
    > reports/setup.rpt


# ---------------- Clock report ----------------

report_clock \
    -attributes \
    > reports/clocks.rpt


# ---------------- Constraint violations ----------------

report_constraint \
    -all_violators \
    -nosplit \
    > reports/constraints.rpt





####################################################################################
#                           TX Clock Debug
####################################################################################

puts "###############################################"
puts "############### TX CLOCK DEBUG ###############"
puts "###############################################"


report_clock \
    -attributes \
    TX_CLK


####################################################################################
#                           UART TX Timing Debug
####################################################################################

puts "###############################################"
puts "############ UART TX TIMING DEBUG ############"
puts "###############################################"


# Specific reset-to-TX path

report_timing \
    -from [get_pins u_RST_SYNC_UART/SYNC_RST_reg/Q] \
    -to [get_ports UART_TX_O] \
    -delay_type max \
    -path_type full_clock_expanded


# Worst TX output paths

report_timing \
    -to [get_ports UART_TX_O] \
    -delay_type max \
    -max_paths 10 \
    -path_type full_clock_expanded


####################################################################################
#                           Final Constraint Report
####################################################################################

report_constraint \
    -all_violators \
    -nosplit


####################################################################################
#                           GUI
####################################################################################

# gui_start

# exit
