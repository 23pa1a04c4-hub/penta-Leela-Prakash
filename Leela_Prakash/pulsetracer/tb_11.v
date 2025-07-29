

module tb_pulse_cleaner;

  reg clk;
  reg noisy_in;
  wire clean_pulse;

  // Instantiate the pulse_cleaner with debounce count 4
  pulse_cleaner #(.DEBOUNCE_CNT_MAX(4)) uut (
    .clk(clk),
    .noisy_in(noisy_in),
    .clean_pulse(clean_pulse)
  );

  // Clock generation: 10ns period
  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  // Test stimulus
  initial begin
    noisy_in = 0;
    #20;

    // Glitch: short spike (3 cycles, less than debounce 4)
    noisy_in = 1; #30;
    noisy_in = 0; #20;

    // Stable pulse: longer than debounce (6 cycles)
    noisy_in = 1; #60;
    noisy_in = 0; #20;

    // Another glitch: very short spike (1 cycle)
    noisy_in = 1; #10;
    noisy_in = 0; #40;

    // Stable pulse again
    noisy_in = 1; #50;
    noisy_in = 0; #50;

    #50;
    $finish;
  end

  // Monitor signals
  initial begin
    $monitor("Time=%0t | clk=%b | noisy_in=%b | clean_pulse=%b",
             $time, clk, noisy_in, clean_pulse);
  end

endmodule

