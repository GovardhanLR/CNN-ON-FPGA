module neuron_rom
	#(
		parameter Depth             = 169,
		parameter DATA_FILE 		= "w_1_0.txt"
	)
	(
	input							clock,
	input                           load,
//	input							ram_enable,
    input 		[RAM_ADDR_BITS-1:0]	address,
	output signed [RAM_WIDTH-1:0] 	output_data,
	output reg                      loaded
	);
	
   parameter RAM_WIDTH = 9, RAM_ADDR_BITS = $clog2(Depth);
   
   
   (* RAM_STYLE="BLOCK" *)
   reg signed [RAM_WIDTH-1:0] weight_mem [Depth-1:0];

   integer counter;
   integer file,file1,i;
    
   always @(negedge clock)
      
     if (load)
     begin
        for(i=0;i<=Depth-1;i=i+1)
        begin
            weight_mem[i]=0;
        end
 
        file = $fopen(DATA_FILE,"r");
        for (i=0; i<Depth; i=i+1) begin  
        $fscanf(file,"%d",weight_mem[i]);                
        end
        $fclose(file);

        loaded = 1;
    end
      
    assign output_data = weight_mem[address];

endmodule