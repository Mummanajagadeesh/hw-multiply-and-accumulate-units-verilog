# ========================================================
# run.tcl — robust Sky130 version (hardcoded floorplan + robust routing-layer & track detection)
# ========================================================

# === Inputs ===
set run_dir "/home/jagadeesh97/OpenLane/designs/kogge/runs/myrun"
set design_name "kogge"
set netlist_file "kogge_synth.v"
set lef_file1 "/home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs.tlef"
set lef_file2 "/home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs_merged.lef"
set liberty_file "/home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lib/sky130_fd_sc_hs__tt_025C_1v80.lib"

# ========================================================
# Utility: Safe DBU lookup (works on many OpenROAD versions)
# ========================================================
proc get_dbu_per_micron {} {
    if {[catch {set tech [ord::get_db_tech]} err]} {
        # fallback for older OpenROAD
        if {[catch {set dbu [db::getTechUnits]} err2]} {
            puts "Warning: Cannot determine DBU per micron (ord::get_db_tech and db::getTechUnits both failed). Assuming 1000."
            return 1000
        } else {
            return $dbu
        }
    } else {
        return [$tech getDbUnitsPerMicron]
    }
}

# Helper to attempt many attribute names for site width/height or layer direction
proc try_attrs {obj attrList} {
    foreach a $attrList {
        if {[catch {set v [get_attribute $obj $a]} err]} {
            continue
        }
        if {$v ne ""} { return $v }
    }
    return ""
}

# ========================================================
# Read design and libraries (defensive)
# ========================================================
puts ">>> Reading design and technology files..."
if {[catch {read_lef $lef_file1} err]} {
    puts "Warning: read_lef $lef_file1 -> $err"
} else {
    puts "read_lef $lef_file1 succeeded."
}
if {[catch {read_lef $lef_file2} err]} {
    puts "Warning: read_lef $lef_file2 -> $err"
} else {
    puts "read_lef $lef_file2 succeeded."
}

if {[catch {read_liberty $liberty_file} err]} {
    puts "Warning: read_liberty $liberty_file -> $err"
} else {
    puts "read_liberty succeeded."
}

if {[catch {read_verilog $netlist_file} err]} {
    puts "Warning: read_verilog $netlist_file -> $err"
} else {
    puts "read_verilog succeeded."
}

if {[llength [info commands link_design]] > 0} {
    if {[catch {link_design $design_name} err]} {
        puts "Warning: link_design -> $err"
    } else {
        puts "link_design succeeded."
    }
} else {
    puts "Note: link_design not available; continuing."
}

# Ensure run_dir exists before output
if {![file exists $run_dir]} {
    if {[catch {file mkdir $run_dir} err]} {
        puts "Warning: cannot create run_dir $run_dir -> $err"
    } else {
        puts "Created run_dir: $run_dir"
    }
}

# ========================================================
# Hardcoded cell/core/die areas from report (no runtime calc)
# ========================================================
# Path to CSV (assuming it's in the same folder as where you run the script)
set csv_file "../ppa_summary.csv"

# Open CSV
set fp [open $csv_file r]
gets $fp header       ;# skip header line
set data_line [gets $fp]
close $fp

# Split CSV line into list
set fields [split $data_line ","]

# Map CSV fields to variables
# Assuming CSV columns are:
# run_dir,core_area_um2,die_area_um2,utilization_percent,flops,total_cells,comb_cells,...
set total_cell_area [lindex $fields 1]
set core_area       [lindex $fields 1]
set die_area        [lindex $fields 2]

puts "total_cell_area = $total_cell_area"
puts "core_area = $core_area"
puts "die_area = $die_area"


# aspect ratio = 1 (square layout)
set core_width  [expr {sqrt($core_area)}]     ;# keep full precision until snapping
set core_height $core_width
set die_width  [expr {sqrt($die_area)}]
set die_height $die_width

puts "Core size (pre-snap): ${core_width}x${core_height} µm"
puts "Die  size: ${die_width}x${die_height} µm"

# ========================================================
# Snap core coordinates to site grid (avoid initialize_floorplan snapping)
# ========================================================
set dbu [get_dbu_per_micron]
puts "DBU per µm: $dbu"

