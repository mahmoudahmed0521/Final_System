################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'14',
                          "totalGeneratedCount"=>'59',
                          "totalReportCount"=>'45'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive -rule "Clock_glitch04" -comment "Baud-rate configuration registers are quasi-static."%',
                       "-rule"=>'"Clock_glitch04"',
                       "-comment"=>'"Baud-rate configuration registers are quasi-static."',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'91'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive -rule "Ac_glitch03"    -file "RTL/Data_Sync.v" -comment "Internal logic reconvergence within Data_sync cell."%',
                       "-file"=>'"RTL/Data_Sync.v"',
                       "-rule"=>'"Ac_glitch03"',
                       "-comment"=>'"Internal logic reconvergence within Data_sync cell."',
                       "violations_waived"=>'65',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'92'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive -rule "Ac_conv01"      -comment "Convergence of multiple synchronized signals at System Control FSM."%',
                       "-rule"=>'"Ac_conv01"',
                       "-comment"=>'"Convergence of multiple synchronized signals at System Control FSM."',
                       "violations_waived"=>'132',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'93'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive -rule "Ac_conv02"      -comment "Gray-coded Async FIFO pointer convergence on empty/full logic."%',
                       "-rule"=>'"Ac_conv02"',
                       "-comment"=>'"Gray-coded Async FIFO pointer convergence on empty/full logic."',
                       "violations_waived"=>'123 126 128',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'94'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv04" -comment "Created by ICer on 07-Oct-2026 03:08:14 FIFO memory data is read only after gray-coded pointers are synchronized; data is stable when sampled"%',
                       "-rule"=>'"Ac_conv04"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 03:08:14 FIFO memory data is read only after gray-coded pointers are synchronized; data is stable when sampled"',
                       "violations_waived"=>'133',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'6',
                       "waiverCmd"=>'q%waive  -rule "Setup_port01" -comment "Created by ICer on 07-Oct-2026 03:10:10"%',
                       "-rule"=>'"Setup_port01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 03:10:10"',
                       "violations_waived"=>'61 63',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'7',
                       "waiverCmd"=>'q%waive  -rule "Ac_cdc01a" -comment "Created by ICer on 07-Oct-2026 03:22:47 safe as it pass to the sync"%',
                       "-rule"=>'"Ac_cdc01a"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 03:22:47 safe as it pass to the sync"',
                       "violations_waived"=>'134',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'4'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'8',
                       "waiverCmd"=>'q%waive  -rule "Ac_unsync01" -comment "Created by ICer on 07-Oct-2026 03:33:03 safe crossing to tx_out "%',
                       "-rule"=>'"Ac_unsync01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 03:33:03 safe crossing to tx_out "',
                       "violations_waived"=>'30 31 32',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'6'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'9',
                       "waiverCmd"=>'q%waive  -rule "Ac_datahold01a" -comment "Created by ICer on 07-Oct-2026 03:58:20"%',
                       "-rule"=>'"Ac_datahold01a"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 03:58:20"',
                       "violations_waived"=>'135 136',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'7'
                      );

spyWaiversDataCount("totalWaivers"=>'9',
"totalWaiversApplied"=>'9',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'9',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'1',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
