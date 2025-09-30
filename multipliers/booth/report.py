#!/usr/bin/env python3
import sys, os, glob, re, csv

def read_text(path):
    try:
        with open(path, 'r', errors='ignore') as f:
            return f.read()
    except:
        return ""

def parse_area(runroot):
    core_file = os.path.join(runroot, "reports/floorplan/3-initial_fp_core_area.rpt")
    die_file  = os.path.join(runroot, "reports/floorplan/3-initial_fp_die_area.rpt")
    core_area = die_area = None
    if os.path.isfile(core_file):
        nums = list(map(float, read_text(core_file).split()))
        if len(nums) == 4:
            core_area = (nums[2]-nums[0]) * (nums[3]-nums[1])
    if os.path.isfile(die_file):
        nums = list(map(float, read_text(die_file).split()))
        if len(nums) == 4:
            die_area = (nums[2]-nums[0]) * (nums[3]-nums[1])
    util = None
    if core_area and die_area:
        util = 100.0 * core_area / die_area
    return core_area, die_area, util

def parse_cells(runroot):
    synth_file = os.path.join(runroot, "reports/synthesis/1-synthesis.AREA_0.stat.rpt")
    flops = 0
    total_cells = None
    comb_cells = None
    if os.path.isfile(synth_file):
        txt = read_text(synth_file)
        m = re.search(r'Number of cells:\s+(\d+)', txt)
        if m: total_cells = int(m.group(1))
        if "DFF" in txt or "$_DFF_" in txt:
            flops = sum(int(x) for x in re.findall(r'\$_DFF_[^\s]*\s+(\d+)', txt))
        else:
            flops = 0
        comb_cells = total_cells - flops if total_cells is not None else None
    return flops, total_cells, comb_cells

def parse_timing(runroot, clock_period=10.0):
    sta_file = os.path.join(runroot, "reports/signoff/31-rcx_sta.summary.rpt")
    wns = tns = crit = None
    if os.path.isfile(sta_file):
        txt = read_text(sta_file)
        m1 = re.search(r'wns\s+([-+]?\d+\.?\d*)', txt)
        if m1: wns = float(m1.group(1))
        m2 = re.search(r'tns\s+([-+]?\d+\.?\d*)', txt)
        if m2: tns = float(m2.group(1))
        m3 = re.search(r'worst slack\s+([-+]?\d+\.?\d*)', txt)
        if m3:
            slack = float(m3.group(1))
            crit = clock_period - slack
    fmax = 1000.0/crit if crit and crit > 0 else None
    return wns, tns, crit, fmax

def parse_power(runroot):
    pwr_file = os.path.join(runroot, "reports/signoff/31-rcx_sta.power.rpt")
    total_mw = None
    if os.path.isfile(pwr_file):
        txt = read_text(pwr_file)
        m = re.search(r'Total\s+[\d.eE+-]+\s+[\d.eE+-]+\s+[\d.eE+-]+\s+([\d.eE+-]+)', txt)
        if m:
            watts = float(m.group(1))
            total_mw = watts * 1000.0  # convert W → mW
    return total_mw

def main(runroot):
    runroot = os.path.abspath(runroot)
    out = {'run_dir': runroot}
    print("Scanning run:", runroot)

    core_area, die_area, util = parse_area(runroot)
    out['core_area_um2'] = core_area
    out['die_area_um2'] = die_area
    out['utilization_percent'] = util

    flops, total_cells, comb_cells = parse_cells(runroot)
    out['flops'] = flops
    out['total_cells'] = total_cells
    out['comb_cells'] = comb_cells

    clk_period = 10.0  # from config
    out['clock_period_ns'] = clk_period
    wns, tns, crit, fmax = parse_timing(runroot, clk_period)
    out['WNS_ns'] = wns
    out['TNS_ns'] = tns
    out['critical_path_ns'] = crit
    out['Fmax_MHz'] = fmax

    total_power_mw = parse_power(runroot)
    out['total_power_mw'] = total_power_mw
    out['energy_per_cycle_pJ'] = (total_power_mw*clk_period) if total_power_mw else None

    # === NEW METRICS ===
    # latency = critical path
    out['latency_ns'] = crit

    # throughput = ops/sec = Fmax (MHz) * 1e6
    out['throughput_ops_per_sec'] = fmax*1e6 if fmax else None

    # energy per operation (pJ/op) = total power (mW) / throughput * 1e3
    if total_power_mw and fmax:
        out['energy_per_op_pJ'] = (total_power_mw / (fmax*1e6))*1e12
    else:
        out['energy_per_op_pJ'] = None

    # power efficiency = throughput / power (ops/sec/mW)
    if total_power_mw and fmax:
        out['power_efficiency_ops_per_sec_per_mW'] = (fmax*1e6)/total_power_mw
    else:
        out['power_efficiency_ops_per_sec_per_mW'] = None

    # area efficiency = throughput / die area (ops/sec/um^2)
    if die_area and fmax:
        out['area_efficiency_ops_per_sec_per_um2'] = (fmax*1e6)/die_area
    else:
        out['area_efficiency_ops_per_sec_per_um2'] = None

    # print nicely
    print("\nExtracted summary:")
    for k,v in out.items():
        print(f"  {k}: {v}")

    out_csv = os.path.join(os.path.dirname(os.path.abspath(__file__)), "ppa_summary.csv")
    with open(out_csv, 'w', newline='') as csvf:
        w = csv.DictWriter(csvf, fieldnames=out.keys())
        w.writeheader()
        w.writerow(out)
    print("\nWrote:", out_csv)

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python3 extract_metrics_from_run.py /path/to/run_dir")
        sys.exit(1)
    sys.exit(main(sys.argv[1]))
