module tb_edgedetector();
reg a,clk;
wire c,b,d,x,y;
edgedetector dut(a,b,c,d,x,y,clk);
initial clk=0;
always #2 clk=~clk;
initial
begin
a=1;
#10

$finish;
end
endmodule

