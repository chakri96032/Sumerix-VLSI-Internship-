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

    // Reset processor
    #10;
    reset = 0;

    // Allow instructions to execute
    #40;

    // Verification checks
    if (uut.registers.registers[1] == 32'd10)
        $display("PASS: R1 = 10");
    else
        $display("FAIL: R1 = %0d", uut.registers.registers[1]);

    if (uut.registers.registers[2] == 32'd20)
        $display("PASS: R2 = 20");
    else
        $display("FAIL: R2 = %0d", uut.registers.registers[2]);

    if (uut.registers.registers[3] == 32'd30)
        $display("PASS: R3 = 30");
    else
        $display("FAIL: R3 = %0d", uut.registers.registers[3]);

    #10;
    $finish;
end

initial begin
    $monitor(
        "Time=%0t | PC=%h | Instruction=%h | ALU Result=%h",
        $time,
        uut.pc,
        uut.instruction,
        uut.alu_result
    );
end

endmodule
