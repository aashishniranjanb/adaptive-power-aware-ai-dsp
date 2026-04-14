module replica_path #(
    parameter DELAY_STAGES = 16
)(
    input  wire  clk,
    input  wire  in_signal,
    output wire  slack_violation
);

    // A chain of buffers/inverters that mimic the critical path delay.
    // This is used for "Replica Path Timing" as mentioned in the README.
    wire [DELAY_STAGES:0] delay_chain;
    assign delay_chain[0] = in_signal;

    genvar i;
    generate
        for (i = 0; i < DELAY_STAGES; i = i + 1) begin : chain
            (* keep = "true" *) 
            assign delay_chain[i+1] = ~delay_chain[i];
        end
    endgenerate

    reg late_signal;
    always @(posedge clk) begin
        late_signal <= delay_chain[DELAY_STAGES];
    end

    // If the signal doesn't arrive in time, slack_violation will trigger.
    // In a real system, this would feed back to a DFS/DVFS controller.
    assign slack_violation = late_signal ^ in_signal;

endmodule
