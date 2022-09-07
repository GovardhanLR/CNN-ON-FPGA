`timescale 1ns / 1ps

module KAG #(parameter m=3)(
    input clk,rstn,
    input [6:0]addr,
    output signed [8:0] out
    );
    
    
//   (* RAM_STYLE="BLOCK" *)
    reg signed [7:0] ker_mem [(m*m)-1:0];
   
    integer i;
    always @(negedge clk or negedge rstn)
     begin
        if(!rstn)
            begin
              for (i=0; i<m*m; i=i+1)begin
                #1 ker_mem[i]= 0;
              end
            end
        else
            begin
    
                ker_mem [0] = 79;
                ker_mem [1] = 102;
                ker_mem [2] = 60;
                ker_mem [3] = -30;
                ker_mem [4] = -14;
                ker_mem [5] = -116;
                ker_mem [6] = -110;
                ker_mem [7] = -127;
                ker_mem [8] = -93;
    
            end
     end
     
     assign out = ker_mem[addr];
endmodule
