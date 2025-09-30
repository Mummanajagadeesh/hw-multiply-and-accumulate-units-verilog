###############################################################################
# Created by write_sdc
# Tue Sep 30 08:04:31 2025
###############################################################################
current_design booth
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 10.0000 
set_clock_uncertainty 0.2500 clk
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplicand[7]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[0]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[1]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[2]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[3]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[4]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[5]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[6]}]
set_input_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {multiplier[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[0]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[10]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[11]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[12]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[13]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[14]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[15]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[1]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[2]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[3]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[4]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[5]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[6]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[7]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[8]}]
set_output_delay 2.0000 -clock [get_clocks {clk}] -add_delay [get_ports {product[9]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {product[15]}]
set_load -pin_load 0.0334 [get_ports {product[14]}]
set_load -pin_load 0.0334 [get_ports {product[13]}]
set_load -pin_load 0.0334 [get_ports {product[12]}]
set_load -pin_load 0.0334 [get_ports {product[11]}]
set_load -pin_load 0.0334 [get_ports {product[10]}]
set_load -pin_load 0.0334 [get_ports {product[9]}]
set_load -pin_load 0.0334 [get_ports {product[8]}]
set_load -pin_load 0.0334 [get_ports {product[7]}]
set_load -pin_load 0.0334 [get_ports {product[6]}]
set_load -pin_load 0.0334 [get_ports {product[5]}]
set_load -pin_load 0.0334 [get_ports {product[4]}]
set_load -pin_load 0.0334 [get_ports {product[3]}]
set_load -pin_load 0.0334 [get_ports {product[2]}]
set_load -pin_load 0.0334 [get_ports {product[1]}]
set_load -pin_load 0.0334 [get_ports {product[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplicand[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[7]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[6]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[5]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[4]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[3]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {multiplier[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_transition 0.7500 [current_design]
set_max_fanout 10.0000 [current_design]
