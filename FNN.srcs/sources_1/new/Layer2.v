`timescale 1ns / 1ps

module Layer2 # (parameter INDATA_WIDTH = 26, NN2=10, PREVLAYER_COUNT =30)(
    input load2,
    input clk,
    input rst2,
    input start2,
    input restart2,
    output reg finish_layer2,
    output reg loaded2
    );
    reg [INDATA_WIDTH+8+2:0] layer2_out[0:NN2-1];
    reg [0:INDATA_WIDTH+10]layer2_in[0:PREVLAYER_COUNT-1];
    reg [7:0] address_2;
    reg [0:1]count2=0;
    integer outfile2;
    integer file,file2,i;
    reg x=0;
//    reg stored_final;
    reg [0: NN2-1]complete2;
    wire [0:NN2-1]finished2;
    reg [0:INDATA_WIDTH] in_data2;
    wire [INDATA_WIDTH+8+2:0]neuron2_0_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_1_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_2_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_3_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_4_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_5_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_6_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_7_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_8_out;
    wire [INDATA_WIDTH+8+2:0]neuron2_9_out;
   
    neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_0.txt"),.WEIGHT_FILE("w_2_0.txt"))NN2_0 (
   .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_0_out),
    .finish(finished2[0])
    );
    
     neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_1.txt"),.WEIGHT_FILE("w_2_1.txt"))NN2_1 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_1_out),
    .finish(finished2[1])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_2.txt"),.WEIGHT_FILE("w_2_2.txt"))NN2_2 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_2_out),
    .finish(finished2[2])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_3.txt"),.WEIGHT_FILE("w_2_3.txt"))NN2_3 (
   .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_3_out),
    .finish(finished2[3])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_4.txt"),.WEIGHT_FILE("w_2_4.txt"))NN2_4 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_4_out),
    .finish(finished2[4])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_5.txt"),.WEIGHT_FILE("w_2_5.txt"))NN2_5 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_5_out),
    .finish(finished2[5])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_6.txt"),.WEIGHT_FILE("w_2_6.txt"))NN2_6 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_6_out),
    .finish(finished2[6])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_7.txt"),.WEIGHT_FILE("w_2_7.txt"))NN2_7 (
   .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_7_out),
    .finish(finished2[7])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_8.txt"),.WEIGHT_FILE("w_2_8.txt"))NN2_8 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_8_out),
    .finish(finished2[8])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_2_9.txt"),.WEIGHT_FILE("w_2_9.txt"))NN2_9 (
    .clk(clk),
    .rstn(rst2),
    .restart(restart2),
    .in_data(in_data2),
    .start(start2),
    .out_data(neuron2_9_out),
    .finish(finished2[9])
    );
         
    
   always @(negedge clk)
   begin
    if(!rst2 && x==0)
        begin
        for(i=0;i<NN2;i=i+1)
        layer2_out[i]=0;  
         x=1;    
        end
          
          
          if(load2)
          begin 
          
             address_2=0;
             file = $fopen("Layer1_out.txt","r");
             for (i=0; i<PREVLAYER_COUNT; i=i+1) begin  
             $fscanf(file,"%d",layer2_in[i]); 
             end
             $fclose(file);
             loaded2=1;
          end
          else if(start2)
          begin
            if(address_2 < PREVLAYER_COUNT)
            begin
            in_data2 = layer2_in[address_2];
            address_2 = address_2+1;
            end
          end 
          if((finished2==1023) && count2<=1)
          begin
            if(count2==1)begin
            outfile2=$fopen("Layer2_out.txt","w");
            for(i=0;i<NN2;i=i+1)
            begin
                $fdisplayb(outfile2,"%d",layer2_out[i]);
                $display("%d",layer2_out[i]);
                $display("%d",i);
            end
            $fclose(outfile2);
            end
            count2=count2+1;
            if(count2>=2)
            finish_layer2 = 1;
        end
        end
    
    always @(negedge clk)
        begin
        layer2_out[0]=neuron2_0_out;
        layer2_out[1]=neuron2_1_out;
        layer2_out[2]=neuron2_2_out;
        layer2_out[3]=neuron2_3_out;
        layer2_out[4]=neuron2_4_out;
        layer2_out[5]=neuron2_5_out;
        layer2_out[6]=neuron2_6_out;
        layer2_out[7]=neuron2_7_out;
        layer2_out[8]=neuron2_8_out;
        layer2_out[9]=neuron2_9_out;
        
//        complete2=finished2; 
        end
    
    
    
  
endmodule
