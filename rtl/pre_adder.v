
module pre_adder (
    input  wire [7:0] x0,
    input  wire [7:0] x1,
    input  wire [7:0] x2,
    input  wire [7:0] x3,
    input  wire [7:0] x4,
    input  wire [7:0] x5,

    output wire [8:0] A,
    output wire [8:0] B,
    output wire [8:0] C
);

wire unused_carry_A;
wire unused_carry_B;
wire unused_carry_C;

rca_9bit PA0 (
    .a({1'b0, x0}),
    .b({1'b0, x5}),
    .cin(1'b0),
    .sum(A),
    .cout(unused_carry_A)
);

rca_9bit PA1 (
    .a({1'b0, x1}),
    .b({1'b0, x4}),
    .cin(1'b0),
    .sum(B),
    .cout(unused_carry_B)
);

rca_9bit PA2 (
    .a({1'b0, x2}),
    .b({1'b0, x3}),
    .cin(1'b0),
    .sum(C),
    .cout(unused_carry_C)
);

endmodule

