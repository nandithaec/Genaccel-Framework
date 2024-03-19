`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 21.01.2022 19:50:13
// Design Name: 
// Module Name: (*DONT_TOUCH="YES"*) PE
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

//`ifdef USE_DSP
    (* use_dsp = "yes" *)
//`else 
//    (* use_dsp = "no" *)
//`endif

//`ifdef DONT_USE_DSP
//    (* use_dsp = "no" *)
//`endif
    

module  PE_v2_dsp #(parameter REG_WIDTH = 16, VECTOR = 2) (clk,a_n_1,b_n_1,c_n_1,a_n,b_n,c_ab);
    
    input clk;
    input [REG_WIDTH-1:0] a_n_1[VECTOR - 1:0] ;
    input [REG_WIDTH-1:0] b_n_1[ VECTOR-1: 0] ;
    input [REG_WIDTH-1:0] c_n_1[VECTOR - 1:0] ;
    output reg [REG_WIDTH-1:0] a_n[VECTOR - 1:0]; //NEED NOT BE REG, JUST USED HERE TO SIMPLIFY
    output reg [REG_WIDTH-1:0] b_n[ VECTOR-1: 0]; // POINT OF OPTIMISATION, CAN REMOVE REG
    output reg [REG_WIDTH-1:0] c_ab[VECTOR - 1:0];

    initial begin
        a_n[0] = 0;a_n[1] = 0;
        b_n[0] = 0; b_n[0] = 0;
        c_ab[0] = 0;
    end
    
    


    reg [VECTOR - 1: 0] i;
    always @(posedge clk) begin
        a_n <= a_n_1;
        b_n[0] <= b_n_1[0];
        b_n[1] <= b_n_1[0];
        c_ab[0] <=  ( a_n_1[0] * b_n_1[0]) + c_n_1[0];
        c_ab[1] <=  ( a_n_1[1] * b_n_1[0]) + c_n_1[1];
    end
endmodule