# Synthesis and Hardware Analysis

## Overview

This directory contains the synthesis documentation and hardware analysis of the proposed 6-tap multiplierless FIR low-pass filter.

The RTL design was synthesized using **Xilinx Vivado 2024.2** to evaluate the inferred hardware architecture and implementation characteristics.

## Synthesis Objectives

- Verify that the RTL design can be synthesized successfully.
- Analyse the hardware resources inferred by the synthesis tool.
- Examine the timing characteristics of the synthesized design.
- Evaluate the hardware implications of the multiplierless shift-and-add architecture.

## Design Architecture

The FIR filter uses symmetric coefficients:

\[
h[n] = \{2,4,6,6,4,2\}
\]

The implementation uses three pre-adders and a shift-and-add arithmetic structure instead of conventional multipliers.

## Synthesis Tool

- **Tool:** Xilinx Vivado
- **Version:** 2024.2
- **HDL:** Verilog

## Directory Contents

- `reports/` – Synthesis reports and hardware analysis.
- `netlist/` – Synthesized Verilog netlist, if exported.

## Results

The synthesis reports are provided in this directory for reference and further analysis of the hardware implementation.

