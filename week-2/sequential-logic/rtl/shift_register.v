module shift_register (
    input logic clk,
    input logic reset,
    input logic serial_in,
    output logic [7:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 8'b0;
    else
        q <= {q[6:0], serial_in};
end

endmodule