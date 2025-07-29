module pulse_cleaner (
    input  wire clk,
    input  wire noisy_in,    // noisy input signal
    output reg  clean_pulse  // single-cycle clean pulse output
);

  // Parameters for debounce length (in clock cycles)
  parameter DEBOUNCE_CNT_MAX = 4;

  reg [2:0] debounce_cnt = 0;   // debounce counter (adjust width as needed)
  reg stable_in = 0;            // debounced input
  reg prev_stable_in = 0;       // previous stable input

  always @(posedge clk) begin
    // Debounce logic:
    if (noisy_in == 1'b1) begin
      if (debounce_cnt < DEBOUNCE_CNT_MAX)
        debounce_cnt <= debounce_cnt + 1;
    end else begin
      debounce_cnt <= 0;
    end

    // Consider input stable high only if debounce counter saturated
    stable_in <= (debounce_cnt == DEBOUNCE_CNT_MAX);

    // Generate single-cycle pulse on rising edge of stable_in
    clean_pulse <= stable_in & ~prev_stable_in;

    prev_stable_in <= stable_in;
  end

endmodule

