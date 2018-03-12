# 
# Synthesis run script generated by Vivado
# 

create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.cache/wt [current_project]
set_property parent.project_path C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property ip_output_repo c:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_verilog -library xil_defaultlib -sv {
  C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/sources_1/new/KeypadController.sv
  C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/sources_1/new/MotorController.sv
  C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/sources_1/new/RandomController.sv
  C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/sources_1/new/SegmentController.sv
  {D:/Documents/Fall 2017/cs 223/Project_files/Ready_Modules/SevSeg_4digit.sv}
  {D:/Documents/Fall 2017/cs 223/Project_files/Ready_Modules/keypad4X4.sv}
  {D:/Documents/Fall 2017/cs 223/Project_files/Ready_Modules/stepmotor.sv}
  {D:/Documents/Fall 2017/cs 223/Project_files/Ready_Modules/steppermotor_wrapper.sv}
  C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/sources_1/new/PlayController.sv
}
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/constrs_1/new/const.xdc
set_property used_in_implementation false [get_files C:/Users/Yryskul/Desktop/term_project_/term_project_2/term_project.srcs/constrs_1/new/const.xdc]


synth_design -top PlayController -part xc7a35tcpg236-1


write_checkpoint -force -noxdef PlayController.dcp

catch { report_utilization -file PlayController_utilization_synth.rpt -pb PlayController_utilization_synth.pb }
