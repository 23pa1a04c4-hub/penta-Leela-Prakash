module bitbalancer(a,reset,clk,count);
input [7:0]a;
input clk,reset;
output reg [3:0]count;
integer i;
reg [3:0]counting;
always @(posedge clk)
begin
if(reset)begin
count<=4'b000;
end
else
begin
counting=4'b000;
for(i=0;i<8;i=i+1)
begin
counting=counting+a[i];
end
count<=counting;
end
end
endmodule

