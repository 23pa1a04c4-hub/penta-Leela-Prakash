module nibble_tb;
reg [7:0] a;
reg clk,reset;
wire [7:0] b;
nibble dut (a,clk,reset,b);
  always #5 clk = ~clk;
initial
begin
    clk = 0;
    reset = 1;
    a = 8'h00;
#10
reset=0;
    a = 8'hAB;
    #10;
    a = 8'hF0;
#10
    a = 8'h12;
#10
     reset = 1;
    #10;
    reset = 0;

   a = 8'h3C; // Expect b = 0xC3
    #10;
 $finish;
  end
endmodule

