# 4-bit Ripple Carry Adder RTL Block Diagram

The 4-bit Ripple Carry Adder is constructed using four Full Adders.

```text
A[0], B[0], Cin
       │
       ▼
     ┌─────┐
     │ FA0 │─── Sum[0]
     └──┬──┘
        │ C1
        ▼
     ┌─────┐
     │ FA1 │─── Sum[1]
     └──┬──┘
        │ C2
        ▼
     ┌─────┐
     │ FA2 │─── Sum[2]
     └──┬──┘
        │ C3
        ▼
     ┌─────┐
     │ FA3 │─── Sum[3]
     └──┬──┘
        │
        ▼
       Cout
