# MIPS-Based MCU on FPGA

This project implements a **MIPS-based MCU** on the **DE10-Standard FPGA board** (Cyclone V SoC) (5CSXFC6D6F31C6).  
It was developed in **VHDL**, simulated with **ModelSim**, and synthesized using **Quartus**, with hardware verification via **SignalTap**.

The MCU controls on-board peripherals through memory-mapped I/O, supports **interrupt handling**, and integrates an **FIR filter hardware accelerator**.  

## Repository Structure
- `VHDL/` — VHDL design files (MCU, CPU core, peripherals, accelerators)
- `TB/` — Testbench files
- `SIM/` — ModelSim DO scripts
- `Software Test Samples/` — A sample of tests and assembly programs to run on the MCU
- `PinAssignments.qsf` — FPGA pin mapping for DE10-Standard board

## Key Capabilities:
- 32-bit CPU compatible with the MIPS ISA
- Full instruction set support
- Memory-mapped I/O
- Interrupt controller for handling external/internal events
- FIR Filter hardware accelerator
- Timer peripheral for timing and timed interrupt generation

## For Reproducibility:
- Set your environment to use VHDL 2008
- In `VHDL/cond_compilation_package.vhd`, set the constant:
   - `G_MODELSIM = 1` → for simulation in ModelSim
   - `G_MODELSIM = 0` → for synthesis in Quartus
- Pin assignments for Quartus are provided in PinAssignments.qsf