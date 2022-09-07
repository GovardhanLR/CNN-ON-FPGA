`timescale 1ns / 1ps

module mp_control #(parameter M=26,N=26,m=2)(
    input clk,
    input wire start,
//    output [169*17-1:0] res,
    output reg finish=0
    );
    reg rstn=1;
    reg ready=0;
    reg [9:0]pool_count;
    reg [16:0]input_data;
    reg write_enable=0;
    reg access,move;
    reg ram_enable=1;
    reg [15:0]ram_addr;
    reg [15:0] ker_res;
    reg load;
    wire loaded;
    wire [15:0]out_addr;
    wire [16:0]fimg_val;
    wire pool_complete;
    wire done;
    wire [9:0]OFFSET;
    reg offset;
    reg maxpool_out;
    wire [16:0]max;
    wire inc;
    wire moved;  
    wire [15:0] base_addr;
    wire [16:0] max_init;
    wire out;
    
   
    IAG_mp img(.clk(clk),.rstn(rstn),.m(m),.access(access),.move(move),.pool_count(pool_count),.inc(inc),.OFFSET(OFFSET),.pool_complete(pool_complete),.out_addr(out_addr),.done(done),.moved(moved),.base_addr(base_addr));
    RAM_mp bram(clk,load,ram_enable,write_enable,ram_addr,input_data,loaded,fimg_val);
    compute_mp cmp(clk,rstn,OFFSET,fimg_val,base_addr,max_init,max);
    storage_mp strg(clk,rstn,move,max_init,max,out);
    reg [2:0] state ;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,S4=3'b100, S5=3'b101;
     
 always @ (negedge clk)
    begin
       case(state)
        S0: begin
            if(start)
            state <= S1;
            end
        S1: if(loaded)state<=S2;
        S2: if(ready ) 
             begin 
             rstn <=1 ;
             state <= S3;
             end
        S3: begin
            if(pool_count==(m*m-1))state <= S4;
            else state <= S3;
            end
        S4: begin
           if(done)state <= S5;
            else state<=S3;
            end       
        S5: if(ready) state <= S1;
            else state <= S5;
        default: state <= S0;
      endcase
     end
    
    always @ (negedge clk )  
    begin
        ker_res=max;            
        case(state)
        S0: begin
            rstn=0;
            ready=1;
            end
        S1: load =1;
        S2: begin 
            load =0;
            finish=0;
            access=0;
            move=0;        
            pool_count=0;
            ker_res=0;         
            end
        S3: begin
            access=1;
            move=0;
            ram_addr = out_addr;
            pool_count = pool_count+1;
            end
        S4: begin
            access=0;
            move=1;  
            if(moved==1)
            begin
            move =0;
            end
            input_data = max ;          
            ker_res=0;
            pool_count=0;
            end
        S5: begin
            finish=1;
            access=0;
            move=0;
            end
       endcase
     end
       
//     assign res = mp_vals;        
endmodule