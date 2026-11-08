# Simulation and Functional Verification

This directory contains the simulation testbench, functional verification results, and waveform evidence for the 6-Tap Pipelined FIR Low-Pass Filter.

The RTL design was functionally verified using Xilinx Vivado 2024.2.

## Directory Structure

```text
simulation/
├── testbench/
│   └── fir_filter_top_tb.v
│
├── simulation_results/
│   ├── simulation_log.txt
│   └── input_output_results.csv
│
└── waveforms/
    ├── fir_filter_waveform.png
    └── fir_filter_output_visualised.pdf
```

## Testbench

The testbench generates clock and reset signals, applies input samples to the FIR filter, and checks the simulated output against the expected mathematical result.

## Functional Verification

The filter was tested using a sequence of input samples, including constant values and varying input amplitudes.

Selected simulation results:

| Input | Expected Output |
|---:|---:|
| 20 | 40 |
| 20 | 120 |
| 20 | 240 |
| 21 | 362 |
| 22 | 448 |
| 90 | 634 |

All expected values are calculated using the FIR coefficient equation:

\[
y[n]=2x[n]+4x[n-1]+6x[n-2]+6x[n-3]+4x[n-4]+2x[n-5]
\]

## Simulation Environment

- Simulator: Xilinx Vivado 2024.2
- HDL: Verilog
- Verification: Testbench-based functional simulation
- Output: 13-bit unsigned

## Verification Evidence

The `simulation_results/` directory contains simulation logs and numerical output data.

The `waveforms/` directory contains waveform screenshots and input-versus-output visualizations.

These results demonstrate the functional behaviour of the designed FIR filter.
