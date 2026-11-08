
`timescale 1ns/1ps

module fir_filter_tb;

    reg clk;
    reg reset;
    reg [7:0] data_in;

    wire [12:0] data_out;

    // DUT
    fir_filter_top uut (
        .clk      (clk),
        .reset    (reset),
        .data_in  (data_in),
        .data_out (data_out)
    );

    // 10 ns clock period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Reference model history
    reg [7:0] history [0:5];

    integer expected;
    integer sample_count;
    integer pass_count;
    integer fail_count;
    integer i;

    // Clear reference history
    task clear_history;
        integer k;
        begin
            for (k = 0; k < 6; k = k + 1)
                history[k] = 0;
        end
    endtask

    // Reset the actual DUT and reference model
    task reset_dut;
        begin
            @(negedge clk);
            reset = 1'b1;
            data_in = 8'd0;

            clear_history;

            // Synchronous active-high reset
            repeat (2) @(posedge clk);

            @(negedge clk);
            reset = 1'b0;

            // Allow reset deassertion to settle
            #1;
        end
    endtask

    // Independent mathematical FIR reference
    task calculate_expected;
        begin
            expected =
                (2 * history[0]) +
                (4 * history[1]) +
                (6 * history[2]) +
                (6 * history[3]) +
                (4 * history[4]) +
                (2 * history[5]);
        end
    endtask

    // Apply sample and compare output
    task apply_sample;
        input [7:0] sample;
        integer k;

        begin
            @(negedge clk);
            data_in = sample;

            @(posedge clk);

            // Match DUT shift-register behaviour
            for (k = 5; k > 0; k = k - 1)
                history[k] = history[k-1];

            history[0] = sample;

            calculate_expected;

            // Wait for combinational output to settle
            #1;

            sample_count = sample_count + 1;

            if (data_out === expected[12:0]) begin
                pass_count = pass_count + 1;

                $display(
                    "PASS: input=%0d output=%0d expected=%0d time=%0t",
                    sample, data_out, expected, $time
                );
            end
            else begin
                fail_count = fail_count + 1;

                $display(
                    "FAIL: input=%0d output=%0d expected=%0d time=%0t",
                    sample, data_out, expected, $time
                );
            end
        end
    endtask

    // Main verification sequence
    initial begin

        reset = 1'b1;
        data_in = 8'd0;

        sample_count = 0;
        pass_count = 0;
        fail_count = 0;

        clear_history;

        $display("----------------------------------------");
        $display("6-TAP FIR FILTER FUNCTIONAL VERIFICATION");
        $display("----------------------------------------");

        // Initial reset
        reset_dut;

        // TEST 1: Zero input
        $display("\nTEST 1: ZERO INPUT");

        repeat (8)
            apply_sample(8'd0);

        // TEST 2: Impulse response
        $display("\nTEST 2: IMPULSE RESPONSE");

        reset_dut;

        apply_sample(8'd100);

        repeat (7)
            apply_sample(8'd0);

        // TEST 3: Constant input
        $display("\nTEST 3: CONSTANT INPUT");

        reset_dut;

        repeat (10)
            apply_sample(8'd20);

        // TEST 4: Maximum input
        $display("\nTEST 4: MAXIMUM INPUT");

        reset_dut;

        repeat (10)
            apply_sample(8'd255);

        // TEST 5: Step input
        $display("\nTEST 5: STEP INPUT");

        reset_dut;

        repeat (5)
            apply_sample(8'd0);

        repeat (10)
            apply_sample(8'd100);

        // TEST 6: UAV command-like varying inputs
        $display("\nTEST 6: VARYING INPUT SEQUENCE");

        reset_dut;

        apply_sample(8'd20);
        apply_sample(8'd20);
        apply_sample(8'd20);
        apply_sample(8'd21);
        apply_sample(8'd22);
        apply_sample(8'd90);
        apply_sample(8'd24);
        apply_sample(8'd23);
        apply_sample(8'd22);
        apply_sample(8'd25);
        apply_sample(8'd0);
        apply_sample(8'd21);
        apply_sample(8'd22);
        apply_sample(8'd20);

        // TEST 7: Random input
        $display("\nTEST 7: RANDOM INPUT");

        reset_dut;

        for (i = 0; i < 30; i = i + 1)
            apply_sample($random);

        // Verification summary
        $display("\n----------------------------------------");
        $display("VERIFICATION SUMMARY");
        $display("----------------------------------------");

        $display("Total samples checked : %0d", sample_count);
        $display("PASS                  : %0d", pass_count);
        $display("FAIL                  : %0d", fail_count);

        if (fail_count == 0)
            $display("FINAL RESULT: ALL TESTS PASSED");
        else
            $display("FINAL RESULT: VERIFICATION FAILED");

        $display("----------------------------------------");

        $finish;
    end

endmodule
