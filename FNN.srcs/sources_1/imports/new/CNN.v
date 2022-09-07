`timescale 1ns / 1ps


module CNN #(parameter DATAFILE = "inputfile.txt", w = 28, h = 28, m = 3, INDATA_WIDTH_FNN = 17, NN_L1 = 30,NN_L2 = 10,NN_L3 = 10,NN_L4 =10, NO_INPUTS_FNN = 169)(
    input clk,rstn, start,  
    output reg finish,
    output [0:3]result
    );
    
    reg restart_conv = 0, start_conv;
    reg start_mp;
    reg start_FNN;
    reg restart_FNN=0;
    wire finish_FNN;
    wire finish_mp;
    wire out_conv;
    wire finish_conv;
    wire mp_res;
    
    conv_control #(.w(w),.h(h),.m(m),.DATAFILE(DATAFILE))conv(clk,restart_conv,start_conv, out_conv, finish_conv);
    mp_control#(.M(w),.N(h),.m(2)) mp(clk, start_mp, finish_mp);
    control_FNN #(.INDATA_WIDTH(INDATA_WIDTH_FNN), .NN_L1(NN_L1), .NN_L2(NN_L2), .NN_L3(NN_L3), .NN_L4(NN_L4), .NO_INPUTS(NO_INPUTS_FNN)) FNN(start_FNN,restart_FNN,clk,result,finish_FNN);
    reg [2:0] state ;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,S4=3'b100;
    
    always @ (negedge clk)
    begin
       case(state)
        S0: begin
            if(start == 1)
            state <= S1;
            end
        S1: begin
            if(finish_conv) state<=S2;
            end
        S2: begin
            if(finish_mp) state<=S3;
            end
        S3: begin
            if(finish_FNN)
            state<=S4;
            end      
        S4: begin
            if(!rstn) state <= S0;
            end
        default: state <= S0;
      endcase
     end
    
    always @ (negedge clk )  
    begin
            
        case(state)
        S1: begin 
            start_conv = 1;
            end
        S2: begin
            start_conv = 0;
            restart_conv = 0;
            start_mp = 1;
            end
        S3: begin
            start_FNN=1;
            end
        S4: begin
            finish=1;
            end
       endcase
     end
    
endmodule
