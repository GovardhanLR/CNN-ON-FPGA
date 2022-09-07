`timescale 1ns / 1ps


module IAG_mp #(parameter M=26,N=26)(
        input clk,rstn,
        input [3 : 0]m,
        input access,move,
        input [9:0]pool_count,
        output reg inc,
        output wire [9:0] OFFSET,
        output reg pool_complete,
        output [15:0]out_addr,
        output reg done, 
        output reg moved,
        output reg [15:0]base_addr
    );
 
        reg [9:0]col_offset;
        reg [9:0]row_offset;//row_offset and col_offset used to describe the base address
        reg [9:0]offset;//offset is used to find the next addresses.It changes as 0,1,2,...,m-1
        reg [9:0]bit_number;//to keep track of column(1,2...m)
        // pool_count//number of elements accessed if the pool (total m elements should be accessed)
        //pool_complete//indicates one pool done if value=1
        //access//in access state,we get all the elements of 1 pool(base_addr remains constant throughout and offset on changes
        //move//moves the base_addr down by m rows.Done by increasing row_offset by m and bringing col_offset to 0.
        
        
        always @(*)
        begin
            if(!rstn)
            begin
              base_addr = 0;
              offset = 0;
              col_offset=0;
              row_offset=0;
              bit_number=1;
              done=0;
              inc=0;
            end
            else if (access)
            begin
                moved=0;
                inc = 0;
               base_addr = (M*row_offset)+col_offset;
               pool_complete=0;
               if(pool_count ==0)
               begin
                 offset=0;
               end
               else if(pool_count == (m*m))
               pool_complete = 1;
               else
               begin
                    if(bit_number<m)
                    begin
                        offset = offset+1;
                        bit_number = bit_number+1;
                    end
                    else if(bit_number==(m))
                    begin
                        offset = offset+(M-m+1);
                        bit_number = 1;
                    end
               end      
            end 

            if(move)
            begin
                bit_number=1;
                offset=0;
                base_addr = (M*row_offset)+col_offset;
              if(col_offset < N-m)
              begin
                 col_offset = col_offset +m;
                 inc = 1;
              end
              else if(row_offset < M-m)
              begin
              row_offset = row_offset +m;
              inc=1;
              col_offset = 0;
              end
              moved =1;
            end
      
            base_addr = (M*row_offset)+col_offset;
           
            if(base_addr >= ((M*N)-M-m))
            done =1;
            
         end
           
         assign OFFSET = offset;
         assign out_addr = base_addr + offset; 
         
endmodule
