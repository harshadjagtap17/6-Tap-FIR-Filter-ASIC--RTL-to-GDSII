# RTL Design – 6-Tap FIR Filter

This directory contains the synthesizable Verilog HDL source files for the 6-tap pipelined FIR low-pass filter.

## Source Files

| File | Description |
|---|---|
| `full_adder.v` | Basic 1-bit full adder module |
| `rca_9bit.v` | 9-bit Ripple Carry Adder |
| `rca_12bit.v` | 12-bit Ripple Carry Adder |
| `rca_13bit.v` | 13-bit Ripple Carry Adder |
| `pre_adder.v` | Adds symmetric input samples |
| `adder_architecture.v` | Implements the shift-and-add arithmetic structure |
| `shift_register.v` | Stores and delays input samples |
| `fir_filter_top.v` | Top-level module integrating the FIR filter architecture |

## Architecture

The design exploits coefficient symmetry to reduce arithmetic hardware requirements.

The coefficient set is:

`h[n] = {2, 4, 6, 6, 4, 2}`

The symmetric input samples are combined using pre-adders, followed by shift-and-add operations and accumulation through adder stages.

## Design Characteristics

- 6-tap FIR filter
- 8-bit unsigned input
- 13-bit unsigned output
- Symmetric coefficient architecture
- Multiplierless shift-and-add implementation
- Modular RTL design
- Pipelined implementation

## Top Module

`fir_filter_top.v`

This module integrates the individual RTL components to implement the complete FIR filter.

## Verification

The RTL design was functionally verified using Xilinx Vivado 2024.2.

Refer to the `simulation/` directory for testbench and verification results.

