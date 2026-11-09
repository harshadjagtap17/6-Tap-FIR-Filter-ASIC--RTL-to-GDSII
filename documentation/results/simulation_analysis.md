# FIR Filter Simulation Analysis

## 1. Overview

Functional simulation was performed to verify the operation of the 6-tap multiplierless FIR low-pass filter.

The Verilog RTL design was simulated using Xilinx Vivado 2024.2.

The testbench applies a sequence of input samples and compares the simulated output against the expected FIR filter response.

## 2. Verification Methodology

The testbench verifies the following functional blocks:

- Input sample storage using the shift register.
- Symmetric sample pairing.
- Pre-adder functionality.
- Shift-and-add coefficient arithmetic.
- Final output generation.

The expected output is calculated using the FIR equation:

y[n] = 2x[n] + 4x[n-1] + 6x[n-2] + 6x[n-3] + 4x[n-4] + 2x[n-5]

The simulated output is compared against the expected value for each test vector.

## 3. Simulation Results

The following observations were recorded during functional simulation:

| Input Sample | Simulated Output | Expected Output | Status |
|---:|---:|---:|---|
| 20 | 40 | 40 | PASS |
| 20 | 120 | 120 | PASS |
| 20 | 240 | 240 | PASS |
| 21 | 362 | 362 | PASS |
| 22 | 448 | 448 | PASS |
| 90 | 634 | 634 | PASS |

These are selected observations from the simulation log. The input column represents the input sample associated with the corresponding simulation output.

## 4. Observations

The simulation results demonstrate that:

- The RTL output matches the expected mathematical FIR response for the selected test vectors.
- The shift register correctly maintains the previous input samples.
- The symmetric pre-addition structure produces the expected intermediate values.
- The shift-and-add architecture correctly implements the selected coefficients.
- The 13-bit output accommodates the calculated filter response.

## 5. Initial Transient Behaviour

At the beginning of simulation, the delay elements contain zero-filled samples.

As new input samples enter the shift register, the filter output builds up over successive clock cycles.

This explains the increasing output values observed when a constant input is applied at the beginning of the simulation.

## 6. Simulation Environment

| Parameter | Details |
|---|---|
| HDL | Verilog |
| Simulation Tool | Xilinx Vivado |
| Version | 2024.2 |
| Testbench | fir_filter_top_tb.v |
| Design | fir_filter_top |

## 7. Conclusion

The functional simulation results confirm that the implemented RTL produces outputs consistent with the expected FIR mathematical calculations for the tested input vectors.

The simulation stage provides functional verification before proceeding to synthesis and ASIC physical implementation.

