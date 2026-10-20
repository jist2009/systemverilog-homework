//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux
(
  input  d0, d1,
  input  sel,
  output y
);

  assign y = sel ? d1 : d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module and_gate_using_mux
(
    input  a,
    input  b,
    output o
);
/*
* wire not_b, nand_out;
* mux u_not_b (.d0(1'b1), .d1(1'b0), .sel(b), .y(not_b));
* mux u_nand (.d0(1'b1), .d1(not_b), .sel(a), .y(nand_out));
* mux u_not_final (.d0(1'b1), .d1(1'b0), .sel(nand_out), .y(o));
* */

mux and_mux(.d0(1'b0), .d1(b), .sel(a), .y(o));

  // Task:
  // Implement and gate using instance(s) of mux,
  // constants 0 and 1, and wire connections


endmodule
