/*
module mod10_counter(input bit clock, counter_if vif);

	always@(posedge clock)
		begin 
			if(vif.rst)
				vif.data_out <= 0;
			else if(vif.load == 1)
				vif.data_out <= vif.data_in;
			else if(vif.mode)
				begin 
					if(vif.data_out == 9)
						vif.data_out <= 0; 
					else 
						vif.data_out <= vif.data_out + 1; 
				end
			else
				begin 
					if(vif.data_out == 0)
						vif.data_out <= 9; 
					else 
						vif.data_out <= vif.data_out - 1; 
				end

			$display("printing from RTL : %p", vif); 
		end


endmodule 
*/

module mod10_counter(clock, rst, mode, load, data_in, data_out);
input clock; 
input rst;
		     input mode;
		     input load;
    	 	     input [3:0] data_in;
		     output reg [3:0]data_out;

	always@(posedge clock)
		begin 
			if(rst)
				data_out <= 0;
			else if(load == 1)
				data_out <= data_in;
			else if(mode)
				begin 
					if(data_out == 9)
						data_out <= 0; 
					else 
						data_out <= data_out + 1; 
				end
			else
				begin 
					if(data_out == 0)
						data_out <= 9; 
					else 
						data_out <= data_out - 1; 
				end
		end


endmodule 
 
 
