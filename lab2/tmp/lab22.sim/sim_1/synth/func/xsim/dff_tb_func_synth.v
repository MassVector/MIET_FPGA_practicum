// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.2 (win64) Build 2708876 Wed Nov  6 21:40:23 MST 2019
// Date        : Thu May  7 19:42:04 2020
// Host        : DESKTOP-GCS90HJ running 64-bit major release  (build 9200)
// Command     : write_verilog -mode funcsim -nolib -force -file
//               A:/github/lab22/tmp/lab22.sim/sim_1/synth/func/xsim/dff_tb_func_synth.v
// Design      : dff
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* DATA_WIDTH = "8" *) 
(* NotValidForBitStream *)
module dff
   (clk_i,
    rstn_i,
    data_i,
    data_o);
  input clk_i;
  input rstn_i;
  input [7:0]data_i;
  output [7:0]data_o;

  wire clk_i;
  wire clk_i_IBUF;
  wire clk_i_IBUF_BUFG;
  wire \data[0]_i_1_n_0 ;
  wire \data[1]_i_1_n_0 ;
  wire \data[2]_i_1_n_0 ;
  wire \data[3]_i_1_n_0 ;
  wire \data[4]_i_1_n_0 ;
  wire \data[5]_i_1_n_0 ;
  wire \data[6]_i_1_n_0 ;
  wire \data[7]_i_2_n_0 ;
  wire [7:0]data_i;
  wire [7:0]data_i_IBUF;
  wire [7:0]data_o;
  wire [7:0]data_o_OBUF;
  wire p_0_in;
  wire rstn_i;
  wire rstn_i_IBUF;

  BUFG clk_i_IBUF_BUFG_inst
       (.I(clk_i_IBUF),
        .O(clk_i_IBUF_BUFG));
  IBUF clk_i_IBUF_inst
       (.I(clk_i),
        .O(clk_i_IBUF));
  LUT2 #(
    .INIT(4'h6)) 
    \data[0]_i_1 
       (.I0(data_i_IBUF[0]),
        .I1(data_o_OBUF[0]),
        .O(\data[0]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[1]_i_1 
       (.I0(data_i_IBUF[1]),
        .I1(data_o_OBUF[1]),
        .O(\data[1]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[2]_i_1 
       (.I0(data_i_IBUF[2]),
        .I1(data_o_OBUF[2]),
        .O(\data[2]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[3]_i_1 
       (.I0(data_i_IBUF[3]),
        .I1(data_o_OBUF[3]),
        .O(\data[3]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[4]_i_1 
       (.I0(data_i_IBUF[4]),
        .I1(data_o_OBUF[4]),
        .O(\data[4]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[5]_i_1 
       (.I0(data_i_IBUF[5]),
        .I1(data_o_OBUF[5]),
        .O(\data[5]_i_1_n_0 ));
  LUT2 #(
    .INIT(4'h6)) 
    \data[6]_i_1 
       (.I0(data_i_IBUF[6]),
        .I1(data_o_OBUF[6]),
        .O(\data[6]_i_1_n_0 ));
  LUT1 #(
    .INIT(2'h1)) 
    \data[7]_i_1 
       (.I0(rstn_i_IBUF),
        .O(p_0_in));
  LUT2 #(
    .INIT(4'h6)) 
    \data[7]_i_2 
       (.I0(data_i_IBUF[7]),
        .I1(data_o_OBUF[7]),
        .O(\data[7]_i_2_n_0 ));
  IBUF \data_i_IBUF[0]_inst 
       (.I(data_i[0]),
        .O(data_i_IBUF[0]));
  IBUF \data_i_IBUF[1]_inst 
       (.I(data_i[1]),
        .O(data_i_IBUF[1]));
  IBUF \data_i_IBUF[2]_inst 
       (.I(data_i[2]),
        .O(data_i_IBUF[2]));
  IBUF \data_i_IBUF[3]_inst 
       (.I(data_i[3]),
        .O(data_i_IBUF[3]));
  IBUF \data_i_IBUF[4]_inst 
       (.I(data_i[4]),
        .O(data_i_IBUF[4]));
  IBUF \data_i_IBUF[5]_inst 
       (.I(data_i[5]),
        .O(data_i_IBUF[5]));
  IBUF \data_i_IBUF[6]_inst 
       (.I(data_i[6]),
        .O(data_i_IBUF[6]));
  IBUF \data_i_IBUF[7]_inst 
       (.I(data_i[7]),
        .O(data_i_IBUF[7]));
  OBUF \data_o_OBUF[0]_inst 
       (.I(data_o_OBUF[0]),
        .O(data_o[0]));
  OBUF \data_o_OBUF[1]_inst 
       (.I(data_o_OBUF[1]),
        .O(data_o[1]));
  OBUF \data_o_OBUF[2]_inst 
       (.I(data_o_OBUF[2]),
        .O(data_o[2]));
  OBUF \data_o_OBUF[3]_inst 
       (.I(data_o_OBUF[3]),
        .O(data_o[3]));
  OBUF \data_o_OBUF[4]_inst 
       (.I(data_o_OBUF[4]),
        .O(data_o[4]));
  OBUF \data_o_OBUF[5]_inst 
       (.I(data_o_OBUF[5]),
        .O(data_o[5]));
  OBUF \data_o_OBUF[6]_inst 
       (.I(data_o_OBUF[6]),
        .O(data_o[6]));
  OBUF \data_o_OBUF[7]_inst 
       (.I(data_o_OBUF[7]),
        .O(data_o[7]));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[0] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[0]_i_1_n_0 ),
        .Q(data_o_OBUF[0]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[1] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[1]_i_1_n_0 ),
        .Q(data_o_OBUF[1]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[2] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[2]_i_1_n_0 ),
        .Q(data_o_OBUF[2]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[3] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[3]_i_1_n_0 ),
        .Q(data_o_OBUF[3]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[4] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[4]_i_1_n_0 ),
        .Q(data_o_OBUF[4]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[5] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[5]_i_1_n_0 ),
        .Q(data_o_OBUF[5]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[6] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[6]_i_1_n_0 ),
        .Q(data_o_OBUF[6]),
        .R(p_0_in));
  FDRE #(
    .INIT(1'b0)) 
    \data_reg[7] 
       (.C(clk_i_IBUF_BUFG),
        .CE(1'b1),
        .D(\data[7]_i_2_n_0 ),
        .Q(data_o_OBUF[7]),
        .R(p_0_in));
  IBUF rstn_i_IBUF_inst
       (.I(rstn_i),
        .O(rstn_i_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