# default site step DBU for Sky130 (fallback if we cannot discover it):
# these are DBU (1000 DBU/µm * site_width_um) guesses; adjust if you know differently.
set default_site_width_dbu 480    ;# 0.48 µm -> 480 DBU (common for sky130 standard cell width)
set default_site_height_dbu 3330  ;# 3.33 µm -> 3330 DBU (common row height in some sky130 hs flows)

# attempt to query a site object (try many attribute names)
set site_name "unit"
set site_width_dbu ""
set site_height_dbu ""

# Try: if get_sites/get_site commands exist, get attributes
if {[llength [info commands get_sites]] > 0} {
    if {[catch {set sites [get_sites]} err]} {
        # ignore
    } else {
        if {[llength $sites] > 0} {
            set s0 [lindex $sites 0]
            set site_width_dbu [try_attrs $s0 {site_width width width_db siteWidth siteW SITEWIDTH}]
            set site_height_dbu [try_attrs $s0 {site_height height height_db siteHeight siteH SITEHEIGHT rowHeight}]
        }
    }
}

# Also attempt direct get_attribute from the nominated site_name (some versions expose site as an object)
if {$site_width_dbu eq ""} {
    if {[catch {set v1 [try_attrs $site_name {site_width width siteWidth width_db}]} err]} {
        # ignore
    } else {
        if {$v1 ne ""} { set site_width_dbu $v1 }
    }
}
if {$site_height_dbu eq ""} {
    if {[catch {set v2 [try_attrs $site_name {site_height height siteHeight rowHeight}]} err]} {
        # ignore
    } else {
        if {$v2 ne ""} { set site_height_dbu $v2 }
    }
}

# convert site values to numeric DBU if they look like µm values
if {$site_width_dbu ne ""} {
    # if the value is small (<100), it's probably µm; convert
    if {[expr {$site_width_dbu < 100}]} {
        set site_width_dbu [expr {double($site_width_dbu) * $dbu}]
    }
} else {
    set site_width_dbu $default_site_width_dbu
}

if {$site_height_dbu ne ""} {
    if {[expr {$site_height_dbu < 100}]} {
        set site_height_dbu [expr {double($site_height_dbu) * $dbu}]
    }
} else {
    set site_height_dbu $default_site_height_dbu
}

puts "Using site step (DBU): width=$site_width_dbu height=$site_height_dbu"

# compute DBU widths/heights
set die_width_dbu  [expr {double($die_width)  * $dbu}]
set die_height_dbu [expr {double($die_height) * $dbu}]
set core_width_dbu [expr {double($core_width) * $dbu}]
set core_height_dbu [expr {double($core_height) * $dbu}]

# compute lower-left snapped to site grid (floor so core sits fully inside die)
set core_llx_dbu [expr {int(floor((($die_width_dbu - $core_width_dbu) / 2.0) / $site_width_dbu) * $site_width_dbu)}]
set core_lly_dbu [expr {int(floor((($die_height_dbu - $core_height_dbu) / 2.0) / $site_height_dbu) * $site_height_dbu)}]
# ensure non-negative
if {$core_llx_dbu < 0} { set core_llx_dbu 0 }
if {$core_lly_dbu < 0} { set core_lly_dbu 0 }

# convert back to microns (floating)
set core_llx [expr {double($core_llx_dbu) / $dbu}]
set core_lly [expr {double($core_lly_dbu) / $dbu}]
set core_urx [expr {double($core_llx_dbu + $core_width_dbu) / $dbu}]
set core_ury [expr {double($core_lly_dbu + $core_height_dbu) / $dbu}]

# Round core/ die dims for human printing (but keep DBU-aligned exact numbers for floorplan)
set core_width_print [format "%.3f" [expr {$core_urx - $core_llx}]]
set core_height_print [format "%.3f" [expr {$core_ury - $core_lly}]]
puts "Snapped core box (µm): ll=$core_llx $core_lly ur=$core_urx $core_ury => ${core_width_print}x${core_height_print} µm"

# ========================================================
# Initialize floorplan (safe/cautious)
# ========================================================
puts ">>> Initializing floorplan..."
if {[llength [info commands initialize_floorplan]] > 0} {
    if {[catch {
        initialize_floorplan \
            -die_area  [list 0 0 $die_width $die_height] \
            -core_area [list $core_llx $core_lly $core_urx $core_ury] \
            -sites $site_name
    } err]} {
        puts "Warning: initialize_floorplan -> $err"
    } else {
        puts "initialize_floorplan completed."
    }
} else {
    puts "Warning: initialize_floorplan command not found; floorplan init skipped."
}

