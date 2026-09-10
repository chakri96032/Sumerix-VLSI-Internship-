`timescale 1ns/1ps

module tb_register_file;

    logic clk;
    logic reset;
    logic write_enable;

    logic [4:0] read_addr1;
    logic [4:0] read_addr2;
    logic [4:0] write_addr;

    logic [31:0] write_data;

    logic [31:0] read_data1;
    logic [31:0] read_data2;

    register_file uut (
        .clk(clk),
        .reset(reset),
        .write_enable(write_enable),
        .read_addr1(read_addr1),
        .read_addr2(read_addr2),
        .write_addr(write_addr),
        .write_data(write_data),
        .read_data1(read_data1),
        .read_data2(read_data2)
    );

    always #5 clk = ~clk;

    initial begin
        $dumpfile("register_file.vcd");
        $dumpvars(0, tb_register_file);

        clk = 0;
        reset = 1;
        write_enable = 0;

        read_addr1 = 0;
        read_addr2 = 0;
        write_addr = 0;
        write_data = 0;

        #10;

        reset = 0;

        // Write 100 into R1
        write_enable = 1;
        write_addr = 5'd1;
        write_data = 32'd100;

        #10;

        // Write 200 into R2
        write_addr = 5'd2;
        write_data = 32'd200;

        #10;

        // Read R1 and R2
        write_enable = 0;
        read_addr1 = 5'd1;
        read_addr2 = 5'd2;

        #10;

        // Check R0
        read_addr1 = 5'd0;

        #10;

        $finish;
    end

    initial begin
        $monitor("Time=%0t | R1 Data=%0d | R2 Data=%0d",
                 $time, read_data1, read_data2);
    end

endmodule
