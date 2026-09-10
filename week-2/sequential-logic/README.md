# Task-2 — Combinational and Sequential RTL Design

## Overview

This project is part of the Industry-Oriented Internship Program on VLSI Design and Semiconductor Engineering.

Task-2 focuses on sequential RTL design, counters, parameterized Verilog, finite state machines, timing concepts, and advanced RTL simulation.

## Tools Used

- Verilog / SystemVerilog
- Icarus Verilog
- GTKWave
- VS Code
- Ubuntu WSL
- Git and GitHub

## Project Structure

```text
sequential-logic/
├── rtl/
│   ├── d_flip_flop.v
│   ├── register_8bit.v
│   ├── shift_register.v
│   ├── up_counter_4bit.v
│   ├── down_counter_4bit.v
│   ├── mod10_counter.v
│   ├── ring_counter.v
│   ├── johnson_counter.v
│   ├── parameterized_register.v
│   ├── parameterized_counter.v
│   ├── parameterized_shift_register.v
│   └── fsm/
│       └── traffic_light_fsm.v
│
├── verification/
│   ├── tb_d_flip_flop.v
│   ├── tb_register_8bit.v
│   ├── tb_shift_register.v
│   ├── tb_up_counter_4bit.v
│   ├── tb_down_counter_4bit.v
│   ├── tb_mod10_counter.v
│   ├── tb_ring_counter.v
│   ├── tb_johnson_counter.v
│   ├── tb_parameterized_register.v
│   ├── tb_parameterized_counter.v
│   ├── tb_parameterized_shift_register.v
│   ├── tb_traffic_light_fsm.v
│   └── advanced_tb/
│       └── reusable_tb.v
│
├── waveforms/
│   ├── *.vcd
│   └── *.png
│
└── docs/
    ├── timing/
    └── fsm/
    
    
    Completed Modules
Sequential Logic
D Flip-Flop
8-bit Register
8-bit Shift Register
Counters
4-bit Up Counter
4-bit Down Counter
Mod-10 Counter
Ring Counter
Johnson Counter
Parameterized RTL
Parameterized Register
Parameterized Counter
Parameterized Shift Register

Multiple widths were verified during simulation.

Finite State Machine

A Moore Traffic Light FSM was implemented with:

RED → GREEN → YELLOW → RED

Reset places the FSM in the RED state.

Verification

The designs were compiled and simulated using Icarus Verilog.

Waveforms were generated in VCD format and inspected using GTKWave.

The Traffic Light FSM testbench includes automatic checks for the expected state sequence.

Timing Concepts

The testbenches use a 10 ns clock period:

Clock Period = 10 ns
Clock Frequency = 100 MHz

Setup time and hold time concepts were also documented.

Advanced Testbench

A reusable testbench template was created with:

Clock generation
Reset generation
Reset task
Waveform dumping
Reusable test structure
Documentation

Documentation includes:

FSM state transition diagram
Timing analysis
GTKWave waveform screenshots
RTL and verification files

Conclusion
Task-2 demonstrates practical knowledge of sequential RTL design, counters, parameterized modules, FSMs, timing concepts, testbench development, simulation, and waveform verification.