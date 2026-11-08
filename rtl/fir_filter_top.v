
module fir_filter_top (
    input  wire clk,
    input  wire rst,
    input  wire [7:0] data_in,
    output wire [12:0] data_out
);

// Six delayed input samples
wire [7:0] x0, x1, x2;
wire [7:0] x3, x4, x5;

// Symmetric pre-adder outputs
wire [8:0] A, B, C;

// Shift register
shift_register SR (
    .clk(clk),
    .rst(rst),
    .data_in(data_in),
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5)
);

// Symmetric pre-addition
pre_adder PA (
    .x0(x0),
    .x1(x1),
    .x2(x2),
    .x3(x3),
    .x4(x4),
    .x5(x5),
    .A(A),
    .B(B),
    .C(C)
);

// FIR arithmetic
adder_architecture FIR_ADD (
    .A(A),
    .B(B),
    .C(C),
    .Y(data_out)
);

endmodule

