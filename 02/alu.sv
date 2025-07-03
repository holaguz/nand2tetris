module alu (
    input logic [15:0] x,
    input logic [15:0] y,

    input bit zx,  /* zero x */
    input bit nx,  /* negate x */

    input bit zy,  /* zero y */
    input bit ny,  /* negate y */

    input bit f,  /* 0 -> x&x, 1 -> x+y */
    input bit no, /* negate output */

    output logic [15:0] out,
    output bit zr,
    output bit ng
);

  logic [15:0] x_, y_, out_;

  assign out = out_;

  always_comb begin
    if (zx) x_ = 16'h0;
    else x_ = x;
    if (nx) x_ = ~x_;

    if (zy) y_ = 16'h0;
    else y_ = y;
    if (ny) y_ = ~y_;

    if (f) out_ = x_ + y_;
    else out_ = x_ & y_;

    if (no) out_ = ~out_;

    zr = !(|out_);

    if (out_[15]) ng = '1;
    else ng = '0;
  end


endmodule
