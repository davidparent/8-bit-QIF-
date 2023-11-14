module QIFNeuron (
  input wire clk,          // Clock input
  input wire rst_n,       // Reset input
  input  signed reg [7:0] I_syn,     // Input B (8-bit, signed)
  output signed reg [7:0] V_mem     // Output voltage V (8-bit, signed)
  
);

  parameter signed [7:0] V_reset =  -8'sd20; // Reset potential
  parameter signed [7:0] V_th = 8'd50;   // Threshold potential (Adjust as needed)
  always @(posedge clk or posedge rst_n) begin
        if (rst_n) begin
           V_mem <= V_reset;
        end else if (V_mem >= V_th) begin
           V_mem <= V_reset;
    end else begin
        V_mem <= V_mem +  (V_mem/8)*(V_mem/8) I_syn/4; // Integrate the synaptic current
    end
  end  

  // Assign spike_out_reg to spike_out (output wire)
  assign spike_out = spike_out_reg;
  assign V = Z2;

endmodule
