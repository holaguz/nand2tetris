`timescale 1ns / 1ps

module tb_mux;

  bit a, b, sel, out;

  // Instantiate the DUT
  mux dut (.*);

  // Test sequence
  initial begin
    a   = 'b0;
    b   = 'b0;
    sel = 'b0;
    #1;
    assert (out == 'b0);
    a   = 'b0;
    b   = 'b1;
    sel = 'b0;
    #1;
    assert (out == 'b0);
    a   = 'b1;
    b   = 'b0;
    sel = 'b0;
    #1;
    assert (out == 'b1);
    a   = 'b1;
    b   = 'b1;
    sel = 'b0;
    #1;
    assert (out == 'b1);

    a   = 'b0;
    b   = 'b0;
    sel = 'b1;
    #1;
    assert (out == 'b0);
    a   = 'b0;
    b   = 'b1;
    sel = 'b1;
    #1;
    assert (out == 'b1);
    a   = 'b1;
    b   = 'b0;
    sel = 'b1;
    #1;
    assert (out == 'b0);
    a   = 'b1;
    b   = 'b1;
    sel = 'b1;
    #1;
    assert (out == 'b1);

    $display("Simulation finished.");
    $finish;
  end
endmodule

