
########################### Define Top Module ############################
                                                   
set top_module SYS_TOP

######################### Formality Setup File ###########################

set synopsys_auto_setup true

# Formality Setup File
set_svf /mnt/hgfs/Shared_Folder/SYSTEM/SYN/SYS_TOP.svf

set SSLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ss_1p08v_125c.db"
set TTLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_tt_1p2v_25c.db"
set FFLIB "/mnt/hgfs/Shared_Folder/SYSTEM/std_cells/scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c.db"

######################### Reference Container ############################

## Read Reference technology libraries

read_db -container Ref [list $SSLIB $TTLIB $FFLIB]

## Read Reference Design Files

set REF_RTL_FILES [glob /mnt/hgfs/Shared_Folder/SYSTEM/RTL/*.v
]

read_verilog -container Ref $REF_RTL_FILES

## set the top Reference Design 

set_reference_design SYS_TOP
set_top SYS_TOP

######################## Implementation Container #########################

## Read Implementation technology libraries

read_db -container Imp [list $SSLIB $TTLIB $FFLIB]

## Read Implementation Design Files
 
 read_verilog -container Imp /mnt/hgfs/Shared_Folder/SYSTEM/SYN/netlists/SYS_TOP.v
 
## set the top Implementation Design
set_implementation_design SYS_TOP
set_top SYS_TOP


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
