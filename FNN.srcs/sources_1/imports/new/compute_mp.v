`timescale 1ns / 1ps

module compute_mp(
        input clk,rstn,[9:0]OFFSET,
        input [16:0] fimg_val,
        input [15:0] base_addr,
        output reg [16:0] max_init,
        output reg [16:0] max
    );
    
    reg [16:0] temp_max;
    always @(negedge clk or negedge rstn)
        begin         
            if(OFFSET == 0 )
            begin
            max = temp_max;
            temp_max = fimg_val;
              if(base_addr == 2)
              max_init = fimg_val;
            end
            else if(fimg_val > temp_max)
            begin
            temp_max = fimg_val;
              if(base_addr == 2)
              max_init = fimg_val;
            end
        end

endmodule

