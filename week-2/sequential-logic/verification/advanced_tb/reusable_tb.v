`timescale 1ns/1ps

module reusable_tb;

logic clk;
logic reset;

// Clock generation
always #5 clk = ~clk;

// Reset generation
task automatic reset_dut;
begin
    reset = 1'b1;
    #10;
    reset = 1'b0;
end
endtask

initial begin
        
    $dumpfile("reusable_tb.vcd");
    $dumpvars(0, reusable_tb);
    
    clk = 1'b0;
    reset = 1'b0;

    // Apply reset
    reset_dut();

    // Test cases can be added here
    #100;

    $display("Reusable testbench completed.");
    $finish;
end

endmodule