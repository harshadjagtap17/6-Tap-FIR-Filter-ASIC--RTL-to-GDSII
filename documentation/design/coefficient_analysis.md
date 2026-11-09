# FIR Filter Coefficient Analysis

## 1. Introduction

The proposed FIR filter uses a 6-tap symmetric coefficient sequence:

h[n] = {2, 4, 6, 6, 4, 2}

The coefficients are selected to provide a simple low-pass filtering structure while allowing efficient hardware implementation through coefficient symmetry and shift-and-add arithmetic.

## 2. Coefficient Properties

| Tap | Coefficient | Binary Representation |
|---|---:|---|
| h[0] | 2 | 0010 |
| h[1] | 4 | 0100 |
| h[2] | 6 | 0110 |
| h[3] | 6 | 0110 |
| h[4] | 4 | 0100 |
| h[5] | 2 | 0010 |

The coefficient sequence is symmetric:

h[0] = h[5]

h[1] = h[4]

h[2] = h[3]

This property is used to simplify the arithmetic architecture.

## 3. Symmetry-Based Optimization

The conventional FIR equation is:

y[n] = 2x[n] + 4x[n-1] + 6x[n-2] + 6x[n-3] + 4x[n-4] + 2x[n-5]

By pairing symmetric samples:

A = x[n] + x[n-5]

B = x[n-1] + x[n-4]

C = x[n-2] + x[n-3]

The equation becomes:

y[n] = 2A + 4B + 6C

This reduces the number of coefficient multiplication operations from six to three.

## 4. Shift-and-Add Implementation

The coefficients are represented as sums of powers of two.

| Coefficient | Arithmetic Implementation |
|---|---|
| 2 | A << 1 |
| 4 | B << 2 |
| 6 | (C << 2) + (C << 1) |

The complete output equation is:

y[n] = (A << 1) + (B << 2) + (C << 2) + (C << 1)

This approach avoids conventional multiplier hardware and uses binary shifting and addition operations.

## 5. Coefficient Sum and Output Range

The sum of the coefficients is:

Σh[k] = 2 + 4 + 6 + 6 + 4 + 2 = 24

For a constant input sequence, the steady-state output is:

y[n] = 24x[n]

For the maximum 8-bit unsigned input:

x_max = 255

y_max = 255 × 24 = 6120

Therefore, a 13-bit unsigned output is sufficient.

## 6. Hardware Advantages

The selected coefficient sequence provides the following implementation advantages:

- Symmetry reduces the number of required coefficient multiplication operations.
- Shift-and-add arithmetic eliminates conventional multipliers.
- Small integer coefficients simplify the datapath.
- The architecture is suitable for synthesizable RTL implementation.
- The design provides an opportunity to analyse area and timing trade-offs in ASIC implementation.

## 7. Design Considerations

The coefficient sum is 24, which means the filter does not have unity DC gain.

For a constant input, the output reaches 24 times the input value after the filter's initial transient response.

The current implementation retains the original integer coefficient set without normalization. Any normalization or coefficient redesign would change the filter's numerical behaviour and would require separate verification.

