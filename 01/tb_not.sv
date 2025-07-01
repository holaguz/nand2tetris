`timescale 1ns / 1ps

module tb_not;

  bit in, out;

  // Instantiate the DUT
  not_gate dut (.*);

  // Test sequence
  initial begin
    in = 'b0;
    #1;
    assert (out == 'b1);

    in = 'b1;
    #1;
    assert (out == 'b0);

    $display("Simulation finished.");
    $finish;
  end
endmodule

