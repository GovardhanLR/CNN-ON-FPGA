`timescale 1ns / 1ps


module max_finder #(parameter INDATA_WIDTH = 44, NN4=10, PREVLAYER_COUNT =10)(
    input clk,rstn,find_max,
    output reg [3:0]predicted_output,
    output reg found_max
    );
    
    reg [0:INDATA_WIDTH+10] max_mem [0:PREVLAYER_COUNT-1];
    reg loaded=0;
    reg [0:INDATA_WIDTH+10]max;
    reg [0:3]index;
    reg [0:3] address;
    integer i;
    reg x=0;
    integer file;
    always @(negedge clk)
    begin
    if(!rstn && x==0)
        begin
        address=0;
        for(i=0;i<PREVLAYER_COUNT;i=i+1)
        max_mem[i]=0;
        found_max =0;
        predicted_output=0;
        x=1;       
        end
          if(find_max && loaded==0)
          begin 
             file = $fopen("Layer4_out.txt","r");
             for (i=0; i< PREVLAYER_COUNT; i=i+1) begin  
             $fscanf(file,"%d",max_mem[i]);
             end
             $fclose(file);
             loaded=1;
             max=max_mem[0];
          end
          if(loaded && address<=9)
          begin
            if(max<max_mem[ address])begin
                max=max_mem[address];
                index = address;
                end
             address = address+1;
             if(address==9)
             found_max=1;
          end
         if(found_max)
         begin
         predicted_output= index;
         end
            
        end
endmodule
