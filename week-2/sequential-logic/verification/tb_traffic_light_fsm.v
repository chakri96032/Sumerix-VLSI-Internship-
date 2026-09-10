`timescale 1ns/1ps

module tb_traffic_light_fsm;

logic clk;
logic reset;
logic red;
logic yellow;
logic green;

traffic_light_fsm uut (
    .clk(clk),
    .reset(reset),
    .red(red),
    .yellow(yellow),
    .green(green)
);

always #5 clk = ~clk;

initial begin
    $dumpfile("traffic_light_fsm.vcd");
    $dumpvars(0, tb_traffic_light_fsm);

    clk = 0;
    reset = 1;

    #10;
    reset = 0;

    #1;
    if (red !== 1'b0 || green !== 1'b1 || yellow !== 1'b0)
        $display("ERROR: Expected GREEN");

    #10;
    if (red !== 1'b0 || green !== 1'b0 || yellow !== 1'b1)
        $display("ERROR: Expected YELLOW");

    #10;
    if (red !== 1'b1 || green !== 1'b0 || yellow !== 1'b0)
        $display("ERROR: Expected RED");

    #10;
    if (red !== 1'b0 || green !== 1'b1 || yellow !== 1'b0)
        $display("ERROR: Expected GREEN");

    $display("Traffic Light FSM test completed.");

    #10;
    $finish;
end

endmodule