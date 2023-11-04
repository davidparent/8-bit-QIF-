`default_nettype none

module tt_um_davidparent_qif #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input switches
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the 7 segment display
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    reg signed [7:0] I_syn, // Synaptic current input (8-bit signed)
    reg signed [7:0] V_mem, // Membrane potential (8-bit signed)
    wire reset = ! rst_n;
    assign uio_out = V_mem;
    assign uio_in = I_syn;

  parameter signed [7:0] V_reset = -20; // Reset potential
  parameter signed [7:0] V_th = 50;   // Threshold potential (Adjust as needed)

    always @(posedge clk or posedge reset) begin
        if (reset) begin
      V_mem <= V_reset;
    end else if (V_mem >= V_th) begin
      V_mem <= V_reset;
    end else begin
        V_mem <= V_mem +  (V_mem/8)*(V_mem/8) ui_in/4; // Integrate the synaptic current
    end
  end
 
endmodule
