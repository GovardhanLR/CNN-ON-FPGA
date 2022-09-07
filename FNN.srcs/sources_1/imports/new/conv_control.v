`timescale 1ns / 1ps

module conv_control#(parameter [3:0]m=3,w=28, h=28, DATAFILE = "inputdata.txt")(
    input clk,restart,start,
    output wire signed [17:0] out,
    output reg finish
    );
    
    reg rstn;
    reg ready;
    reg [9:0]pixel_count;
    reg signed [16:0] input_data;
    reg write_enable=0;
    reg fetch,slide;
    reg [6:0]ker_addr;
    reg ram_enable=1;
    reg [15:0]ram_addr;
    reg res_rst;
    reg signed [16:0]ker_res;
    reg load;
    wire signed [12:0] res;
    wire [15:0]res_addr;
    wire temp_clk;
    wire [15:0]img_addr;
    wire signed [7:0] ker_val;
    wire [7:0]img_val;
    wire slided;
    wire ker_complete,conv_complete;
    wire stored,stored_ker,loaded;
    
    integer prod_counter;
      
    assign temp_clk = ready&clk;
    assign out = res;
    
    KAG ker(clk,rstn,ker_addr,ker_val);
    IAG_conv img(clk,rstn,fetch,slide,m,pixel_count,img_addr,res_addr,ker_complete,conv_complete,slided);
    RAM_conv #(.DATAFILE(DATAFILE))ram(clk,load,ram_enable,write_enable,ram_addr,input_data,finish,img_val,stored,stored_ker,loaded);
    compute_conv cmp(clk,rstn,ker_val,res_rst,img_val,pixel_count,res);
    
    reg [2:0] state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
       
    always @ (negedge clk)
    begin

       case(state)
        S0: if(start)state<=S1;
        S1: if(ready && loaded) state <= S2;
        S2: begin
            if((pixel_count>(m*m-1)))state <= S3;
            end
        S3: begin
            if(conv_complete==1 && stored_ker)state <= S4;
            else if(stored_ker)state<=S2;
            end       
        S4: begin
            if(stored) state <= S5;
            else state<= S4;
            end
        S5: begin
            if(restart)state<=S0;
            else state<=S5;
            end
        default: state <= S0;
       endcase
     end
     
 
  always @ (negedge clk)
    begin
       ker_res = res;
       case(state)
        S0: begin
            rstn = 0;
            ready = 1;
            end
            
        S1: begin 
            rstn = 1;
            load = 1;
            finish=0;
            fetch=0;
            slide=0;
            ker_addr=0;
            pixel_count=0;
            ker_res = 0;
            input_data = 0;
            end
        
        S2: begin
            load =0;
            slide=0;
            res_rst = 0;
            ram_enable = 0;
            fetch=1;
            ram_addr = img_addr;
            if(pixel_count<2)ker_addr=0;
            else if(pixel_count<=(m*m)) ker_addr=ker_addr+1;
            if(pixel_count<=(m*m)-1)
            begin
            pixel_count = pixel_count+1;
            end
            end
            
        S3: begin
            pixel_count=0;
            prod_counter = 0;
            ram_enable = 1;
            ram_addr = res_addr;
            fetch=0;
            slide=1;
            if(slided)slide=0;
            ker_addr=0;
            write_enable=1;
            input_data = ker_res;
            if(stored_ker)
            begin
            write_enable=0;
            res_rst=1;
            ker_res=0;
            input_data = 0;
            end
            end
        
        S4: finish=1;
        
        S5: finish=0;
       
       endcase
    end
endmodule
