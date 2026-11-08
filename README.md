# 6-Tap Pipelined FIR Low-Pass Filter ASIC

A 6-tap pipelined multiplierless FIR low-pass filter designed using Verilog HDL, functionally verified using Xilinx Vivado, and implemented as an ASIC using OpenLane 2 and the Sky130A PDK.

## Project Overview

This project focuses on the RTL design, functional verification, FPGA implementation, and ASIC physical design of a 6-tap Finite Impulse Response (FIR) low-pass filter.

The filter uses a symmetric coefficient architecture and shift-and-add arithmetic to reduce hardware complexity by eliminating conventional multipliers.

The design is intended for signal smoothing in applications such as UAV flight command reception.

## Design Specifications

| Parameter | Specification |
|---|---|
| Filter Type | FIR Low-Pass Filter |
| Number of Taps | 6 |
| Input Width | 8-bit unsigned |
| Output Width | 13-bit unsigned |
| Coefficients | {2, 4, 6, 6, 4, 2} |
| Architecture | Pipelined |
| Arithmetic | Shift-and-Add |
| Adder Architecture | Ripple Carry Adder |
| HDL | Verilog |
| FPGA Verification | Xilinx Vivado 2024.2 |
| ASIC Implementation | OpenLane 2 |
| Technology | Sky130A PDK |
| Final Layout | GDSII |

## Filter Architecture

The filter uses symmetric coefficients:

**h[n] = {2, 4, 6, 6, 4, 2}**

Taking advantage of coefficient symmetry, the architecture combines corresponding delayed input samples using pre-adders before performing shift-and-add operations.

The main functional blocks are:

1. Input register and delay line
2. Symmetric pre-adders
3. Shift-and-add arithmetic units
4. Ripple Carry Adder stages
5. Output register

The mathematical operation is:

\[
y[n] = 2(x[n]+x[n-5]) + 4(x[n-1]+x[n-4]) + 6(x[n-2]+x[n-3])
\]

## RTL Design

The Verilog implementation is organized into modular hardware blocks.

- Full Adder
- Ripple Carry Adder
- Pre-Adder
- Adder Architecture
- Shift Register
- FIR Filter Top Module

## Verification and Implementation

### Functional Verification
The RTL design was simulated using Xilinx Vivado 2024.2 and verified against expected output values using a testbench.

### FPGA Implementation
The verified RTL design was prepared for FPGA implementation.

### ASIC Physical Design
The design was taken through the ASIC implementation flow using OpenLane 2 and the Sky130A PDK.

The physical design deliverable includes the generated GDSII layout.

## Tools and Technologies

- Verilog HDL
- Xilinx Vivado 2024.2
- Yosys
- OpenLane 2
- Sky130A PDK
- Magic VLSI
- Linux / Ubuntu

## Repository Structure

```text
FIR-Filter-ASIC/
├── rtl/
├── simulation/
│   ├── testbench/
│   ├── results/
│   └── waveforms/
├── synthesis/
│   └── reports/
├── physical_design/
│   ├── config/
│   ├── reports/
│   └── gds/
├── documentation/
│   └── block_diagrams/
├── README.md
├── LICENSE
└── .gitignore
```

## Contributors

- Harshad Jagtap
- Suraj Jagtap
- Shraddha Jadhav

## Project Objective

To develop a complete digital signal processing hardware design and demonstrate its implementation journey from RTL development and functional verification to ASIC physical design and GDSII generation.

---

**Designed using Verilog HDL | Verified using Vivado | Implemented using OpenLane 2 and Sky130A**
