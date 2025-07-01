`timescale 1ns / 1ps

module tb_not16;
  logic [15:0] in, out;

  typedef struct {
    logic [15:0] input_val;
    logic [15:0] expected;
  } test_case_t;

  test_case_t test_cases[] = '{
      '{16'hFFFF, 16'h0000},
      '{16'h0000, 16'hFFFF},
      '{16'hAAAA, 16'h5555},
      '{16'h1234, 16'hEDCB}
  };

  not_16_gate dut (.*);

  initial begin
    foreach (test_cases[i]) begin
      in = test_cases[i].input_val;
      #1;
      assert (out == test_cases[i].expected)
      else
        $error("Test %0d failed: in=%h, expected=%h, got=%h", i, in, test_cases[i].expected, out);
    end
    $display("All tests passed");
    $finish;
  end
endmodule
