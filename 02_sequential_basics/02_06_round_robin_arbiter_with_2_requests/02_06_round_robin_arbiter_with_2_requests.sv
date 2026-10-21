//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module round_robin_arbiter_with_2_requests
(
    input        clk,
    input        rst,
    input  [1:0] requests,
    output [1:0] grants
);

	reg priority_ptr; // 0: priorite req[0], 1: priorite req[1];
	
	assign grants[0] = requests[0] & (!priority_ptr | !requests[1]);
	assign grants[1] = requests[1] & ( priority_ptr | !requests[0]);
	
	always_ff @ (posedge clk) begin
		if(rst) begin
			priority_ptr <= 1'b0;
		end else begin 
			if (grants[0]) 
				priority_ptr <= 1'b1;
			else if (grants[1]) 
				priority_ptr <= 1'b0;
			end
		end 
    // Task:
    // Implement a "arbiter" module that accepts up to two requests
    // and grants one of them to operate in a round-robin manner.
    //
    // The module should maintain an internal register
    // to keep track of which requester is next in line for a grant.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.
    //
    // Example:
    // requests -> 01 00 10 11 11 00 11 00 11 11
    // grants   -> 01 00 10 01 10 00 01 00 10 01


endmodule
