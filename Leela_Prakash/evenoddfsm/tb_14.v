module tb_evenodd();
reg in,clk,reset;
wire even,odd;
evenodd dut(in,clk,reset,even,odd);
initial
clk=0;
always #2 clk=~clk;
initial
begin
reset=1;
#1
reset=0;
in=4'b1010;//giving the even number
#10
in=4'b1011;//giving odd number
#10
$finish;
end
endmodule
