`default_nettype none

module tt_um_QIF_8bit #( parameter MAX_COUNT = 24'd10_000_000 ) (
    input  wire [7:0] ui_in,    // Dedicated inputs - connected to the input vector b
    output wire [7:0] uo_out,   // Dedicated outputs - connected to the output of membrane
    input  wire [7:0] uio_in,   // IOs: Bidirectional Input path Not used
    output wire [7:0] uio_out,  // IOs: Bidirectional Output path Not used
    output wire [7:0] uio_oe,   // IOs: Bidirectional Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);
    assign uio_oe = 8'b00000001;
    assign uio_out[7:0] = 8'd0;
   
     QIFNeuron neuron (
       .clk(clk),
       .rst_n(rst_n),
       .I_syn(ui_in),
       .V_mem(uo_out))
     );
    QIFNeuron neuron (
       .clk(clk),
       .rst_n(rst_n),
       .B(ui_in),
       .V(uo_out),
       .spike_out(uio_out[0])
     );

endmodule
