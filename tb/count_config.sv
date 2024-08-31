class count_config extends uvm_object; 
	`uvm_object_utils(count_config)
	virtual counter_if vif;
	int count = 2;
	uvm_active_passive_enum is_active = UVM_ACTIVE;  
	function new(string name = "count_config"); 
		super.new(name); 
	endfunction 
endclass
