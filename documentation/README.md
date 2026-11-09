# Project Documentation

This directory contains the technical documentation for the 6-tap multiplierless FIR low-pass filter ASIC.

## Documentation Structure

### Architecture
Contains the functional block diagram and internal datapath architecture of the FIR filter.

### Design
Documents the filter specifications, coefficient selection, mathematical formulation and arithmetic architecture.

### Methodology
Describes the complete implementation methodology, from RTL development and functional verification to ASIC physical design and GDSII generation.

### Results
Presents the simulation analysis, synthesis observations and physical design results.

## Project Overview

The project implements a symmetric 6-tap FIR low-pass filter using a multiplierless shift-and-add architecture. The design targets noise smoothing in a UAV flight command receiver.

The implementation progresses through Verilog RTL design, functional simulation, FPGA-oriented verification and ASIC physical design using the Sky130A technology.

