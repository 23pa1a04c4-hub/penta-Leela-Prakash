


module tb_bitbalancer();
  reg [7:0] a;
  reg clk;
  reg reset;
  wire [3:0] count;
  bitbalancer uut (.a(a),.reset(reset),.clk(clk),.count(count));
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  
  end
  initial begin
    reset = 1;
    a = 8'b00000000;
    #20;
    reset = 0;
    a = 8'b10101011; 
    #10;
    $display("Input a = %b, count = %d", a, count);

    a = 8'b11110000;
    #10;
    $display("Input a = %b, count = %d", a, count);

    a = 8'b00000000; 
    #10;
    $display("Input a = %b, count = %d", a, count);

    a = 8'b11111111; 
    #10;
    $display("Input a = %b, count = %d", a, count);
#10
    
    $finish;
  end
endmodule

