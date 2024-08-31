interface counter_if(input bit clock); 
	bit rst; 
	bit mode; 
	bit load; 
	bit [3:0] data_in; 
	bit [3:0] data_out;

	clocking drv_cb@(posedge clock); 
		default input #1 output #1; 
		output rst; 
		output mode; 
		output data_in; 
		output load; 
	endclocking 

	clocking mon_cb@(posedge clock); 
		default input #1 output #1; 
		input rst; 
		input mode; 
		input data_in; 
		input load; 
		input data_out; 
	endclocking 

	
	modport drv_mp(clocking drv_cb, output data_out); 
	modport mon_mp(clocking mon_cb); 
endinterface 
		