# ========================================================
# Routing tracks: source the make_tracks script (if present)
# ========================================================
puts ">>> Loading routing tracks script (if present)..."
set make_tracks_script "/home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/make_tracks.tcl"
if {[file exists $make_tracks_script]} {
    if {[catch {source $make_tracks_script} err]} {
        puts "Warning: sourcing make_tracks.tcl -> $err"
    } else {
        puts "Sourced make_tracks.tcl"
    }
} else {
    puts "Note: $make_tracks_script not found; skipping source."
}

# ========================================================
# Auto-detect routing layers AND verify they have routing tracks
# ========================================================
puts ">>> Detecting routing layers and validating tracks..."

# --- function to test track availability ---
proc layer_has_tracks {layer} {
    if {[llength [info commands get_tracks]] > 0} {
        if {[catch {set t [get_tracks -layer $layer]} err]} {
            return 0
        } else {
            if {[llength $t] > 0} { return 1 } else { return 0 }
        }
    } else {
        return -1
    }
}

# --- gather candidate layers ---
set hor_layer ""
set ver_layer ""
set layers {}

if {[llength [info commands get_layers]] > 0} {
    if {[catch {set layers [get_layers -routing]} err]} {
        if {[catch {set layers [get_layers]} err2]} {
            set layers {}
        }
    }
}

if {[llength $layers] == 0} {
    set layers {met1 met2 met3 metal1 metal2 M1 M2}
}

# --- iterate and detect preferred directions safely ---
foreach L $layers {
    set lname $L
    set pdir ""

    if {[catch {set tmp [get_attribute $L preferred_direction]} err]} {
        # fallback heuristic for Sky130
        if {[regexp {met} [string tolower $lname]]} {
            if {[regexp {(\d+)} $lname -> num]} {
                if {[expr {$num % 2 == 1}]} { set pdir "HORIZONTAL" } else { set pdir "VERTICAL" }
            } else {
                set pdir "HORIZONTAL"
            }
        }
    } else {
        set pdir $tmp
    }

    set has_tracks [layer_has_tracks $L]
    puts "Layer candidate: $lname  preferred_dir=$pdir  tracks-check=$has_tracks"

    # assign hor/ver layer if not yet assigned and tracks exist (or unknown)
    set pdir_up [string toupper [string trim $pdir]]
    if {($pdir_up eq "HORIZONTAL" || $pdir_up eq "H") && ($hor_layer eq "") && ($has_tracks != 0)} {
        set hor_layer $lname
    }
    if {($pdir_up eq "VERTICAL" || $pdir_up eq "V") && ($ver_layer eq "") && ($has_tracks != 0)} {
        set ver_layer $lname
    }
}

# --- heuristic layer-pair fallback if necessary ---
if {$hor_layer eq "" || $ver_layer eq ""} {
    puts "Info: preferred_direction detection incomplete or no verified tracks; trying name-pairs."
    set candidates {
        {met1 met2}
        {met2 met3}
        {metal1 metal2}
        {M1 M2}
        {m1 m2}
    }
    foreach pair $candidates {
        set h [lindex $pair 0]
        set v [lindex $pair 1]
        set h_ok [layer_has_tracks $h]
        set v_ok [layer_has_tracks $v]
        if {($h_ok == 1 || $h_ok == -1) && ($v_ok == 1 || $v_ok == -1)} {
            if {$hor_layer eq ""} { set hor_layer $h }
            if {$ver_layer eq ""} { set ver_layer $v }
            # no break needed, continue safely
        }
    }
}

# --- final fallback defaults ---
if {$hor_layer eq ""} { set hor_layer "met1" }
if {$ver_layer eq ""} { set ver_layer "met2" }

puts "Selected horizontal layer: $hor_layer"
puts "Selected vertical   layer: $ver_layer"

