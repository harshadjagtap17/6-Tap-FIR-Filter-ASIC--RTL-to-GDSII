
module rca_13bit (
    input  wire [12:0] a,
    input  wire [12:0] b,
    input  wire cin,
    output wire [12:0] sum,
    output wire cout
);

wire [13:0] carry;

assign carry[0] = cin;

genvar i;
generate
    for (i = 0; i < 13; i = i + 1) begin : FA_STAGE
        full_adder FA (
            .a(a[i]),
            .b(b[i]),
            .cin(carry[i]),
            .sum(sum[i]),
            .cout(carry[i+1])
        );
    end
endgenerate

assign cout = carry[13];

endmodule

