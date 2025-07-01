`timescale 1ns / 1ps

module tb_full_adder;
  bit x, y, z, sum, carry;

  typedef struct packed {
    bit x;
    bit y;
    bit z;
    bit sum;
    bit carry;
  } test_case_t;

  test_case_t test_cases[] = '{
      {1'b0, 1'b0, 1'b0, 1'b0, 1'b0},
      {1'b0, 1'b0, 1'b1, 1'b1, 1'b0},
      {1'b0, 1'b1, 1'b0, 1'b1, 1'b0},
      {1'b0, 1'b1, 1'b1, 1'b0, 1'b1},
      {1'b1, 1'b0, 1'b0, 1'b1, 1'b0},
      {1'b1, 1'b0, 1'b1, 1'b0, 1'b1},
      {1'b1, 1'b1, 1'b0, 1'b0, 1'b1},
      {1'b1, 1'b1, 1'b1, 1'b1, 1'b1}
  };

  full_adder dut (.*);
  initial begin

    foreach (test_cases[i]) begin
      x = test_cases[i].x;
      y = test_cases[i].y;
      z = test_cases[i].z;
      #1;

      assert (test_cases[i].sum == sum)
      else $error("%d: sum mismatch %d != %d", i, test_cases[i].sum, sum);
      assert (test_cases[i].carry == carry)
      else $error("%d: carry mismatch %d != %d", i, test_cases[i].carry, carry);

    end
    $display("All tests passed");
    $finish;
  end

endmodule
