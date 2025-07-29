module tb_converter;
reg [3:0]b;
wire [3:0]g;
binary2graycode dut(b,g); //linking of the rtl
initial
begin
b=4'b1010; //applying the binary inputs
#10
b=4'b0011;
#10
b=4'b1111;
#10
$finish;
end
endmodule

