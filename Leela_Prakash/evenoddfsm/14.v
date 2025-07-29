module evenodd(in,clk,reset,even,odd);
input reset,clk,in;
output reg even,odd;
reg[1:0] cs,ns;
parameter s1=2'b00 ,s2=2'b01 ,s3=2'b11;
always @(posedge clk)
begin
if(reset)
cs<=s1;
else
cs<=ns;//assigning the next state
end
always @ (in)
begin
if(in%2==0) //checking even condition
begin
ns<=s2;
even<=1; //assigning statwe
odd<=0;
end
else
if(in[0]==1)
begin
ns<=s3;
odd<=1;//assigning odd state
even<=0;
end
end
endmodule
