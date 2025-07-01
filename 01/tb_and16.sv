`timescale 1ns / 1ps

module tb_and16;
  logic [15:0] a, b, out;

  typedef struct {
    logic [15:0] a;
    logic [15:0] b;
    logic [15:0] expected;
  } test_case_t;

  test_case_t test_cases[] = '{
      '{16'hFFFF, 16'h0000, 16'h0000},
      '{16'h0000, 16'hFFFF, 16'h0000},
      '{16'hAAAA, 16'h5555, 16'h0000},
      '{16'hAAAA, 16'hAAAA, 16'hAAAA},
      '{16'hFFFF, 16'hFFFF, 16'hFFFF}
  };

  and_16_gate dut (.*);

  initial begin
    foreach (test_cases[i]) begin
      a = test_cases[i].a;
      b = test_cases[i].b;
      #1;
      assert (out == test_cases[i].expected)
      else
        $error(
            "Test %0d failed: a=%h, b=%h, expected=%h, got=%h", i, a, b, test_cases[i].expected, out
        );
    end
    $display("All tests passed");
    $finish;
  end
endmodule


