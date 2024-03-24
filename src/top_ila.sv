`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2024 10:45:41 PM
// Design Name: 
// Module Name: top_ila
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
`include "/home/iiitb/Jay/htiles_design_1/htiles_design_1.srcs/sources_1/new/parameters.v"


module top_ila      (
    input clk,
          reset,
          enable
    );
    

wire  [DATA_WIDTH-1:0] out_b_7_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_b_6_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_b_5_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_b_4_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_r_4_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_r_5_t1[V1 - 1:0];
wire [DATA_WIDTH-1:0] out_r_6_t1[V1 - 1:0];

wire [DATA_WIDTH-1:0] out_b_7_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_b_6_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_b_5_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_b_4_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_r_4_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_r_5_t2[V2 - 1:0];
wire [DATA_WIDTH-1:0] out_r_6_t2[V2 - 1:0];

wire [DATA_WIDTH-1:0] out_b_7_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_b_6_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_b_5_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_b_4_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_r_4_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_r_5_t3[V3 - 1:0];
wire [DATA_WIDTH-1:0] out_r_6_t3[V3 - 1:0];

wire [DATA_WIDTH-1:0] out_b_7_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_b_6_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_b_5_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_b_4_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_r_4_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_r_5_t4[V4 - 1:0];
wire [DATA_WIDTH-1:0] out_r_6_t4[V4 - 1:0];
wire clk_250;
wire clk_125;
assign clk_250 = clk;

clock_divider clock_dsp_lut
   (
    // Clock out ports
    .clk_out1(clk_125),     // output clk_out1
   // Clock in ports
    .clk_in1(clk_250)      // input clk_in1
);
    
    top #(
            .MATRIX_SIZE(4),
            .ARRAY_SIZE(2 * MATRIX_SIZE - 1),
            .REG_WIDTH(16), // system type
            .DATA_WIDTH(16),
            .V1(V1),
            .V2(V2),
            .V3(V3),
            .V4(V4),
            .BRAM_DEPTH(2),
              .TILE(4)) top_instance(clk_250, clk_250, reset, enable, out_b_7_t1, out_b_6_t1, out_b_5_t1, out_b_4_t1, out_r_4_t1, out_r_5_t1, out_r_6_t1,
                            out_b_7_t2, out_b_6_t2, out_b_5_t2, out_b_4_t2, out_r_4_t2, out_r_5_t2, out_r_6_t2,
                            out_b_7_t3, out_b_6_t3, out_b_5_t3, out_b_4_t3, out_r_4_t3, out_r_5_t3, out_r_6_t3,
                            out_b_7_t4, out_b_6_t4, out_b_5_t4, out_b_4_t4, out_r_4_t4, out_r_5_t4, out_r_6_t4);
    
     //ILA
     
    ila_0 ila_output_instance_t1 (
            .clk(clk_250), // input wire clk
            
            
            .probe0(out_b_7_t1[0]), // input wire [15:0]  probe0  
            .probe1(out_b_6_t1[0]), // input wire [15:0]  probe1 
            .probe2(out_b_5_t1[0]), // input wire [15:0]  probe2 
            .probe3(out_b_4_t1[0]), // input wire [15:0]  probe3 
            .probe4(out_r_4_t1[0]), // input wire [15:0]  probe4 
            .probe5(out_r_5_t1[0]), // input wire [15:0]  probe5 
            .probe6(out_r_6_t1[0]) // input wire [15:0]  probe6
        );

    ila_0 ila_output_instance_t2 (
            .clk(clk_250), // input wire clk
            
            
            .probe0(out_b_7_t2[0]), // input wire [15:0]  probe0  
            .probe1(out_b_6_t2[0]), // input wire [15:0]  probe1 
            .probe2(out_b_5_t2[0]), // input wire [15:0]  probe2 
            .probe3(out_b_4_t2[0]), // input wire [15:0]  probe3 
            .probe4(out_r_4_t2[0]), // input wire [15:0]  probe4 
            .probe5(out_r_5_t2[0]), // input wire [15:0]  probe5 
            .probe6(out_r_6_t2[0]) // input wire [15:0]  probe6
        );

    ila_0 ila_output_instance_t3 (
            .clk(clk_125), // input wire clk
            
            
            .probe0(out_b_7_t3[0]), // input wire [15:0]  probe0  
            .probe1(out_b_6_t3[0]), // input wire [15:0]  probe1 
            .probe2(out_b_5_t3[0]), // input wire [15:0]  probe2 
            .probe3(out_b_4_t3[0]), // input wire [15:0]  probe3 
            .probe4(out_r_4_t3[0]), // input wire [15:0]  probe4 
            .probe5(out_r_5_t3[0]), // input wire [15:0]  probe5 
            .probe6(out_r_6_t3[0]) // input wire [15:0]  probe6
        );

    ila_0 ila_output_instance_t4 (
            .clk(clk_125), // input wire clk
            
            
            .probe0(out_b_7_t4[0]), // input wire [15:0]  probe0  
            .probe1(out_b_6_t4[0]), // input wire [15:0]  probe1 
            .probe2(out_b_5_t4[0]), // input wire [15:0]  probe2 
            .probe3(out_b_4_t4[0]), // input wire [15:0]  probe3 
            .probe4(out_r_4_t4[0]), // input wire [15:0]  probe4 
            .probe5(out_r_5_t4[0]), // input wire [15:0]  probe5 
            .probe6(out_r_6_t4[0]) // input wire [15:0]  probe6
        );
        
    
    
endmodule
