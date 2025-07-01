`timescale 1ns / 1ps

module tb_mux16;

  logic [15:0] a;
  logic [15:0] b;
  logic sel;
  logic [15:0] out;

  typedef struct {
    logic [15:0] a;
    logic [15:0] b;
    logic sel;
    logic [15:0] expected;
  } test_case_t;

  test_case_t test_case[] = '{
      '{16'h0000, 16'hFFFF, 0, 16'h0000},
      '{16'hFFFF, 16'h0000, 1, 16'h0000},
      '{16'hAAAA, 16'h5555, 0, 16'hAAAA},
      '{16'hAAAA, 16'h5555, 1, 16'h5555}
  };

  // Instantiate the DUT
  mux16 dut (.*);

  initial begin
    foreach (test_case[i]) begin
      a   = test_case[i].a;
      b   = test_case[i].b;
      sel = test_case[i].sel;
      #1;

      assert (out == test_case[i].expected)
      else
        $error(
            "Test %0d failed: a=%h, b=%h, sel=%b\nexpected=%h, got=%d",
            i,
            a,
            b,
            sel,
            test_case[i].expected,
            out
        );

    end

    $display("All tests passed");
    $finish;
  end
endmodule

