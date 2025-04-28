#/***********************************************************/
#/*   FILE        : MPE.tcl                                 */
#/*   Description : Default Synopsys Design Compiler Script */
#/*   Usage       : dc_shell -f MPE.tcl                     */
#/*   You'll need to minimally set design_name & read files */
#/***********************************************************/
set SYN_DIR ./synthesis_log/
set search_path [ list "./" "/afs/eecs.umich.edu/kits/ARM/IBM_soi12s0/sc12_rvt/db/" ]
set target_library "sc12_base_v31_rvt_soi12s0_ffl_nominal_min_1p10v_125c_mns.db"
set link_library [concat  "*" $target_library]

#/***********************************************************/
#/* Set some flags to suppress warnings we don't care about */
set suppress_errors [concat $suppress_errors "UID-401"]
suppress_message {"VER-130"}

#/***********************************************************/
#/* The following four lines must be updated for every      */
#/* new design                                              */
#/***********************************************************/
if {![info exists verilog_file]} {
    puts "ERROR: Set 'verilog_file' before running (e.g., with: dc_shell -f MPE.tcl -x \"set verilog_file your_file.v\")"
    quit
}
if {![info exists design_name]} {
    puts "ERROR: Set 'design_name' before running (e.g., with: dc_shell -f MPE.tcl -x \"set design_name your_module\")"
    quit
}

read_file -f sverilog [list $verilog_file]
set design_name topEntity

#/***********************************************************/
#/* The rest of this file may be left alone for most small  */
#/* to moderate sized designs.  You may need to alter it    */
#/* when synthesizing your final project.                   */
#/***********************************************************/

#/***********************************************************/
#/* Set some flags for optimisation */

set compile_top_all_paths "true"
set auto_wire_load_selection "true"

#/***********************************************************/
#/*  Clk Periods/uncertainty/transition                     */

#/* Input/output Delay values */
set AVG_INPUT_DELAY 0.1
set AVG_OUTPUT_DELAY 0.1

#/* Critical Range (ns) */
set CRIT_RANGE 1.0

#/***********************************************************/
#/* Design Constrains: Not all used                         */
set MAX_TRANSITION 1.0
set FAST_TRANSITION 0.1
set MAX_FANOUT 32
set MID_FANOUT 8
set LOW_FANOUT 1
set HIGH_DRIVE 0
set HIGH_LOAD 1.0
set AVG_LOAD 0.1
set AVG_FANOUT_LOAD 10

#/***********************************************************/
#/*BASIC_INPUT = cb18os120_tsmc_max/nd02d1/A1
#BASIC_OUTPUT = cb18os120_tsmc_max/nd02d1/ZN*/

set DRIVING_CELL dffacs1

#/* DONT_USE_LIST = {   } */

#/*************operation cons**************/
#/*OP_WCASE = WCCOM;
#OP_BCASE = BCCOM;*/
#set WIRE_LOAD "tsmcwire"
#set LOGICLIB lec25dscc25_TT
#/*****************************/

#/* Sourcing the file that sets the Search path and the libraries(target,link) */


set netlist_file [format "%s%s"  [format "%s%s"  $SYN_DIR $design_name] ".vg"]
set ddc_file [format "%s%s"  [format "%s%s"  $SYN_DIR $design_name] ".ddc"]
set rep_prefix [format "%s%s_%s" $SYN_DIR $design_name $run_label]
set dc_shell_status [ set chk_file [format "%s%s"  [format "%s%s"  $SYN_DIR $design_name] ".chk"] ]

#/* if we didnt find errors at this point, run */
if {  $dc_shell_status != [list] } {
   current_design $design_name
  link
#  set_wire_load_model -name $WIRE_LOAD -lib $LOGICLIB $design_name
#  set_wire_load_mode top
  set_fix_multiple_port_nets -outputs -buffer_constants
  group_path -from [all_inputs] -name input_grp
  group_path -to [all_outputs] -name output_grp
# set_driving_cell  -lib_cell $DRIVING_CELL [all_inputs]
  set_fanout_load $AVG_FANOUT_LOAD [all_outputs]
  set_load $AVG_LOAD [all_outputs]
  set_critical_range $CRIT_RANGE [current_design]
  set MAX_FANOUT $MAX_FANOUT
  set MAX_TRANSITION $MAX_TRANSITION
  uniquify
  redirect $chk_file { check_design }
  # compile_ultra
  compile -map_effort low -area_effort high
  write -hier -format verilog -output $netlist_file $design_name
  write -hier -format ddc -output $ddc_file $design_name

  report_timing     -transition_time -max_paths 100 -input_pins -nets -attributes -nosplit > "${rep_prefix}_timing.rpt"
  report_area       -nosplit -hier > "${rep_prefix}_area.rpt"
  report_power      -nosplit -hier > "${rep_prefix}_power.rpt"
  report_reference  -nosplit -hier > "${rep_prefix}_reference.rpt"
  report_resources  -nosplit -hier > "${rep_prefix}_resources.rpt"
  report_constraint -all_violators > "${rep_prefix}_violations.rpt"

  remove_design -all
  read_file -format verilog $netlist_file
  current_design $design_name
  quit
} else {
   quit
}