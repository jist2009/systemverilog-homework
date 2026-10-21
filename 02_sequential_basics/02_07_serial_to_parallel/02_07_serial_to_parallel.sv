//----------------------------------------------------------------------------
// Task
//----------------------------------------------------------------------------

module serial_to_parallel
# (
    parameter width = 8
)
(
    input                      clk,
    input                      rst,

    input                      serial_valid,
    input                      serial_data,

    output logic               parallel_valid,
    output logic [width - 1:0] parallel_data
);

	logic [$clog2(width)-1:0] 	cpt;
	logic [width-1:0] 			shift_reg;
	
	wire is_last_bit = serial_valid && (cpt == width -1);
	
	assign parallel_valid = is_last_bit;
	assign parallel_data = is_last_bit ? {serial_data, shift_reg[width-1:1]} : shift_reg;
	
	always_ff @(posedge clk) begin 
		if(rst) begin 
			cpt				<= '0;
			shift_reg	 	<= '0;
		end else if (serial_valid) begin 
			// abandon , the shift is towards to the right and not the left, 
			// this code is inconvenient for right shift
			//parallel_data <= (parallel_data << 1) | serial_data ;
			
			shift_reg <= {serial_data, shift_reg[width-1:1]};
			
			if (cpt == width - 1)
				cpt <= '0;
			else 
				cpt <= cpt +1;
		end 
	end 
	
    // Task:
    // Implement a module that converts single-bit serial data to the multi-bit parallel value.
    //
    // The module should accept one-bit values with valid interface in a serial manner.
    // After accumulating 'width' bits and receiving last 'serial_valid' input,
    // the module should assert the 'parallel_valid' at the same clock cycle
    // and output 'parallel_data' value.
    //
    // Note:
    // Check the waveform diagram in the README for better understanding.

	// la concétanation est mis dans always_ff, this is a fault, the value is output too late. this operation need to be put as assign 

endmodule
