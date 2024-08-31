class monitor extends uvm_monitor; 
	`uvm_component_utils(monitor)
	virtual counter_if.mon_mp vif; 
	uvm_analysis_port #(transaction) monitor_port; 
	count_config m_cfg;
	transaction data_rcvd;  
	function new(string name = "monitor", uvm_component parent); 
		super.new(name, parent); 
		monitor_port = new("monitor_port", this); 
	endfunction 

	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		assert(uvm_config_db #(count_config)::get(this, "", "count_config", m_cfg)); 
	endfunction 

	function void connect_phase(uvm_phase phase); 
		vif = m_cfg.vif; 
	endfunction  
	
	task run_phase(uvm_phase phase); 
	//	repeat(1)
		//	@(vif.mon_cb);  
		forever 
			received_data(); 
	endtask 

	task received_data(); 
		data_rcvd = transaction::type_id::create("data_rcvd");
		
		@(vif.mon_cb);
			data_rcvd.rst = vif.mon_cb.rst; 
			data_rcvd.load = vif.mon_cb.load; 
			data_rcvd.mode = vif.mon_cb.mode; 
			data_rcvd.data_in = vif.mon_cb.data_in; 	
			data_rcvd.data_out = vif.mon_cb.data_out;
		`uvm_info("monitor", "Printing from monitor", UVM_LOW) 
		data_rcvd.print();  
		monitor_port.write(data_rcvd);
	//	@(vif.mon_cb); 
	endtask 

endclass
		                                                                                                                                                                                                                                                                                                                                                                                                                                               
	
