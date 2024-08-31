class transaction extends uvm_sequence_item; 
	`uvm_object_utils_begin(transaction)
		`uvm_field_int(rst, UVM_ALL_ON +UVM_DEC)
		`uvm_field_int(load, UVM_ALL_ON +UVM_DEC)
		`uvm_field_int(mode, UVM_ALL_ON )
		`uvm_field_int(data_in, UVM_ALL_ON +UVM_DEC)
		`uvm_field_int(data_out, UVM_ALL_ON +UVM_DEC)
	`uvm_object_utils_end

	rand bit rst; 
	rand bit load; 
	rand bit mode; 
	bit [3:0] data_in;
	bit [3:0] data_out;  
	constraint range {rst == 1'b0;
			  load dist {0:= 10, 1:= 2};} 
	function new(string name = "transaction"); 
		super.new(name); 
	endfunction 
endclass 
