`timescale 1ns/1ps

module tb_ring_counter;

logic clk;
logic reset;
logic [3:0] q;

ring_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("ring_counter.vcd");
    $dumpvars(0, tb_ring_counter);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #50;

    $finish;
end

endmodule