`timescale 1ns / 1ps

module control_FNN #(parameter INDATA_WIDTH = 17, NN_L1=30, NN_L2=10, NN_L3=10, NN_L4=10, NO_INPUTS=169)(
    input start_FNN,
    input restart,
    input clk,
    output reg [0:3]max,
    output reg finish_FNN
);
 reg start1,rstn1,restart1,start2,rstn2,restart2;  
 reg start3,rstn3,restart3,start4,rstn4,restart4,rstn_max;
 reg load1;
 reg load2;
 reg load3;
 reg load4;
 wire loaded1;
 wire loaded2;
 wire loaded3;
 wire loaded4;
 wire [0:29]finished1;
 wire [0:29]finished2;
 wire [0:29]finished3;
 wire [0:29]finished4;
 wire [0:3]maximum;
 reg find_max;
 wire maxfound;
 

// reg [0:INDATA_WIDTH+30]semifinal_mem[0:NN_L4];
    
    
Layer1  #(.INDATA_WIDTH(INDATA_WIDTH), .NN1(NN_L1),.PRELAYER_COUNT(NO_INPUTS)) L1(
        load1,
        clk,
        rstn1,
        start1,
        restart1,
        finished1,
        loaded1);
Layer2 #(.INDATA_WIDTH(INDATA_WIDTH+10), .NN2(NN_L2),.PRELAYER_COUNT(NN_L1))L2(
     load2,
     clk,
     rstn2,
     start2,
     restart2,
     finished2,
     loaded2);
Layer3 #(.INDATA_WIDTH(INDATA_WIDTH+10+1    ), .NN3(NN_L3),.PRELAYER_COUNT(NN_L2))L3(
     load3,
     clk,rstn3,
     start3,
     restart3,
     finished3,
     loaded3);
Layer4 #(.INDATA_WIDTH(INDATA_WIDTH+10+10+10), .NN4(NN_L4),.PRELAYER_COUNT(NN_L3))L4(
        load4,
        clk,rstn4,
        start4,
        restart4,
        finished4,
        loaded4);

max_finder #(.INDATA_WIDTH(44),.NN4(NN_L4),.PREVLAYER_COUNT(NN_L4)) max_value(
.clk(clk),
.rstn(rstn_max),
.find_max(find_max),
.predicted_output(maximum),
.found_max(maxfound));


    reg [2:0] state_FNN ;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011,S4=3'b100,S5=3'b101,S6=3'b110;
    
    always @ (negedge clk)
    begin
       case(state_FNN)
        S0: begin
            if(start_FNN == 1)
            state_FNN <= S1;
            end
        S1: begin
            if(finished1) state_FNN<=S2;
            end
        S2: begin
            if(finished2) state_FNN<=S3;
            end
        S3: begin
            if(finished3) state_FNN<=S4;
            end      
        S4: begin
            if(finished4) state_FNN<=S5;
            end
        S5: begin
            if(maxfound) state_FNN<=S6;
            end    
        S6: if(restart) state_FNN<=S0;
        default: state_FNN <= S0;
      endcase
     end
    
    always @ (state_FNN)  
    begin
            
        case(state_FNN)
        S0: max=0;
        S1: begin
            rstn1=0;
            load1=1;
            if(loaded1)load1=0; 
            restart1=0;
            start1=1;
            end
        S2: begin
            rstn2=0;
            load2=1;
            if(loaded2)load2=0; 
            restart2=0;
            start2=1;
            end
        S3: begin
            rstn3=0;
            load3=1;
            if(loaded3)load3=0; 
            restart3=0;
            start3=1;
            end
        S4: begin
            rstn4=0;
            load4=1;
            if(loaded4)load4=0; 
            restart4=0;
            start4=1;
            rstn_max=0;
            end
        S5: begin
            rstn_max=1;
            find_max=1;
            end
        S6: begin
            max=maximum;
            finish_FNN=1;
            end
       endcase
     end

endmodule
