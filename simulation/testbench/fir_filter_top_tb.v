
`timescale 1ns / 1ps

module fir_filter_tb;

    reg clk;
    reg reset;
    reg [7:0] data_in;
    wire [12:0] data_out;

    reg [7:0] hist [0:5];
    reg [12:0] expected;

    integer i;
    integer errors;

    fir_filter_top dut (
        .clk      (clk),
        .reset    (reset),
        .data_in  (data_in),
        .data_out (data_out)
    );

    // 100 MHz simulation clock.
    initial clk = 1'b0;
    always #5 clk = ~clk;

    // Send one sample and compare against the reference equation.
    task send_sample;
        input [7:0] sample;
        begin
            @(negedge clk);
            data_in = sample;

            @(posedge clk);
            #1;

            for (i = 5; i > 0; i = i - 1)
                hist[i] = hist[i-1];

            hist[0] = sample;

            expected =
                (hist[0] * 13'd2) +
                (hist[1] * 13'd4) +
                (hist[2] * 13'd6) +
                (hist[3] * 13'd6) +
                (hist[4] * 13'd4) +
                (hist[5] * 13'd2);

            if (data_out !== expected) begin
                $display(
                    "FAIL: input=%0d output=%0d expected=%0d time=%0t",
                    sample, data_out, expected, $time
                );
                errors = errors + 1;
            end
            else begin
                $display(
                    "PASS: input=%0d output=%0d expected=%0d time=%0t",
                    sample, data_out, expected, $time
                );
            end
        end
    endtask

    initial begin
        reset   = 1'b1;
        data_in = 8'd0;
        errors  = 0;
        expected = 13'd0;

        for (i = 0; i < 6; i = i + 1)
            hist[i] = 8'd0;

        repeat (2) @(posedge clk);
        #1;
        reset = 1'b0;

        // Original project test vector.
        send_sample(8'd20);
        send_sample(8'd20);
        send_sample(8'd20);
        send_sample(8'd21);
        send_sample(8'd22);
        send_sample(8'd90);
        send_sample(8'd24);
        send_sample(8'd23);
        send_sample(8'd22);
        send_sample(8'd25);
        send_sample(8'd0);
        send_sample(8'd21);
        send_sample(8'd22);
        send_sample(8'd20);

        // Zero-input test.
        repeat (7) send_sample(8'd0);

        // Constant-input test.
        repeat (8) send_sample(8'd20);

        // Maximum-input test.
        repeat (8) send_sample(8'd255);

        // Impulse-response test.
        repeat (7) send_sample(8'd0);
        send_sample(8'd255);
        repeat (7) send_sample(8'd0);

        if (errors == 0)
            $display("ALL TESTS PASSED");
        else
            $display("TESTS FAILED: %0d mismatches", errors);

        $finish;
    end

endmodule

