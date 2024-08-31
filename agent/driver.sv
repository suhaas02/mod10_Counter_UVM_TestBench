class driver extends uvm_driver #(transaction); 
	`uvm_component_utils(driver)
	count_config m_cfg;
	virtual counter_if.drv_mp vif; 
	function new(string name = "driver", uvm_component parent); 
		super.new(name, parent); 
	endfunction 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		assert(uvm_config_db #(count_config)::get(this, "", "count_config", m_cfg)); 
	endfunction 

	function void connect_phase(uvm_phase phase); 
		vif = m_cfg.vif; 
	endfunction   

	task run_phase(uvm_phase phase); 
		forever 
			begin 
				seq_item_port.get_next_item(req); 	
				drive_to_dut(req); 
				seq_item_port.item_done(); 
			end
	endtask 
	
	task drive_to_dut(transaction xtn);
		//xtn.print(); 	
	@(vif.drv_cb);
		vif.drv_cb.rst <= xtn.rst; 
		vif.drv_cb.mode <= xtn.mode; 
		vif.drv_cb.load <= xtn.load; 
		vif.drv_cb.data_in <= xtn.data_in; 
		//$display("interface object: %p", vif); 
  // @(vif.drv_cb);
		`uvm_info("driver", $sformatf("Printing from driver %s", xtn.sprint()), UVM_LOW)
		

	endtask 
endclass
