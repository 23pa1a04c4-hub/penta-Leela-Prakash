module lightchase(clk,enable,reset,l);
input clk,enable,reset;
output reg[6:0]l;
parameter s1=3'b000,s2=3'b001,s3=3'b010,s4=3'b011,s5=3'b100,s6=3'b101;
parameter delay=3;//delay timt i.e.clk cycles
reg [3:0]cs,ns;
reg [2:0]count;
always @(posedge clk)
begin
if(reset)
begin
cs<=s1;
count<=0; //reset input
end
else if(enable)
begin
if(count>=delay)
begin
cs<=ns;
count<=0;
end
else
begin
count<=count +1; // measuring the count
end
end
end
always @ (*)
begin
case (cs) //applying the next states
s1:ns=s2;
s2:ns=s3;
s3:ns=s4;
s4:ns=s5;
s5:ns=s6;
s6:ns=s1;
default:ns=s1;
endcase
end
always @(*)
begin
case (cs)
s1:l=6'b000001;   //applying the current states values
s2:l=6'b000010;
s3:l=6'b000100;
s4:l=6'b001000;
s5:l=6'b010000;
s6:l=6'b100000;
default: l=6'b000000;
endcase
end
endmodule
