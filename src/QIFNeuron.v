module QIFNeuron (
  input wire clk,          // Clock input
  input wire rst_n,       // Reset input
  input   wire [7:0] I_syn,     // Input B (8-bit, signed)
  output  reg [7:0] V_mem     // Output voltage V (8-bit, signed) 
);
  reg [7:0] Z1 
  //wire  [7:0] V_reset =  -8'sd20; // Reset potential
  //wire  [7:0] V_th = 8'd50;   // Threshold potential (Adjust as needed)
  always @(posedge clk or posedge rst_n) begin
        if (rst_n) 
          Z1 <= 0;
        else
          Z1 <= I_syn;
  end
  assign V_mem = Z1;
endmodule
