`timescale 1ns / 1ps

module tb_demux;

  logic in, sel, out_a, out_b;

  // Instantiate the DUT
  demux dut (.*);

  // Test sequence
  initial begin
    in  = 'b0;
    sel = 'b0;
    #1;
    assert (out_a == 'b0);
    assert (out_b == 'b0);

    in  = 'b0;
    sel = 'b1;
    #1;
    assert (out_a == 'b0);
    assert (out_b == 'b0);

    in  = 'b1;
    sel = 'b0;
    #1;
    assert (out_a == 'b1);
    assert (out_b == 'b0);

    in  = 'b1;
    sel = 'b1;
    #1;
    assert (out_a == 'b0);
    assert (out_b == 'b1);

    $display("Simulation finished.");
    $finish;
  end
endmodule

