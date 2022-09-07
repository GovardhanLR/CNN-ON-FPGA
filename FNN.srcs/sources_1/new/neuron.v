`timescale 1ns / 1ps

module neuron#(parameter INDATA_WIDTH = 17, PREVLAYER_COUNT =169, BIASFILE = "b_1_0.txt", WEIGHT_FILE="w_1_0.txt")(
    input clk,
    input rstn,
    input restart,
    input [INDATA_WIDTH-1:0]in_data,
    input start,
    output reg [INDATA_WIDTH+8+2:0]out_data,
    output reg finish
    );
    reg x=0;
    reg bias_added=0;
    reg [8:0]count;
    reg signed [9:0] bias;
    reg [INDATA_WIDTH+8:0]product;
    reg [INDATA_WIDTH+8+2:0]sum;
    reg load_weight;
    reg [8:0] weight_adress;
    wire [8:0] weight_val;
    wire weight_loaded;
    integer file,file1,i;
    
    neuron_rom #(.Depth(PREVLAYER_COUNT), .DATA_FILE(WEIGHT_FILE))weights (clk,load_weight,weight_adress,weight_val,weight_loaded);
    
    reg [2:0] state;
    parameter S0 = 3'b000, S1 = 3'b001, S2 = 3'b010, S3 = 3'b011, S4 = 3'b100, S5 = 3'b101;
       
    always @ (negedge clk)
    begin
       case(state)
        S0: if(start)state<=S1;
        S1: if(weight_loaded) state <= S2;
        S2: begin
            if(count >= PREVLAYER_COUNT && sum!=={INDATA_WIDTH+11{1'bx}})       
            state <= S3; 
            end
        S3: begin
            if(bias_added) state<= S4;
            end       
        S4: begin
            if(restart) state <= S0;
            else state<= S4;
            end       
        default: state <= S0;
       endcase
     end
     
    always @ (negedge clk )  
    begin
           
        case(state)
        S0: begin
            if(!rstn)
            begin
            count = 0;
            sum=0;
            product=0;
            finish=0;
            end
            file = $fopen(BIASFILE,"r");
            $fscanf(file,"%d",bias);                
            $fclose(file);
            end
        S1: load_weight=1;
        S2: begin 
            load_weight=0;
            finish=0;
            weight_adress = count;
            product = weight_val*$signed(in_data);
            if(count <= PREVLAYER_COUNT)
            count = count+1;
            if(product!=={INDATA_WIDTH+9{1'bx}})
            begin          
            sum = sum + product;
//            if(count <= PREVLAYER_COUNT)
//            count = count+1;
            end
            end
        S3: begin
            sum = sum+bias;
            bias_added=1;
            end
        S4: begin
            if(sum <0)
            out_data =0;
            else
            out_data = sum;
            finish = 1;
            end
       endcase
     end
     
     
endmodule
