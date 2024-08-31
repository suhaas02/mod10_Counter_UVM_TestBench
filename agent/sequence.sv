class base_seq extends uvm_sequence #(transaction);
	`uvm_object_utils(base_seq)
	
	function new(string name = "base_seq"); 
		super.new(name); 
	endfunction 

	task body(); 
		repeat(10)
			begin
				req = transaction::type_id::create("req"); 
				start_item(req); 
				assert(req.randomize()); 
				finish_item(req);
			end 
	endtask 
endclass 
		
