`timescale 1ns/1ps

module tb_program_counter;

logic clk;
logic reset;
logic [31:0] pc;

program_counter uut (
    .clk(clk),
    .reset(reset),
    .pc(pc)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("program_counter.vcd");
    $dumpvars(0, tb_program_counter);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #50;

    $finish;
end

initial begin
    $monitor("Time=%0t | reset=%b | PC=%h", $time, reset, pc);
end

endmodule
