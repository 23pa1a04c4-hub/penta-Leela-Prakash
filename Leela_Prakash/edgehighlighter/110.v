
module edgedetector(a, b, c, d, x, y, clk);
input a,clk;
output c,b,d,x, y;
reg b,c,d;

always @(posedge clk) begin
    b <= 1; //detecting posedge
d<=0;
c<=0;
end

always @(negedge clk) begin
    d <= 1;
b<=0;  //detecting negedge
c=1;
end

assign x = a & b;
assign y = c&d;

endmodule






