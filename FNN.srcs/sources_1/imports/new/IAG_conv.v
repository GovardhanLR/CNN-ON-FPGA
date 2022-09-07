`timescale 1ns / 1ps

module IAG_conv #(parameter w=28, h=28)(
    input clk,rstn,fetch,slide,
    input [3:0] m,
    input [9:0]pixel_count,
    output reg [15:0]img_addr,
    output reg [15:0]res_addr,
    output reg ker_complete,conv_complete,slided
    );

    reg [15:0]base_addr;
    reg [9:0]offset;
    reg [9:0]col_offset, row_offset;
    reg [9:0]col_addr;
    
    always @(negedge clk)
    begin
        img_addr = base_addr+offset;
    end
    
    always @(*)
    begin
        if(!rstn)
         begin
            slided = 0;
            base_addr =0;
            offset=0;
            col_offset=0;
            row_offset=0;
            col_addr=1;
            conv_complete=0;
          end
        
        else
        begin
        if(base_addr>=(w*h)-((m-1)*w)-m)
            conv_complete = 1;
        
        else if(fetch && pixel_count>0)
            begin
            slided = 0;
            base_addr = (w*row_offset)+col_offset;
            ker_complete=0;
            
            if(col_addr<m)
                 begin
                   offset = offset+1;
                   col_addr=col_addr+1; 
                 end
            else if(col_addr==(m))
                 begin
                    offset = offset+(w-m+1);
                    col_addr=1; 
                 end
                     
            if(pixel_count==(((m*m)-1)>>1))res_addr=base_addr+offset;
            end

        if(slide)
        begin
            col_addr=1;
            offset=0;
            base_addr = (w*row_offset)+col_offset;
            if(col_offset<w-m+1)
            col_offset = col_offset+1;
            else if(row_offset<h-m+1)
            begin
            col_offset = 0;
            row_offset = row_offset+1;
            end
            base_addr = (w*row_offset)+col_offset;
            slided = 1;
        end
        end
    end
endmodule
