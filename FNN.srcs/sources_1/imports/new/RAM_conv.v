module RAM_conv
	#(
		parameter RAM_WIDTH 		= 8,
		parameter RAM_ADDR_BITS 	= 16,
		parameter DATA_FILE 		= "inputdata.txt",
		parameter w                 = 28,
		parameter h                 = 28
	)
	(
	input							clock,
	input                           load,
	input							ram_enable,
	input							write_enable,
    input 		[RAM_ADDR_BITS-1:0]	address,
    input 		[16:0] 	            input_data,
    input                           finish,
	output signed [RAM_WIDTH-1:0] 	output_data,
	output reg                      stored_final,stored_ker,
	output reg                      loaded
	);
	
   
//   (* RAM_STYLE="BLOCK" *)
   reg signed [7:0] img_mem [w*h-1:0];
   reg signed [16:0] res_mem [(w-2)*(h-2)-1:0];
   integer counter;
   integer outfile1;
   integer file,file1,i;
    
    
   always @(negedge clock)
      
     if (load)
     begin
        counter=0;
        stored_final = 0;
        stored_ker = 0;
        file = $fopen(DATA_FILE,"rb");
        file1 = $fread(img_mem, file);
        $fclose(file);
        for(i=0;i<w*h;i=i+1)
        begin
            res_mem[i]=0;
        end
        loaded = 1;
    end
      
     else if (ram_enable) begin
         if (write_enable)begin
            res_mem[counter] <= input_data;
            counter = counter+1;
            stored_ker <=1;
            end
        
     else if(finish)
        begin
            outfile1=$fopen("conv_out.txt","w");
            for(i=0;i<(w-2)*(h-2);i=i+1)
            begin
                if(res_mem[i]>0)
                $fdisplayb(outfile1,"%d",res_mem[i]);
                else
                $fdisplayb(outfile1,"%d",17'b0);
                $display("%d",res_mem[i]);
                $display("%d",i);
            end
            $fclose(outfile1);
            stored_final = 1;
        end
            
      end
      
      else
      begin
      stored_ker <=0;
      end
      
      assign output_data = img_mem[address];

endmodule