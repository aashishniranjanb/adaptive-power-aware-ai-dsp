`timescale 1ns / 1ps

module tb_systolic_array();

    parameter ROWS = 4;
    parameter COLS = 4;
    parameter DATA_WIDTH = 8;
    parameter ACC_WIDTH = 24;

    reg clk;
    reg rst_n;
    reg [DATA_WIDTH-1:0] weights [ROWS-1:0][COLS-1:0];
    reg [DATA_WIDTH-1:0] data_in [ROWS-1:0];
    reg [ROWS-1:0] zero_mask;
    wire [ACC_WIDTH-1:0] data_out [COLS-1:0];

    systolic_array #(
        .ROWS(ROWS),
        .COLS(COLS),
        .DATA_WIDTH(DATA_WIDTH),
        .ACC_WIDTH(ACC_WIDTH)
    ) dut (
        .clk(clk),
        .rst_n(rst_n),
        .weights(weights),
        .data_in(data_in),
        .data_out(data_out),
        .zero_mask(zero_mask)
    );

    always #5 clk = ~clk;

    integer i, j;

    initial begin
        clk = 0;
        rst_n = 0;
        zero_mask = 0;
        
        // Initialize weights
        for (i = 0; i < ROWS; i = i + 1)
            for (j = 0; j < COLS; j = j + 1)
                weights[i][j] = i + j + 1;

        #20 rst_n = 1;

        // Test with full data
        for (i = 0; i < ROWS; i = i + 1) data_in[i] = i + 1;
        #100;

        // Test with sparsity (zero mask)
        zero_mask = 4'b1010; // Row 1 and 3 are zero
        #100;

        $display("Simulation finished");
        $finish;
    end

endmodule
