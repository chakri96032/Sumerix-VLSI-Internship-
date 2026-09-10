`timescale 1ns/1ps

module tb_mod10_counter;

logic clk;
logic reset;
logic [3:0] q;

mod10_counter uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("mod10_counter.vcd");
    $dumpvars(0, tb_mod10_counter);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #110;

    $finish;
end

endmodule