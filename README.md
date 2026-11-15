# 4-Bit Structural Processor

## Overview

This project focuses on the design, simulation, and verification of a **4-Bit Structural Processor Core** using VHDL.

The processor is designed as part of the Digital Logic Labs Capstone Project at the Faculty of Engineering, Alexandria University.

The design follows a modular structural architecture, where individual hardware components are developed independently and interconnected to perform different processor operations.

The project is implemented and simulated using **Intel Quartus Prime** and **ModelSim**.

## Features

The processor supports 9 different instructions controlled by a 4-bit Opcode:

| Instruction | Operation | Description |
|---|---|---|
| 0000 | Addition | A + B |
| 0001 | Subtraction | A - B |
| 0010 | Increment | A + 1 |
| 0011 | Decrement | A - 1 |
| 0100 | Circular Shift Right | Circular right shift of B |
| 0101 | Circular Shift Left | Circular left shift of B |
| 0110 | Bus Merging | Concatenation of A and B |
| 0111 | Clear Bus | Clear all output bits |
| 1000 | Concatenated Shift Left | Left shift of the concatenated A and B |

*Note: Opcode assignments are the selected project implementation mapping.*

## Architecture

### Input Signals
- `A[3:0]`: First 4-bit input operand.
- `B[3:0]`: Second 4-bit input operand.
- `Opcode[3:0]`: Instruction selection input.
- `clk`: Global master clock.

### Output Signal
- `Output_Bus[7:0]`: 8-bit processor output.

### Structural Components

The processor is built using modular hardware components, including:

- Full Adder.
- 4-Bit Ripple Carry Adder.
- Subtractor using 2's Complement.
- Incrementer and Decrementer.
- Multiplexers.
- Circular Shifter.
- 8-Bit Concatenated Shifter.
- Instruction Decoder.
- Synchronous Output Register.

## Design Requirements

The implementation follows the project constraints:

- Structural VHDL modeling through component instantiation.
- No use of `IEEE.numeric_std`, `std_logic_arith`, or `std_logic_unsigned`.
- Arithmetic operations implemented using hardware logic circuits.
- Synchronous output updates on the rising edge of the master clock.
- Explicit handling of unused Opcode states.
- Modular and hierarchical design methodology.

## Tools & Technologies

- **VHDL** – Hardware Description Language.
- **Intel Quartus Prime** – Design entry, compilation, and synthesis.
- **ModelSim** – Functional simulation and waveform verification.

## Simulation & Verification

The processor is verified through interactive ModelSim simulations.

Each instruction is tested using multiple input combinations and different simulation time intervals.

The verification process focuses on:

- Correct instruction decoding.
- Arithmetic and logical operation accuracy.
- Proper output bus mapping.
- Clock synchronization.
- Correct handling of unused Opcode states.

Simulation waveforms are documented to demonstrate the functionality of all supported instructions.

## Project Structure

```text
4-Bit-Structural-Processor/
│
├── src/
│   ├── full_adder.vhd
│   ├── ripple_carry_adder.vhd
│   ├── subtractor.vhd
│   ├── incrementer.vhd
│   ├── decrementer.vhd
│   ├── shifter.vhd
│   ├── multiplexer.vhd
│   ├── instruction_decoder.vhd
│   ├── output_register.vhd
│   └── processor_top.vhd
│
├── simulation/
│   └── waveforms/
│
├── docs/
│   ├── architecture/
│   └── project_report/
│
└── README.md
```

*The directory structure represents the planned modular organization of the project.*

## Academic Information

**University:** Alexandria University  
**Faculty:** Faculty of Engineering  
**Project:** EE Undergraduate Digital Logic Labs – Capstone Project  
**Project Title:** Design and Verification of a 4-Bit Structural Processor Core

## Contributors

Developed collaboratively as part of the Digital Logic Labs capstone project.

