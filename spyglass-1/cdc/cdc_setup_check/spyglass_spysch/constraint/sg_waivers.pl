################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'2',
                          "totalGeneratedCount"=>'18',
                          "totalReportCount"=>'16'
                         );

spyDecompileWaiverInfo("waive_cmd_id"=>'1',
                       "waiverCmd"=>'q%waive -rule "Clock_glitch04" -comment "Baud-rate configuration registers are quasi-static."%',
                       "-rule"=>'"Clock_glitch04"',
                       "-comment"=>'"Baud-rate configuration registers are quasi-static."',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'89'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'2',
                       "waiverCmd"=>'q%waive -rule "Ac_glitch03"    -file "RTL/Data_Sync.v" -comment "Internal logic reconvergence within Data_sync cell."%',
                       "-file"=>'"RTL/Data_Sync.v"',
                       "-rule"=>'"Ac_glitch03"',
                       "-comment"=>'"Internal logic reconvergence within Data_sync cell."',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'90'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive -rule "Ac_conv01"      -comment "Convergence of multiple synchronized signals at System Control FSM."%',
                       "-rule"=>'"Ac_conv01"',
                       "-comment"=>'"Convergence of multiple synchronized signals at System Control FSM."',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'91'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive -rule "Ac_conv02"      -comment "Gray-coded Async FIFO pointer convergence on empty/full logic."%',
                       "-rule"=>'"Ac_conv02"',
                       "-comment"=>'"Gray-coded Async FIFO pointer convergence on empty/full logic."',
                       "violations_waived"=>'',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'92'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -rule "Setup_port01" -comment "Created by ICer on 07-Oct-2026 01:41:28 Ok as partially constrained"%',
                       "-rule"=>'"Setup_port01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:41:28 Ok as partially constrained"',
                       "violations_waived"=>'24 26',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_setup_check/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyWaiversDataCount("totalWaivers"=>'5',
"totalWaiversApplied"=>'5',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'5',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'1',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
