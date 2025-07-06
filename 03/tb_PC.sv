`timescale 1ns / 100ps

module tb_PC;

  localparam unsigned CLKPERIOD = 10;

  logic [15:0] in, out;
  logic reset, load, inc, clk;
  logic [15:0] expected;

  typedef struct {
    logic [15:0] in;
    logic reset, load, inc;
    logic [15:0] expected;
  } test_case_t;

  test_case_t tcs[] = '{
      '{0, 0, 0, 0, 0},
      '{0, 0, 0, 0, 0},
      '{0, 0, 0, 1, 0},
      '{0, 0, 0, 1, 1},
      '{-32123, 0, 0, 1, 1},
      '{-32123, 0, 0, 1, 2},
      '{-32123, 0, 1, 1, 2},
      '{-32123, 0, 1, 1, -32123},
      '{-32123, 0, 0, 1, -32123},
      '{-32123, 0, 0, 1, -32122},
      '{-32123, 0, 0, 1, -32122},
      '{-32123, 0, 0, 1, -32121},
      '{12345, 0, 1, 0, -32121},
      '{12345, 0, 1, 0, 12345},
      '{12345, 1, 1, 0, 12345},
      '{12345, 1, 1, 0, 0},
      '{12345, 0, 1, 1, 0},
      '{12345, 0, 1, 1, 12345},
      '{12345, 1, 1, 1, 12345},
      '{12345, 1, 1, 1, 0},
      '{12345, 0, 0, 1, 0},
      '{12345, 0, 0, 1, 1},
      '{12345, 1, 0, 1, 1},
      '{12345, 1, 0, 1, 0},
      '{0, 0, 1, 1, 0},
      '{0, 0, 1, 1, 0},
      '{0, 0, 0, 1, 0},
      '{0, 0, 0, 1, 1},
      '{22222, 1, 0, 0, 1},
      '{22222, 1, 0, 0, 0}
  };

  PC dut (.*);

  initial begin
    $monitor("[%04d]: in=%d, out=%d, rst=%b, load=%b, inc=%b", $time, in, out, reset, load, inc);
    clk = 0;
    forever #(CLKPERIOD / 2) clk = ~clk;
  end


  initial begin
    foreach (tcs[i]) begin
      // {in, reset, load, inc, expected} = tcs[i];
      in = tcs[i].in;
      reset = tcs[i].reset;
      load = tcs[i].load;
      inc = tcs[i].inc;
      @(posedge clk);
      assert (out == tcs[i].expected)
      else $error("%02d: %d != %d", i, tcs[i].expected, out);
    end

    $display("All tests passed");
    $finish;
  end

  initial begin
    $dumpfile("waveform.vcd");  // Specify the waveform file
    $dumpvars(0, tb_PC);  // Dump all variables in the testbench
  end

endmodule
