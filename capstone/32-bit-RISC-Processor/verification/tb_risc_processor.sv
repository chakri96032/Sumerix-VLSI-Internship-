`timescale 1ns/1ps

module tb_risc_processor;

    logic clk;
    logic reset;

    risc_processor uut (
        .clk(clk),
        .reset(reset)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("risc_processor.vcd");
        $dumpvars(0, tb_risc_processor);

        clk = 0;
        reset = 1;

        // Hold reset
        #10;

        reset = 0;

        // Run processor
        #100;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | PC=%h | Instruction=%h | ALU Result=%h",
                 $time,
                 uut.pc,
                 uut.instruction,
                 uut.alu_result);
    end

endmodule
