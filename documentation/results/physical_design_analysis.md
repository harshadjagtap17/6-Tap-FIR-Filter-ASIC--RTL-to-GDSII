# FIR Filter Physical Design Analysis

## 1. Overview

The 6-tap multiplierless FIR filter was taken through an ASIC physical design flow using OpenLane 2 and the Sky130A process design kit.

The objective was to translate the synthesizable Verilog RTL into a physical standard-cell layout and generate the final GDSII output.

## 2. Physical Design Environment

| Parameter | Details |
|---|---|
| Physical Design Flow | OpenLane 2 |
| Synthesis Engine | Yosys |
| Technology | Sky130A |
| Standard Cell Library | sky130_fd_sc_hd |
| Layout Tool | Magic |
| Design | fir_filter_top |

## 3. Physical Design Stages

### 3.1 RTL Synthesis

The Verilog RTL was synthesized into a gate-level representation using the Sky130A standard-cell library.

### 3.2 Floorplanning

The initial physical design floorplan was generated, defining the core and die regions for the standard-cell implementation.

### 3.3 Placement

The synthesized standard cells were placed within the defined core region.

### 3.4 Routing

The interconnections between the placed cells were generated through the physical routing stages.

### 3.5 Layout Generation

The physical implementation was exported as a GDSII layout file.

## 4. Physical Verification

The physical design flow includes two important verification procedures.

### Design Rule Check (DRC)

DRC evaluates the physical layout against the geometric design rules of the Sky130A technology.

The DRC results are maintained in the physical design verification directory.

### Layout Versus Schematic (LVS)

LVS compares the extracted physical layout connectivity against the reference netlist.

The LVS verification results are maintained separately for traceability.

## 5. Final GDSII Deliverable

The final physical layout is available in GDSII format.

**File:** `fir_filter_top.gds`

**Technology:** Sky130A

The GDSII file represents the generated physical layout of the FIR filter implementation.

## 6. Implementation Evidence

The physical design directory contains the implementation outputs and supporting evidence, including:

- Final GDSII layout.
- Physical design reports.
- Floorplanning and placement information.
- Routing reports.
- DRC verification results.
- LVS verification results.
- Layout visualisations.

## 7. Conclusion

The physical design stage demonstrates the progression of the FIR filter from synthesizable RTL to a physical ASIC layout.

The generated GDSII file serves as the final physical implementation deliverable.

