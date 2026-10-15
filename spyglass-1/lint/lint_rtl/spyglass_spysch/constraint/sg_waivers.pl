################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'5',
                          "totalGeneratedCount"=>'11',
                          "totalReportCount"=>'6'
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
                       "waiverCmd"=>'q%waive  -rule "W240" -comment "Created by ICer on 07-Oct-2026 01:34:39"%',
                       "-rule"=>'"W240"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:34:39"',
                       "violations_waived"=>'5 6 7',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'6',
                       "waiverCmd"=>'q%waive  -rule "STARC05-1.4.3.4" -comment "Created by ICer on 07-Oct-2026 01:34:39"%',
                       "-rule"=>'q%STARC05-1.4.3.4%',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:34:39"',
                       "violations_waived"=>'15',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'2'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'7',
                       "waiverCmd"=>'q%waive  -rule "FlopEConst" -comment "Created by ICer on 07-Oct-2026 01:34:39 safe waivers as the odd flag is disabel due to configrations, the FF of the clk divider is toggling and it is not a problem"%',
                       "-rule"=>'"FlopEConst"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:34:39 safe waivers as the odd flag is disabel due to configrations, the FF of the clk divider is toggling and it is not a problem"',
                       "violations_waived"=>'16',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/lint/lint_rtl/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'3'
                      );

spyWaiversDataCount("totalWaivers"=>'7',
"totalWaiversApplied"=>'7',
"totalWaiversWithRegExp"=>'0',
"totalWaiversWithRuleSpecified"=>'7',
"totalWaiversWithIpSpecified"=>'0',
"totalWaiversWithFileLine"=>'1',
                         );

spyProhibitWaiverRules(                         );

spySetWaivedViolationNumberHash("");

1;
