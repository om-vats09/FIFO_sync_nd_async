
This project implements a parameterizable Synchronous FIFO for data buffering. It includes a memory array, write/read pointers, and status flags to prevent overflow and underflow.
Parameters
Data Width: 8 bits
Depth: 16 entries
Address Width: 4 bits
Port Signals
clk: System clock
rst: Active-low asynchronous reset
w_en / r_en: Write and Read enable signals
data_in / data_out: 8-bit data buses
full / empty: Status flags
Files
fifo.sv: RTL design and logic
tb_fifo.sv: Testbench with waveform dumping
