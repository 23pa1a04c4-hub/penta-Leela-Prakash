
module dtgsfh;
reg clk,signal,reset;
wire high;
seqcheck dut(clk,signal,reset,high);
initial
begin
clk=0;
forever #1 clk=~clk;
end
// giving the input and clk signal to check the rtl code
initial
begin
reset=1;        
signal=0;     
#5
reset=0;
#2;
signal=1;
#2
signal=0;
#2
signal=1;
#2;
signal=0;
#2;
signal=1;
#2
signal=0;
#10
$finish;
end
endmodule

