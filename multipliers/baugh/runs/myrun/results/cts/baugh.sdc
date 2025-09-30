###############################################################################
# Created by write_sdc
# Tue Sep 30 08:19:35 2025
###############################################################################
current_design baugh
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {A[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {B[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[10]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[11]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[12]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[13]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[14]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[15]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[8]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {P[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {P[15]}]
set_load -pin_load 0.0334 [get_ports {P[14]}]
set_load -pin_load 0.0334 [get_ports {P[13]}]
set_load -pin_load 0.0334 [get_ports {P[12]}]
set_load -pin_load 0.0334 [get_ports {P[11]}]
set_load -pin_load 0.0334 [get_ports {P[10]}]
set_load -pin_load 0.0334 [get_ports {P[9]}]
set_load -pin_load 0.0334 [get_ports {P[8]}]
set_load -pin_load 0.0334 [get_ports {P[7]}]
set_load -pin_load 0.0334 [get_ports {P[6]}]
set_load -pin_load 0.0334 [get_ports {P[5]}]
set_load -pin_load 0.0334 [get_ports {P[4]}]
set_load -pin_load 0.0334 [get_ports {P[3]}]
set_load -pin_load 0.0334 [get_ports {P[2]}]
set_load -pin_load 0.0334 [get_ports {P[1]}]
set_load -pin_load 0.0334 [get_ports {P[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {A[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {B[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
