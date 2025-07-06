`timescale 1ns / 100ps

module tb_Bit;

  logic in, load, clk, out;

  Bit dut (.*);

  localparam unsigned CLKPERIOD = 10;

  // Clock generation
  initial begin
    clk = 0;
    forever #(CLKPERIOD / 2) clk = ~clk;
  end


  initial begin
    $monitor("t: %04d - in=%b, load=%b, out=%b", $time, in, load, out);

    in   = 'b0;
    load = 'b0;
    #CLKPERIOD;
    assert (out == 'b0)
    else $error("Bad initial state");

    in   = 'b1;
    load = 'b0;
    #CLKPERIOD;
    assert (out == 'b0)
    else $error("Did not retain state when load = 0");

    in   = 'b0;
    load = 'b1;
    #CLKPERIOD;
    assert (out == 'b0)
    else $error("Output doesnt match input");

    in   = 'b1;
    load = 'b1;
    #CLKPERIOD;
    assert (out == 'b1)
    else $error("Did not update output to 1");

    in   = 'b0;
    load = 'b0;
    #CLKPERIOD;
    assert (out == 'b1)
    else $error("Did not retain state");

    in   = 'b0;
    load = 'b1;
    #CLKPERIOD;
    assert (out == 'b0)
    else $error("Did not update output to 0");

    $display("All tests passed");
    $finish;
  end

  initial begin
    $dumpfile("waveform.vcd");  // Specify the waveform file
    $dumpvars(0, tb_Bit);  // Dump all variables in the testbench
  end

endmodule
