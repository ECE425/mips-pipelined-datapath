`timescale 1ns / 1ps

module dff(q,reset,data,clk);
output reg q;

input reset;
input data;
input clk;

always @(posedge clk)
begin
    q<=data;
    
    if(reset)
        q<=0;
end 

endmodule
       
