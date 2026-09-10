`timescale 1ns/1ps

module tb_parameterized_counter;

logic clk;
logic reset;
logic [7:0] q;

parameterized_counter #(
    .WIDTH(8)
) uut (
    .clk(clk),
    .reset(reset),
    .q(q)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("parameterized_counter_8bit.vcd");
    $dumpvars(0, tb_parameterized_counter);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #160;

    $finish;
end

endmodule