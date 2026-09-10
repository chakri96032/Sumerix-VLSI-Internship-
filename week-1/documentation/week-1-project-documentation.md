# Task-1 Week-1 Project Documentation

## 1. Introduction

This document summarizes the work completed during Week 1 of the VLSI internship Task-1.

The main areas covered were:

- Digital electronics fundamentals
- Linux environment setup
- Verilog HDL programming
- Testbench development
- Icarus Verilog simulation
- GTKWave waveform analysis
- Basic digital circuit design
- Git and GitHub version control

---

## 2. Development Environment

### Hardware/Operating Environment

- Windows
- Ubuntu Linux through WSL

### Software Tools

- Visual Studio Code
- Ubuntu WSL
- Icarus Verilog
- GTKWave
- Git
- GitHub

---

## 3. Digital Electronics

The following logic gates were studied and implemented:

- AND
- OR
- XOR
- NOT
- NAND
- NOR
- XNOR

Truth tables and K-map solutions were documented separately.

---

## 4. Verilog HDL Designs

The following circuits were implemented using Verilog HDL:

### Logic Gates

1. AND Gate
2. OR Gate
3. XOR Gate
4. NOT Gate
5. NAND Gate
6. NOR Gate
7. XNOR Gate

### Combinational Circuits

8. 2-to-1 Multiplexer
9. Half Adder
10. Full Adder
11. 4-bit Ripple Carry Adder

---

## 5. Verification Methodology

Each Verilog design was tested using a dedicated testbench.

The verification flow was:

```text
Verilog RTL
     ↓
Testbench
     ↓
Icarus Verilog
     ↓
Simulation
     ↓
VCD Waveform
     ↓
GTKWave
     ↓
Waveform Verification

 A0 ──┐
 B0 ──┤
 Cin ─┤ Full Adder ── S0
      │       │
      │       C1
      ↓       ↓

 A1 ──┐
 B1 ──┤
 C1 ──┤ Full Adder ── S1
      │       │
      │       C2
      ↓       ↓

 A2 ──┐
 B2 ──┤
 C2 ──┤ Full Adder ── S2
      │       │
      │       C3
      ↓       ↓

 A3 ──┐
 B3 ──┤
 C3 ──┤ Full Adder ── S3
      │       │
      └────── Cout

      week-1/documentation/waveforms/

      week-1/documentation/linux-report/

      week-1/mini-project/digital-arithmetic-logic-circuit-library/