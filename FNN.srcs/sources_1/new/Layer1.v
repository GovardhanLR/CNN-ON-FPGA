`timescale 1ns / 1ps

module Layer1 # (parameter INDATA_WIDTH = 17, NN1=30, PREVLAYER_COUNT =169)(
    input load1,
    input clk,
    input rst1,
    input start1,
    input restart1,
    output reg finish_layer1,
    output reg loaded1
    
    );
    reg [INDATA_WIDTH+8+2:0] layer1_out[0:NN1-1];
    reg [0:INDATA_WIDTH]layer1_in[0:PREVLAYER_COUNT];
    reg [7:0] address_1;
    integer outfile1;
    reg [1:0]count1 = 0;
    integer file,file1,i;
    wire [0:NN1-1]finished1;
    reg [0:INDATA_WIDTH] in_data1;
//    reg stored_final;
//    reg [0: NN1-1]complete1;
    wire [INDATA_WIDTH+8+2:0]neuron1_0_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_1_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_2_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_3_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_4_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_5_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_6_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_7_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_8_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_9_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_10_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_11_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_12_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_13_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_14_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_15_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_16_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_17_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_18_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_19_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_20_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_21_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_22_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_23_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_24_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_25_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_26_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_27_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_28_out;
    wire [INDATA_WIDTH+8+2:0]neuron1_29_out;
    

    
    neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_0.txt"),.WEIGHT_FILE("w_1_0.txt"))NN1_0 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_0_out),
    .finish(finished1[0])
    );
    
     neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_1.txt"),.WEIGHT_FILE("w_1_1.txt"))NN1_1 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_1_out),
    .finish(finished1[1])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_2.txt"),.WEIGHT_FILE("w_1_2.txt"))NN1_2 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_2_out),
    .finish(finished1[2])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_3.txt"),.WEIGHT_FILE("w_1_3.txt"))NN1_3 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_3_out),
    .finish(finished1[3])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_4.txt"),.WEIGHT_FILE("w_1_4.txt"))NN1_4 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_4_out),
    .finish(finished1[4])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_5.txt"),.WEIGHT_FILE("w_1_5.txt"))NN1_5 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_5_out),
    .finish(finished1[5])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_6.txt"),.WEIGHT_FILE("w_1_6.txt"))NN1_6 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_6_out),
    .finish(finished1[6])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_7.txt"),.WEIGHT_FILE("w_1_7.txt"))NN1_7 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_7_out),
    .finish(finished1[7])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_8.txt"),.WEIGHT_FILE("w_1_8.txt"))NN1_8 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_8_out),
    .finish(finished1[8])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_9.txt"),.WEIGHT_FILE("w_1_9.txt"))NN1_9 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_9_out),
    .finish(finished1[9])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_10.txt"),.WEIGHT_FILE("w_1_10.txt"))NN1_10 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_10_out),
    .finish(finished1[10])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_11.txt"),.WEIGHT_FILE("w_1_11.txt"))NN1_11 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_11_out),
    .finish(finished1[11])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_12.txt"),.WEIGHT_FILE("w_1_12.txt"))NN1_12 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_12_out),
    .finish(finished1[12])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_13.txt"),.WEIGHT_FILE("w_1_13.txt"))NN1_13 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_13_out),
    .finish(finished1[13])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_14.txt"),.WEIGHT_FILE("w_1_14.txt"))NN1_14 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_14_out),
    .finish(finished1[14])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_15.txt"),.WEIGHT_FILE("w_1_15.txt"))NN1_15 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_15_out),
    .finish(finished1[15])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_16.txt"),.WEIGHT_FILE("w_1_16.txt"))NN1_16 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_16_out),
    .finish(finished1[16])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_17.txt"),.WEIGHT_FILE("w_1_17.txt"))NN1_17 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_17_out),
    .finish(finished1[17])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_18.txt"),.WEIGHT_FILE("w_1_18.txt"))NN1_18 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_18_out),
    .finish(finished1[18])
    );
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_19.txt"),.WEIGHT_FILE("w_1_19.txt"))NN1_19 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_19_out),
    .finish(finished1[19])
    );
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_20.txt"),.WEIGHT_FILE("w_1_20.txt"))NN1_20 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_20_out),
    .finish(finished1[20])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_21.txt"),.WEIGHT_FILE("w_1_21.txt"))NN1_21 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_21_out),
    .finish(finished1[21])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_22.txt"),.WEIGHT_FILE("w_1_22.txt"))NN1_22 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_22_out),
    .finish(finished1[22])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_23.txt"),.WEIGHT_FILE("w_1_23.txt"))NN1_23 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_23_out),
    .finish(finished1[23])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_24.txt"),.WEIGHT_FILE("w_1_24.txt"))NN1_24 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_24_out),
    .finish(finished1[24])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_25.txt"),.WEIGHT_FILE("w_1_25.txt"))NN1_25 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_25_out),
    .finish(finished1[25])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_26.txt"),.WEIGHT_FILE("w_1_26.txt"))NN1_26 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_26_out),
    .finish(finished1[26])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_27.txt"),.WEIGHT_FILE("w_1_27.txt"))NN1_27 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_27_out),
    .finish(finished1[27])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_28.txt"),.WEIGHT_FILE("w_1_28.txt"))NN1_28 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_28_out),
    .finish(finished1[28])
    );
    
       neuron  #(.INDATA_WIDTH(INDATA_WIDTH), .PREVLAYER_COUNT(PREVLAYER_COUNT), .BIASFILE ("b_1_29.txt"),.WEIGHT_FILE("w_1_29.txt"))NN1_29 (
    .clk(clk),
    .rstn(rst1),
    .restart(restart1),
    .in_data(in_data1),
    .start(start1),
    .out_data(neuron1_29_out),
    .finish(finished1[29])
    );
    
     
    
    always @(negedge clk)
    begin      
          if(load1)
          begin 
             address_1=0;
             file = $fopen("maxpool_out.txt","r");
             for (i=0; i<PREVLAYER_COUNT; i=i+1) begin  
             $fscanf(file,"%d",layer1_in[i]); 
             end
             $fclose(file);
             loaded1=1;
          end
          else if(start1)
          begin
            if(address_1 < PREVLAYER_COUNT)
            begin
            in_data1 = layer1_in[address_1];
            address_1 = address_1+1;
            end
          end 
          if(finished1==1073741823 && count1<=1)
          begin
            if(count1==1)begin
            outfile1=$fopen("Layer1_out.txt","w");
            for(i=0;i<NN1;i=i+1)
            begin
                $fdisplayb(outfile1,"%d",layer1_out[i]);
                $display("%d",layer1_out[i]);
                $display("%d",i);
            end
            $fclose(outfile1);
            end
            count1=count1+1;
            if(count1>=2)
            finish_layer1 = 1;
        end
        end
        
    
    always @(negedge clk)
        begin
        layer1_out[0]=neuron1_0_out;
        layer1_out[1]=neuron1_1_out;
        layer1_out[2]=neuron1_2_out;
        layer1_out[3]=neuron1_3_out;
        layer1_out[4]=neuron1_4_out;
        layer1_out[5]=neuron1_5_out;
        layer1_out[6]=neuron1_6_out;
        layer1_out[7]=neuron1_7_out;
        layer1_out[8]=neuron1_8_out;
        layer1_out[9]=neuron1_9_out;
        layer1_out[10]=neuron1_10_out;
        layer1_out[11]=neuron1_11_out;
        layer1_out[12]=neuron1_12_out;
        layer1_out[13]=neuron1_13_out;
        layer1_out[14]=neuron1_14_out;
        layer1_out[15]=neuron1_15_out;
        layer1_out[16]=neuron1_16_out;
        layer1_out[17]=neuron1_17_out;
        layer1_out[18]=neuron1_18_out;
        layer1_out[19]=neuron1_19_out;
        layer1_out[20]=neuron1_20_out;
        layer1_out[21]=neuron1_21_out;
        layer1_out[22]=neuron1_22_out;
        layer1_out[23]=neuron1_23_out;
        layer1_out[24]=neuron1_24_out;
        layer1_out[25]=neuron1_25_out;
        layer1_out[26]=neuron1_26_out;
        layer1_out[27]=neuron1_27_out;
        layer1_out[28]=neuron1_28_out;
        layer1_out[29]=neuron1_29_out; 
        
//        complete1=finished1; 
        end
    
    
    
  
endmodule
