module binary2graycode(b,g);
input [3:0]b;
output [3:0]g;
assign g[3]=b[3]; //applying the operation of binary to grey code conversion operation
assign g[2]=b[3]^b[2];
assign g[1]=b[2]^b[1];
assign g[0]=b[1]^b[0];
endmodule
