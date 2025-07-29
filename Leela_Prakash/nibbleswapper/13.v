module nibble(a,reset,clk,b);
input [7:0]a;
input clk,reset;
output reg[7:0]b;
always@(posedge clk)//at the positive edge
begin
if(reset)begin
b<=0;
end
else begin
b<={a[3:0],a[7:4]};//swapping th input
end
end
endmodule

