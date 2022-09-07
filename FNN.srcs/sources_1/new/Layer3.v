`timescale 1ns / 1ps

module Layer3 # (parameter INDATA_WIDTH = 35, NN3=10, PREVLAYER_COUNT =10)(
    input load3,
    input clk,
    input rst3,
    input start3,
    input restart3,
    output reg finish_layer3,
    output reg loaded3
    
    );
    reg [INDATA_WIDTH+8+2:0] layer3_out[0:NN3-1];
    reg [0:INDATA_WIDTH+20]layer3_in[0:PREVLAYER_COUNT-1];
    reg [7:0] address_3;
    integer outfile3;
    integer file,file3,i;
//    reg stored_final;
    reg [0: NN3-1]complete3;
    reg [0:1]count3=0;
    wire [0:NN3-1]finished3;
    reg [0:INDATA_WIDTH] in_data3;
    reg x=0;
    wire [INDATA_WIDTH+8+2:0]neuron3_0_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_1_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_2_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_3_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_4_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_5_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_6_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_7_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_8_out;
    wire [INDATA_WIDTH+8+2:0]neuron3_9_out;
   
    neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_0.txt"),.WEIGHT_FILE("w_3_0.txt"))NN3_0 (
  .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_0_out),
    .finish(finished3[0])
    );
    
     neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_1.txt"),.WEIGHT_FILE("w_3_1.txt"))NN3_1 (
  .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_1_out),
    .finish(finished3[1])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_2.txt"),.WEIGHT_FILE("w_3_2.txt"))NN3_2 (
   .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_2_out),
    .finish(finished3[2])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_3.txt"),.WEIGHT_FILE("w_3_3.txt"))NN3_3 (
   .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_3_out),
    .finish(finished3[3])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_4.txt"),.WEIGHT_FILE("w_3_4.txt"))NN3_4 (
    .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_4_out),
    .finish(finished3[4])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_5.txt"),.WEIGHT_FILE("w_3_5.txt"))NN3_5 (
    .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_5_out),
    .finish(finished3[5])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_6.txt"),.WEIGHT_FILE("w_3_6.txt"))NN3_6 (
    .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_6_out),
    .finish(finished3[6])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_7.txt"),.WEIGHT_FILE("w_3_7.txt"))NN3_7 (
 .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_7_out),
    .finish(finished3[7])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_8.txt"),.WEIGHT_FILE("w_3_8.txt"))NN3_8 (
    .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_8_out),
    .finish(finished3[8])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_3_9.txt"),.WEIGHT_FILE("w_3_9.txt"))NN3_9 (
    .clk(clk),
    .rstn(rst3),
    .restart(restart3),
    .in_data(in_data3),
    .start(start3),
    .out_data(neuron3_9_out),
    .finish(finished3[9])
    );
         
    
       
        
      always @(negedge clk)
      begin
    if(!rst3 && x==0)
        begin
        for(i=0;i<NN3;i=i+1)
        layer3_out[i]=0;
        x=1;       
        end
      
          if(load3)
          begin 
             address_3=0;
             file = $fopen("Layer2_out.txt","r");
             for (i=0; i< PREVLAYER_COUNT; i=i+1) begin  
             $fscanf(file,"%d",layer3_in[i]);
             end
             $fclose(file);
             loaded3=1;
          end
          else if(start3)
          begin
            if(address_3 < PREVLAYER_COUNT)
            begin
            in_data3 = layer3_in[address_3];
            address_3 = address_3+1;
            end
          end 
          if((finished3==1023) && count3<=1)
          begin
            if(count3==1)begin
            outfile3=$fopen("Layer3_out.txt","w");
            for(i=0;i<NN3;i=i+1)
            begin
                $fdisplayb(outfile3,"%d",layer3_out[i]);
                $display("%d",layer3_out[i]);
                $display("%d",i);
            end
            $fclose(outfile3);
            end
            count3=count3+1;
            if(count3>=2)
            finish_layer3 = 1;
        end
        end
    
    always @(negedge clk)
        begin
        layer3_out[0]=neuron3_0_out;
        layer3_out[1]=neuron3_1_out;
        layer3_out[2]=neuron3_2_out;
        layer3_out[3]=neuron3_3_out;
        layer3_out[4]=neuron3_4_out;
        layer3_out[5]=neuron3_5_out;
        layer3_out[6]=neuron3_6_out;
        layer3_out[7]=neuron3_7_out;
        layer3_out[8]=neuron3_8_out;
        layer3_out[9]=neuron3_9_out;
        
        complete3=finished3; 
        end
    
    
    
  
endmodule
