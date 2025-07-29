

module rotor_tb;

reg clk;
reg sigright, sigleft, load;
reg [7:0] in;
wire [7:0] out;

// Instantiate the rotor module
rotor uut (
    .sigright(sigright),
    .sigleft(sigleft),
    .clk(clk),
    .in(in),
    .out(out),
    .load(load)
);

// Clock generation: 10 ns period
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// Stimulus
initial begin
    // Initialize inputs
    sigright = 0;
    sigleft = 0;
    load = 0;
    in = 8'b10110011;

    // Wait for a few clock cycles
    #10;

    // Load the input
    load = 1;
    #10;
    load = 0;

    // Rotate right for 3 cycles
    sigright = 1;
    #30;
    sigright = 0;

    // Rotate left for 3 cycles
    sigleft = 1;
    #30;
    sigleft = 0;

    // Finish simulation
    #10;
    $finish;
end

// Monitor output
initial begin
    $monitor("Time=%0t | Load=%b | SigR=%b | SigL=%b | In=%b | Out=%b", 
              $time, load, sigright, sigleft, in, out);
end

endmodule

