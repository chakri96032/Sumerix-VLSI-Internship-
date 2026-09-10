module traffic_light_fsm (
    input  logic clk,
    input  logic reset,
    output logic red,
    output logic yellow,
    output logic green
);

typedef enum logic [1:0] {
    RED_STATE,
    GREEN_STATE,
    YELLOW_STATE
} state_t;

state_t current_state, next_state;

// State register
always_ff @(posedge clk) begin
    if (reset)
        current_state <= RED_STATE;
    else
        current_state <= next_state;
end

// Next-state logic
always_comb begin
    case (current_state)

        RED_STATE:
            next_state = GREEN_STATE;

        GREEN_STATE:
            next_state = YELLOW_STATE;

        YELLOW_STATE:
            next_state = RED_STATE;

        default:
            next_state = RED_STATE;

    endcase
end

// Moore output logic
always_comb begin
    red = 1'b0;
    yellow = 1'b0;
    green = 1'b0;

    case (current_state)

        RED_STATE:
            red = 1'b1;

        GREEN_STATE:
            green = 1'b1;

        YELLOW_STATE:
            yellow = 1'b1;

        default:
            red = 1'b1;

    endcase
end

endmodule