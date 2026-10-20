//----------------------------------------------------------------------------
// Example
//----------------------------------------------------------------------------

module mux_2_1
(
  input        [3:0] d0, d1,
  input              sel,
  output logic [3:0] y
);

  always_comb
    if (sel)
      y = d1;
    else
      y = d0;

endmodule

//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module mux_4_1
(
  input        [3:0] d0, d1, d2, d3,
  input        [1:0] sel,
  output logic [3:0] y
);

//wire [3:0] w_m1, w_m2;

/*mux_2_1 m1(
	.d0(d0),
	.d1(d1),
	.sel(sel[0]),
	.y(w_m1));

mux_2_1 m2(
	.d0(d2),
	.d1(d3),
	.sel(sel[0]),
	.y(w_m2));

mux_2_1 m_final(
        .d0(w_m1),
        .d1(w_m2),
        .sel(sel[1]),
        .y(y));

*/
always_comb begin 
	if(sel == 2'b11) y = d3;
	else if(sel == 2'b10) y = d2;
	else if(sel == 2'b01) y = d1;
	else y = d0;
	end   
// Task:
  // Using code for mux_2_1 as an example,
  // write code for 4:1 mux using the "if" statement


endmodule
