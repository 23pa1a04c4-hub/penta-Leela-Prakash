module rotor(sigright, sigleft, clk, in, out, load);
input sigright, sigleft, clk, load;
input [7:0] in;
output reg [7:0] out;

always @ (posedge clk)
begin
    if (load) begin
        out <= in;  // Load input data when load is high
    end
    else if (sigright) begin
        out <= {out[0], out[7:1]};  // Rotate right
    end
    else if (sigleft) begin
        out <= {out[6:0], out[7]};  // Rotate left
    end
end

endmodule

