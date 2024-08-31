class test extends uvm_test; 
	`uvm_component_utils(test)
	environment env_h; 
	count_config m_cfg; 
	base_seq seq; 
	function new(string name = "test", uvm_component parent); 
		super.new(name, parent); 
	endfunction         

	function void build_phase(uvm_phase phase); 
		super.build_phase(phase); 
		m_cfg = count_config::type_id::create("m_cfg"); 
		uvm_config_db #(virtual counter_if)::get(this, "", "vif", m_cfg.vif);
		uvm_config_db #(count_config)::set(this, "*", "count_config", m_cfg); 
                env_h = environment::type_id::create("env_h", this); 
		
		
	endfunction

	task run_phase(uvm_phase phase);
		phase.raise_objection(this);  
		seq = base_seq::type_id::create("seq"); 
		seq.start(env_h.agnth.seqr_h); 
//#30;
		phase.drop_objection(this); 	
	endtask 

endclass                                                                                                         
