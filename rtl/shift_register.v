
module shift_register (
    input  wire clk,
    input  wire rst,
    input  wire [7:0] data_in,

    output reg [7:0] x0,
    output reg [7:0] x1,
    output reg [7:0] x2,
    output reg [7:0] x3,
    output reg [7:0] x4,
    output reg [7:0] x5
);

always @(posedge clk) begin

    if (rst) begin
        x0 <= 8'd0;
        x1 <= 8'd0;
        x2 <= 8'd0;
        x3 <= 8'd0;
        x4 <= 8'd0;
        x5 <= 8'd0;
    end

    else begin
        x5 <= x4;
        x4 <= x3;
        x3 <= x2;
        x2 <= x1;
        x1 <= x0;
        x0 <= data_in;
    end

end

endmodule

