module testcase;
reg clk,enable,reset;
wire [5:0]l;
lightchase dut(clk,enable,reset,l[5:0]);
initial
begin
clk=0;
forever #0.5 clk=~clk;
end
initial
begin
enable=0;
reset=1;
#5
enable=1;
reset=0;
#50
$finish;
end
endmodule
