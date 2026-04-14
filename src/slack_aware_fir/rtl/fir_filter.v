module fir_filter #(
    parameter TAPS = 8,
    parameter DATA_WIDTH = 16,
    parameter COEFF_WIDTH = 16
)(
    input  wire                   clk,
    input  wire                   rst_n,
    input  wire [DATA_WIDTH-1:0]  data_in,
    output reg  [DATA_WIDTH*2-1:0] data_out,
    input  wire [COEFF_WIDTH-1:0] coeffs [TAPS-1:0]
);

    reg [DATA_WIDTH-1:0] shift_reg [TAPS-1:0];
    integer i;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            for (i = 0; i < TAPS; i = i + 1)
                shift_reg[i] <= {DATA_WIDTH{1'b0}};
            data_out <= {DATA_WIDTH*2{1'b0}};
        end else begin
            shift_reg[0] <= data_in;
            for (i = 1; i < TAPS; i = i + 1)
                shift_reg[i] <= shift_reg[i-1];
            
            data_out <= {DATA_WIDTH*2{1'b0}};
            for (i = 0; i < TAPS; i = i + 1)
                data_out <= data_out + (shift_reg[i] * coeffs[i]);
        end
    end

endmodule
