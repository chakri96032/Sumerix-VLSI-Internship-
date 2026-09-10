module ring_counter (
    input logic clk,
    input logic reset,
    output logic [3:0] q
);

always_ff @(posedge clk) begin
    if (reset)
        q <= 4'b0001;
    else
        q <= {q[2:0], q[3]};
end

endmodule