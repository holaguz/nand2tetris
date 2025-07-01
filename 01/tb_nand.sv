`timescale 1ns / 1ps

module tb_nand;

  bit a, b, out;

  // Instantiate the DUT
  nand_gate dut (.*);

  // Test sequence
  initial begin
    a = 'b0;
    b = 'b0;
    #1;
    assert (out == 'b1);
    a = 'b0;
    b = 'b1;
    #1;
    assert (out == 'b1);
    a = 'b1;
    b = 'b0;
    #1;
    assert (out == 'b1);
    a = 'b1;
    b = 'b1;
    #1;
    assert (out == 'b0);

    $display("Simulation finished.");
    $finish;
  end
endmodule

