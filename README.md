# 6-Tap Pipelined FIR Low-Pass Filter ASIC

A multiplierless, symmetric 6-tap Finite Impulse Response (FIR) low-pass filter designed using Verilog HDL, functionally verified using Xilinx Vivado 2024.2, and taken through ASIC physical implementation using OpenLane 2 and the Sky130A PDK.

<p align="center">
  <b>RTL Design | Functional Verification | ASIC Physical Design | GDSII</b>
</p>

---

## Project Overview

This project presents the design and implementation of a 6-tap pipelined FIR low-pass filter intended for signal smoothing in applications such as UAV flight command reception.

The architecture exploits coefficient symmetry to reduce the number of arithmetic operations. Conventional multipliers are replaced with a shift-and-add implementation, using ripple carry adders for the arithmetic datapath.

The project covers the complete digital hardware development process, from modular RTL design and functional simulation to ASIC physical design and final GDSII generation.

## Design Specifications

| Parameter | Specification |
|---|---|
| Filter Type | Finite Impulse Response (FIR) Low-Pass |
| Number of Taps | 6 |
| Input Width | 8-bit unsigned |
| Output Width | 13-bit unsigned |
| Coefficients | {2, 4, 6, 6, 4, 2} |
| Architecture | Symmetric, pipelined |
| Arithmetic | Multiplierless shift-and-add |
| Adder Architecture | Ripple Carry Adder (RCA) |
| HDL | Verilog |
| Functional Simulation | Xilinx Vivado 2024.2 |
| Synthesis Engine | Yosys |
| ASIC Flow | OpenLane 2 |
| Technology | Sky130A PDK |
| Layout Format | GDSII |

## Filter Architecture

The filter uses the symmetric coefficient sequence:

\[
h[n] = \{2,4,6,6,4,2\}
\]

The symmetry allows corresponding input samples to be paired before coefficient multiplication.

### Symmetric Pre-Addition

The three pre-addition operations are:

\[
A = x[n] + x[n-5]
\]

\[
B = x[n-1] + x[n-4]
\]

\[
C = x[n-2] + x[n-3]
\]

The resulting output equation is:

\[
y[n] = 2A + 4B + 6C
\]

### Multiplierless Shift-and-Add Arithmetic

The coefficient multiplications are implemented using binary shifts and additions:

\[
y[n] = (A \ll 1) + (B \ll 2) + (C \ll 2) + (C \ll 1)
\]

This eliminates conventional multiplier blocks and provides a hardware-efficient arithmetic structure.

### Main Functional Blocks

1. Input sample register and delay line
2. Symmetric pre-adders
3. Shift-and-add arithmetic units
4. Ripple Carry Adder stages
5. FIR output generation

## RTL Design

The design is developed using modular, synthesizable Verilog.

| RTL Module | Function |
|---|---|
| `full_adder.v` | One-bit full adder |
| `rca_9bit.v` | 9-bit ripple carry adder |
| `rca_12bit.v` | 12-bit ripple carry adder |
| `rca_13bit.v` | 13-bit ripple carry adder |
| `pre_adder.v` | Symmetric input sample addition |
| `adder_architecture.v` | Shift-and-add coefficient arithmetic |
| `shift_register.v` | Input sample storage and delay |
| `fir_filter_top.v` | Top-level FIR filter integration |

Explore the source files in [`rtl/`](rtl/).

## Verification and Implementation

### 1. Functional Simulation

The RTL design was functionally simulated using Xilinx Vivado 2024.2.

A Verilog testbench applies input samples and compares the simulated outputs against expected values calculated using the FIR equation.

Selected simulation observations:

| Input Sample | Simulated Output | Expected Output | Status |
|---:|---:|---:|---|
| 20 | 40 | 40 | PASS |
| 20 | 120 | 120 | PASS |
| 20 | 240 | 240 | PASS |
| 21 | 362 | 362 | PASS |
| 22 | 448 | 448 | PASS |
| 90 | 634 | 634 | PASS |

These are selected observations from the functional simulation log.

Explore the [simulation testbench](simulation/testbench/), [simulation results](simulation/simulation_results/), and [waveforms](simulation/waveforms/).

### 2. Synthesis

The RTL design was synthesized using Yosys as part of the ASIC implementation workflow.

Synthesis and timing reports are organised in:

- [`synthesis/synthesis_reports/`](synthesis/synthesis_reports/)
- [`synthesis/timing_reports/`](synthesis/timing_reports/)

### 3. ASIC Physical Design

The synthesized design was taken through the OpenLane 2 physical design flow using the Sky130A PDK.

The implementation workflow covers:

- RTL synthesis
- Floorplanning
- Standard-cell placement
- Routing
- Physical verification
- Final layout generation

The physical design reports and verification evidence are available in [`physical_design/`](physical_design/).

### 4. GDSII Generation

The final physical layout was generated in GDSII format.

**Final layout file:** [`fir_filter_top.gds`](physical_design/gds/fir_filter_top.gds)

**Technology:** Sky130A

## Tools and Technologies

| Tool / Technology | Application |
|---|---|
| Verilog HDL | RTL development |
| Xilinx Vivado 2024.2 | Functional simulation and FPGA-oriented workflow |
| Yosys | RTL synthesis |
| OpenLane 2 | ASIC physical design |
| Sky130A PDK | Standard-cell technology |
| Magic VLSI | Layout inspection and physical design |

## Repository Structure

```text
FIR-Filter-ASIC/
│
├── rtl/
│
├── simulation/
│   ├── testbench/
│   ├── simulation_results/
│   ├── waveforms/
│   └── README.md
│
├── synthesis/
│   ├── synthesis_reports/
│   ├── timing_reports/
│   └── README.md
│
├── physical_design/
│   ├── gds/
│   ├── reports/
│   ├── verification/
│   ├── layout/
│   └── README.md
│
├── documentation/
│   ├── architecture/
│   ├── design/
│   ├── methodology/
│   ├── results/
│   └── README.md
│
├── README.md
├── LICENSE
└── .gitignore
```

## Technical Documentation

Detailed project documentation is available in [`documentation/`](documentation/).

| Document | Description |
|---|---|
| [Design Specifications](documentation/design/design_specifications.md) | Filter parameters and mathematical formulation |
| [Coefficient Analysis](documentation/design/coefficient_analysis.md) | Symmetry and shift-and-add optimisation |
| [Implementation Flow](documentation/methodology/implementation_flow.md) | RTL-to-GDSII workflow |
| [Simulation Analysis](documentation/results/simulation_analysis.md) | Functional verification observations |
| [Physical Design Analysis](documentation/results/physical_design_analysis.md) | ASIC implementation and GDSII details |

## Contributors

- **Harshad Jagtap**
- **Suraj Jagtap**
- **Shraddha Jadhav**
  
## License

This project is licensed under the MIT License.
See the [LICENSE](LICENSE) file for details.
## Project Objective

To design and implement a multiplierless digital FIR filter and demonstrate the complete hardware development journey, from RTL architecture and functional verification to ASIC physical design and GDSII generation.

---

<p align="center">
  <b>Designed using Verilog HDL | Verified using Vivado | Synthesized using Yosys | Implemented using OpenLane 2 and Sky130A</b>
</p>
