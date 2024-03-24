`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.02.2024 11:57:05
// Design Name: 
// Module Name: top
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


module top#(
    parameter MATRIX_SIZE = 4,
              ARRAY_SIZE = 2 * MATRIX_SIZE - 1,
              REG_WIDTH = 16, // system type
              DATA_WIDTH = 16,
              V1 = 2,
              V2 = 2,
              V3 = 2,
              V4 = 2,
              BRAM_DEPTH = 2,
              TILE = 4)(
    input clk_250,
          clk_125,
          reset,
          enable,
          
    output  [DATA_WIDTH-1:0] out_b_7_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_b_6_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_b_5_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_b_4_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_r_4_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_r_5_t1[V1 - 1:0],
            [DATA_WIDTH-1:0] out_r_6_t1[V1 - 1:0],

            [DATA_WIDTH-1:0] out_b_7_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_b_6_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_b_5_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_b_4_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_r_4_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_r_5_t2[V2 - 1:0],
            [DATA_WIDTH-1:0] out_r_6_t2[V2 - 1:0],

            [DATA_WIDTH-1:0] out_b_7_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_b_6_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_b_5_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_b_4_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_r_4_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_r_5_t3[V3 - 1:0],
            [DATA_WIDTH-1:0] out_r_6_t3[V3 - 1:0],

            [DATA_WIDTH-1:0] out_b_7_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_b_6_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_b_5_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_b_4_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_r_4_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_r_5_t4[V4 - 1:0],
            [DATA_WIDTH-1:0] out_r_6_t4[V4 - 1:0]
    );
    
    



reg [BRAM_DEPTH-1:0] address_lut, address_dsp;
wire write_mode_lut, write_mode_dsp;
wire compute_ready;
wire enable_cu;

wire [REG_WIDTH*MATRIX_SIZE-1:0] data_bram_t1[V1-1:0], data_bram_t2[V2-1:0], data_bram_t3[V3-1:0], data_bram_t4[V4-1:0], data_bram_top_1, data_bram_top_2, data_bram_top_3, data_bram_top_4;

wire compute_start_left_t1[V1-1:0], compute_start_left_t2[V2-1:0], compute_start_left_t3[V3-1:0], compute_start_left_t4[V4-1:0];
wire compute_start_top_1, compute_start_top_2, compute_start_top_3, compute_start_top_4;
wire [ REG_WIDTH-1: 0] left_0_t1[V1-1:0],
                      left_1_t1[V1-1:0],
                      left_2_t1[V1-1:0], 
                      left_3_t1[V1-1:0], 
                      left_4_t1[V1-1:0], 
                      left_5_t1[V1-1:0], 
                      left_6_t1[V1-1:0];
wire [ REG_WIDTH-1: 0] top_0_t1, 
                      top_1_t1, 
                      top_2_t1, 
                      top_3_t1, 
                      top_4_t1, 
                      top_5_t1, 
                      top_6_t1; 

wire [ REG_WIDTH-1: 0] left_0_t2[V2-1:0],
                      left_1_t2[V2-1:0],
                      left_2_t2[V2-1:0], 
                      left_3_t2[V2-1:0], 
                      left_4_t2[V2-1:0], 
                      left_5_t2[V2-1:0], 
                      left_6_t2[V2-1:0];
wire [ REG_WIDTH-1: 0] top_0_t2, 
                      top_1_t2, 
                      top_2_t2, 
                      top_3_t2, 
                      top_4_t2, 
                      top_5_t2, 
                      top_6_t2; 

wire [ REG_WIDTH-1: 0] left_0_t3[V3-1:0],
                      left_1_t3[V3-1:0],
                      left_2_t3[V3-1:0], 
                      left_3_t3[V3-1:0], 
                      left_4_t3[V3-1:0], 
                      left_5_t3[V3-1:0], 
                      left_6_t3[V3-1:0];
wire [ REG_WIDTH-1: 0] top_0_t3, 
                      top_1_t3, 
                      top_2_t3, 
                      top_3_t3, 
                      top_4_t3, 
                      top_5_t3, 
                      top_6_t3; 

wire [ REG_WIDTH-1: 0] left_0_t4[V4-1:0],
                      left_1_t4[V4-1:0],
                      left_2_t4[V4-1:0], 
                      left_3_t4[V4-1:0], 
                      left_4_t4[V4-1:0], 
                      left_5_t4[V4-1:0], 
                      left_6_t4[V4-1:0];
wire [ REG_WIDTH-1: 0] top_0_t4, 
                      top_1_t4, 
                      top_2_t4, 
                      top_3_t4, 
                      top_4_t4, 
                      top_5_t4, 
                      top_6_t4;    
                      
                      
                      
                                                                
always@(posedge clk_250) begin
    address_lut = address_lut + 1;
end

always@(posedge clk_125) begin
    address_dsp = address_dsp + 1;
end

(*DONT_TOUCH = "YES"*)control_unit#(
.BRAM_DEPTH(2)
) cu(.clk(clk_250), .reset(reset), .enable(enable), .enable_cu(enable_cu), .compute_ready(compute_ready), .write_mode(write_mode), .address(address));
     
       Mat_1 mat_1_instance (
            .clka(clk_250),    // input wire clka
            .ena(enable),      // input wire ena
            .wea(0),      // input wire [0 : 0] wea
            .addra(address_dsp),  // input wire [1 : 0] addra
            .dina(0),    // input wire [63 : 0] dina
            .douta(data_bram_top_1)  // output wire [63 : 0] douta
            );
            
       Mat_1 mat_2_instance (
            .clka(clk_250),    // input wire clka
            .ena(enable),      // input wire ena
            .wea(0),      // input wire [0 : 0] wea
            .addra(address_dsp),  // input wire [1 : 0] addra
            .dina(0),    // input wire [63 : 0] dina
            .douta(data_bram_top_2)  // output wire [63 : 0] douta
            );
            
            
      Mat_1 mat_3_instance (
            .clka(clk_125),    // input wire clka
            .ena(enable),      // input wire ena
            .wea(0),      // input wire [0 : 0] wea
            .addra(address_lut),  // input wire [1 : 0] addra
            .dina(0),    // input wire [63 : 0] dina
            .douta(data_bram_top_3)  // output wire [63 : 0] douta
            );
            
            
            
      Mat_1 mat_4_instance (
            .clka(clk_125),    // input wire clka
            .ena(enable),      // input wire ena
            .wea(0),      // input wire [0 : 0] wea
            .addra(address_lut),  // input wire [1 : 0] addra
            .dina(0),    // input wire [63 : 0] dina
            .douta(data_bram_top_4)  // output wire [63 : 0] douta
            );
    

genvar k;
generate
    for(k=0;k<V1;k=k+1) begin
            Mat_2_tile_1 mat_2_tile_1_instance (
                .clka(clk_250),    // input wire clka
                .ena(enable),      // input wire ena
                .wea(0),      // input wire [0 : 0] wea
                .addra(address_dsp),  // input wire [1 : 0] addra
                .dina(0),    // input wire [63 : 0] dina
                .douta(data_bram_t1[k])  // output wire [63 : 0] douta
                );
    end


    for(k=0;k<V2;k=k+1) begin
            Mat_2_tile_2 mat_2_tile_2_instance (
                .clka(clk_250),    // input wire clka
                .ena(enable),      // input wire ena
                .wea(0),      // input wire [0 : 0] wea
                .addra(address_dsp),  // input wire [1 : 0] addra
                .dina(0),    // input wire [63 : 0] dina
                .douta(data_bram_t2[k])  // output wire [63 : 0] douta
                );
    end

    for(k=0;k<V3;k=k+1) begin
            Mat_2_tile_3 mat_2_tile_3_instance (
                .clka(clk_125),    // input wire clka
                .ena(enable),      // input wire ena
                .wea(0),      // input wire [0 : 0] wea
                .addra(address_lut),  // input wire [1 : 0] addra
                .dina(0),    // input wire [63 : 0] dina
                .douta(data_bram_t3[k])  // output wire [63 : 0] douta
                );
    end

    for(k=0;k<V4;k=k+1) begin
            Mat_2_tile_4 mat_2_tile_4_instance (
                .clka(clk_125),    // input wire clka
                .ena(enable),      // input wire ena
                .wea(0),      // input wire [0 : 0] wea
                .addra(address_lut),  // input wire [1 : 0] addra
                .dina(0),    // input wire [63 : 0] dina
                .douta(data_bram_t4[k])  // output wire [63 : 0] douta
                );
    end
endgenerate

    
        Data_decoder #(.REG_WIDTH(16), .MATRIX_SIZE(4), .ARRAY_SIZE(7), .BRAM_DEPTH(MATRIX_SIZE*REG_WIDTH), .OUTPUT_WIDTH(ARRAY_SIZE*REG_WIDTH), .VECTOR(V1)) dd_instance_t1(clk_250, enable_cu, data_bram_t1, reset, left_0_t1, left_1_t1, left_2_t1, left_3_t1, left_4_t1, left_5_t1, left_6_t1 , compute_start_left_t1);
    
        Data_decoder #(.REG_WIDTH(16), .MATRIX_SIZE(4), .ARRAY_SIZE(7), .BRAM_DEPTH(MATRIX_SIZE*REG_WIDTH), .OUTPUT_WIDTH(ARRAY_SIZE*REG_WIDTH), .VECTOR(V2)) dd_instance_t2(clk_250, enable_cu, data_bram_t2, reset, left_0_t2, left_1_t2, left_2_t2, left_3_t2, left_4_t2, left_5_t2, left_6_t2 , compute_start_left_t2);
    
        Data_decoder #(.REG_WIDTH(16), .MATRIX_SIZE(4), .ARRAY_SIZE(7), .BRAM_DEPTH(MATRIX_SIZE*REG_WIDTH), .OUTPUT_WIDTH(ARRAY_SIZE*REG_WIDTH), .VECTOR(V3)) dd_instance_t3(clk_125, enable_cu, data_bram_t3, reset, left_0_t3, left_1_t3, left_2_t3, left_3_t3, left_4_t3, left_5_t3, left_6_t3 , compute_start_left_t3);
    
        Data_decoder #(.REG_WIDTH(16), .MATRIX_SIZE(4), .ARRAY_SIZE(7), .BRAM_DEPTH(MATRIX_SIZE*REG_WIDTH), .OUTPUT_WIDTH(ARRAY_SIZE*REG_WIDTH), .VECTOR(V4)) dd_instance_t4(clk_125, enable_cu, data_bram_t4, reset, left_0_t4, left_1_t4, left_2_t4, left_3_t4, left_4_t4, left_5_t4, left_6_t4 , compute_start_left_t4);
   


    Data_decoder_top  dd_instance_mat1_t1(clk_250, enable_cu, data_bram_top_1, reset, top_0_t1, top_1_t1, top_2_t1, top_3_t1, top_4_t1, top_5_t1, top_6_t1, compute_start_top_1);

    Data_decoder_top  dd_instance_mat1_t2(clk_250, enable_cu, data_bram_top_2, reset, top_0_t2, top_1_t2, top_2_t2, top_3_t2, top_4_t2, top_5_t2, top_6_t2, compute_start_top_2);

    Data_decoder_top  dd_instance_mat1_t3(clk_125, enable_cu, data_bram_top_3, reset, top_0_t3, top_1_t3, top_2_t3, top_3_t3, top_4_t3, top_5_t3, top_6_t3, compute_start_top_3);

    Data_decoder_top  dd_instance_mat1_t4(clk_125, enable_cu, data_bram_top_4, reset, top_0_t4, top_1_t4, top_2_t4, top_3_t4, top_4_t4, top_5_t4, top_6_t4, compute_start_top_4);




    systolic_module_v6_dsp tile_1(clk_250,left_0_t1, left_1_t1 ,left_2_t1,left_3_t1,left_4_t1, left_5_t1, left_6_t1,top_0_t1,top_1_t1,top_2_t1,top_3_t1,top_4_t1, top_5_t1,  top_6_t1, out_b_7_t1, out_b_6_t1,out_b_5_t1, out_b_4_t1, out_r_4_t1, out_r_5_t1, out_r_6_t1);

    systolic_module_v6_dsp tile_2(clk_250,left_0_t2, left_1_t2 ,left_2_t2,left_3_t2,left_4_t2, left_5_t2, left_6_t2,top_0_t2,top_1_t2,top_2_t2,top_3_t2,top_4_t2, top_5_t2,  top_6_t2, out_b_7_t2, out_b_6_t2,out_b_5_t2, out_b_4_t2, out_r_4_t2, out_r_5_t2, out_r_6_t2);
    
    systolic_module_v8_dsp tile_3(clk_125,left_0_t3, left_1_t3 ,left_2_t3,left_3_t3,left_4_t3, left_5_t3, left_6_t3,top_0_t3,top_1_t3,top_2_t3,top_3_t3,top_4_t3, top_5_t3,  top_6_t3, out_b_7_t3, out_b_6_t3,out_b_5_t3, out_b_4_t3, out_r_4_t3, out_r_5_t3, out_r_6_t3);
    
    systolic_module_v8_dsp tile_4(clk_125,left_0_t4, left_1_t4 ,left_2_t4,left_3_t4,left_4_t4, left_5_t4, left_6_t4,top_0_t4,top_1_t4,top_2_t4,top_3_t4,top_4_t4, top_5_t4,  top_6_t4, out_b_7_t4, out_b_6_t4,out_b_5_t4, out_b_4_t4, out_r_4_t4, out_r_5_t4, out_r_6_t4);
    
   
endmodule
