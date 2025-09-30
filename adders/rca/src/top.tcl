# top.tcl — wrapper to run run.tcl in OpenROAD GUI and log output

# Path to your run.tcl
set run_script "run.tcl"

# Path to log file
set log_file "../run.log"

# Open log file for writing
set log_chan [open $log_file "w"]

# Helper procedure to tee messages
proc tee {msg} {
    global log_chan
    puts $msg
    puts $log_chan $msg
    flush $log_chan
}

# Launch OpenROAD and source run.tcl
tee "=== Starting OpenROAD session ==="
if {[catch {source $run_script} err]} {
    tee "ERROR: sourcing $run_script -> $err"
} else {
    tee "Finished running $run_script"
}

close $log_chan
tee "=== Log saved to $log_file ==="
