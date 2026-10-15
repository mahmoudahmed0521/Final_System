################################################################################
#This is an internally genertaed by spyglass to populate Waiver Info for Reports
#Note:Spyglass does not support any perl routine like "spyDecompileWaiverInfo"
#     The routine is purely for internal usage of spyglass
################################################################################


use SpyGlass;

spyClearWaiverHashInPerl(0);

spyComputeWaivedViolCount("totalWaivedViolationCount"=>'11',
                          "totalGeneratedCount"=>'53',
                          "totalReportCount"=>'42'
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
                       "violations_waived"=>'65',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'90'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'3',
                       "waiverCmd"=>'q%waive -rule "Ac_conv01"      -comment "Convergence of multiple synchronized signals at System Control FSM."%',
                       "-rule"=>'"Ac_conv01"',
                       "-comment"=>'"Convergence of multiple synchronized signals at System Control FSM."',
                       "violations_waived"=>'76',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'91'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'4',
                       "waiverCmd"=>'q%waive -rule "Ac_conv02"      -comment "Gray-coded Async FIFO pointer convergence on empty/full logic."%',
                       "-rule"=>'"Ac_conv02"',
                       "-comment"=>'"Gray-coded Async FIFO pointer convergence on empty/full logic."',
                       "violations_waived"=>'67 70 72',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"SYS_TOP.sgdc"',
                       "waiverline"=>'92'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'5',
                       "waiverCmd"=>'q%waive  -rule "Ac_conv04" -comment "Created by ICer on 07-Oct-2026 01:42:33 safe gray encoding as only one bit change"%',
                       "-rule"=>'"Ac_conv04"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:42:33 safe gray encoding as only one bit change"',
                       "violations_waived"=>'77',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify_struct/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'1'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'6',
                       "waiverCmd"=>'q%waive  -rule "Ac_unsync01" -comment "Created by ICer on 07-Oct-2026 01:43:29 Safe crossing as they are in the same domain"%',
                       "-rule"=>'"Ac_unsync01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:43:29 Safe crossing as they are in the same domain"',
                       "violations_waived"=>'30 31 32',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify_struct/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'3'
                      );

spyDecompileWaiverInfo("waive_cmd_id"=>'7',
                       "waiverCmd"=>'q%waive  -rule "Setup_port01" -comment "Created by ICer on 07-Oct-2026 01:45:53 not fully constrained is ok"%',
                       "-rule"=>'"Setup_port01"',
                       "-comment"=>'"Created by ICer on 07-Oct-2026 01:45:53 not fully constrained is ok"',
                       "violations_waived"=>'61 63',
                       "partial_violations_waived"=>'',
                       "cmd_status"=>'1',
                       "waiverfile"=>'"./spyglass-1/cdc/cdc_verify_struct/spyglass-1_waiver_file.awl"',
                       "waiverline"=>'5'
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
