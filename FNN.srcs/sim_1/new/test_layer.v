`timescale 1ns / 1ps

module test_layer(

    );
    
    reg clk,start,rstn,restart;  
    reg [17-1:0]in_data;
    wire [0:29]finished;
//    reg [17+8+2:0] layer_out[0:30-1];
    reg [17:0]in_mem[0:168];
    integer file,i;
    
    Layer1 tb2(in_data,clk,rstn,start,restart,finished);
    initial 
    begin
    file = $fopen("in_data.txt","r");
    for (i=0; i<169; i=i+1) begin  
    $fscanf(file,"%d",in_mem[i]);                
    end
    $fclose(file);
    end
    integer count1; 
    initial #99 count1 = 0;
      always@(negedge clk )begin
        in_data = in_mem[count1];
        if(count1<=169)
        count1 = count1 +1;
        end
    
    initial
    begin
    clk =0;
    end
    
    always #10 clk =~clk;
    
    initial
    begin
    rstn=0;
    #1 start=1;
    
    end
    
    initial
    begin
    $monitor("clk=%b,rstn=%b,restart=%b,in_data=%d,start=%b,finished=%b",clk,rstn,restart,in_data,start,finished);
    end
   

endmodule
