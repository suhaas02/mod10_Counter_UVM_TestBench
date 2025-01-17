class scoreboard extends uvm_scoreboard; 
	`uvm_component_utils(scoreboard)
	
	//uvm_analysis_imp #(transaction, scoreboard) analysis_imp;
	uvm_tlm_analysis_fifo #(transaction) fifo_h;
	transaction xtn, xtn_ref;
	//static bit [3:0] xtn_ref.data_out;   
	function new(string name = "scoreboard", uvm_component parent); 	
		super.new(name,parent); 
	endfunction 

	function void build_phase(uvm_phase phase); 
		fifo_h = new("fifo_h", this);
	 	super.build_phase(phase); 
		`uvm_info(get_type_name, "I am in build phase", UVM_LOW)
	endfunction

	task run_phase(uvm_phase phase); 
		forever
			begin
				$display("I am in run_phase"); 
				fifo_h.get(xtn);
				//`uvm_info("scoreboard", $sformatf("Printing from sb get original packet: %s", xtn.sprint()), UVM_LOW)  
				assert($cast(xtn_ref, xtn.clone())); 
				//`uvm_info("scoreboard", $sformatf("Printing from sb get cloned packet: %s", xtn_ref.sprint()), UVM_LOW)  

				data_out_ref(xtn_ref);
				check_data(xtn, xtn_ref);  
			end 
	endtask 

	task data_out_ref(ref transaction xtn); 
		$display("I am in ref model"); 
		if(xtn.rst == 1)
			xtn_ref.data_out = 0; 
		else if(xtn.load)
			xtn_ref.data_out = xtn.data_in; 
		else if(xtn.mode)
			begin 
				if(xtn_ref.data_out == 9)
					xtn_ref.data_out = 0; 
				else
					xtn_ref.data_out = xtn_ref.data_out + 1; 
			end 
		else
			begin 
				if(xtn_ref.data_out == 0)
					xtn_ref.data_out = 9; 
				else
					xtn_ref.data_out = xtn_ref.data_out - 1; 
			end

	endtask 

	task check_data(transaction xtn, transaction xtn_ref); 
		$display("I am here in check data"); 
		if(xtn.compare(xtn_ref))
			`uvm_info(get_full_name(), "Successfully compared", UVM_LOW); 
		
	endtask
endclass 






















































































































































































































































































































































































































































































































































































































































































































































































































































































































































