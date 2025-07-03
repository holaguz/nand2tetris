`timescale 1ns / 1ps

module tb_dff;

  logic d;
  logic clk;
  logic q;
  logic not_q;

  dff dut (
      .d(d),
      .clk(clk),
      .q(q),
      .not_q(not_q)
  );

  localparam unsigned CLKPERIOD = 10;

  // Clock generation
  initial begin
    clk = 0;
    forever #(CLKPERIOD / 2) clk = ~clk;  // Toggle clock every 5 ns
  end

  // Test cases
  initial begin
    d = 0;  // Initial value for d
    #CLKPERIOD;  // Wait for 10 ns

    // Test case 1: Set d = 1, expect q = 1 after clock edge
    d = 1;
    #CLKPERIOD;  // Wait for one clock cycle
    assert (q == 1)
    else $error("Expected q = 1, got q = %0d", q);

    // Test case 2: Set d = 0, expect q = 0 after clock edge
    d = 0;

    // Wait half a clock cycle, expect q = 1.
    #(CLKPERIOD / 2);
    assert (q == 1)
    else $error("Expected q = 1, got q = 0");

    #(CLKPERIOD / 2);  // Wait half a cycle
    assert (q == 0)
    else $error("Expected q = 0, got q = %0d", q);

    // Test case 3: Set d = 1 again
    d = 1;
    #CLKPERIOD;  // Wait for one clock cycle
    assert (q == 1)
    else $error("Expected q = 1, got q = %0d", q);

    // Test case 4: Set d = 0 again
    d = 0;
    #CLKPERIOD;  // Wait for one clock cycle
    assert (q == 0)
    else $error("Expected q = 0, got q = %0d", q);

    $display("All tests passed");
    $finish;
  end

endmodule

