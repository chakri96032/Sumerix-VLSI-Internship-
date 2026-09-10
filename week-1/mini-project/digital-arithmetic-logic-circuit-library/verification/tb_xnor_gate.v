`timescale 1ns/1ps

module tb_xnor_gate;

reg a;
reg b;
wire y;

xnor_gate uut (
    .a(a),
    .b(b),
    .y(y)
);

initial begin
    $dumpfile("xnor_gate.vcd");
    $dumpvars(0, tb_xnor_gate);

    $monitor("Time=%0t | a=%b b=%b | y=%b", $time, a, b, y);

    a = 0; b = 0;
    #10;

    a = 0; b = 1;
    #10;

    a = 1; b = 0;
    #10;

    a = 1; b = 1;
    #10;

    $finish;
end

endmodule
