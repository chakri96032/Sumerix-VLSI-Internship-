# Task-2 Simulation Results

## Simulation Tool

Icarus Verilog was used to compile and simulate the SystemVerilog RTL designs.

GTKWave was used to inspect the generated VCD waveforms.

## Sequential Logic

### D Flip-Flop
- Reset verified
- Data capture on rising clock edge verified
- Waveform generated successfully

### 8-bit Register
- Multiple 8-bit data patterns tested
- Data storage on rising clock edge verified
- Waveform generated successfully

### 8-bit Shift Register
- Serial input sequence tested
- Bit shifting verified
- Waveform generated successfully

## Counters

### 4-bit Up Counter
- Count sequence verified
- Counts from 0000 to 1111
- Wraps from 1111 to 0000

### 4-bit Down Counter
- Count sequence verified
- Counts from 1111 to 0000
- Wraps from 0000 to 1111

### Mod-10 Counter
- Counts from 0 to 9
- Returns to 0 after 9
- Waveform verified

### Ring Counter
- Single-bit circulation verified
- Sequence:
  0001 → 0010 → 0100 → 1000 → 0001

### Johnson Counter
- Eight-state sequence verified
- Sequence:
  0000 → 0001 → 0011 → 0111 → 1111
  → 1110 → 1100 → 1000 → 0000

## Parameterized RTL

### Parameterized Register
- WIDTH=8 verified
- WIDTH=16 verified

### Parameterized Counter
- WIDTH=4 verified
- WIDTH=8 verified

### Parameterized Shift Register
- WIDTH=8 verified
- WIDTH=4 verified

## Traffic Light FSM

The Moore FSM was tested using automatic testbench checks.

Expected sequence:

RED → GREEN → YELLOW → RED

Result:
PASS

No ERROR messages were reported during simulation.

## Reusable Testbench

The reusable testbench verified:
- Clock generation
- Reset generation
- Waveform dumping
- Reusable reset task

Result:
PASS

## Overall Result

All implemented Task-2 RTL modules were successfully compiled and simulated.

The generated VCD files were inspected using GTKWave and corresponding waveform screenshots were saved in the waveforms directory.
