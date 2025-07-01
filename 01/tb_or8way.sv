`timescale 1ns / 1ps

module tb_or8way;
  logic [7:0] in;
  logic out;

  typedef struct {
    logic [7:0] in;
    logic expected;
  } test_case_t;

  test_case_t test_cases[] = '{'{8'hFF, 1}, '{8'h00, 0}, '{8'hAA, 1}, '{8'h11, 1}};

  or8way dut (.*);

  initial begin
    foreach (test_cases[i]) begin
      in = test_cases[i].in;
      #1;
      assert (out == test_cases[i].expected)
      else
        $error("Test %0d failed: in=%h, expected=%h, got=%h", i, in, test_cases[i].expected, out);
    end
    $display("All tests passed");
    $finish;
  end
endmodule
