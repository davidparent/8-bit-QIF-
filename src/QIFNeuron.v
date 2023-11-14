module QIFNeuron (
  input wire clk,          // Clock input
  input wire rst_n,       // Reset input
  input   wire [7:0] I_syn,     // Input B (8-bit, signed)
  output  wire [7:0] V_mem     // Output voltage V (8-bit, signed) 
);
  reg [7:0] V;
  reg [7:0] B;
  //wire reset = ! rst_n;
   //reg [7:0] Z1, Z2;        // Delay flip-flops
  //wire [7:0] V_reset = -8'sd20; // Set Vreset to -20
  //wire [7:0] Vpeak = 8'd50;  // Vpeak value (Set to 50)
  //wire [7:0] A = 8'd32;      // Gain A (Set to 0.25)
  
  assign V_mem = V;
  
  always @(posedge clk) begin
        // if reset, set counter to 0
      if (rst_n) begin
            V <= 0;
            //B <=0 ;
     
        end else begin
            V <= I_syn;
            //B <=1 ;
      
        end
  end
endmodule
