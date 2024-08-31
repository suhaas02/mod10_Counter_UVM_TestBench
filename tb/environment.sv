class environment extends uvm_env;
	`uvm_component_utils(environment)
	agent agnth; 
	scoreboard sb; 
	function new(string name = "environment", uvm_component parent); 
		super.new(name, parent); 
	endfunction 

	function void build_phase(uvm_phase phase);
		super.build_phase(phase); 
		agnth = agent::type_id::create("agnth", this);
		sb = scoreboard::type_id::create("sb", this); 
		//if(m_cfg.is_active == 	UVM_ACTIVE)	
	endfunction
	
	function void connect_phase(uvm_phase phase); 	
		agnth.mon_h.monitor_port.connect(sb.fifo_h.analysis_export);  
	endfunction 
	
endclass
