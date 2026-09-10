`timescale 1ns/1ps

module tb_full_adder;

reg a;
reg b;
reg cin;
wire sum;
wire carry;

full_adder uut (
    .a(a),
    .b(b),
    .cin(cin),
    .sum(sum),
    .carry(carry)
);

initial begin
    $dumpfile("full_adder.vcd");
    $dumpvars(0, tb_full_adder);

    $monitor("Time=%0t | a=%b b=%b cin=%b | sum=%b carry=%b",
             $time, a, b, cin, sum, carry);

    a = 0; b = 0; cin = 0;
    #10;

    a = 0; b = 0; cin = 1;
    #10;

    a = 0; b = 1; cin = 0;
    #10;

    a = 0; b = 1; cin = 1;
    #10;

    a = 1; b = 0; cin = 0;
    #10;

    a = 1; b = 0; cin = 1;
    #10;

    a = 1; b = 1; cin = 0;
    #10;

    a = 1; b = 1; cin = 1;
    #10;

    $finish;
end

endmodule
