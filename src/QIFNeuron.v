module QIFNeuron (
  input wire clk,          // Clock input
  input wire rst_n,       // Reset input
  input   wire [7:0] I_syn,     // Input B (8-bit, signed)
  output  reg [7:0] V_mem     // Output voltage V (8-bit, signed) 
);
  reg [7:0] Z1, Z2;        // Delay flip-flops
  wire [7:0] V_reset = -8'sd20; // Set Vreset to -20
  wire [7:0] Vpeak = 8'd50;  // Vpeak value (Set to 50)
  wire [7:0] A = 8'd32;      // Gain A (Set to 0.25)

  

  // V computation
  reg [7:0] V_reg; // Intermediate register for V
  always @(posedge clk or posedge rst_n) begin
    if (rst_n) begin
      V_reg <= V_reset;
     
      Z1 <= 8'b0; // Initialize Z1 on reset
    end else if (V_reg >= Vpeak) begin
      V_reg <= V_reset;
      
      Z1 <= 8'b0;
      Z2 <= 8'b0;
    end else begin
      V_reg <= A * (V_reg + (V_reg/8) *( V_reg/8) + I_syn/4); // Include the square term here
      
      Z1 <= B + Z2;
    end
  end

  

  // Assign spike_out_reg to spike_out (output wire)
  
  assign V_mem = Z2;
endmodule