# --- diagnostics if horizontal layer has no tracks ---
set final_h_has [layer_has_tracks $hor_layer]
if {$final_h_has == 0} {
    puts "ERROR: chosen horizontal layer '$hor_layer' has NO routing tracks according to get_tracks."
    puts "Diagnostic: listing all layers and their track status (if available):"
    foreach L $layers {
        set status [layer_has_tracks $L]
        puts "  $L => tracks_status=$status"
    }
    puts "Suggestion: check the make_tracks.tcl you sourced; ensure it actually created tracks for the intended layers."
    puts "You can also run the small debug snippet in the README or paste the layer listing here for further help."
}

# ========================================================
# Placement (defensive)
# ========================================================
puts ">>> Preparing placement..."

# --- Mark power/ground nets as special ---
puts ">>> Marking power/ground nets as special..."
foreach net {vdd VDD vss VSS zero_} {
    if {[llength [get_nets $net]] > 0} {
        add_global_connection -net $net -pin_pattern {^$net$} -power
        puts "Marked net '$net' as special."
    } else {
        puts "Warning: net '$net' not found."
    }
}

# --- Perform place_pins ---
puts ">>> Performing place_pins..."
if {[llength [info commands place_pins]] > 0} {
    if {[catch {place_pins -hor_layers $hor_layer -ver_layers $ver_layer} err]} {
        puts "Warning: place_pins failed -> $err"
    } else {
        puts "place_pins succeeded."
    }
} else {
    puts "Warning: place_pins command not found; skipping."
}

# --- Global placement ---
puts ">>> Performing global placement..."
if {[llength [info commands global_placement]] > 0} {
    if {[catch {global_placement -density 0.8} err]} {
        puts "Warning: global_placement failed -> $err"
    } else {
        puts "global_placement succeeded."
    }
} else {
    puts "Warning: global_placement command not found; skipping."
}

# --- Detailed placement ---
puts ">>> Performing detailed placement..."
if {[llength [info commands detailed_placement]] > 0} {
    if {[catch {detailed_placement} err]} {
        puts "Warning: detailed_placement failed -> $err"
    } else {
        puts "detailed_placement succeeded."
    }
} else {
    puts "Warning: detailed_placement command not found; skipping."
}

# --- Summary ---
puts ">>> Placement step complete."
# puts "Special nets verified: [join [get_nets -special] , ]"


# ========================================================
# Optional routing
# ========================================================
if {[llength [info commands detailed_route]] > 0} {
    if {[catch {detailed_route} err]} {
        puts "Detailed routing reported error: $err"
        puts "If TritonRoute complains about special nets (e.g. 'Net zero_ of signal type GROUND is not routable'),"
        puts "ensure ground/power nets are connected properly in the netlist or renamed to standard VSS/VDD."
    } else {
        puts "detailed_route succeeded."
    }
} else {
    puts "detailed_route command not found; skipping detailed routing."
}

# ========================================================
# Small diagnostic: list nets that look like ground/power
# ========================================================
if {[llength [info commands get_nets]] > 0} {
    puts "Top-level net scan (showing nets with 'gnd'/'vss'/'vdd'/'zero' in name):"
    # Use get_nets -all to safely list all nets
    foreach net [get_nets *] {
        set name $net
        set nl [string tolower $name]
        if {[string first "gnd" $nl] >= 0 || [string first "vss" $nl] >= 0 || [string first "vdd" $nl] >= 0 || [string first "zero" $nl] >= 0} {
            puts "  candidate-power-net: $name"
        }
    }
} else {
    puts "Note: cannot run net scan (get_nets not available)."
}


# ========================================================
# Export DEF (ensure directory exists)
# ========================================================
puts ">>> Writing DEF output..."
set def_out [file join $run_dir "${design_name}.def"]
if {[catch {write_def $def_out} err]} {
    puts "Warning: write_def -> $err"
    puts "Make sure $run_dir exists and is writable."
} else {
    puts "Done! DEF exported to $def_out"
}


# ========================================================
# Export GDS (ensure directory exists)
# ========================================================
# puts ">>> Writing GDS output..."
# set gds_out [file join $run_dir "${design_name}.gds"]
# if {[catch {write_gds $gds_out} err]} {
#    puts "Warning: write_gds -> $err"
#    puts "Make sure $run_dir exists and is writable."
# } else {
#    puts "Done! GDS exported to $gds_out"
# }

puts ">>> run.tcl finished."
