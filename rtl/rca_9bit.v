
module rca_9bit (
    input  wire [8:0] a,
    input  wire [8:0] b,
    input  wire cin,
    output wire [8:0] sum,
    output wire cout
);

wire [9:0] carry;

assign carry[0] = cin;

genvar i;
generate
    for (i = 0; i < 9; i = i + 1) begin : FA_STAGE
        full_adder FA (
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .sum(sum[i]),
            .cout(carry[i+1])
        );
    end
endgenerate

assign cout = carry[9];

endmodule

