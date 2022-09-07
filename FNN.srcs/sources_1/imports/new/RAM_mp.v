`timescale 1ns / 1ps

module RAM_mp
	#(
		parameter RAM_WIDTH 		= 17,
		parameter RAM_ADDR_BITS 	= 10,
		parameter ConvOut    		= "conv_out.txt",
		parameter INIT_START_ADDR 	= 0,
		parameter INIT_END_ADDR		= 27
		
	)
	(
	input							clock,
	input                           load,
	input							ram_enable,
	input							write_enable,
    input 		[RAM_ADDR_BITS-1:0]	address,
    input 		[RAM_WIDTH-1:0] 	input_data,
    output reg                      loaded,
	output reg 	[RAM_WIDTH-1:0] 	output_data
	);
	
   integer file,file1,i;
   
   (* RAM_STYLE="BLOCK" *)
   reg [RAM_WIDTH-1:0] mp_input [675:0];


//initial
//    begin
//    file = $fopen("conv_out.txt","r");
//    file1 = $fread(mp_input, file);
//    $fclose(file);
//    end

   always @(negedge clock)
   begin
      if(load)
      begin
          file=$fopen("conv_out.txt","r");

            if (file)  $display("File was opened successfully : %0d", file);
            else       $display("File was NOT opened successfully : %0d", file);

            for (i=1; i<676; i=i+1) begin  
                $fscanf(file,"%d",mp_input[i]);                
            end
//        file = $fopen("conv_out.txt","r");
//        file1 = $fread(mp_input, file);
//        $fclose(file);
        loaded = 1;
      end
      else
      if (ram_enable) begin
         if (write_enable)
            mp_input[address] <= input_data;
         output_data <= mp_input[address];
      end
    end
endmodule
