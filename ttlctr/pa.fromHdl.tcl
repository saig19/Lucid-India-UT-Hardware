
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name ttlctr -dir "C:/Users/jani/Desktop/LUCID intern/ise projects/ttllogic ctr/ttlctr/planAhead_run_3" -part xc6slx9csg324-3
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "ttllogicctr.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {ttllogicctr.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top ttllogicctr $srcset
add_files [list {ttllogicctr.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc6slx9csg324-3
