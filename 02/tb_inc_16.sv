`timescale 1ns / 1ps

module tb_inc_16;
  logic [15:0] in;
  logic [15:0] out;

  typedef struct packed {
    logic [15:0] in;
    logic [15:0] out;
  } test_case_t;

  test_case_t test_cases[] = '{
      {16'b0000000000000000, 16'b0000000000000001},
      {16'b1111111111111111, 16'b0000000000000000},
      {16'b0000000000000101, 16'b0000000000000110},
      {16'b1111111111111011, 16'b1111111111111100}
  };

  inc_16 dut (.*);
  initial begin

    foreach (test_cases[i]) begin
      in = test_cases[i].in;
      #1;

      assert (test_cases[i].out == out)
      else $error("%d: sum mismatch %d != %d", i, test_cases[i].out, out);

    end
    $display("All tests passed");
    $finish;
  end

endmodule
