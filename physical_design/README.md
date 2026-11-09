# Physical Design and GDSII Implementation

## Overview

This directory contains the physical design implementation of the 6-tap multiplierless FIR low-pass filter ASIC.

The RTL design was taken through an ASIC physical design flow using OpenLane 2 and the Sky130A process design kit (PDK), resulting in a GDSII layout file.

## Physical Design Flow

The implementation follows these major stages:

1. RTL synthesis
2. Floorplanning
3. Placement
4. Clock tree synthesis, if applicable
5. Global and detailed routing
6. Design Rule Check (DRC)
7. Layout Versus Schematic (LVS)
8. Parasitic extraction
9. Final GDSII generation

## Technology and Tools

- **RTL:** Verilog
- **Physical Design Flow:** OpenLane 2
- **Synthesis Engine:** Yosys
- **PDK:** SkyWater Sky130A
- **Layout Tool:** Magic

## Design Specifications

| Parameter | Specification |
|---|---|
| Filter architecture | 6-tap symmetric FIR |
| Input width | 8-bit unsigned |
| Output width | 13-bit unsigned |
| Coefficients | {2, 4, 6, 6, 4, 2} |
| Arithmetic | Multiplierless shift-and-add |

## Directory Contents

- `gds/` – Final GDSII layout output.
- `reports/` – Physical design and implementation reports.
- `verification/` – DRC and LVS verification results.
- `layout/` – Layout visualisations and screenshots.

## Final Deliverable

The final GDSII file represents the physical layout generated from the FIR filter RTL implementation.

