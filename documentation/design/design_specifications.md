# FIR Filter Design Specifications

## 1. Introduction

This project focuses on the design and implementation of a 6-tap Finite Impulse Response (FIR) low-pass digital filter using Verilog RTL.

The filter is designed for noise smoothing in a UAV flight command receiver, where unwanted high-frequency variations in the received command signal can affect the stability and reliability of the control input.

The implementation uses a symmetric coefficient structure and a multiplierless shift-and-add arithmetic architecture to reduce hardware complexity.

## 2. Design Objectives

- Design a 6-tap symmetric FIR low-pass filter.
- Implement the filter using synthesizable Verilog RTL.
- Exploit coefficient symmetry to reduce arithmetic operations.
- Replace conventional multipliers with shift-and-add operations.
- Verify the functionality through RTL simulation.
- Implement the design through an ASIC physical design flow.
- Generate the final GDSII layout using the Sky130A PDK.

## 3. Filter Specifications

| Parameter | Specification |
|---|---|
| Filter Type | Finite Impulse Response (FIR) |
| Filter Response | Low-pass |
| Number of Taps | 6 |
| Input Data Width | 8 bits |
| Input Format | Unsigned |
| Input Range | 0–255 |
| Output Data Width | 13 bits |
| Output Format | Unsigned |
| Coefficient Set | {2, 4, 6, 6, 4, 2} |
| Architecture | Symmetric FIR |
| Arithmetic Architecture | Multiplierless Shift-and-Add |
| Implementation Language | Verilog |
| ASIC Technology | Sky130A |

## 4. Mathematical Representation

The general FIR filter equation is:

y[n] = Σ h[k] × x[n-k]

For the proposed 6-tap filter:

y[n] = 2x[n] + 4x[n-1] + 6x[n-2] + 6x[n-3] + 4x[n-4] + 2x[n-5]

The coefficient sequence is symmetric:

h[0] = h[5] = 2

h[1] = h[4] = 4

h[2] = h[3] = 6

This symmetry allows the input samples to be paired before multiplication.

## 5. Symmetric Architecture

The filter uses three pre-addition operations:

A = x[n] + x[n-5]

B = x[n-1] + x[n-4]

C = x[n-2] + x[n-3]

The output equation becomes:

y[n] = 2A + 4B + 6C

This structure reduces six coefficient multiplication operations to three coefficient multiplication operations.

## 6. Multiplierless Arithmetic

Since all coefficients are small integers, multiplication is implemented using binary shifts and additions.

2A = A << 1

4B = B << 2

6C = (C << 2) + (C << 1)

Therefore:

y[n] = (A << 1) + (B << 2) + (C << 2) + (C << 1)

This eliminates the need for conventional hardware multipliers.

## 7. Data Width Considerations

The maximum input value is 255.

The maximum theoretical output is:

y_max = 255 × (2 + 4 + 6 + 6 + 4 + 2)

y_max = 255 × 24 = 6120

Since 6120 is less than 8192, a 13-bit unsigned output is sufficient to represent the maximum result.

## 8. Intended Application

The filter is intended for smoothing noisy digital command signals in a UAV flight command receiver.

The low-pass FIR structure reduces rapid variations in the input sequence while preserving the overall signal trend.

## 9. Implementation Scope

The project covers:

- RTL architecture development.
- Verilog module implementation.
- Functional simulation and verification.
- FPGA-oriented design verification.
- RTL synthesis.
- ASIC floorplanning and placement.
- Physical routing and layout generation.
- DRC and LVS verification.
- Final GDSII generation.

