#start_gui;
open_project /home/iiitb/Jay/htiles_design_1/htiles_design_1.xpr 
update_compile_order -fileset sources_1
reset_run synth_1
launch_runs synth_1 -jobs 28
update_compile_order -fileset sources_1
wait_on_run synth_1
launch_runs impl_1 -jobs 28
wait_on_run impl_1
update_compile_order -fileset sources_1
open_run impl_1
report_utilization -file /home/iiitb/Desktop/Test_Case/utilization_rpt.rpt
report_timing_summary -delay_type min_max -report_unconstrained -check_timing_verbose -max_paths 10 -input_pins -routable_nets -name timing_1 -file /home/iiitb/Desktop/Test_Case/timing_rpt.rpt
report_power -name {power_1} -file /home/iiitb/Desktop/Test_Case/power_rpt.rpt
close_design
quit

