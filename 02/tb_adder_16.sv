`timescale 1ns / 1ps

module tb_adder_16;

  logic [15:0] x, y, sum;

  typedef struct packed {
    logic [15:0] x;
    logic [15:0] y;
    logic [15:0] sum;
  } test_case_t;

  test_case_t test_cases[] = '{
      {16'b0000000000000000, 16'b0000000000000000, 16'b0000000000000000},
      {16'b0000000000000000, 16'b1111111111111111, 16'b1111111111111111},
      {16'b1111111111111111, 16'b1111111111111111, 16'b1111111111111110},
      {16'b1010101010101010, 16'b0101010101010101, 16'b1111111111111111},
      {16'b0011110011000011, 16'b0000111111110000, 16'b0100110010110011},
      {16'b0001001000110100, 16'b1001100001110110, 16'b1010101010101010}
  };

  adder_16 dut (.*);

  initial begin
    foreach (test_cases[i]) begin
      x = test_cases[i].x;
      y = test_cases[i].y;
      #1;

      assert (test_cases[i].sum == sum)
      else $error("%d: mismatch %h != %h", i, test_cases[i].sum, sum);
    end
    $display("All tests passed");
    $finish;
  end

endmodule
