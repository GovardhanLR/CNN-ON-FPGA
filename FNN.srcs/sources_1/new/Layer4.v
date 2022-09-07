`timescale 1ns / 1ps

module Layer4 # (parameter INDATA_WIDTH = 44, NN4=10, PREVLAYER_COUNT =10)(
//    input [INDATA_WIDTH-1:0] in_data4,
    input load4,
    input clk,
    input rst4,
    input start4,
    input restart4,
    output reg finish_layer4,
    output reg loaded4

    );
    reg [INDATA_WIDTH+8+2:0] layer4_out[0:NN4-1];
    reg [0:INDATA_WIDTH+30]layer4_in[0:PREVLAYER_COUNT-1];
    integer outfile4;
    integer file,file4,i;
    reg x=0;
//    reg stored_final;
//    reg [0: NN-1]complete4;
    wire [0:NN4-1]finished4;
    reg [0:1]count4=0;
    reg [7:0] address_4;
    reg [0:INDATA_WIDTH] in_data4;
    
    wire [INDATA_WIDTH+8+2:0]neuron4_0_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_1_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_2_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_3_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_4_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_5_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_6_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_7_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_8_out;
    wire [INDATA_WIDTH+8+2:0]neuron4_9_out;
   
    neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_0.txt"),.WEIGHT_FILE("w_4_0.txt"))NN4_0 (
  .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_0_out),
    .finish(finished4[0])
    );
    
     neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_1.txt"),.WEIGHT_FILE("w_4_1.txt"))NN4_1 (
  .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_1_out),
    .finish(finished4[1])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_2.txt"),.WEIGHT_FILE("w_4_2.txt"))NN4_2 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_2_out),
    .finish(finished4[2])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_3.txt"),.WEIGHT_FILE("w_4_3.txt"))NN4_3 (
  .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_3_out),
    .finish(finished4[3])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_4.txt"),.WEIGHT_FILE("w_4_4.txt"))NN4_4 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_4_out),
    .finish(finished4[4])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_5.txt"),.WEIGHT_FILE("w_4_5.txt"))NN4_5 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_5_out),
    .finish(finished4[5])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_6.txt"),.WEIGHT_FILE("w_4_6.txt"))NN4_6 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_6_out),
    .finish(finished4[6])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_7.txt"),.WEIGHT_FILE("w_4_7.txt"))NN4_7 (
 .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_7_out),
    .finish(finished4[7])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_8.txt"),.WEIGHT_FILE("w_4_8.txt"))NN4_8 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_8_out),
    .finish(finished4[8])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_4_9.txt"),.WEIGHT_FILE("w_4_9.txt"))NN4_9 (
   .clk(clk),
    .rstn(rst4),
    .restart(restart4),
    .in_data(in_data4),
    .start(start4),
    .out_data(neuron4_9_out),
    .finish(finished4[9])
    );
         
    
     always @(negedge clk)
     begin
    if(!rst4 && x==0)
        begin
        for(i=0;i<NN4;i=i+1)
        layer4_out[i]=0;
        x=1;       
        end
         
          if(load4)
          begin
             address_4=0; 
             file = $fopen("Layer3_out.txt","r");
             for (i=0; i< PREVLAYER_COUNT; i=i+1) begin  
             $fscanf(file,"%d",layer4_in[i]);
             end
             $fclose(file);
             loaded4=1;
          end
          else if(start4)
          begin
            if(address_4 < PREVLAYER_COUNT)
            begin
            in_data4 = layer4_in[address_4];
            address_4 = address_4+1;
            end
          end 
          if((finished4==1023) && count4<=1)
          begin
            if(count4==1)begin
            outfile4=$fopen("Layer4_out.txt","w");
            for(i=0;i<NN4;i=i+1)
            begin
                $fdisplayb(outfile4,"%d",layer4_out[i]);
                $display("%d",layer4_out[i]);
                $display("%d",i);
            end
            $fclose(outfile4);
            end
            count4=count4+1;
            if(count4>=2)
            finish_layer4 = 1;
        end
        end
    
    always @(negedge clk)
        begin
        layer4_out[0]=neuron4_0_out;
        layer4_out[1]=neuron4_1_out;
        layer4_out[2]=neuron4_2_out;
        layer4_out[3]=neuron4_3_out;
        layer4_out[4]=neuron4_4_out;
        layer4_out[5]=neuron4_5_out;
        layer4_out[6]=neuron4_6_out;
        layer4_out[7]=neuron4_7_out;
        layer4_out[8]=neuron4_8_out;
        layer4_out[9]=neuron4_9_out;
        
//        complete4=finished4; 
        end
    
    
    
  
endmodule
