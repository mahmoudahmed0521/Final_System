########################### Define Top Module ############################

set top_module SYS_TOP_dft

######################### Formality Setup File ###########################

set synopsys_auto_setup true

# Formality Setup File (Guidance from DFT compiler)
set_svf $top_module.svf

set SSLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

set REF_RTL_FILES [glob /mnt/hgfs/Shared_Folder/SYSTEM/DFT/RTL/*.v]

read_verilog -container Ref $REF_RTL_FILES

## set the top Reference Design

set_reference_design $top_module
set_top $top_module

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files

read_verilog -container Imp netlists/$top_module.v

## set the top Implementation Design

set_implementation_design $top_module
set_top $top_module

######################## DFT Test Mode Constants ##########################

## Disable scan control signals so logic is verified in functional mode
set_constant i:/WORK/$top_module/test_mode 0
set_constant i:/WORK/$top_module/SE 0


set_constant r:/WORK/$top_module/test_mode 0
set_constant r:/WORK/$top_module/SE 0
######################## Compare & Verify #################################

## matching Compare points
match

## verify
set successful [verify]
if {!$successful} {
    diagnose
    analyze_points -failing
}

file mkdir reports
report_passing_points > "reports/passing_points.rpt"
report_failing_points > "reports/failing_points.rpt"
report_aborted_points > "reports/aborted_points.rpt"
report_unverified_points > "reports/unverified_points.rpt"

start_gui
