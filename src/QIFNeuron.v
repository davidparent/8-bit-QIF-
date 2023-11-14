module QIFNeuron (
  input wire clk,          // Clock input
  input wire rst_n,       // Reset input
  input   wire [7:0] I_syn,     // Input B (8-bit, signed)
  output  wire [7:0] V_mem     // Output voltage V (8-bit, signed) 
);
   //reg [7:0] Z1, Z2;        // Delay flip-flops
  //wire [7:0] V_reset = -8'sd20; // Set Vreset to -20
  //wire [7:0] Vpeak = 8'd50;  // Vpeak value (Set to 50)
  //wire [7:0] A = 8'd32;      // Gain A (Set to 0.25)
  assign V_mem = I_syn;

endmodule
