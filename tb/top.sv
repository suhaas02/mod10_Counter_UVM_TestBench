module top; 
	import counter_test_pkg::*; 
	import uvm_pkg::*; 
	`include "uvm_macros.svh"
	bit clock; 
	always #10 clock = ~clock; 
	
	counter_if in0(clock); 
	
	//duv instantiation 
	 mod10_counter DUV(.clock(clock), .rst(in0.rst), .mode(in0.mode), .load(in0.load), .data_in(in0.data_in), .data_out(in0.data_out));

	initial 
		begin 
			`ifdef VCS
			$fsdbDumpvars(0, top);
			`endif
			//set configuration 
			uvm_config_db #(virtual counter_if)::set(null, "*", "vif", in0);
			uvm_top.enable_print_topology = 1;  
			run_test("test"); 
		end 
endmodule 
	
