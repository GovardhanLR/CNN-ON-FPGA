`timescale 1ns / 1ps

module storage_mp #(parameter M=26,N=26,dataWidth=17)(
        input clk,rstn,
        input move,
        input [16:0] max_init,
        input  [16:0]max,
//        output reg [169*17-1:0] maxpool_res,
        output reg out=0
    );
    
    
    (* RAM_STYLE="BLOCK" *)
    reg [16:0] maxpool_out [0:168];
    integer outfile1;
    integer file,file1,i;
    integer pointer =1;
    // maxpool_out will have max elements equal to one_fourth of the initial feature image
    reg [7:0] num=0; 
    always @(negedge clk)
    if(move == 1 && out ==0)
    begin
//    maxpool_res[pointer*dataWidth+:dataWidth]= max;
    maxpool_out[num]=max;
    num = num+1;
//    mp_vals = max;
//    pointer = pointer+1;  
//     maxpool_res[0*dataWidth+:dataWidth] = max_init;
//    maxpool_res[1*dataWidth+:dataWidth] = max_init;
//      maxpool_res[2*dataWidth+:dataWidth] = max_init;
    
    if(num == 169)
        begin
            out =1;
            outfile1=$fopen("maxpool_out.txt","w");
            for(i=0;i<13*13;i=i+1)
            begin
                if(maxpool_out[i]>0)
                $fdisplayb(outfile1,"%d",maxpool_out[i]);
                else
                $fdisplayb(outfile1,"%d",17'b0);
                $display("%d",maxpool_out[i]);
                $display("%d",i);
            end
            $fclose(outfile1);
            

        end
    end
     
endmodule
