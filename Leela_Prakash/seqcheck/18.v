module seqcheck(clk,signal,reset,high);
input clk,signal,reset;
output reg high;
reg [2:0]clkcount;
reg [2:0]edgecount;
reg active;   //making the reg reg variables
reg previous;
wire rising=(~previous)&signal;
always @(posedge clk or posedge reset)
begin
if(reset)
begin
previous<=0;
clkcount<=0;
edgecount<=0; //reset input
active<=0;
high<=0;
end
else
begin
previous<=signal;
if(active)
begin
clkcount<=clkcount+1; // measuring the count
if(rising)
begin
edgecount<=edgecount+1;
end
if(edgecount==3) //checking input count
begin
high<=1;
end
if(clkcount==5) //checking clk count
begin
active<=0;
clkcount<=0;
edgecount<=0;
high<=1;
end
end
else
begin
if(rising)   
begin
active<=1;
clkcount<=1;
edgecount<=1;
high<=0;
end
end
end
end
endmodule

