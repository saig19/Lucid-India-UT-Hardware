
# PlanAhead Launch Script for Pre-Synthesis Floorplanning, created by Project Navigator

create_project -name UART_Tx -dir "C:/Users/edlab/Desktop/EDM14B009_10/Session 7/UART_Tx/planAhead_run_1" -part xc3s500efg320-4
set_param project.pinAheadLayout yes
set srcset [get_property srcset [current_run -impl]]
set_property target_constrs_file "uart_tx.ucf" [current_fileset -constrset]
set hdlfile [add_files [list {convert_to_baud.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set hdlfile [add_files [list {uart_tx.v}]]
set_property file_type Verilog $hdlfile
set_property library work $hdlfile
set_property top uart_tx $srcset
add_files [list {uart_tx.ucf}] -fileset [get_property constrset [current_run]]
open_rtl_design -part xc3s500efg320-4
