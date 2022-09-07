`timescale 1ns / 1ps

module test_CNN(

    );
     reg clk;
     reg rstn;
    reg start;
    wire [3:0]result;
    wire finish;
    
    CNN tb(clk,rstn,start,finish,result);
  
    
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
    $monitor("clk=%b,rstn=%b,start=%b,finish=%b,result=%d",clk,rstn,start,finish,result);
    end
   

endmodule
