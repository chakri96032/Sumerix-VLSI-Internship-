`timescale 1ns/1ps

module tb_alu;

    logic [31:0] a;
    logic [31:0] b;
    logic [3:0]  alu_control;

    logic [31:0] result;
    logic        zero;

    alu uut (
        .a(a),
        .b(b),
        .alu_control(alu_control),
        .result(result),
        .zero(zero)
    );

    initial begin

        $dumpfile("alu.vcd");
        $dumpvars(0, tb_alu);

        // ADD: 10 + 5 = 15
        a = 32'd10;
        b = 32'd5;
        alu_control = 4'b0000;
        #10;

        // SUB: 10 - 5 = 5
        alu_control = 4'b0001;
        #10;

        // AND
        a = 32'hF0F0;
        b = 32'h0FF0;
        alu_control = 4'b0010;
        #10;

        // OR
        alu_control = 4'b0011;
        #10;

        // XOR
        alu_control = 4'b0100;
        #10;

        // LESS THAN: 5 < 10
        a = 32'd5;
        b = 32'd10;
        alu_control = 4'b0101;
        #10;

        // ZERO result
        a = 32'd10;
        b = 32'd10;
        alu_control = 4'b0001;
        #10;

        $finish;

    end

    initial begin
        $monitor("Time=%0t | A=%0d | B=%0d | Control=%b | Result=%0d | Zero=%b",
                 $time, a, b, alu_control, result, zero);
    end

endmodule
