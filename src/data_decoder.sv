`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.02.2024 22:57:22
// Design Name: 
// Module Name: Data_decoder
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

(*DONT_TOUCH = "YES"*)
module Data_decoder#(
    parameter REG_WIDTH = 16,
              MATRIX_SIZE = 4,
              ARRAY_SIZE = 2*MATRIX_SIZE - 1,
              BRAM_DEPTH = MATRIX_SIZE*REG_WIDTH,
              OUTPUT_WIDTH = ARRAY_SIZE*REG_WIDTH,
              VECTOR = 2
)(
input clk,
input enable,
input [BRAM_DEPTH-1: 0] data_bram [VECTOR-1:0],
input reset,

output  [REG_WIDTH-1:0] out_0 [VECTOR-1:0] ,
output  [REG_WIDTH-1:0] out_1 [VECTOR-1:0],
output  [REG_WIDTH-1:0] out_2 [VECTOR-1:0],
output  [REG_WIDTH-1:0] out_3 [VECTOR-1:0],
output  [REG_WIDTH-1:0] out_4 [VECTOR-1:0],
output  [REG_WIDTH-1:0] out_5 [VECTOR-1:0],
output  [REG_WIDTH-1:0] out_6 [VECTOR-1:0],
output reg compute_start [VECTOR-1:0]
    );
    
    reg [3:0] state;
    wire [OUTPUT_WIDTH-1:0] o_left_inputs [VECTOR-1:0];
//    For simulation purpose only
//    initial begin
//    state = 0;
//    o_left_inputs = 0; 
//    end


genvar i;
generate
for(i = 0;i<VECTOR-1; i=i+1) begin
    (*DONT_TOUCH = "YES"*) assign o_left_inputs[i] = ({OUTPUT_WIDTH{1'b0}} | (data_bram[i] << (REG_WIDTH*state)));
end
endgenerate
    
    always@(posedge clk) begin
        if(reset) begin
            compute_start[0] <= 0;
        end
        else begin
            if(enable) begin 
                if(state < MATRIX_SIZE-1) begin
                    state <= state + 1;
                end
                else begin
                    state <= 0;
                end
    end        
        end
    end
    
  genvar j;
  generate 
  for(j = 0; j<VECTOR-1;j=j+1) begin 
        (*DONT_TOUCH = "YES"*)assign out_0[j] = o_left_inputs[j][15:0];
        (*DONT_TOUCH = "YES"*)assign out_1[j] = o_left_inputs[j][31:16];
        (*DONT_TOUCH = "YES"*)assign out_2[j] = o_left_inputs[j][47:32];
        (*DONT_TOUCH = "YES"*)assign out_3[j] = o_left_inputs[j][63:48];
        (*DONT_TOUCH = "YES"*)assign out_4[j] = o_left_inputs[j][79:64];
        (*DONT_TOUCH = "YES"*)assign out_5[j] = o_left_inputs[j][95:80];
        (*DONT_TOUCH = "YES"*)assign out_6[j] = o_left_inputs[j][111:96];
  end
  endgenerate
    
//    assign  out_0 = o_left_inputs[REG_WIDTH-1:0];
//    assign out_1 = o_left_inputs[2*REG_WIDTH-1:REG_WIDTH];
//    assign out_2 = o_left_inputs[3*REG_WIDTH-1:2*REG_WIDTH];
//    assign out_3 = o_left_inputs[4*REG_WIDTH-1:3*REG_WIDTH];
//    assign out_4 = o_left_inputs[5*REG_WIDTH-1:4*REG_WIDTH];
//    assign out_5 = o_left_inputs[6*REG_WIDTH-1:5*REG_WIDTH];
//    assign out_6 = o_left_inputs[7*REG_WIDTH-1:6*REG_WIDTH];
    
    
endmodule
