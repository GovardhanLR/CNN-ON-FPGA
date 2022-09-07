`timescale 1ns / 1ps

module compute_conv(
        input clk,rstn,
        input signed [7:0] ker_val,
        input res_rst,
        input [7:0]img_val,
        input [9:0]pixel_count,
        output reg signed [16:0] temp_res=0
    );
    wire signed [15:0]product;
    
    assign product = ker_val * $signed({1'b0,img_val}); 
    always @(negedge clk or negedge rstn)
        begin
        if(!rstn || res_rst)temp_res = 0;
        else if(product!==16'bx && pixel_count>1)
        temp_res = temp_res+product;
        end
endmodule
