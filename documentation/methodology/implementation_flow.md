# FIR Filter Implementation Methodology

## 1. Overview

The project follows a complete digital design and ASIC implementation workflow, beginning with filter architecture development and ending with final GDSII generation.

The implementation is divided into RTL design, functional verification, synthesis, physical design and layout verification.

## 2. Design Flow

The major implementation stages are:

1. FIR filter architecture design.
2. Verilog RTL development.
3. Functional simulation and verification.
4. FPGA-oriented implementation and verification.
5. RTL synthesis.
6. ASIC floorplanning.
7. Standard-cell placement.
8. Physical routing.
9. Design Rule Check (DRC).
10. Layout Versus Schematic (LVS).
11. Final GDSII generation.

## 3. RTL Design

The FIR filter is implemented using modular Verilog RTL.

The design consists of the following modules:

| Module | Function |
|---|---|
| full_adder.v | Implements a one-bit full adder |
| rca_9bit.v | Implements a 9-bit ripple carry adder |
| rca_12bit.v | Implements a 12-bit ripple carry adder |
| rca_13bit.v | Implements a 13-bit ripple carry adder |
| pre_adder.v | Adds symmetric input sample pairs |
| adder_architecture.v | Implements the shift-and-add coefficient arithmetic |
| shift_register.v | Stores input samples for FIR processing |
| fir_filter_top.v | Integrates the complete FIR filter architecture |

The modular design makes the datapath easier to understand, verify and maintain.

## 4. Functional Verification

The RTL design is verified using a Verilog testbench.

The testbench applies input samples to the FIR filter and compares the hardware output against the expected mathematical result.

The simulation is performed using Xilinx Vivado 2024.2.

The verification process checks:

- Correct sample shifting.
- Correct symmetric pre-addition.
- Correct coefficient arithmetic.
- Correct output width.
- Correct behaviour during initial zero-filled samples.
- Agreement between simulated and expected outputs.

## 5. FPGA-Oriented Verification

The design is also taken through the Vivado implementation workflow for FPGA-oriented evaluation.

The target development platform considered for hardware testing is the PYNQ-Z2 board.

This stage provides an additional opportunity to evaluate the RTL implementation beyond software simulation.

## 6. ASIC Synthesis

The synthesizable Verilog RTL is processed using Yosys as part of the OpenLane 2 flow.

The synthesis stage converts the RTL description into a gate-level representation using the selected Sky130A standard-cell library.

The generated reports are used to analyse:

- Inferred hardware resources.
- Standard-cell utilisation.
- Synthesis statistics.
- Timing-related design characteristics.

## 7. Physical Design

The synthesized design is processed through the OpenLane 2 physical design flow.

The major physical implementation stages include:

- Floorplanning.
- Placement.
- Routing.
- Physical verification.
- Final layout generation.

The Sky130A PDK provides the technology-specific standard-cell and physical design information required for implementation.

## 8. Physical Verification

The final layout is checked using physical verification procedures.

### Design Rule Check (DRC)

DRC checks the layout against the geometric and manufacturing rules defined by the selected technology.

### Layout Versus Schematic (LVS)

LVS checks whether the connectivity extracted from the physical layout matches the reference circuit netlist.

## 9. GDSII Generation

After the physical design and verification stages, the final layout is exported in GDSII format.

The GDSII file represents the physical layout of the implemented FIR filter and serves as the final layout deliverable of the project.

## 10. Tools and Technologies

| Tool / Technology | Purpose |
|---|---|
| Verilog | RTL design |
| Xilinx Vivado 2024.2 | Simulation and FPGA-oriented design workflow |
| Yosys | RTL synthesis |
| OpenLane 2 | ASIC physical design |
| Sky130A PDK | Semiconductor technology library |
| Magic | Layout inspection and physical verification |

