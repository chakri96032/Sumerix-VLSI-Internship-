TRAFFIC LIGHT FSM

1. Overview
This project implements a Traffic Light Controller using a Moore
Finite State Machine (FSM).

2. States
The FSM has three states:

RED_STATE
- Red light is ON.
- Green and Yellow lights are OFF.

GREEN_STATE
- Green light is ON.
- Red and Yellow lights are OFF.

YELLOW_STATE
- Yellow light is ON.
- Red and Green lights are OFF.

3. State Transitions

RED_STATE → GREEN_STATE
GREEN_STATE → YELLOW_STATE
YELLOW_STATE → RED_STATE

The transition occurs on every rising edge of the clock.

4. Reset
When reset is active, the FSM enters RED_STATE.

5. FSM Type
This is a Moore FSM because the outputs depend only on the
current state.

6. Output Logic

RED_STATE:
red = 1
yellow = 0
green = 0

GREEN_STATE:
red = 0
yellow = 0
green = 1

YELLOW_STATE:
red = 0
yellow = 1
green = 0

7. Verification
The testbench checks the expected sequence:

RED → GREEN → YELLOW → RED

Automatic checks were used to verify the outputs.

8. Simulation
The design was simulated using Icarus Verilog and the waveform
was inspected using GTKWave.