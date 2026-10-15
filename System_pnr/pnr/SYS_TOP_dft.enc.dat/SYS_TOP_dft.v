module SYS_TOP_dft (
	REF_CLK, 
	UART_CLK, 
	RST_N, 
	UART_RX_IN, 
	UART_TX_O, 
	parity_error, 
	framing_error, 
	scan_clk, 
	scan_rst, 
	test_mode, 
	SE, 
	SI, 
	SO, 
	test_si4);
   input REF_CLK;
   input UART_CLK;
   input RST_N;
   input UART_RX_IN;
   output UART_TX_O;
   output parity_error;
   output framing_error;
   input scan_clk;
   input scan_rst;
   input test_mode;
   input SE;
   input [2:0] SI;
   output [2:0] SO;
   input test_si4;

   // Internal wires
   wire FE_OFN7_SE;
   wire FE_OFN2_REF_RST_M;
   wire FE_OFN1_REF_RST_M;
   wire FE_OFN0_UART_RST_M;
   wire N0;
   wire REF_CLK_M;
   wire UART_CLK_M;
   wire UART_TX_CLK_M;
   wire UART_TX_CLK;
   wire UART_RX_CLK_M;
   wire UART_RX_CLK;
   wire REF_RST_M;
   wire SYNC_REF_RST;
   wire UART_RST_M;
   wire SYNC_UART_RST;
   wire UART_RX_V_OUT;
   wire UART_RX_V_SYNC;
   wire RF_RdEn;
   wire RF_WrEn;
   wire RF_RdData_VLD;
   wire _0_net_;
   wire ALU_CLK;
   wire CLKG_EN;
   wire ALU_EN;
   wire ALU_OUT_VLD;
   wire FIFO_FULL;
   wire UART_TX_VLD;
   wire UART_TX_Busy_PULSE;
   wire FIFO_EMPTY;
   wire UART_TX_Busy;
   wire n2;
   wire n3;
   wire n6;
   wire n9;
   wire n10;
   wire n11;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire [7:0] UART_RX_OUT;
   wire [7:0] UART_RX_SYNC;
   wire [3:0] RF_Address;
   wire [7:0] RF_WrData;
   wire [7:0] RF_RdData;
   wire [7:0] Operand_A;
   wire [7:0] Operand_B;
   wire [7:0] UART_Config;
   wire [7:0] DIV_RATIO;
   wire [3:0] ALU_FUN;
   wire [15:0] ALU_OUT;
   wire [7:0] UART_TX_IN;
   wire [7:0] FIFO_RD_DATA;
   wire [7:0] DIV_RATIO_RX;
   wire SYNOPSYS_UNCONNECTED__0;
   wire SYNOPSYS_UNCONNECTED__1;
   wire SYNOPSYS_UNCONNECTED__2;
   wire SYNOPSYS_UNCONNECTED__3;

   assign N0 = test_mode ;

   BUFX4M FE_OFC7_SE (.Y(FE_OFN7_SE), 
	.A(SE));
   CLKBUFX8M FE_OFC2_REF_RST_M (.Y(FE_OFN2_REF_RST_M), 
	.A(REF_RST_M));
   BUFX4M FE_OFC1_REF_RST_M (.Y(FE_OFN1_REF_RST_M), 
	.A(REF_RST_M));
   BUFX5M FE_OFC0_UART_RST_M (.Y(FE_OFN0_UART_RST_M), 
	.A(UART_RST_M));
   MX2X6M U8 (.Y(UART_RST_M), 
	.S0(N0), 
	.B(scan_rst), 
	.A(SYNC_UART_RST));
   OR2X2M U9 (.Y(_0_net_), 
	.B(N0), 
	.A(CLKG_EN));
   MX2X2M U10 (.Y(UART_TX_CLK_M), 
	.S0(N0), 
	.B(scan_clk), 
	.A(UART_TX_CLK));
   MX2X2M U11 (.Y(UART_RX_CLK_M), 
	.S0(N0), 
	.B(scan_clk), 
	.A(UART_RX_CLK));
   MX2X2M U12 (.Y(UART_CLK_M), 
	.S0(N0), 
	.B(scan_clk), 
	.A(UART_CLK));
   MX2X8M U13 (.Y(REF_CLK_M), 
	.S0(N0), 
	.B(scan_clk), 
	.A(REF_CLK));
   MX2X8M U14 (.Y(REF_RST_M), 
	.S0(N0), 
	.B(scan_rst), 
	.A(SYNC_REF_RST));
   DLY1X4M U20 (.Y(n15), 
	.A(n16));
   INVXLM U21 (.Y(n16), 
	.A(n26));
   DLY1X4M U22 (.Y(n17), 
	.A(n22));
   DLY1X4M U23 (.Y(n18), 
	.A(n20));
   INVXLM U24 (.Y(n19), 
	.A(n27));
   INVXLM U25 (.Y(n20), 
	.A(n19));
   CLKINVX2M U26 (.Y(n21), 
	.A(n19));
   INVXLM U27 (.Y(n22), 
	.A(n19));
   INVXLM U28 (.Y(n23), 
	.A(n28));
   CLKINVX2M U29 (.Y(n24), 
	.A(n23));
   INVX2M U30 (.Y(n25), 
	.A(n23));
   INVXLM U31 (.Y(n26), 
	.A(FE_OFN7_SE));
   INVXLM U32 (.Y(n27), 
	.A(n26));
   INVXLM U33 (.Y(n28), 
	.A(n26));
   RST_SYNC_0 u_RST_SYNC_REF (.RST(RST_N), 
	.CLK(REF_CLK_M), 
	.SYNC_RST(SYNC_REF_RST));
   RST_SYNC_1 u_RST_SYNC_UART (.RST(RST_N), 
	.CLK(UART_CLK_M), 
	.SYNC_RST(SYNC_UART_RST));
   Data_sync_BUS_WIDTH8_NUM_STAGES2_test_1 u_Data_sync (.Unsync_bus({ UART_RX_OUT[7],
		UART_RX_OUT[6],
		UART_RX_OUT[5],
		UART_RX_OUT[4],
		UART_RX_OUT[3],
		UART_RX_OUT[2],
		UART_RX_OUT[1],
		UART_RX_OUT[0] }), 
	.bus_enable(UART_RX_V_OUT), 
	.CLK(REF_CLK_M), 
	.RST(FE_OFN2_REF_RST_M), 
	.sync_bus({ UART_RX_SYNC[7],
		UART_RX_SYNC[6],
		UART_RX_SYNC[5],
		UART_RX_SYNC[4],
		UART_RX_SYNC[3],
		UART_RX_SYNC[2],
		UART_RX_SYNC[1],
		UART_RX_SYNC[0] }), 
	.enable_pulse(UART_RX_V_SYNC), 
	.test_si(n11), 
	.test_so(n10), 
	.test_se(n24));
   REG_FILE_ADDR_WIDTH4_DATA_WIDTH8_test_1 u_REG_FILE (.RD_EN(RF_RdEn), 
	.WR_EN(RF_WrEn), 
	.RST(REF_RST_M), 
	.CLK(REF_CLK_M), 
	.ADDRESS({ RF_Address[3],
		RF_Address[2],
		RF_Address[1],
		RF_Address[0] }), 
	.WR_DATA({ RF_WrData[7],
		RF_WrData[6],
		RF_WrData[5],
		RF_WrData[4],
		RF_WrData[3],
		RF_WrData[2],
		RF_WrData[1],
		RF_WrData[0] }), 
	.RD_DATA({ RF_RdData[7],
		RF_RdData[6],
		RF_RdData[5],
		RF_RdData[4],
		RF_RdData[3],
		RF_RdData[2],
		RF_RdData[1],
		RF_RdData[0] }), 
	.RdData_VLD(RF_RdData_VLD), 
	.REG0({ Operand_A[7],
		Operand_A[6],
		Operand_A[5],
		Operand_A[4],
		Operand_A[3],
		Operand_A[2],
		Operand_A[1],
		Operand_A[0] }), 
	.REG1({ Operand_B[7],
		Operand_B[6],
		Operand_B[5],
		Operand_B[4],
		Operand_B[3],
		Operand_B[2],
		Operand_B[1],
		Operand_B[0] }), 
	.REG2({ UART_Config[7],
		UART_Config[6],
		UART_Config[5],
		UART_Config[4],
		UART_Config[3],
		UART_Config[2],
		UART_Config[1],
		UART_Config[0] }), 
	.REG3({ DIV_RATIO[7],
		DIV_RATIO[6],
		DIV_RATIO[5],
		DIV_RATIO[4],
		DIV_RATIO[3],
		DIV_RATIO[2],
		DIV_RATIO[1],
		DIV_RATIO[0] }), 
	.test_si2(SI[0]), 
	.test_si1(n9), 
	.test_so1(SO[1]), 
	.test_se(FE_OFN7_SE), 
	.FE_OFN2_REF_RST_M(FE_OFN2_REF_RST_M));
   CLK_GATE u_CLK_GATE (.CLK_EN(_0_net_), 
	.CLK(REF_CLK_M), 
	.GATED_CLK(ALU_CLK));
   ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 u_ALU (.A({ Operand_A[7],
		Operand_A[6],
		Operand_A[5],
		Operand_A[4],
		Operand_A[3],
		Operand_A[2],
		Operand_A[1],
		Operand_A[0] }), 
	.B({ Operand_B[7],
		Operand_B[6],
		Operand_B[5],
		Operand_B[4],
		Operand_B[3],
		Operand_B[2],
		Operand_B[1],
		Operand_B[0] }), 
	.EN(ALU_EN), 
	.ALU_FUN({ ALU_FUN[3],
		ALU_FUN[2],
		ALU_FUN[1],
		ALU_FUN[0] }), 
	.CLK(ALU_CLK), 
	.RST(FE_OFN1_REF_RST_M), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.OUT_VALID(ALU_OUT_VLD), 
	.test_si(SI[2]), 
	.test_se(n17), 
	.FE_OFN2_REF_RST_M(FE_OFN2_REF_RST_M));
   SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_test_1 u_SYS_CTRL (.CLK(REF_CLK_M), 
	.RST(REF_RST_M), 
	.ALU_OUT({ ALU_OUT[15],
		ALU_OUT[14],
		ALU_OUT[13],
		ALU_OUT[12],
		ALU_OUT[11],
		ALU_OUT[10],
		ALU_OUT[9],
		ALU_OUT[8],
		ALU_OUT[7],
		ALU_OUT[6],
		ALU_OUT[5],
		ALU_OUT[4],
		ALU_OUT[3],
		ALU_OUT[2],
		ALU_OUT[1],
		ALU_OUT[0] }), 
	.OUT_Valid(ALU_OUT_VLD), 
	.RdData({ RF_RdData[7],
		RF_RdData[6],
		RF_RdData[5],
		RF_RdData[4],
		RF_RdData[3],
		RF_RdData[2],
		RF_RdData[1],
		RF_RdData[0] }), 
	.RdData_Valid(RF_RdData_VLD), 
	.RX_P_Data({ UART_RX_SYNC[7],
		UART_RX_SYNC[6],
		UART_RX_SYNC[5],
		UART_RX_SYNC[4],
		UART_RX_SYNC[3],
		UART_RX_SYNC[2],
		UART_RX_SYNC[1],
		UART_RX_SYNC[0] }), 
	.RX_D_VLD(UART_RX_V_SYNC), 
	.FIFO_FULL(FIFO_FULL), 
	.ALU_FUN({ ALU_FUN[3],
		ALU_FUN[2],
		ALU_FUN[1],
		ALU_FUN[0] }), 
	.EN(ALU_EN), 
	.CLK_EN(CLKG_EN), 
	.Address({ RF_Address[3],
		RF_Address[2],
		RF_Address[1],
		RF_Address[0] }), 
	.WrEN(RF_WrEn), 
	.RdEn(RF_RdEn), 
	.WrData({ RF_WrData[7],
		RF_WrData[6],
		RF_WrData[5],
		RF_WrData[4],
		RF_WrData[3],
		RF_WrData[2],
		RF_WrData[1],
		RF_WrData[0] }), 
	.TX_P_Data({ UART_TX_IN[7],
		UART_TX_IN[6],
		UART_TX_IN[5],
		UART_TX_IN[4],
		UART_TX_IN[3],
		UART_TX_IN[2],
		UART_TX_IN[1],
		UART_TX_IN[0] }), 
	.TX_D_VLD(UART_TX_VLD), 
	.test_si2(test_si4), 
	.test_si1(n6), 
	.test_so2(n3), 
	.test_so1(SO[0]), 
	.test_se(n15), 
	.FE_OFN1_REF_RST_M(FE_OFN1_REF_RST_M), 
	.FE_OFN2_REF_RST_M(FE_OFN2_REF_RST_M));
   ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_test_1 u_ASYNC_FIFO (.W_CLK(REF_CLK_M), 
	.W_RST(FE_OFN2_REF_RST_M), 
	.W_INC(UART_TX_VLD), 
	.WR_DATA({ UART_TX_IN[7],
		UART_TX_IN[6],
		UART_TX_IN[5],
		UART_TX_IN[4],
		UART_TX_IN[3],
		UART_TX_IN[2],
		UART_TX_IN[1],
		UART_TX_IN[0] }), 
	.FULL(FIFO_FULL), 
	.R_CLK(UART_TX_CLK_M), 
	.R_RST(UART_RST_M), 
	.R_INC(UART_TX_Busy_PULSE), 
	.RD_DATA({ FIFO_RD_DATA[7],
		FIFO_RD_DATA[6],
		FIFO_RD_DATA[5],
		FIFO_RD_DATA[4],
		FIFO_RD_DATA[3],
		FIFO_RD_DATA[2],
		FIFO_RD_DATA[1],
		FIFO_RD_DATA[0] }), 
	.EMPTY(FIFO_EMPTY), 
	.test_si2(SI[1]), 
	.test_si1(ALU_OUT_VLD), 
	.test_so2(n11), 
	.test_so1(SO[2]), 
	.test_se(FE_OFN7_SE), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M));
   CLKDIV_MUX_WIDTH8 u_CLKDIV_MUX (.IN({ UART_Config[7],
		UART_Config[6],
		UART_Config[5],
		UART_Config[4],
		UART_Config[3],
		UART_Config[2] }), 
	.OUT({ SYNOPSYS_UNCONNECTED__0,
		SYNOPSYS_UNCONNECTED__1,
		SYNOPSYS_UNCONNECTED__2,
		SYNOPSYS_UNCONNECTED__3,
		DIV_RATIO_RX[3],
		DIV_RATIO_RX[2],
		DIV_RATIO_RX[1],
		DIV_RATIO_RX[0] }));
   INT_CLK_DIV_test_1 u_TX_CLK_DIV (.REF_CLK(UART_CLK_M), 
	.RST(UART_RST_M), 
	.CLK_EN(1'b1), 
	.DIV_RATIO({ DIV_RATIO[7],
		DIV_RATIO[6],
		DIV_RATIO[5],
		DIV_RATIO[4],
		DIV_RATIO[3],
		DIV_RATIO[2],
		DIV_RATIO[1],
		DIV_RATIO[0] }), 
	.O_DIV_CLK(UART_TX_CLK), 
	.test_si(n3), 
	.test_so(n2), 
	.test_se(n25));
   INT_CLK_DIV_test_0 u_RX_CLK_DIV (.REF_CLK(UART_CLK_M), 
	.RST(UART_RST_M), 
	.CLK_EN(1'b1), 
	.DIV_RATIO({ 1'b0,
		1'b0,
		1'b0,
		1'b0,
		DIV_RATIO_RX[3],
		DIV_RATIO_RX[2],
		DIV_RATIO_RX[1],
		DIV_RATIO_RX[0] }), 
	.O_DIV_CLK(UART_RX_CLK), 
	.test_si(RF_RdData_VLD), 
	.test_so(n6), 
	.test_se(n21));
   PULSE_GEN_test_1 u_PULSE_GEN (.clk(UART_TX_CLK_M), 
	.rst(FE_OFN0_UART_RST_M), 
	.lvl_sig(UART_TX_Busy), 
	.pulse_sig(UART_TX_Busy_PULSE), 
	.test_si(n10), 
	.test_so(n9), 
	.test_se(n25));
   UART_TOP_DATA_WIDTH8_test_1 u_UART_TOP (.RX_CLK(UART_RX_CLK_M), 
	.TX_CLK(UART_TX_CLK_M), 
	.RST_N(UART_RST_M), 
	.RX_IN(UART_RX_IN), 
	.TX_OUT(UART_TX_O), 
	.PRESCALE({ UART_Config[7],
		UART_Config[6],
		UART_Config[5],
		UART_Config[4],
		UART_Config[3],
		UART_Config[2] }), 
	.PAR_EN(UART_Config[0]), 
	.PAR_TYP(UART_Config[1]), 
	.TX_P_DATA({ FIFO_RD_DATA[7],
		FIFO_RD_DATA[6],
		FIFO_RD_DATA[5],
		FIFO_RD_DATA[4],
		FIFO_RD_DATA[3],
		FIFO_RD_DATA[2],
		FIFO_RD_DATA[1],
		FIFO_RD_DATA[0] }), 
	.F_EMPTY(FIFO_EMPTY), 
	.RX_P_DATA({ UART_RX_OUT[7],
		UART_RX_OUT[6],
		UART_RX_OUT[5],
		UART_RX_OUT[4],
		UART_RX_OUT[3],
		UART_RX_OUT[2],
		UART_RX_OUT[1],
		UART_RX_OUT[0] }), 
	.RX_D_VLD(UART_RX_V_OUT), 
	.PAR_ERR(parity_error), 
	.STP_ERR(framing_error), 
	.TX_BUSY(UART_TX_Busy), 
	.test_si(n2), 
	.test_se(n18), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M));
endmodule

/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct  9 07:01:12 2026
/////////////////////////////////////////////////////////////
module RST_SYNC_0 (
	RST, 
	CLK, 
	SYNC_RST);
   input RST;
   input CLK;
   output SYNC_RST;

   // Internal wires
   wire LTIE_LTIELO_NET;
   wire [2:0] sync_reg;

   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M SYNC_RST_reg (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(SYNC_RST), 
	.D(sync_reg[0]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[2]), 
	.D(RST), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[1]), 
	.D(sync_reg[2]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[0]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[0]), 
	.D(sync_reg[1]), 
	.CK(CLK));
endmodule

module RST_SYNC_1 (
	RST, 
	CLK, 
	SYNC_RST);
   input RST;
   input CLK;
   output SYNC_RST;

   // Internal wires
   wire LTIE_LTIELO_NET;
   wire [2:0] sync_reg;

   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M SYNC_RST_reg (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(SYNC_RST), 
	.D(sync_reg[0]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[2]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[2]), 
	.D(RST), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[1]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[1]), 
	.D(sync_reg[2]), 
	.CK(CLK));
   SDFFRQX2M \sync_reg_reg[0]  (.SI(LTIE_LTIELO_NET), 
	.SE(LTIE_LTIELO_NET), 
	.RN(RST), 
	.Q(sync_reg[0]), 
	.D(sync_reg[1]), 
	.CK(CLK));
endmodule

module Data_sync_BUS_WIDTH8_NUM_STAGES2_test_1 (
	Unsync_bus, 
	bus_enable, 
	CLK, 
	RST, 
	sync_bus, 
	enable_pulse, 
	test_si, 
	test_so, 
	test_se);
   input [7:0] Unsync_bus;
   input bus_enable;
   input CLK;
   input RST;
   output [7:0] sync_bus;
   output enable_pulse;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire pulse_gen_ff;
   wire n1;
   wire n3;
   wire n5;
   wire n7;
   wire n9;
   wire n11;
   wire n13;
   wire n15;
   wire n17;
   wire n34;
   wire [1:0] sync_reg;

   assign test_so = sync_reg[1] ;

   SDFFRQX1M \sync_reg_reg[0]  (.SI(sync_bus[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_reg[0]), 
	.D(sync_reg[1]), 
	.CK(CLK));
   SDFFRQX1M pulse_gen_ff_reg (.SI(enable_pulse), 
	.SE(test_se), 
	.RN(RST), 
	.Q(pulse_gen_ff), 
	.D(sync_reg[0]), 
	.CK(CLK));
   SDFFRQX1M enable_pulse_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(enable_pulse), 
	.D(n34), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[7]  (.SI(sync_bus[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[7]), 
	.D(n17), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[6]  (.SI(sync_bus[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[6]), 
	.D(n15), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[5]  (.SI(sync_bus[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[5]), 
	.D(n13), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[4]  (.SI(sync_bus[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[4]), 
	.D(n11), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[3]  (.SI(sync_bus[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[3]), 
	.D(n9), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[2]  (.SI(sync_bus[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[2]), 
	.D(n7), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[1]  (.SI(sync_bus[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[1]), 
	.D(n5), 
	.CK(CLK));
   SDFFRQX1M \sync_bus_reg[0]  (.SI(pulse_gen_ff), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_bus[0]), 
	.D(n3), 
	.CK(CLK));
   SDFFRQX1M \sync_reg_reg[1]  (.SI(sync_reg[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sync_reg[1]), 
	.D(bus_enable), 
	.CK(CLK));
   INVX2M U27 (.Y(n34), 
	.A(n1));
   NAND2BX2M U28 (.Y(n1), 
	.B(sync_reg[0]), 
	.AN(pulse_gen_ff));
   AO22X1M U29 (.Y(n3), 
	.B1(n1), 
	.B0(sync_bus[0]), 
	.A1(n34), 
	.A0(Unsync_bus[0]));
   AO22X1M U30 (.Y(n5), 
	.B1(n1), 
	.B0(sync_bus[1]), 
	.A1(n34), 
	.A0(Unsync_bus[1]));
   AO22X1M U31 (.Y(n7), 
	.B1(n1), 
	.B0(sync_bus[2]), 
	.A1(n34), 
	.A0(Unsync_bus[2]));
   AO22X1M U32 (.Y(n9), 
	.B1(n1), 
	.B0(sync_bus[3]), 
	.A1(n34), 
	.A0(Unsync_bus[3]));
   AO22X1M U33 (.Y(n11), 
	.B1(n1), 
	.B0(sync_bus[4]), 
	.A1(n34), 
	.A0(Unsync_bus[4]));
   AO22X1M U34 (.Y(n13), 
	.B1(n1), 
	.B0(sync_bus[5]), 
	.A1(n34), 
	.A0(Unsync_bus[5]));
   AO22X1M U35 (.Y(n15), 
	.B1(n1), 
	.B0(sync_bus[6]), 
	.A1(n34), 
	.A0(Unsync_bus[6]));
   AO22X1M U36 (.Y(n17), 
	.B1(n1), 
	.B0(sync_bus[7]), 
	.A1(n34), 
	.A0(Unsync_bus[7]));
endmodule

module REG_FILE_ADDR_WIDTH4_DATA_WIDTH8_test_1 (
	RD_EN, 
	WR_EN, 
	RST, 
	CLK, 
	ADDRESS, 
	WR_DATA, 
	RD_DATA, 
	RdData_VLD, 
	REG0, 
	REG1, 
	REG2, 
	REG3, 
	test_si2, 
	test_si1, 
	test_so1, 
	test_se, 
	FE_OFN2_REF_RST_M);
   input RD_EN;
   input WR_EN;
   input RST;
   input CLK;
   input [3:0] ADDRESS;
   input [7:0] WR_DATA;
   output [7:0] RD_DATA;
   output RdData_VLD;
   output [7:0] REG0;
   output [7:0] REG1;
   output [7:0] REG2;
   output [7:0] REG3;
   input test_si2;
   input test_si1;
   output test_so1;
   input test_se;
   input FE_OFN2_REF_RST_M;

   // Internal wires
   wire FE_OFN3_REF_RST_M;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire \RF[15][7] ;
   wire \RF[15][6] ;
   wire \RF[15][5] ;
   wire \RF[15][4] ;
   wire \RF[15][3] ;
   wire \RF[15][2] ;
   wire \RF[15][1] ;
   wire \RF[15][0] ;
   wire \RF[14][7] ;
   wire \RF[14][6] ;
   wire \RF[14][5] ;
   wire \RF[14][4] ;
   wire \RF[14][3] ;
   wire \RF[14][2] ;
   wire \RF[14][1] ;
   wire \RF[14][0] ;
   wire \RF[13][7] ;
   wire \RF[13][6] ;
   wire \RF[13][5] ;
   wire \RF[13][4] ;
   wire \RF[13][3] ;
   wire \RF[13][2] ;
   wire \RF[13][1] ;
   wire \RF[13][0] ;
   wire \RF[12][7] ;
   wire \RF[12][6] ;
   wire \RF[12][5] ;
   wire \RF[12][4] ;
   wire \RF[12][3] ;
   wire \RF[12][2] ;
   wire \RF[12][1] ;
   wire \RF[12][0] ;
   wire \RF[11][7] ;
   wire \RF[11][6] ;
   wire \RF[11][5] ;
   wire \RF[11][4] ;
   wire \RF[11][3] ;
   wire \RF[11][2] ;
   wire \RF[11][1] ;
   wire \RF[11][0] ;
   wire \RF[10][7] ;
   wire \RF[10][6] ;
   wire \RF[10][5] ;
   wire \RF[10][4] ;
   wire \RF[10][3] ;
   wire \RF[10][2] ;
   wire \RF[10][1] ;
   wire \RF[10][0] ;
   wire \RF[9][7] ;
   wire \RF[9][6] ;
   wire \RF[9][5] ;
   wire \RF[9][4] ;
   wire \RF[9][3] ;
   wire \RF[9][2] ;
   wire \RF[9][1] ;
   wire \RF[9][0] ;
   wire \RF[8][7] ;
   wire \RF[8][6] ;
   wire \RF[8][5] ;
   wire \RF[8][4] ;
   wire \RF[8][3] ;
   wire \RF[8][2] ;
   wire \RF[8][1] ;
   wire \RF[8][0] ;
   wire \RF[7][7] ;
   wire \RF[7][6] ;
   wire \RF[7][5] ;
   wire \RF[7][4] ;
   wire \RF[7][3] ;
   wire \RF[7][2] ;
   wire \RF[7][1] ;
   wire \RF[7][0] ;
   wire \RF[6][7] ;
   wire \RF[6][6] ;
   wire \RF[6][5] ;
   wire \RF[6][4] ;
   wire \RF[6][3] ;
   wire \RF[6][2] ;
   wire \RF[6][1] ;
   wire \RF[6][0] ;
   wire \RF[5][7] ;
   wire \RF[5][6] ;
   wire \RF[5][5] ;
   wire \RF[5][4] ;
   wire \RF[5][3] ;
   wire \RF[5][2] ;
   wire \RF[5][1] ;
   wire \RF[5][0] ;
   wire \RF[4][7] ;
   wire \RF[4][6] ;
   wire \RF[4][5] ;
   wire \RF[4][4] ;
   wire \RF[4][3] ;
   wire \RF[4][2] ;
   wire \RF[4][1] ;
   wire \RF[4][0] ;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n178;
   wire n179;
   wire n180;
   wire n181;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n192;
   wire n193;
   wire n194;
   wire n195;
   wire n196;
   wire n197;
   wire n198;
   wire n199;
   wire n200;
   wire n201;
   wire n202;
   wire n203;
   wire n204;
   wire n205;
   wire n206;
   wire n207;
   wire n208;
   wire n209;
   wire n210;
   wire n211;
   wire n212;
   wire n213;
   wire n214;
   wire n215;
   wire n216;
   wire n217;
   wire n218;
   wire n219;
   wire n220;
   wire n221;
   wire n222;
   wire n223;
   wire n224;
   wire n225;
   wire n226;
   wire n227;
   wire n228;
   wire n229;
   wire n230;
   wire n231;
   wire n232;
   wire n233;
   wire n234;
   wire n235;
   wire n236;
   wire n237;
   wire n238;
   wire n239;
   wire n240;
   wire n241;
   wire n242;
   wire n243;
   wire n244;
   wire n245;
   wire n246;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n287;
   wire n288;
   wire n289;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;
   wire n295;
   wire n296;
   wire n297;
   wire n298;
   wire n299;
   wire n300;
   wire n301;
   wire n302;
   wire n303;
   wire n304;
   wire n305;
   wire n306;
   wire n307;
   wire n308;
   wire n309;
   wire n310;
   wire n311;
   wire n312;
   wire n313;
   wire n314;
   wire n437;
   wire n438;
   wire n439;
   wire n440;
   wire n441;
   wire n442;
   wire n443;
   wire n444;
   wire n445;
   wire n446;
   wire n447;
   wire n448;
   wire n449;
   wire n450;
   wire n451;
   wire n452;
   wire n453;
   wire n454;
   wire n455;
   wire n456;
   wire n457;
   wire n458;
   wire n459;
   wire n460;
   wire n461;
   wire n462;
   wire n463;
   wire n464;
   wire n465;
   wire n466;
   wire n467;
   wire n468;
   wire n469;
   wire n470;
   wire n471;
   wire n472;
   wire n473;
   wire n474;
   wire n475;
   wire n476;
   wire n477;
   wire n478;
   wire n479;
   wire n480;
   wire n481;
   wire n482;
   wire n483;
   wire n484;
   wire n485;
   wire n486;
   wire n487;
   wire n488;
   wire n489;
   wire n490;
   wire n491;
   wire n492;
   wire n493;
   wire n494;
   wire n495;
   wire n496;
   wire n497;
   wire n498;
   wire n499;
   wire n500;
   wire n501;
   wire n502;
   wire n503;
   wire n504;
   wire n505;
   wire n506;
   wire n507;
   wire n508;
   wire n509;
   wire n510;
   wire n511;
   wire n512;
   wire n513;
   wire n514;
   wire n515;
   wire n516;
   wire n517;
   wire n518;
   wire n519;
   wire n520;
   wire n521;
   wire n522;
   wire n523;
   wire n524;
   wire n525;
   wire n526;
   wire n527;
   wire n528;
   wire n529;
   wire n530;
   wire n531;
   wire n532;
   wire n533;
   wire n534;
   wire n535;
   wire n536;
   wire n537;
   wire n538;
   wire n539;
   wire n540;
   wire n541;
   wire n542;
   wire n543;
   wire n545;
   wire n546;
   wire n547;
   wire n549;
   wire n550;
   wire n551;
   wire n552;
   wire n553;
   wire n554;
   wire n555;
   wire n556;
   wire n557;
   wire n558;
   wire n559;
   wire n560;
   wire n566;
   wire n567;
   wire n568;
   wire n569;
   wire n1;

   assign N10 = ADDRESS[0] ;
   assign N11 = ADDRESS[1] ;
   assign N12 = ADDRESS[2] ;
   assign N13 = ADDRESS[3] ;

   CLKBUFX8M FE_OFC3_REF_RST_M (.Y(FE_OFN3_REF_RST_M), 
	.A(FE_OFN2_REF_RST_M));
   SDFFSQX1M \RF_reg[2][0]  (.SN(FE_OFN2_REF_RST_M), 
	.SI(REG1[7]), 
	.SE(test_se), 
	.Q(REG2[0]), 
	.D(n195), 
	.CK(CLK));
   SDFFSQX1M \RF_reg[3][5]  (.SN(RST), 
	.SI(REG3[4]), 
	.SE(n569), 
	.Q(REG3[5]), 
	.D(n208), 
	.CK(CLK));
   SDFFSQX1M \RF_reg[2][7]  (.SN(RST), 
	.SI(REG2[6]), 
	.SE(n568), 
	.Q(REG2[7]), 
	.D(n202), 
	.CK(CLK));
   SDFFRQX1M RdData_VLD_reg (.SI(\RF[15][7] ), 
	.SE(n567), 
	.RN(RST), 
	.Q(RdData_VLD), 
	.D(n178), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][7]  (.SI(REG1[6]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG1[7]), 
	.D(n194), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][6]  (.SI(REG1[5]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG1[6]), 
	.D(n193), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][5]  (.SI(REG1[4]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG1[5]), 
	.D(n192), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][4]  (.SI(REG1[3]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG1[4]), 
	.D(n191), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][3]  (.SI(REG1[2]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG1[3]), 
	.D(n190), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][2]  (.SI(REG1[1]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG1[2]), 
	.D(n189), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][1]  (.SI(REG1[0]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG1[1]), 
	.D(n188), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[1][0]  (.SI(REG0[7]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG1[0]), 
	.D(n187), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][7]  (.SI(\RF[7][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][7] ), 
	.D(n242), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][6]  (.SI(\RF[7][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][6] ), 
	.D(n241), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][5]  (.SI(\RF[7][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][5] ), 
	.D(n240), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][4]  (.SI(\RF[7][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][4] ), 
	.D(n239), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][3]  (.SI(test_si2), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][3] ), 
	.D(n238), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][1]  (.SI(\RF[7][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][1] ), 
	.D(n236), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[7][0]  (.SI(\RF[6][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][0] ), 
	.D(n235), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][7]  (.SI(\RF[5][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][7] ), 
	.D(n226), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][6]  (.SI(\RF[5][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][6] ), 
	.D(n225), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][5]  (.SI(\RF[5][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][5] ), 
	.D(n224), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][4]  (.SI(\RF[5][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][4] ), 
	.D(n223), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][3]  (.SI(\RF[5][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][3] ), 
	.D(n222), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][2]  (.SI(\RF[5][1] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[5][2] ), 
	.D(n221), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][1]  (.SI(\RF[5][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][1] ), 
	.D(n220), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[5][0]  (.SI(\RF[4][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[5][0] ), 
	.D(n219), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][7]  (.SI(\RF[14][6] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[14][7] ), 
	.D(n298), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][6]  (.SI(\RF[14][5] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[14][6] ), 
	.D(n297), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][5]  (.SI(\RF[14][4] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[14][5] ), 
	.D(n296), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][4]  (.SI(\RF[14][3] ), 
	.SE(n567), 
	.RN(RST), 
	.Q(\RF[14][4] ), 
	.D(n295), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][3]  (.SI(\RF[14][2] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[14][3] ), 
	.D(n294), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][2]  (.SI(\RF[14][1] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[14][2] ), 
	.D(n293), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][1]  (.SI(\RF[14][0] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[14][1] ), 
	.D(n292), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[14][0]  (.SI(\RF[13][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[14][0] ), 
	.D(n291), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][7]  (.SI(\RF[12][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][7] ), 
	.D(n282), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][6]  (.SI(\RF[12][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][6] ), 
	.D(n281), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][5]  (.SI(\RF[12][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][5] ), 
	.D(n280), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][4]  (.SI(\RF[12][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][4] ), 
	.D(n279), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][3]  (.SI(\RF[12][2] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[12][3] ), 
	.D(n278), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][2]  (.SI(\RF[12][1] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[12][2] ), 
	.D(n277), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][1]  (.SI(\RF[12][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][1] ), 
	.D(n276), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[12][0]  (.SI(\RF[11][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[12][0] ), 
	.D(n275), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][7]  (.SI(\RF[6][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][7] ), 
	.D(n234), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][6]  (.SI(\RF[6][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][6] ), 
	.D(n233), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][5]  (.SI(\RF[6][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][5] ), 
	.D(n232), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][4]  (.SI(\RF[6][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][4] ), 
	.D(n231), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][3]  (.SI(\RF[6][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][3] ), 
	.D(n230), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][2]  (.SI(\RF[6][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][2] ), 
	.D(n229), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][1]  (.SI(\RF[6][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][1] ), 
	.D(n228), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[6][0]  (.SI(\RF[5][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[6][0] ), 
	.D(n227), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][7]  (.SI(\RF[4][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[4][7] ), 
	.D(n218), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][6]  (.SI(\RF[4][5] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[4][6] ), 
	.D(n217), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][5]  (.SI(\RF[4][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[4][5] ), 
	.D(n216), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][4]  (.SI(\RF[4][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[4][4] ), 
	.D(n215), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][3]  (.SI(\RF[4][2] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[4][3] ), 
	.D(n214), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][2]  (.SI(\RF[4][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[4][2] ), 
	.D(n213), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][1]  (.SI(\RF[4][0] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[4][1] ), 
	.D(n212), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[4][0]  (.SI(REG3[7]), 
	.SE(n567), 
	.RN(RST), 
	.Q(\RF[4][0] ), 
	.D(n211), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][7]  (.SI(\RF[15][6] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[15][7] ), 
	.D(n306), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][6]  (.SI(\RF[15][5] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[15][6] ), 
	.D(n305), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][5]  (.SI(\RF[15][4] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[15][5] ), 
	.D(n304), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][4]  (.SI(\RF[15][3] ), 
	.SE(n567), 
	.RN(RST), 
	.Q(\RF[15][4] ), 
	.D(n303), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][3]  (.SI(\RF[15][2] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[15][3] ), 
	.D(n302), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][2]  (.SI(\RF[15][1] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[15][2] ), 
	.D(n301), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][1]  (.SI(\RF[15][0] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[15][1] ), 
	.D(n300), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[15][0]  (.SI(\RF[14][7] ), 
	.SE(n567), 
	.RN(RST), 
	.Q(\RF[15][0] ), 
	.D(n299), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][7]  (.SI(\RF[13][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[13][7] ), 
	.D(n290), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][6]  (.SI(\RF[13][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[13][6] ), 
	.D(n289), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][5]  (.SI(\RF[13][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[13][5] ), 
	.D(n288), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][4]  (.SI(\RF[13][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[13][4] ), 
	.D(n287), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][3]  (.SI(\RF[13][2] ), 
	.SE(n566), 
	.RN(RST), 
	.Q(\RF[13][3] ), 
	.D(n286), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][2]  (.SI(\RF[13][1] ), 
	.SE(n569), 
	.RN(RST), 
	.Q(\RF[13][2] ), 
	.D(n285), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][1]  (.SI(\RF[13][0] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[13][1] ), 
	.D(n284), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[13][0]  (.SI(\RF[12][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[13][0] ), 
	.D(n283), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][7]  (.SI(\RF[8][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][7] ), 
	.D(n250), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][6]  (.SI(\RF[8][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][6] ), 
	.D(n249), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][5]  (.SI(\RF[8][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][5] ), 
	.D(n248), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][4]  (.SI(\RF[8][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][4] ), 
	.D(n247), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][3]  (.SI(\RF[8][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][3] ), 
	.D(n246), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][2]  (.SI(\RF[8][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][2] ), 
	.D(n245), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][1]  (.SI(\RF[8][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][1] ), 
	.D(n244), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[8][0]  (.SI(\RF[7][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[8][0] ), 
	.D(n243), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][7]  (.SI(\RF[9][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][7] ), 
	.D(n258), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][6]  (.SI(\RF[9][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][6] ), 
	.D(n257), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][5]  (.SI(\RF[9][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][5] ), 
	.D(n256), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][4]  (.SI(\RF[9][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][4] ), 
	.D(n255), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][3]  (.SI(\RF[9][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][3] ), 
	.D(n254), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][2]  (.SI(\RF[9][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][2] ), 
	.D(n253), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][1]  (.SI(\RF[9][0] ), 
	.SE(n568), 
	.RN(RST), 
	.Q(\RF[9][1] ), 
	.D(n252), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[9][0]  (.SI(\RF[8][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[9][0] ), 
	.D(n251), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][7]  (.SI(\RF[11][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][7] ), 
	.D(n274), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][6]  (.SI(\RF[11][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][6] ), 
	.D(n273), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][5]  (.SI(\RF[11][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][5] ), 
	.D(n272), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][4]  (.SI(\RF[11][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][4] ), 
	.D(n271), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][3]  (.SI(\RF[11][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][3] ), 
	.D(n270), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][2]  (.SI(\RF[11][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][2] ), 
	.D(n269), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][1]  (.SI(\RF[11][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][1] ), 
	.D(n268), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[11][0]  (.SI(\RF[10][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[11][0] ), 
	.D(n267), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][7]  (.SI(\RF[10][6] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][7] ), 
	.D(n266), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][6]  (.SI(\RF[10][5] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][6] ), 
	.D(n265), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][5]  (.SI(\RF[10][4] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][5] ), 
	.D(n264), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][4]  (.SI(\RF[10][3] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][4] ), 
	.D(n263), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][3]  (.SI(\RF[10][2] ), 
	.SE(n566), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][3] ), 
	.D(n262), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][2]  (.SI(\RF[10][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][2] ), 
	.D(n261), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][1]  (.SI(\RF[10][0] ), 
	.SE(n568), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][1] ), 
	.D(n260), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[10][0]  (.SI(\RF[9][7] ), 
	.SE(n567), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[10][0] ), 
	.D(n259), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][7]  (.SI(REG0[6]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG0[7]), 
	.D(n186), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][6]  (.SI(REG0[5]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG0[6]), 
	.D(n185), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][5]  (.SI(REG0[4]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG0[5]), 
	.D(n184), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][4]  (.SI(REG0[3]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG0[4]), 
	.D(n183), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][3]  (.SI(REG0[2]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG0[3]), 
	.D(n182), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][2]  (.SI(REG0[1]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG0[2]), 
	.D(n181), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][1]  (.SI(REG0[0]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG0[1]), 
	.D(n180), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[0][0]  (.SI(RD_DATA[7]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG0[0]), 
	.D(n179), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][7]  (.SI(REG3[6]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG3[7]), 
	.D(n210), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][6]  (.SI(REG3[5]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG3[6]), 
	.D(n209), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][4]  (.SI(REG3[3]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG3[4]), 
	.D(n207), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][3]  (.SI(REG3[2]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG3[3]), 
	.D(n206), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][2]  (.SI(REG3[1]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG3[2]), 
	.D(n205), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][1]  (.SI(REG3[0]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG3[1]), 
	.D(n204), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[3][0]  (.SI(REG2[7]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG3[0]), 
	.D(n203), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][6]  (.SI(REG2[5]), 
	.SE(n567), 
	.RN(RST), 
	.Q(REG2[6]), 
	.D(n201), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][4]  (.SI(REG2[3]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG2[4]), 
	.D(n199), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][3]  (.SI(REG2[2]), 
	.SE(n569), 
	.RN(RST), 
	.Q(REG2[3]), 
	.D(n198), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][2]  (.SI(REG2[1]), 
	.SE(n568), 
	.RN(RST), 
	.Q(REG2[2]), 
	.D(n197), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][1]  (.SI(REG2[0]), 
	.SE(n567), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(REG2[1]), 
	.D(n196), 
	.CK(CLK));
   SDFFRQX1M \RF_reg[2][5]  (.SI(REG2[4]), 
	.SE(n566), 
	.RN(RST), 
	.Q(REG2[5]), 
	.D(n200), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[7]  (.SI(RD_DATA[6]), 
	.SE(n569), 
	.RN(RST), 
	.Q(RD_DATA[7]), 
	.D(n314), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[6]  (.SI(RD_DATA[5]), 
	.SE(n568), 
	.RN(RST), 
	.Q(RD_DATA[6]), 
	.D(n313), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[2]  (.SI(RD_DATA[1]), 
	.SE(n567), 
	.RN(RST), 
	.Q(RD_DATA[2]), 
	.D(n309), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[1]  (.SI(RD_DATA[0]), 
	.SE(n566), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(RD_DATA[1]), 
	.D(n308), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[0]  (.SI(test_si1), 
	.SE(n569), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(RD_DATA[0]), 
	.D(n307), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[5]  (.SI(RD_DATA[4]), 
	.SE(n568), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(RD_DATA[5]), 
	.D(n312), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[4]  (.SI(RD_DATA[3]), 
	.SE(n567), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(RD_DATA[4]), 
	.D(n311), 
	.CK(CLK));
   SDFFRQX1M \RD_DATA_reg[3]  (.SI(RD_DATA[2]), 
	.SE(n566), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(RD_DATA[3]), 
	.D(n310), 
	.CK(CLK));
   NOR2X2M U274 (.Y(n157), 
	.B(N12), 
	.A(n560));
   NOR2X2M U275 (.Y(n152), 
	.B(N12), 
	.A(N11));
   INVX2M U276 (.Y(n545), 
	.A(n437));
   INVX2M U278 (.Y(n549), 
	.A(n438));
   OR2X2M U279 (.Y(n437), 
	.B(n543), 
	.A(n560));
   INVX2M U281 (.Y(n546), 
	.A(n439));
   INVX2M U282 (.Y(n547), 
	.A(n440));
   NAND2X2M U283 (.Y(n154), 
	.B(n152), 
	.A(n155));
   NAND2X2M U284 (.Y(n156), 
	.B(n153), 
	.A(n157));
   NAND2X2M U285 (.Y(n158), 
	.B(n155), 
	.A(n157));
   NAND2X2M U286 (.Y(n159), 
	.B(n153), 
	.A(n160));
   NAND2X2M U287 (.Y(n161), 
	.B(n155), 
	.A(n160));
   NAND2X2M U288 (.Y(n162), 
	.B(n153), 
	.A(n163));
   NAND2X2M U289 (.Y(n165), 
	.B(n155), 
	.A(n163));
   NAND2X2M U290 (.Y(n166), 
	.B(n152), 
	.A(n167));
   NAND2X2M U291 (.Y(n168), 
	.B(n152), 
	.A(n169));
   NAND2X2M U292 (.Y(n170), 
	.B(n157), 
	.A(n167));
   NAND2X2M U293 (.Y(n171), 
	.B(n157), 
	.A(n169));
   NAND2X2M U294 (.Y(n172), 
	.B(n160), 
	.A(n167));
   NAND2X2M U295 (.Y(n173), 
	.B(n160), 
	.A(n169));
   NAND2X2M U296 (.Y(n174), 
	.B(n163), 
	.A(n167));
   NAND2X2M U297 (.Y(n176), 
	.B(n163), 
	.A(n169));
   NAND2X2M U298 (.Y(n151), 
	.B(n153), 
	.A(n152));
   AND2X2M U299 (.Y(n153), 
	.B(n543), 
	.A(n164));
   AND2X2M U300 (.Y(n167), 
	.B(n543), 
	.A(n175));
   INVX2M U301 (.Y(n558), 
	.A(n177));
   OR2X2M U302 (.Y(n438), 
	.B(N11), 
	.A(N10));
   OR2X2M U303 (.Y(n439), 
	.B(N10), 
	.A(n560));
   OR2X2M U304 (.Y(n440), 
	.B(N11), 
	.A(n543));
   INVX2M U305 (.Y(n543), 
	.A(N10));
   INVX2M U306 (.Y(n542), 
	.A(N12));
   INVX2M U307 (.Y(n541), 
	.A(N13));
   NAND2X2M U308 (.Y(n177), 
	.B(n559), 
	.A(RD_EN));
   NOR2X2M U309 (.Y(n150), 
	.B(RD_EN), 
	.A(n559));
   AND2X2M U310 (.Y(n155), 
	.B(N10), 
	.A(n164));
   AND2X2M U311 (.Y(n169), 
	.B(N10), 
	.A(n175));
   AND2X2M U312 (.Y(n160), 
	.B(n560), 
	.A(N12));
   AND2X2M U313 (.Y(n163), 
	.B(N11), 
	.A(N12));
   NOR2BX2M U314 (.Y(n164), 
	.B(N13), 
	.AN(n150));
   INVX2M U315 (.Y(n560), 
	.A(N11));
   AND2X2M U316 (.Y(n175), 
	.B(n150), 
	.A(N13));
   INVX2M U317 (.Y(n550), 
	.A(WR_DATA[0]));
   INVX2M U318 (.Y(n551), 
	.A(WR_DATA[1]));
   INVX2M U319 (.Y(n552), 
	.A(WR_DATA[2]));
   INVX2M U320 (.Y(n553), 
	.A(WR_DATA[3]));
   INVX2M U321 (.Y(n554), 
	.A(WR_DATA[4]));
   INVX2M U322 (.Y(n555), 
	.A(WR_DATA[5]));
   INVX2M U323 (.Y(n556), 
	.A(WR_DATA[6]));
   INVX2M U324 (.Y(n557), 
	.A(WR_DATA[7]));
   INVX2M U325 (.Y(n559), 
	.A(WR_EN));
   AO22X1M U326 (.Y(n307), 
	.B1(n177), 
	.B0(RD_DATA[0]), 
	.A1(n558), 
	.A0(N26));
   AO22X1M U327 (.Y(n308), 
	.B1(n177), 
	.B0(RD_DATA[1]), 
	.A1(n558), 
	.A0(N25));
   AO22X1M U328 (.Y(n309), 
	.B1(n177), 
	.B0(RD_DATA[2]), 
	.A1(n558), 
	.A0(N24));
   AO22X1M U329 (.Y(n310), 
	.B1(n177), 
	.B0(RD_DATA[3]), 
	.A1(n558), 
	.A0(N23));
   AO22X1M U330 (.Y(n311), 
	.B1(n177), 
	.B0(RD_DATA[4]), 
	.A1(n558), 
	.A0(N22));
   AO22X1M U331 (.Y(n312), 
	.B1(n177), 
	.B0(RD_DATA[5]), 
	.A1(n558), 
	.A0(N21));
   AO22X1M U332 (.Y(n313), 
	.B1(n177), 
	.B0(RD_DATA[6]), 
	.A1(n558), 
	.A0(N20));
   AO22X1M U333 (.Y(n314), 
	.B1(n177), 
	.B0(RD_DATA[7]), 
	.A1(n558), 
	.A0(N19));
   OAI2BB2X1M U334 (.Y(n179), 
	.B1(n550), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[0]));
   OAI2BB2X1M U335 (.Y(n180), 
	.B1(n551), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[1]));
   OAI2BB2X1M U336 (.Y(n181), 
	.B1(n552), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[2]));
   OAI2BB2X1M U337 (.Y(n182), 
	.B1(n553), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[3]));
   OAI2BB2X1M U338 (.Y(n183), 
	.B1(n554), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[4]));
   OAI2BB2X1M U339 (.Y(n184), 
	.B1(n555), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[5]));
   OAI2BB2X1M U340 (.Y(n185), 
	.B1(n556), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[6]));
   OAI2BB2X1M U341 (.Y(n186), 
	.B1(n557), 
	.B0(n151), 
	.A1N(n151), 
	.A0N(REG0[7]));
   OAI2BB2X1M U342 (.Y(n196), 
	.B1(n156), 
	.B0(n551), 
	.A1N(n156), 
	.A0N(REG2[1]));
   OAI2BB2X1M U343 (.Y(n197), 
	.B1(n156), 
	.B0(n552), 
	.A1N(n156), 
	.A0N(REG2[2]));
   OAI2BB2X1M U344 (.Y(n198), 
	.B1(n156), 
	.B0(n553), 
	.A1N(n156), 
	.A0N(REG2[3]));
   OAI2BB2X1M U345 (.Y(n199), 
	.B1(n156), 
	.B0(n554), 
	.A1N(n156), 
	.A0N(REG2[4]));
   OAI2BB2X1M U346 (.Y(n200), 
	.B1(n156), 
	.B0(n555), 
	.A1N(n156), 
	.A0N(REG2[5]));
   OAI2BB2X1M U347 (.Y(n201), 
	.B1(n156), 
	.B0(n556), 
	.A1N(n156), 
	.A0N(REG2[6]));
   OAI2BB2X1M U348 (.Y(n203), 
	.B1(n158), 
	.B0(n550), 
	.A1N(n158), 
	.A0N(REG3[0]));
   OAI2BB2X1M U349 (.Y(n204), 
	.B1(n158), 
	.B0(n551), 
	.A1N(n158), 
	.A0N(REG3[1]));
   OAI2BB2X1M U350 (.Y(n205), 
	.B1(n158), 
	.B0(n552), 
	.A1N(n158), 
	.A0N(REG3[2]));
   OAI2BB2X1M U351 (.Y(n206), 
	.B1(n158), 
	.B0(n553), 
	.A1N(n158), 
	.A0N(REG3[3]));
   OAI2BB2X1M U352 (.Y(n207), 
	.B1(n158), 
	.B0(n554), 
	.A1N(n158), 
	.A0N(REG3[4]));
   OAI2BB2X1M U353 (.Y(n209), 
	.B1(n158), 
	.B0(n556), 
	.A1N(n158), 
	.A0N(REG3[6]));
   OAI2BB2X1M U354 (.Y(n210), 
	.B1(n158), 
	.B0(n557), 
	.A1N(n158), 
	.A0N(REG3[7]));
   OAI2BB2X1M U355 (.Y(n187), 
	.B1(n154), 
	.B0(n550), 
	.A1N(n154), 
	.A0N(REG1[0]));
   OAI2BB2X1M U356 (.Y(n188), 
	.B1(n154), 
	.B0(n551), 
	.A1N(n154), 
	.A0N(REG1[1]));
   OAI2BB2X1M U357 (.Y(n189), 
	.B1(n154), 
	.B0(n552), 
	.A1N(n154), 
	.A0N(REG1[2]));
   OAI2BB2X1M U358 (.Y(n190), 
	.B1(n154), 
	.B0(n553), 
	.A1N(n154), 
	.A0N(REG1[3]));
   OAI2BB2X1M U359 (.Y(n191), 
	.B1(n154), 
	.B0(n554), 
	.A1N(n154), 
	.A0N(REG1[4]));
   OAI2BB2X1M U360 (.Y(n192), 
	.B1(n154), 
	.B0(n555), 
	.A1N(n154), 
	.A0N(REG1[5]));
   OAI2BB2X1M U361 (.Y(n193), 
	.B1(n154), 
	.B0(n556), 
	.A1N(n154), 
	.A0N(REG1[6]));
   OAI2BB2X1M U362 (.Y(n194), 
	.B1(n154), 
	.B0(n557), 
	.A1N(n154), 
	.A0N(REG1[7]));
   OAI2BB2X1M U363 (.Y(n243), 
	.B1(n166), 
	.B0(n550), 
	.A1N(n166), 
	.A0N(\RF[8][0] ));
   OAI2BB2X1M U364 (.Y(n244), 
	.B1(n166), 
	.B0(n551), 
	.A1N(n166), 
	.A0N(\RF[8][1] ));
   OAI2BB2X1M U365 (.Y(n245), 
	.B1(n166), 
	.B0(n552), 
	.A1N(n166), 
	.A0N(\RF[8][2] ));
   OAI2BB2X1M U366 (.Y(n246), 
	.B1(n166), 
	.B0(n553), 
	.A1N(n166), 
	.A0N(\RF[8][3] ));
   OAI2BB2X1M U367 (.Y(n247), 
	.B1(n166), 
	.B0(n554), 
	.A1N(n166), 
	.A0N(\RF[8][4] ));
   OAI2BB2X1M U368 (.Y(n248), 
	.B1(n166), 
	.B0(n555), 
	.A1N(n166), 
	.A0N(\RF[8][5] ));
   OAI2BB2X1M U369 (.Y(n249), 
	.B1(n166), 
	.B0(n556), 
	.A1N(n166), 
	.A0N(\RF[8][6] ));
   OAI2BB2X1M U370 (.Y(n250), 
	.B1(n166), 
	.B0(n557), 
	.A1N(n166), 
	.A0N(\RF[8][7] ));
   OAI2BB2X1M U371 (.Y(n251), 
	.B1(n168), 
	.B0(n550), 
	.A1N(n168), 
	.A0N(\RF[9][0] ));
   OAI2BB2X1M U372 (.Y(n252), 
	.B1(n168), 
	.B0(n551), 
	.A1N(n168), 
	.A0N(\RF[9][1] ));
   OAI2BB2X1M U373 (.Y(n253), 
	.B1(n168), 
	.B0(n552), 
	.A1N(n168), 
	.A0N(\RF[9][2] ));
   OAI2BB2X1M U374 (.Y(n254), 
	.B1(n168), 
	.B0(n553), 
	.A1N(n168), 
	.A0N(\RF[9][3] ));
   OAI2BB2X1M U375 (.Y(n255), 
	.B1(n168), 
	.B0(n554), 
	.A1N(n168), 
	.A0N(\RF[9][4] ));
   OAI2BB2X1M U376 (.Y(n256), 
	.B1(n168), 
	.B0(n555), 
	.A1N(n168), 
	.A0N(\RF[9][5] ));
   OAI2BB2X1M U377 (.Y(n257), 
	.B1(n168), 
	.B0(n556), 
	.A1N(n168), 
	.A0N(\RF[9][6] ));
   OAI2BB2X1M U378 (.Y(n258), 
	.B1(n168), 
	.B0(n557), 
	.A1N(n168), 
	.A0N(\RF[9][7] ));
   OAI2BB2X1M U379 (.Y(n259), 
	.B1(n170), 
	.B0(n550), 
	.A1N(n170), 
	.A0N(\RF[10][0] ));
   OAI2BB2X1M U380 (.Y(n260), 
	.B1(n170), 
	.B0(n551), 
	.A1N(n170), 
	.A0N(\RF[10][1] ));
   OAI2BB2X1M U381 (.Y(n261), 
	.B1(n170), 
	.B0(n552), 
	.A1N(n170), 
	.A0N(\RF[10][2] ));
   OAI2BB2X1M U382 (.Y(n262), 
	.B1(n170), 
	.B0(n553), 
	.A1N(n170), 
	.A0N(\RF[10][3] ));
   OAI2BB2X1M U383 (.Y(n263), 
	.B1(n170), 
	.B0(n554), 
	.A1N(n170), 
	.A0N(\RF[10][4] ));
   OAI2BB2X1M U384 (.Y(n264), 
	.B1(n170), 
	.B0(n555), 
	.A1N(n170), 
	.A0N(\RF[10][5] ));
   OAI2BB2X1M U385 (.Y(n265), 
	.B1(n170), 
	.B0(n556), 
	.A1N(n170), 
	.A0N(\RF[10][6] ));
   OAI2BB2X1M U386 (.Y(n266), 
	.B1(n170), 
	.B0(n557), 
	.A1N(n170), 
	.A0N(\RF[10][7] ));
   OAI2BB2X1M U387 (.Y(n267), 
	.B1(n171), 
	.B0(n550), 
	.A1N(n171), 
	.A0N(\RF[11][0] ));
   OAI2BB2X1M U388 (.Y(n268), 
	.B1(n171), 
	.B0(n551), 
	.A1N(n171), 
	.A0N(\RF[11][1] ));
   OAI2BB2X1M U389 (.Y(n269), 
	.B1(n171), 
	.B0(n552), 
	.A1N(n171), 
	.A0N(\RF[11][2] ));
   OAI2BB2X1M U390 (.Y(n270), 
	.B1(n171), 
	.B0(n553), 
	.A1N(n171), 
	.A0N(\RF[11][3] ));
   OAI2BB2X1M U391 (.Y(n271), 
	.B1(n171), 
	.B0(n554), 
	.A1N(n171), 
	.A0N(\RF[11][4] ));
   OAI2BB2X1M U392 (.Y(n272), 
	.B1(n171), 
	.B0(n555), 
	.A1N(n171), 
	.A0N(\RF[11][5] ));
   OAI2BB2X1M U393 (.Y(n273), 
	.B1(n171), 
	.B0(n556), 
	.A1N(n171), 
	.A0N(\RF[11][6] ));
   OAI2BB2X1M U394 (.Y(n274), 
	.B1(n171), 
	.B0(n557), 
	.A1N(n171), 
	.A0N(\RF[11][7] ));
   OAI2BB2X1M U395 (.Y(n195), 
	.B1(n156), 
	.B0(n550), 
	.A1N(n156), 
	.A0N(REG2[0]));
   OAI2BB2X1M U396 (.Y(n202), 
	.B1(n156), 
	.B0(n557), 
	.A1N(n156), 
	.A0N(REG2[7]));
   OAI2BB2X1M U397 (.Y(n208), 
	.B1(n158), 
	.B0(n555), 
	.A1N(n158), 
	.A0N(REG3[5]));
   OAI2BB2X1M U398 (.Y(n211), 
	.B1(n159), 
	.B0(n550), 
	.A1N(n159), 
	.A0N(\RF[4][0] ));
   OAI2BB2X1M U399 (.Y(n212), 
	.B1(n159), 
	.B0(n551), 
	.A1N(n159), 
	.A0N(\RF[4][1] ));
   OAI2BB2X1M U400 (.Y(n213), 
	.B1(n159), 
	.B0(n552), 
	.A1N(n159), 
	.A0N(\RF[4][2] ));
   OAI2BB2X1M U401 (.Y(n214), 
	.B1(n159), 
	.B0(n553), 
	.A1N(n159), 
	.A0N(\RF[4][3] ));
   OAI2BB2X1M U402 (.Y(n215), 
	.B1(n159), 
	.B0(n554), 
	.A1N(n159), 
	.A0N(\RF[4][4] ));
   OAI2BB2X1M U403 (.Y(n216), 
	.B1(n159), 
	.B0(n555), 
	.A1N(n159), 
	.A0N(\RF[4][5] ));
   OAI2BB2X1M U404 (.Y(n217), 
	.B1(n159), 
	.B0(n556), 
	.A1N(n159), 
	.A0N(\RF[4][6] ));
   OAI2BB2X1M U405 (.Y(n218), 
	.B1(n159), 
	.B0(n557), 
	.A1N(n159), 
	.A0N(\RF[4][7] ));
   OAI2BB2X1M U406 (.Y(n219), 
	.B1(n161), 
	.B0(n550), 
	.A1N(n161), 
	.A0N(\RF[5][0] ));
   OAI2BB2X1M U407 (.Y(n220), 
	.B1(n161), 
	.B0(n551), 
	.A1N(n161), 
	.A0N(\RF[5][1] ));
   OAI2BB2X1M U408 (.Y(n221), 
	.B1(n161), 
	.B0(n552), 
	.A1N(n161), 
	.A0N(\RF[5][2] ));
   OAI2BB2X1M U409 (.Y(n222), 
	.B1(n161), 
	.B0(n553), 
	.A1N(n161), 
	.A0N(\RF[5][3] ));
   OAI2BB2X1M U410 (.Y(n223), 
	.B1(n161), 
	.B0(n554), 
	.A1N(n161), 
	.A0N(\RF[5][4] ));
   OAI2BB2X1M U411 (.Y(n224), 
	.B1(n161), 
	.B0(n555), 
	.A1N(n161), 
	.A0N(\RF[5][5] ));
   OAI2BB2X1M U412 (.Y(n225), 
	.B1(n161), 
	.B0(n556), 
	.A1N(n161), 
	.A0N(\RF[5][6] ));
   OAI2BB2X1M U413 (.Y(n226), 
	.B1(n161), 
	.B0(n557), 
	.A1N(n161), 
	.A0N(\RF[5][7] ));
   OAI2BB2X1M U414 (.Y(n227), 
	.B1(n162), 
	.B0(n550), 
	.A1N(n162), 
	.A0N(\RF[6][0] ));
   OAI2BB2X1M U415 (.Y(n228), 
	.B1(n162), 
	.B0(n551), 
	.A1N(n162), 
	.A0N(\RF[6][1] ));
   OAI2BB2X1M U416 (.Y(n229), 
	.B1(n162), 
	.B0(n552), 
	.A1N(n162), 
	.A0N(\RF[6][2] ));
   OAI2BB2X1M U417 (.Y(n230), 
	.B1(n162), 
	.B0(n553), 
	.A1N(n162), 
	.A0N(\RF[6][3] ));
   OAI2BB2X1M U418 (.Y(n231), 
	.B1(n162), 
	.B0(n554), 
	.A1N(n162), 
	.A0N(\RF[6][4] ));
   OAI2BB2X1M U419 (.Y(n232), 
	.B1(n162), 
	.B0(n555), 
	.A1N(n162), 
	.A0N(\RF[6][5] ));
   OAI2BB2X1M U420 (.Y(n233), 
	.B1(n162), 
	.B0(n556), 
	.A1N(n162), 
	.A0N(\RF[6][6] ));
   OAI2BB2X1M U421 (.Y(n234), 
	.B1(n162), 
	.B0(n557), 
	.A1N(n162), 
	.A0N(\RF[6][7] ));
   OAI2BB2X1M U422 (.Y(n235), 
	.B1(n165), 
	.B0(n550), 
	.A1N(n165), 
	.A0N(\RF[7][0] ));
   OAI2BB2X1M U423 (.Y(n236), 
	.B1(n165), 
	.B0(n551), 
	.A1N(n165), 
	.A0N(\RF[7][1] ));
   OAI2BB2X1M U424 (.Y(n237), 
	.B1(n165), 
	.B0(n552), 
	.A1N(n165), 
	.A0N(test_so1));
   OAI2BB2X1M U425 (.Y(n238), 
	.B1(n165), 
	.B0(n553), 
	.A1N(n165), 
	.A0N(\RF[7][3] ));
   OAI2BB2X1M U426 (.Y(n239), 
	.B1(n165), 
	.B0(n554), 
	.A1N(n165), 
	.A0N(\RF[7][4] ));
   OAI2BB2X1M U427 (.Y(n240), 
	.B1(n165), 
	.B0(n555), 
	.A1N(n165), 
	.A0N(\RF[7][5] ));
   OAI2BB2X1M U428 (.Y(n241), 
	.B1(n165), 
	.B0(n556), 
	.A1N(n165), 
	.A0N(\RF[7][6] ));
   OAI2BB2X1M U429 (.Y(n242), 
	.B1(n165), 
	.B0(n557), 
	.A1N(n165), 
	.A0N(\RF[7][7] ));
   OAI2BB2X1M U430 (.Y(n275), 
	.B1(n172), 
	.B0(n550), 
	.A1N(n172), 
	.A0N(\RF[12][0] ));
   OAI2BB2X1M U431 (.Y(n276), 
	.B1(n172), 
	.B0(n551), 
	.A1N(n172), 
	.A0N(\RF[12][1] ));
   OAI2BB2X1M U432 (.Y(n277), 
	.B1(n172), 
	.B0(n552), 
	.A1N(n172), 
	.A0N(\RF[12][2] ));
   OAI2BB2X1M U433 (.Y(n278), 
	.B1(n172), 
	.B0(n553), 
	.A1N(n172), 
	.A0N(\RF[12][3] ));
   OAI2BB2X1M U434 (.Y(n279), 
	.B1(n172), 
	.B0(n554), 
	.A1N(n172), 
	.A0N(\RF[12][4] ));
   OAI2BB2X1M U435 (.Y(n280), 
	.B1(n172), 
	.B0(n555), 
	.A1N(n172), 
	.A0N(\RF[12][5] ));
   OAI2BB2X1M U436 (.Y(n281), 
	.B1(n172), 
	.B0(n556), 
	.A1N(n172), 
	.A0N(\RF[12][6] ));
   OAI2BB2X1M U437 (.Y(n282), 
	.B1(n172), 
	.B0(n557), 
	.A1N(n172), 
	.A0N(\RF[12][7] ));
   OAI2BB2X1M U438 (.Y(n283), 
	.B1(n173), 
	.B0(n550), 
	.A1N(n173), 
	.A0N(\RF[13][0] ));
   OAI2BB2X1M U439 (.Y(n284), 
	.B1(n173), 
	.B0(n551), 
	.A1N(n173), 
	.A0N(\RF[13][1] ));
   OAI2BB2X1M U440 (.Y(n285), 
	.B1(n173), 
	.B0(n552), 
	.A1N(n173), 
	.A0N(\RF[13][2] ));
   OAI2BB2X1M U441 (.Y(n286), 
	.B1(n173), 
	.B0(n553), 
	.A1N(n173), 
	.A0N(\RF[13][3] ));
   OAI2BB2X1M U442 (.Y(n287), 
	.B1(n173), 
	.B0(n554), 
	.A1N(n173), 
	.A0N(\RF[13][4] ));
   OAI2BB2X1M U443 (.Y(n288), 
	.B1(n173), 
	.B0(n555), 
	.A1N(n173), 
	.A0N(\RF[13][5] ));
   OAI2BB2X1M U444 (.Y(n289), 
	.B1(n173), 
	.B0(n556), 
	.A1N(n173), 
	.A0N(\RF[13][6] ));
   OAI2BB2X1M U445 (.Y(n290), 
	.B1(n173), 
	.B0(n557), 
	.A1N(n173), 
	.A0N(\RF[13][7] ));
   OAI2BB2X1M U446 (.Y(n291), 
	.B1(n174), 
	.B0(n550), 
	.A1N(n174), 
	.A0N(\RF[14][0] ));
   OAI2BB2X1M U447 (.Y(n292), 
	.B1(n174), 
	.B0(n551), 
	.A1N(n174), 
	.A0N(\RF[14][1] ));
   OAI2BB2X1M U448 (.Y(n293), 
	.B1(n174), 
	.B0(n552), 
	.A1N(n174), 
	.A0N(\RF[14][2] ));
   OAI2BB2X1M U449 (.Y(n294), 
	.B1(n174), 
	.B0(n553), 
	.A1N(n174), 
	.A0N(\RF[14][3] ));
   OAI2BB2X1M U450 (.Y(n295), 
	.B1(n174), 
	.B0(n554), 
	.A1N(n174), 
	.A0N(\RF[14][4] ));
   OAI2BB2X1M U451 (.Y(n296), 
	.B1(n174), 
	.B0(n555), 
	.A1N(n174), 
	.A0N(\RF[14][5] ));
   OAI2BB2X1M U452 (.Y(n297), 
	.B1(n174), 
	.B0(n556), 
	.A1N(n174), 
	.A0N(\RF[14][6] ));
   OAI2BB2X1M U453 (.Y(n298), 
	.B1(n174), 
	.B0(n557), 
	.A1N(n174), 
	.A0N(\RF[14][7] ));
   OAI2BB2X1M U454 (.Y(n299), 
	.B1(n176), 
	.B0(n550), 
	.A1N(n176), 
	.A0N(\RF[15][0] ));
   OAI2BB2X1M U455 (.Y(n300), 
	.B1(n176), 
	.B0(n551), 
	.A1N(n176), 
	.A0N(\RF[15][1] ));
   OAI2BB2X1M U456 (.Y(n301), 
	.B1(n176), 
	.B0(n552), 
	.A1N(n176), 
	.A0N(\RF[15][2] ));
   OAI2BB2X1M U457 (.Y(n302), 
	.B1(n176), 
	.B0(n553), 
	.A1N(n176), 
	.A0N(\RF[15][3] ));
   OAI2BB2X1M U458 (.Y(n303), 
	.B1(n176), 
	.B0(n554), 
	.A1N(n176), 
	.A0N(\RF[15][4] ));
   OAI2BB2X1M U459 (.Y(n304), 
	.B1(n176), 
	.B0(n555), 
	.A1N(n176), 
	.A0N(\RF[15][5] ));
   OAI2BB2X1M U460 (.Y(n305), 
	.B1(n176), 
	.B0(n556), 
	.A1N(n176), 
	.A0N(\RF[15][6] ));
   OAI2BB2X1M U461 (.Y(n306), 
	.B1(n176), 
	.B0(n557), 
	.A1N(n176), 
	.A0N(\RF[15][7] ));
   AO21XLM U462 (.Y(n178), 
	.B0(n558), 
	.A1(n150), 
	.A0(RdData_VLD));
   AOI22X1M U463 (.Y(n442), 
	.B1(n545), 
	.B0(\RF[11][0] ), 
	.A1(n546), 
	.A0(\RF[10][0] ));
   AOI22X1M U464 (.Y(n441), 
	.B1(n547), 
	.B0(\RF[9][0] ), 
	.A1(n549), 
	.A0(\RF[8][0] ));
   CLKNAND2X2M U465 (.Y(n525), 
	.B(n542), 
	.A(N13));
   AOI21X1M U466 (.Y(n452), 
	.B0(n525), 
	.A1(n441), 
	.A0(n442));
   AOI22X1M U467 (.Y(n444), 
	.B1(n545), 
	.B0(\RF[15][0] ), 
	.A1(n546), 
	.A0(\RF[14][0] ));
   AOI22X1M U468 (.Y(n443), 
	.B1(n547), 
	.B0(\RF[13][0] ), 
	.A1(n549), 
	.A0(\RF[12][0] ));
   CLKNAND2X2M U469 (.Y(n528), 
	.B(N12), 
	.A(N13));
   AOI21X1M U470 (.Y(n451), 
	.B0(n528), 
	.A1(n443), 
	.A0(n444));
   AOI22X1M U471 (.Y(n446), 
	.B1(n545), 
	.B0(REG3[0]), 
	.A1(n546), 
	.A0(REG2[0]));
   AOI22X1M U472 (.Y(n445), 
	.B1(n547), 
	.B0(REG1[0]), 
	.A1(n549), 
	.A0(REG0[0]));
   CLKNAND2X2M U473 (.Y(n531), 
	.B(n541), 
	.A(n542));
   AOI21X1M U474 (.Y(n450), 
	.B0(n531), 
	.A1(n445), 
	.A0(n446));
   AOI22X1M U475 (.Y(n448), 
	.B1(n545), 
	.B0(\RF[7][0] ), 
	.A1(n546), 
	.A0(\RF[6][0] ));
   AOI22X1M U476 (.Y(n447), 
	.B1(n547), 
	.B0(\RF[5][0] ), 
	.A1(n549), 
	.A0(\RF[4][0] ));
   CLKNAND2X2M U477 (.Y(n534), 
	.B(n541), 
	.A(N12));
   AOI21X1M U478 (.Y(n449), 
	.B0(n534), 
	.A1(n447), 
	.A0(n448));
   OR4X1M U479 (.Y(N26), 
	.D(n449), 
	.C(n450), 
	.B(n451), 
	.A(n452));
   AOI22X1M U480 (.Y(n454), 
	.B1(n545), 
	.B0(\RF[11][1] ), 
	.A1(n546), 
	.A0(\RF[10][1] ));
   AOI22X1M U481 (.Y(n453), 
	.B1(n547), 
	.B0(\RF[9][1] ), 
	.A1(n549), 
	.A0(\RF[8][1] ));
   AOI21X1M U482 (.Y(n464), 
	.B0(n525), 
	.A1(n453), 
	.A0(n454));
   AOI22X1M U483 (.Y(n456), 
	.B1(n545), 
	.B0(\RF[15][1] ), 
	.A1(n546), 
	.A0(\RF[14][1] ));
   AOI22X1M U484 (.Y(n455), 
	.B1(n547), 
	.B0(\RF[13][1] ), 
	.A1(n549), 
	.A0(\RF[12][1] ));
   AOI21X1M U485 (.Y(n463), 
	.B0(n528), 
	.A1(n455), 
	.A0(n456));
   AOI22X1M U486 (.Y(n458), 
	.B1(n545), 
	.B0(REG3[1]), 
	.A1(n546), 
	.A0(REG2[1]));
   AOI22X1M U487 (.Y(n457), 
	.B1(n547), 
	.B0(REG1[1]), 
	.A1(n549), 
	.A0(REG0[1]));
   AOI21X1M U488 (.Y(n462), 
	.B0(n531), 
	.A1(n457), 
	.A0(n458));
   AOI22X1M U489 (.Y(n460), 
	.B1(n545), 
	.B0(\RF[7][1] ), 
	.A1(n546), 
	.A0(\RF[6][1] ));
   AOI22X1M U490 (.Y(n459), 
	.B1(n547), 
	.B0(\RF[5][1] ), 
	.A1(n549), 
	.A0(\RF[4][1] ));
   AOI21X1M U491 (.Y(n461), 
	.B0(n534), 
	.A1(n459), 
	.A0(n460));
   OR4X1M U492 (.Y(N25), 
	.D(n461), 
	.C(n462), 
	.B(n463), 
	.A(n464));
   AOI22X1M U493 (.Y(n466), 
	.B1(n545), 
	.B0(\RF[11][2] ), 
	.A1(n546), 
	.A0(\RF[10][2] ));
   AOI22X1M U494 (.Y(n465), 
	.B1(n547), 
	.B0(\RF[9][2] ), 
	.A1(n549), 
	.A0(\RF[8][2] ));
   AOI21X1M U495 (.Y(n476), 
	.B0(n525), 
	.A1(n465), 
	.A0(n466));
   AOI22X1M U496 (.Y(n468), 
	.B1(n545), 
	.B0(\RF[15][2] ), 
	.A1(n546), 
	.A0(\RF[14][2] ));
   AOI22X1M U497 (.Y(n467), 
	.B1(n547), 
	.B0(\RF[13][2] ), 
	.A1(n549), 
	.A0(\RF[12][2] ));
   AOI21X1M U498 (.Y(n475), 
	.B0(n528), 
	.A1(n467), 
	.A0(n468));
   AOI22X1M U499 (.Y(n470), 
	.B1(n545), 
	.B0(REG3[2]), 
	.A1(n546), 
	.A0(REG2[2]));
   AOI22X1M U500 (.Y(n469), 
	.B1(n547), 
	.B0(REG1[2]), 
	.A1(n549), 
	.A0(REG0[2]));
   AOI21X1M U501 (.Y(n474), 
	.B0(n531), 
	.A1(n469), 
	.A0(n470));
   AOI22X1M U502 (.Y(n472), 
	.B1(n545), 
	.B0(test_so1), 
	.A1(n546), 
	.A0(\RF[6][2] ));
   AOI22X1M U503 (.Y(n471), 
	.B1(n547), 
	.B0(\RF[5][2] ), 
	.A1(n549), 
	.A0(\RF[4][2] ));
   AOI21X1M U504 (.Y(n473), 
	.B0(n534), 
	.A1(n471), 
	.A0(n472));
   OR4X1M U505 (.Y(N24), 
	.D(n473), 
	.C(n474), 
	.B(n475), 
	.A(n476));
   AOI22X1M U506 (.Y(n478), 
	.B1(n545), 
	.B0(\RF[11][3] ), 
	.A1(n546), 
	.A0(\RF[10][3] ));
   AOI22X1M U507 (.Y(n477), 
	.B1(n547), 
	.B0(\RF[9][3] ), 
	.A1(n549), 
	.A0(\RF[8][3] ));
   AOI21X1M U508 (.Y(n488), 
	.B0(n525), 
	.A1(n477), 
	.A0(n478));
   AOI22X1M U509 (.Y(n480), 
	.B1(n545), 
	.B0(\RF[15][3] ), 
	.A1(n546), 
	.A0(\RF[14][3] ));
   AOI22X1M U510 (.Y(n479), 
	.B1(n547), 
	.B0(\RF[13][3] ), 
	.A1(n549), 
	.A0(\RF[12][3] ));
   AOI21X1M U511 (.Y(n487), 
	.B0(n528), 
	.A1(n479), 
	.A0(n480));
   AOI22X1M U512 (.Y(n482), 
	.B1(n545), 
	.B0(REG3[3]), 
	.A1(n546), 
	.A0(REG2[3]));
   AOI22X1M U513 (.Y(n481), 
	.B1(n547), 
	.B0(REG1[3]), 
	.A1(n549), 
	.A0(REG0[3]));
   AOI21X1M U514 (.Y(n486), 
	.B0(n531), 
	.A1(n481), 
	.A0(n482));
   AOI22X1M U515 (.Y(n484), 
	.B1(n545), 
	.B0(\RF[7][3] ), 
	.A1(n546), 
	.A0(\RF[6][3] ));
   AOI22X1M U516 (.Y(n483), 
	.B1(n547), 
	.B0(\RF[5][3] ), 
	.A1(n549), 
	.A0(\RF[4][3] ));
   AOI21X1M U517 (.Y(n485), 
	.B0(n534), 
	.A1(n483), 
	.A0(n484));
   OR4X1M U518 (.Y(N23), 
	.D(n485), 
	.C(n486), 
	.B(n487), 
	.A(n488));
   AOI22X1M U519 (.Y(n490), 
	.B1(n545), 
	.B0(\RF[11][4] ), 
	.A1(n546), 
	.A0(\RF[10][4] ));
   AOI22X1M U520 (.Y(n489), 
	.B1(n547), 
	.B0(\RF[9][4] ), 
	.A1(n549), 
	.A0(\RF[8][4] ));
   AOI21X1M U521 (.Y(n500), 
	.B0(n525), 
	.A1(n489), 
	.A0(n490));
   AOI22X1M U522 (.Y(n492), 
	.B1(n545), 
	.B0(\RF[15][4] ), 
	.A1(n546), 
	.A0(\RF[14][4] ));
   AOI22X1M U523 (.Y(n491), 
	.B1(n547), 
	.B0(\RF[13][4] ), 
	.A1(n549), 
	.A0(\RF[12][4] ));
   AOI21X1M U524 (.Y(n499), 
	.B0(n528), 
	.A1(n491), 
	.A0(n492));
   AOI22X1M U525 (.Y(n494), 
	.B1(n545), 
	.B0(REG3[4]), 
	.A1(n546), 
	.A0(REG2[4]));
   AOI22X1M U526 (.Y(n493), 
	.B1(n547), 
	.B0(REG1[4]), 
	.A1(n549), 
	.A0(REG0[4]));
   AOI21X1M U527 (.Y(n498), 
	.B0(n531), 
	.A1(n493), 
	.A0(n494));
   AOI22X1M U528 (.Y(n496), 
	.B1(n545), 
	.B0(\RF[7][4] ), 
	.A1(n546), 
	.A0(\RF[6][4] ));
   AOI22X1M U529 (.Y(n495), 
	.B1(n547), 
	.B0(\RF[5][4] ), 
	.A1(n549), 
	.A0(\RF[4][4] ));
   AOI21X1M U530 (.Y(n497), 
	.B0(n534), 
	.A1(n495), 
	.A0(n496));
   OR4X1M U531 (.Y(N22), 
	.D(n497), 
	.C(n498), 
	.B(n499), 
	.A(n500));
   AOI22X1M U532 (.Y(n502), 
	.B1(n545), 
	.B0(\RF[11][5] ), 
	.A1(n546), 
	.A0(\RF[10][5] ));
   AOI22X1M U533 (.Y(n501), 
	.B1(n547), 
	.B0(\RF[9][5] ), 
	.A1(n549), 
	.A0(\RF[8][5] ));
   AOI21X1M U534 (.Y(n512), 
	.B0(n525), 
	.A1(n501), 
	.A0(n502));
   AOI22X1M U535 (.Y(n504), 
	.B1(n545), 
	.B0(\RF[15][5] ), 
	.A1(n546), 
	.A0(\RF[14][5] ));
   AOI22X1M U536 (.Y(n503), 
	.B1(n547), 
	.B0(\RF[13][5] ), 
	.A1(n549), 
	.A0(\RF[12][5] ));
   AOI21X1M U537 (.Y(n511), 
	.B0(n528), 
	.A1(n503), 
	.A0(n504));
   AOI22X1M U538 (.Y(n506), 
	.B1(n545), 
	.B0(REG3[5]), 
	.A1(n546), 
	.A0(REG2[5]));
   AOI22X1M U539 (.Y(n505), 
	.B1(n547), 
	.B0(REG1[5]), 
	.A1(n549), 
	.A0(REG0[5]));
   AOI21X1M U540 (.Y(n510), 
	.B0(n531), 
	.A1(n505), 
	.A0(n506));
   AOI22X1M U541 (.Y(n508), 
	.B1(n545), 
	.B0(\RF[7][5] ), 
	.A1(n546), 
	.A0(\RF[6][5] ));
   AOI22X1M U542 (.Y(n507), 
	.B1(n547), 
	.B0(\RF[5][5] ), 
	.A1(n549), 
	.A0(\RF[4][5] ));
   AOI21X1M U543 (.Y(n509), 
	.B0(n534), 
	.A1(n507), 
	.A0(n508));
   OR4X1M U544 (.Y(N21), 
	.D(n509), 
	.C(n510), 
	.B(n511), 
	.A(n512));
   AOI22X1M U545 (.Y(n514), 
	.B1(n545), 
	.B0(\RF[11][6] ), 
	.A1(n546), 
	.A0(\RF[10][6] ));
   AOI22X1M U546 (.Y(n513), 
	.B1(n547), 
	.B0(\RF[9][6] ), 
	.A1(n549), 
	.A0(\RF[8][6] ));
   AOI21X1M U547 (.Y(n524), 
	.B0(n525), 
	.A1(n513), 
	.A0(n514));
   AOI22X1M U548 (.Y(n516), 
	.B1(n545), 
	.B0(\RF[15][6] ), 
	.A1(n546), 
	.A0(\RF[14][6] ));
   AOI22X1M U549 (.Y(n515), 
	.B1(n547), 
	.B0(\RF[13][6] ), 
	.A1(n549), 
	.A0(\RF[12][6] ));
   AOI21X1M U550 (.Y(n523), 
	.B0(n528), 
	.A1(n515), 
	.A0(n516));
   AOI22X1M U551 (.Y(n518), 
	.B1(n545), 
	.B0(REG3[6]), 
	.A1(n546), 
	.A0(REG2[6]));
   AOI22X1M U552 (.Y(n517), 
	.B1(n547), 
	.B0(REG1[6]), 
	.A1(n549), 
	.A0(REG0[6]));
   AOI21X1M U553 (.Y(n522), 
	.B0(n531), 
	.A1(n517), 
	.A0(n518));
   AOI22X1M U554 (.Y(n520), 
	.B1(n545), 
	.B0(\RF[7][6] ), 
	.A1(n546), 
	.A0(\RF[6][6] ));
   AOI22X1M U555 (.Y(n519), 
	.B1(n547), 
	.B0(\RF[5][6] ), 
	.A1(n549), 
	.A0(\RF[4][6] ));
   AOI21X1M U556 (.Y(n521), 
	.B0(n534), 
	.A1(n519), 
	.A0(n520));
   OR4X1M U557 (.Y(N20), 
	.D(n521), 
	.C(n522), 
	.B(n523), 
	.A(n524));
   AOI22X1M U558 (.Y(n527), 
	.B1(n545), 
	.B0(\RF[11][7] ), 
	.A1(n546), 
	.A0(\RF[10][7] ));
   AOI22X1M U559 (.Y(n526), 
	.B1(n547), 
	.B0(\RF[9][7] ), 
	.A1(n549), 
	.A0(\RF[8][7] ));
   AOI21X1M U560 (.Y(n540), 
	.B0(n525), 
	.A1(n526), 
	.A0(n527));
   AOI22X1M U561 (.Y(n530), 
	.B1(n545), 
	.B0(\RF[15][7] ), 
	.A1(n546), 
	.A0(\RF[14][7] ));
   AOI22X1M U562 (.Y(n529), 
	.B1(n547), 
	.B0(\RF[13][7] ), 
	.A1(n549), 
	.A0(\RF[12][7] ));
   AOI21X1M U563 (.Y(n539), 
	.B0(n528), 
	.A1(n529), 
	.A0(n530));
   AOI22X1M U564 (.Y(n533), 
	.B1(n545), 
	.B0(REG3[7]), 
	.A1(n546), 
	.A0(REG2[7]));
   AOI22X1M U565 (.Y(n532), 
	.B1(n547), 
	.B0(REG1[7]), 
	.A1(n549), 
	.A0(REG0[7]));
   AOI21X1M U566 (.Y(n538), 
	.B0(n531), 
	.A1(n532), 
	.A0(n533));
   AOI22X1M U567 (.Y(n536), 
	.B1(n545), 
	.B0(\RF[7][7] ), 
	.A1(n546), 
	.A0(\RF[6][7] ));
   AOI22X1M U568 (.Y(n535), 
	.B1(n547), 
	.B0(\RF[5][7] ), 
	.A1(n549), 
	.A0(\RF[4][7] ));
   AOI21X1M U569 (.Y(n537), 
	.B0(n534), 
	.A1(n535), 
	.A0(n536));
   OR4X1M U570 (.Y(N19), 
	.D(n537), 
	.C(n538), 
	.B(n539), 
	.A(n540));
   DLY1X4M U573 (.Y(n566), 
	.A(test_se));
   DLY1X4M U574 (.Y(n567), 
	.A(test_se));
   DLY1X4M U575 (.Y(n568), 
	.A(test_se));
   DLY1X4M U576 (.Y(n569), 
	.A(test_se));
   SDFFRHQX1M \RF_reg[7][2]  (.SI(\RF[7][1] ), 
	.SE(n569), 
	.RN(FE_OFN3_REF_RST_M), 
	.Q(\RF[7][2] ), 
	.D(n237), 
	.CK(CLK));
   INVXLM U3 (.Y(n1), 
	.A(\RF[7][2] ));
   INVX2M U4 (.Y(test_so1), 
	.A(n1));
endmodule

module CLK_GATE (
	CLK_EN, 
	CLK, 
	GATED_CLK);
   input CLK_EN;
   input CLK;
   output GATED_CLK;

   TLATNCAX12M U0_TLATNCAX12M (.ECK(GATED_CLK), 
	.E(CLK_EN), 
	.CK(CLK));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 (
	a, 
	b, 
	quotient, 
	remainder, 
	divide_by_0, 
	n157, 
	n156, 
	n155, 
	n154, 
	n153, 
	n152, 
	n151, 
	n134, 
	n136, 
	n138, 
	n149, 
	n148, 
	n139, 
	n147);
   input [7:0] a;
   input [7:0] b;
   output [7:0] quotient;
   output [7:0] remainder;
   output divide_by_0;
   input n157;
   input n156;
   input n155;
   input n154;
   input n153;
   input n152;
   input n151;
   input n134;
   input n136;
   input n138;
   input n149;
   input n148;
   input n139;
   input n147;

   // Internal wires
   wire \u_div/SumTmp[1][0] ;
   wire \u_div/SumTmp[1][1] ;
   wire \u_div/SumTmp[1][2] ;
   wire \u_div/SumTmp[1][3] ;
   wire \u_div/SumTmp[1][4] ;
   wire \u_div/SumTmp[1][5] ;
   wire \u_div/SumTmp[1][6] ;
   wire \u_div/SumTmp[2][0] ;
   wire \u_div/SumTmp[2][1] ;
   wire \u_div/SumTmp[2][2] ;
   wire \u_div/SumTmp[2][3] ;
   wire \u_div/SumTmp[2][4] ;
   wire \u_div/SumTmp[2][5] ;
   wire \u_div/SumTmp[3][0] ;
   wire \u_div/SumTmp[3][1] ;
   wire \u_div/SumTmp[3][2] ;
   wire \u_div/SumTmp[3][3] ;
   wire \u_div/SumTmp[3][4] ;
   wire \u_div/SumTmp[4][0] ;
   wire \u_div/SumTmp[4][1] ;
   wire \u_div/SumTmp[4][2] ;
   wire \u_div/SumTmp[4][3] ;
   wire \u_div/SumTmp[5][0] ;
   wire \u_div/SumTmp[5][1] ;
   wire \u_div/SumTmp[5][2] ;
   wire \u_div/SumTmp[6][0] ;
   wire \u_div/SumTmp[6][1] ;
   wire \u_div/SumTmp[7][0] ;
   wire \u_div/CryTmp[0][1] ;
   wire \u_div/CryTmp[0][2] ;
   wire \u_div/CryTmp[0][3] ;
   wire \u_div/CryTmp[0][4] ;
   wire \u_div/CryTmp[0][5] ;
   wire \u_div/CryTmp[0][6] ;
   wire \u_div/CryTmp[0][7] ;
   wire \u_div/CryTmp[1][1] ;
   wire \u_div/CryTmp[1][2] ;
   wire \u_div/CryTmp[1][3] ;
   wire \u_div/CryTmp[1][4] ;
   wire \u_div/CryTmp[1][5] ;
   wire \u_div/CryTmp[1][6] ;
   wire \u_div/CryTmp[1][7] ;
   wire \u_div/CryTmp[2][1] ;
   wire \u_div/CryTmp[2][2] ;
   wire \u_div/CryTmp[2][3] ;
   wire \u_div/CryTmp[2][4] ;
   wire \u_div/CryTmp[2][5] ;
   wire \u_div/CryTmp[2][6] ;
   wire \u_div/CryTmp[3][1] ;
   wire \u_div/CryTmp[3][2] ;
   wire \u_div/CryTmp[3][3] ;
   wire \u_div/CryTmp[3][4] ;
   wire \u_div/CryTmp[3][5] ;
   wire \u_div/CryTmp[4][1] ;
   wire \u_div/CryTmp[4][2] ;
   wire \u_div/CryTmp[4][3] ;
   wire \u_div/CryTmp[4][4] ;
   wire \u_div/CryTmp[5][1] ;
   wire \u_div/CryTmp[5][2] ;
   wire \u_div/CryTmp[5][3] ;
   wire \u_div/CryTmp[6][1] ;
   wire \u_div/CryTmp[6][2] ;
   wire \u_div/CryTmp[7][1] ;
   wire \u_div/PartRem[1][1] ;
   wire \u_div/PartRem[1][2] ;
   wire \u_div/PartRem[1][3] ;
   wire \u_div/PartRem[1][4] ;
   wire \u_div/PartRem[1][5] ;
   wire \u_div/PartRem[1][6] ;
   wire \u_div/PartRem[1][7] ;
   wire \u_div/PartRem[2][1] ;
   wire \u_div/PartRem[2][2] ;
   wire \u_div/PartRem[2][3] ;
   wire \u_div/PartRem[2][4] ;
   wire \u_div/PartRem[2][5] ;
   wire \u_div/PartRem[2][6] ;
   wire \u_div/PartRem[3][1] ;
   wire \u_div/PartRem[3][2] ;
   wire \u_div/PartRem[3][3] ;
   wire \u_div/PartRem[3][4] ;
   wire \u_div/PartRem[3][5] ;
   wire \u_div/PartRem[4][1] ;
   wire \u_div/PartRem[4][2] ;
   wire \u_div/PartRem[4][3] ;
   wire \u_div/PartRem[4][4] ;
   wire \u_div/PartRem[5][1] ;
   wire \u_div/PartRem[5][2] ;
   wire \u_div/PartRem[5][3] ;
   wire \u_div/PartRem[6][1] ;
   wire \u_div/PartRem[6][2] ;
   wire \u_div/PartRem[7][1] ;
   wire n2;
   wire n17;
   wire n19;
   wire n20;
   wire n21;

   ADDFX2M \u_div/u_fa_PartRem_0_2_5  (.S(\u_div/SumTmp[2][5] ), 
	.CO(\u_div/CryTmp[2][6] ), 
	.CI(\u_div/CryTmp[2][5] ), 
	.B(n148), 
	.A(\u_div/PartRem[3][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_3  (.S(\u_div/SumTmp[4][3] ), 
	.CO(\u_div/CryTmp[4][4] ), 
	.CI(\u_div/CryTmp[4][3] ), 
	.B(n138), 
	.A(\u_div/PartRem[5][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_2  (.S(\u_div/SumTmp[5][2] ), 
	.CO(\u_div/CryTmp[5][3] ), 
	.CI(\u_div/CryTmp[5][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[6][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_6_1  (.S(\u_div/SumTmp[6][1] ), 
	.CO(\u_div/CryTmp[6][2] ), 
	.CI(\u_div/CryTmp[6][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[7][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_4  (.S(\u_div/SumTmp[3][4] ), 
	.CO(\u_div/CryTmp[3][5] ), 
	.CI(\u_div/CryTmp[3][4] ), 
	.B(n149), 
	.A(\u_div/PartRem[4][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_5  (.CO(\u_div/CryTmp[0][6] ), 
	.CI(\u_div/CryTmp[0][5] ), 
	.B(n148), 
	.A(\u_div/PartRem[1][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_6  (.CO(\u_div/CryTmp[0][7] ), 
	.CI(\u_div/CryTmp[0][6] ), 
	.B(n139), 
	.A(\u_div/PartRem[1][6] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_7  (.CO(quotient[0]), 
	.CI(\u_div/CryTmp[0][7] ), 
	.B(n147), 
	.A(\u_div/PartRem[1][7] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_1  (.CO(\u_div/CryTmp[0][2] ), 
	.CI(\u_div/CryTmp[0][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[1][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_1  (.S(\u_div/SumTmp[1][1] ), 
	.CO(\u_div/CryTmp[1][2] ), 
	.CI(\u_div/CryTmp[1][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[2][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_1  (.S(\u_div/SumTmp[2][1] ), 
	.CO(\u_div/CryTmp[2][2] ), 
	.CI(\u_div/CryTmp[2][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[3][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_1  (.S(\u_div/SumTmp[3][1] ), 
	.CO(\u_div/CryTmp[3][2] ), 
	.CI(\u_div/CryTmp[3][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[4][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_1  (.S(\u_div/SumTmp[4][1] ), 
	.CO(\u_div/CryTmp[4][2] ), 
	.CI(\u_div/CryTmp[4][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[5][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_5_1  (.S(\u_div/SumTmp[5][1] ), 
	.CO(\u_div/CryTmp[5][2] ), 
	.CI(\u_div/CryTmp[5][1] ), 
	.B(n17), 
	.A(\u_div/PartRem[6][1] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_2  (.CO(\u_div/CryTmp[0][3] ), 
	.CI(\u_div/CryTmp[0][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[1][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_3  (.CO(\u_div/CryTmp[0][4] ), 
	.CI(\u_div/CryTmp[0][3] ), 
	.B(n138), 
	.A(\u_div/PartRem[1][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_0_4  (.CO(\u_div/CryTmp[0][5] ), 
	.CI(\u_div/CryTmp[0][4] ), 
	.B(n149), 
	.A(\u_div/PartRem[1][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_5  (.S(\u_div/SumTmp[1][5] ), 
	.CO(\u_div/CryTmp[1][6] ), 
	.CI(\u_div/CryTmp[1][5] ), 
	.B(n148), 
	.A(\u_div/PartRem[2][5] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_4  (.S(\u_div/SumTmp[1][4] ), 
	.CO(\u_div/CryTmp[1][5] ), 
	.CI(\u_div/CryTmp[1][4] ), 
	.B(n149), 
	.A(\u_div/PartRem[2][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_3  (.S(\u_div/SumTmp[1][3] ), 
	.CO(\u_div/CryTmp[1][4] ), 
	.CI(\u_div/CryTmp[1][3] ), 
	.B(n138), 
	.A(\u_div/PartRem[2][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_4  (.S(\u_div/SumTmp[2][4] ), 
	.CO(\u_div/CryTmp[2][5] ), 
	.CI(\u_div/CryTmp[2][4] ), 
	.B(n149), 
	.A(\u_div/PartRem[3][4] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_2  (.S(\u_div/SumTmp[1][2] ), 
	.CO(\u_div/CryTmp[1][3] ), 
	.CI(\u_div/CryTmp[1][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[2][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_3  (.S(\u_div/SumTmp[2][3] ), 
	.CO(\u_div/CryTmp[2][4] ), 
	.CI(\u_div/CryTmp[2][3] ), 
	.B(n138), 
	.A(\u_div/PartRem[3][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_2_2  (.S(\u_div/SumTmp[2][2] ), 
	.CO(\u_div/CryTmp[2][3] ), 
	.CI(\u_div/CryTmp[2][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[3][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_3  (.S(\u_div/SumTmp[3][3] ), 
	.CO(\u_div/CryTmp[3][4] ), 
	.CI(\u_div/CryTmp[3][3] ), 
	.B(n138), 
	.A(\u_div/PartRem[4][3] ));
   ADDFX2M \u_div/u_fa_PartRem_0_3_2  (.S(\u_div/SumTmp[3][2] ), 
	.CO(\u_div/CryTmp[3][3] ), 
	.CI(\u_div/CryTmp[3][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[4][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_4_2  (.S(\u_div/SumTmp[4][2] ), 
	.CO(\u_div/CryTmp[4][3] ), 
	.CI(\u_div/CryTmp[4][2] ), 
	.B(n136), 
	.A(\u_div/PartRem[5][2] ));
   ADDFX2M \u_div/u_fa_PartRem_0_1_6  (.S(\u_div/SumTmp[1][6] ), 
	.CO(\u_div/CryTmp[1][7] ), 
	.CI(\u_div/CryTmp[1][6] ), 
	.B(n139), 
	.A(\u_div/PartRem[2][6] ));
   XNOR2X2M U2 (.Y(\u_div/SumTmp[7][0] ), 
	.B(a[7]), 
	.A(n134));
   XNOR2X2M U3 (.Y(\u_div/SumTmp[6][0] ), 
	.B(a[6]), 
	.A(n134));
   XNOR2X2M U4 (.Y(\u_div/SumTmp[5][0] ), 
	.B(a[5]), 
	.A(n134));
   XNOR2X2M U5 (.Y(\u_div/SumTmp[4][0] ), 
	.B(a[4]), 
	.A(n134));
   XNOR2X2M U6 (.Y(\u_div/SumTmp[3][0] ), 
	.B(a[3]), 
	.A(n134));
   XNOR2X2M U7 (.Y(\u_div/SumTmp[2][0] ), 
	.B(a[2]), 
	.A(n134));
   OR2X2M U8 (.Y(\u_div/CryTmp[7][1] ), 
	.B(a[7]), 
	.A(n134));
   XNOR2X2M U9 (.Y(\u_div/SumTmp[1][0] ), 
	.B(a[1]), 
	.A(n134));
   NAND2X2M U10 (.Y(\u_div/CryTmp[5][1] ), 
	.B(n152), 
	.A(n2));
   INVX2M U12 (.Y(n2), 
	.A(n134));
   NAND2X2M U13 (.Y(\u_div/CryTmp[4][1] ), 
	.B(n153), 
	.A(n2));
   NAND2X2M U16 (.Y(\u_div/CryTmp[3][1] ), 
	.B(n154), 
	.A(n2));
   NAND2X2M U19 (.Y(\u_div/CryTmp[2][1] ), 
	.B(n155), 
	.A(n2));
   NAND2X2M U21 (.Y(\u_div/CryTmp[1][1] ), 
	.B(n156), 
	.A(n2));
   NAND2X2M U23 (.Y(\u_div/CryTmp[0][1] ), 
	.B(n157), 
	.A(n2));
   NAND2X2M U25 (.Y(\u_div/CryTmp[6][1] ), 
	.B(n151), 
	.A(n2));
   INVX2M U28 (.Y(n17), 
	.A(b[1]));
   CLKMX2X2M U34 (.Y(\u_div/PartRem[1][7] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][6] ), 
	.A(\u_div/PartRem[2][6] ));
   CLKMX2X2M U35 (.Y(\u_div/PartRem[2][6] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][5] ), 
	.A(\u_div/PartRem[3][5] ));
   CLKMX2X2M U36 (.Y(\u_div/PartRem[3][5] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][4] ), 
	.A(\u_div/PartRem[4][4] ));
   CLKMX2X2M U37 (.Y(\u_div/PartRem[4][4] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][3] ), 
	.A(\u_div/PartRem[5][3] ));
   CLKMX2X2M U38 (.Y(\u_div/PartRem[5][3] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][2] ), 
	.A(\u_div/PartRem[6][2] ));
   CLKMX2X2M U39 (.Y(\u_div/PartRem[6][2] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][1] ), 
	.A(\u_div/PartRem[7][1] ));
   CLKMX2X2M U40 (.Y(\u_div/PartRem[7][1] ), 
	.S0(quotient[7]), 
	.B(\u_div/SumTmp[7][0] ), 
	.A(a[7]));
   CLKMX2X2M U41 (.Y(\u_div/PartRem[1][6] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][5] ), 
	.A(\u_div/PartRem[2][5] ));
   CLKMX2X2M U42 (.Y(\u_div/PartRem[2][5] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][4] ), 
	.A(\u_div/PartRem[3][4] ));
   CLKMX2X2M U43 (.Y(\u_div/PartRem[3][4] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][3] ), 
	.A(\u_div/PartRem[4][3] ));
   CLKMX2X2M U44 (.Y(\u_div/PartRem[4][3] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][2] ), 
	.A(\u_div/PartRem[5][2] ));
   CLKMX2X2M U45 (.Y(\u_div/PartRem[5][2] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][1] ), 
	.A(\u_div/PartRem[6][1] ));
   CLKMX2X2M U46 (.Y(\u_div/PartRem[6][1] ), 
	.S0(quotient[6]), 
	.B(\u_div/SumTmp[6][0] ), 
	.A(a[6]));
   CLKMX2X2M U47 (.Y(\u_div/PartRem[1][5] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][4] ), 
	.A(\u_div/PartRem[2][4] ));
   CLKMX2X2M U48 (.Y(\u_div/PartRem[2][4] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][3] ), 
	.A(\u_div/PartRem[3][3] ));
   CLKMX2X2M U49 (.Y(\u_div/PartRem[3][3] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][2] ), 
	.A(\u_div/PartRem[4][2] ));
   CLKMX2X2M U50 (.Y(\u_div/PartRem[4][2] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][1] ), 
	.A(\u_div/PartRem[5][1] ));
   CLKMX2X2M U51 (.Y(\u_div/PartRem[5][1] ), 
	.S0(quotient[5]), 
	.B(\u_div/SumTmp[5][0] ), 
	.A(a[5]));
   CLKMX2X2M U52 (.Y(\u_div/PartRem[1][4] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][3] ), 
	.A(\u_div/PartRem[2][3] ));
   CLKMX2X2M U53 (.Y(\u_div/PartRem[2][3] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][2] ), 
	.A(\u_div/PartRem[3][2] ));
   CLKMX2X2M U54 (.Y(\u_div/PartRem[3][2] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][1] ), 
	.A(\u_div/PartRem[4][1] ));
   CLKMX2X2M U55 (.Y(\u_div/PartRem[4][1] ), 
	.S0(quotient[4]), 
	.B(\u_div/SumTmp[4][0] ), 
	.A(a[4]));
   CLKMX2X2M U56 (.Y(\u_div/PartRem[1][3] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][2] ), 
	.A(\u_div/PartRem[2][2] ));
   CLKMX2X2M U57 (.Y(\u_div/PartRem[2][2] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][1] ), 
	.A(\u_div/PartRem[3][1] ));
   CLKMX2X2M U58 (.Y(\u_div/PartRem[3][1] ), 
	.S0(quotient[3]), 
	.B(\u_div/SumTmp[3][0] ), 
	.A(a[3]));
   CLKMX2X2M U59 (.Y(\u_div/PartRem[1][2] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][1] ), 
	.A(\u_div/PartRem[2][1] ));
   CLKMX2X2M U60 (.Y(\u_div/PartRem[2][1] ), 
	.S0(quotient[2]), 
	.B(\u_div/SumTmp[2][0] ), 
	.A(a[2]));
   CLKMX2X2M U61 (.Y(\u_div/PartRem[1][1] ), 
	.S0(quotient[1]), 
	.B(\u_div/SumTmp[1][0] ), 
	.A(a[1]));
   AND4X1M U62 (.Y(quotient[7]), 
	.D(n136), 
	.C(n17), 
	.B(n19), 
	.A(\u_div/CryTmp[7][1] ));
   AND3X1M U63 (.Y(quotient[6]), 
	.C(\u_div/CryTmp[6][2] ), 
	.B(n136), 
	.A(n19));
   AND2X1M U64 (.Y(quotient[5]), 
	.B(n19), 
	.A(\u_div/CryTmp[5][3] ));
   AND2X1M U65 (.Y(n19), 
	.B(n138), 
	.A(n20));
   AND2X1M U66 (.Y(quotient[4]), 
	.B(n20), 
	.A(\u_div/CryTmp[4][4] ));
   AND3X1M U67 (.Y(n20), 
	.C(n148), 
	.B(n149), 
	.A(n21));
   AND3X1M U68 (.Y(quotient[3]), 
	.C(\u_div/CryTmp[3][5] ), 
	.B(n148), 
	.A(n21));
   AND2X1M U69 (.Y(quotient[2]), 
	.B(n21), 
	.A(\u_div/CryTmp[2][6] ));
   NOR2X1M U70 (.Y(n21), 
	.B(b[7]), 
	.A(b[6]));
   AND2X1M U71 (.Y(quotient[1]), 
	.B(n147), 
	.A(\u_div/CryTmp[1][7] ));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 (
	A, 
	B, 
	CI, 
	DIFF, 
	CO, 
	n157, 
	n134, 
	n136, 
	n138, 
	n149, 
	n148, 
	n139, 
	n147);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] DIFF;
   output CO;
   input n157;
   input n134;
   input n136;
   input n138;
   input n149;
   input n148;
   input n139;
   input n147;

   // Internal wires
   wire n8;
   wire [9:0] carry;

   ADDFX2M U2_7 (.S(DIFF[7]), 
	.CO(carry[8]), 
	.CI(carry[7]), 
	.B(n147), 
	.A(A[7]));
   ADDFX2M U2_1 (.S(DIFF[1]), 
	.CO(carry[2]), 
	.CI(carry[1]), 
	.B(n8), 
	.A(A[1]));
   ADDFX2M U2_5 (.S(DIFF[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(n148), 
	.A(A[5]));
   ADDFX2M U2_4 (.S(DIFF[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(n149), 
	.A(A[4]));
   ADDFX2M U2_3 (.S(DIFF[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(n138), 
	.A(A[3]));
   ADDFX2M U2_2 (.S(DIFF[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(n136), 
	.A(A[2]));
   ADDFX2M U2_6 (.S(DIFF[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(n139), 
	.A(A[6]));
   XNOR2X2M U1 (.Y(DIFF[0]), 
	.B(A[0]), 
	.A(n134));
   NAND2X2M U8 (.Y(carry[1]), 
	.B(n157), 
	.A(B[0]));
   INVX2M U9 (.Y(n8), 
	.A(B[1]));
   CLKINVX1M U12 (.Y(DIFF[8]), 
	.A(carry[8]));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [8:0] A;
   input [8:0] B;
   input CI;
   output [8:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire [8:1] carry;

   ADDFX2M U1_7 (.S(SUM[7]), 
	.CO(SUM[8]), 
	.CI(carry[7]), 
	.B(B[7]), 
	.A(A[7]));
   ADDFX2M U1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.CI(n1), 
	.B(B[1]), 
	.A(A[1]));
   ADDFX2M U1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.CI(carry[5]), 
	.B(B[5]), 
	.A(A[5]));
   ADDFX2M U1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.CI(carry[4]), 
	.B(B[4]), 
	.A(A[4]));
   ADDFX2M U1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.CI(carry[3]), 
	.B(B[3]), 
	.A(A[3]));
   ADDFX2M U1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.CI(carry[2]), 
	.B(B[2]), 
	.A(A[2]));
   ADDFX2M U1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.CI(carry[6]), 
	.B(B[6]), 
	.A(A[6]));
   AND2X2M U1 (.Y(n1), 
	.B(A[0]), 
	.A(B[0]));
   CLKXOR2X2M U2 (.Y(SUM[0]), 
	.B(A[0]), 
	.A(B[0]));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 (
	A, 
	B, 
	CI, 
	SUM, 
	CO);
   input [13:0] A;
   input [13:0] B;
   input CI;
   output [13:0] SUM;
   output CO;

   // Internal wires
   wire n1;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;

   AOI21BX2M U2 (.Y(n1), 
	.B0N(n19), 
	.A1(A[12]), 
	.A0(n18));
   NAND2X2M U3 (.Y(n15), 
	.B(B[7]), 
	.A(A[7]));
   XNOR2X2M U4 (.Y(SUM[7]), 
	.B(n8), 
	.A(A[7]));
   INVX2M U5 (.Y(n8), 
	.A(B[7]));
   XNOR2X2M U6 (.Y(SUM[13]), 
	.B(n1), 
	.A(B[13]));
   INVX2M U7 (.Y(n9), 
	.A(A[6]));
   INVX2M U8 (.Y(SUM[6]), 
	.A(n9));
   BUFX2M U9 (.Y(SUM[0]), 
	.A(A[0]));
   BUFX2M U10 (.Y(SUM[1]), 
	.A(A[1]));
   BUFX2M U11 (.Y(SUM[2]), 
	.A(A[2]));
   BUFX2M U12 (.Y(SUM[3]), 
	.A(A[3]));
   BUFX2M U13 (.Y(SUM[4]), 
	.A(A[4]));
   BUFX2M U14 (.Y(SUM[5]), 
	.A(A[5]));
   XNOR2X1M U15 (.Y(SUM[9]), 
	.B(n11), 
	.A(n10));
   NOR2X1M U16 (.Y(n11), 
	.B(n13), 
	.A(n12));
   CLKXOR2X2M U17 (.Y(SUM[8]), 
	.B(n15), 
	.A(n14));
   NAND2BX1M U18 (.Y(n14), 
	.B(n17), 
	.AN(n16));
   OAI21X1M U19 (.Y(n19), 
	.B0(B[12]), 
	.A1(n18), 
	.A0(A[12]));
   XOR3XLM U20 (.Y(SUM[12]), 
	.C(n18), 
	.B(A[12]), 
	.A(B[12]));
   OAI21BX1M U21 (.Y(n18), 
	.B0N(n22), 
	.A1(n21), 
	.A0(n20));
   XNOR2X1M U22 (.Y(SUM[11]), 
	.B(n23), 
	.A(n21));
   NOR2X1M U23 (.Y(n23), 
	.B(n20), 
	.A(n22));
   NOR2X1M U24 (.Y(n20), 
	.B(A[11]), 
	.A(B[11]));
   AND2X1M U25 (.Y(n22), 
	.B(A[11]), 
	.A(B[11]));
   OA21X1M U26 (.Y(n21), 
	.B0(n26), 
	.A1(n25), 
	.A0(n24));
   CLKXOR2X2M U27 (.Y(SUM[10]), 
	.B(n25), 
	.A(n27));
   AOI2BB1X1M U28 (.Y(n25), 
	.B0(n12), 
	.A1N(n13), 
	.A0N(n10));
   AND2X1M U29 (.Y(n12), 
	.B(A[9]), 
	.A(B[9]));
   NOR2X1M U30 (.Y(n13), 
	.B(A[9]), 
	.A(B[9]));
   OA21X1M U31 (.Y(n10), 
	.B0(n17), 
	.A1(n16), 
	.A0(n15));
   CLKNAND2X2M U32 (.Y(n17), 
	.B(A[8]), 
	.A(B[8]));
   NOR2X1M U33 (.Y(n16), 
	.B(A[8]), 
	.A(B[8]));
   NAND2BX1M U34 (.Y(n27), 
	.B(n26), 
	.AN(n24));
   CLKNAND2X2M U35 (.Y(n26), 
	.B(A[10]), 
	.A(B[10]));
   NOR2X1M U36 (.Y(n24), 
	.B(A[10]), 
	.A(B[10]));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 (
	A, 
	B, 
	TC, 
	PRODUCT, 
	n157, 
	n156, 
	n155, 
	n154, 
	n153, 
	n152, 
	n151, 
	n150, 
	n134, 
	n136, 
	n138, 
	n149, 
	n148, 
	n139, 
	n147);
   input [7:0] A;
   input [7:0] B;
   input TC;
   output [15:0] PRODUCT;
   input n157;
   input n156;
   input n155;
   input n154;
   input n153;
   input n152;
   input n151;
   input n150;
   input n134;
   input n136;
   input n138;
   input n149;
   input n148;
   input n139;
   input n147;

   // Internal wires
   wire \ab[7][7] ;
   wire \ab[7][6] ;
   wire \ab[7][5] ;
   wire \ab[7][4] ;
   wire \ab[7][3] ;
   wire \ab[7][2] ;
   wire \ab[7][1] ;
   wire \ab[7][0] ;
   wire \ab[6][7] ;
   wire \ab[6][6] ;
   wire \ab[6][5] ;
   wire \ab[6][4] ;
   wire \ab[6][3] ;
   wire \ab[6][2] ;
   wire \ab[6][1] ;
   wire \ab[6][0] ;
   wire \ab[5][7] ;
   wire \ab[5][6] ;
   wire \ab[5][5] ;
   wire \ab[5][4] ;
   wire \ab[5][3] ;
   wire \ab[5][2] ;
   wire \ab[5][1] ;
   wire \ab[5][0] ;
   wire \ab[4][7] ;
   wire \ab[4][6] ;
   wire \ab[4][5] ;
   wire \ab[4][4] ;
   wire \ab[4][3] ;
   wire \ab[4][2] ;
   wire \ab[4][1] ;
   wire \ab[4][0] ;
   wire \ab[3][7] ;
   wire \ab[3][6] ;
   wire \ab[3][5] ;
   wire \ab[3][4] ;
   wire \ab[3][3] ;
   wire \ab[3][2] ;
   wire \ab[3][1] ;
   wire \ab[3][0] ;
   wire \ab[2][7] ;
   wire \ab[2][6] ;
   wire \ab[2][5] ;
   wire \ab[2][4] ;
   wire \ab[2][3] ;
   wire \ab[2][2] ;
   wire \ab[2][1] ;
   wire \ab[2][0] ;
   wire \ab[1][7] ;
   wire \ab[1][6] ;
   wire \ab[1][5] ;
   wire \ab[1][4] ;
   wire \ab[1][3] ;
   wire \ab[1][2] ;
   wire \ab[1][1] ;
   wire \ab[1][0] ;
   wire \ab[0][7] ;
   wire \ab[0][6] ;
   wire \ab[0][5] ;
   wire \ab[0][4] ;
   wire \ab[0][3] ;
   wire \ab[0][2] ;
   wire \ab[0][1] ;
   wire \CARRYB[7][6] ;
   wire \CARRYB[7][5] ;
   wire \CARRYB[7][4] ;
   wire \CARRYB[7][3] ;
   wire \CARRYB[7][2] ;
   wire \CARRYB[7][1] ;
   wire \CARRYB[7][0] ;
   wire \CARRYB[6][6] ;
   wire \CARRYB[6][5] ;
   wire \CARRYB[6][4] ;
   wire \CARRYB[6][3] ;
   wire \CARRYB[6][2] ;
   wire \CARRYB[6][1] ;
   wire \CARRYB[6][0] ;
   wire \CARRYB[5][6] ;
   wire \CARRYB[5][5] ;
   wire \CARRYB[5][4] ;
   wire \CARRYB[5][3] ;
   wire \CARRYB[5][2] ;
   wire \CARRYB[5][1] ;
   wire \CARRYB[5][0] ;
   wire \CARRYB[4][6] ;
   wire \CARRYB[4][5] ;
   wire \CARRYB[4][4] ;
   wire \CARRYB[4][3] ;
   wire \CARRYB[4][2] ;
   wire \CARRYB[4][1] ;
   wire \CARRYB[4][0] ;
   wire \CARRYB[3][6] ;
   wire \CARRYB[3][5] ;
   wire \CARRYB[3][4] ;
   wire \CARRYB[3][3] ;
   wire \CARRYB[3][2] ;
   wire \CARRYB[3][1] ;
   wire \CARRYB[3][0] ;
   wire \CARRYB[2][6] ;
   wire \CARRYB[2][5] ;
   wire \CARRYB[2][4] ;
   wire \CARRYB[2][3] ;
   wire \CARRYB[2][2] ;
   wire \CARRYB[2][1] ;
   wire \CARRYB[2][0] ;
   wire \SUMB[7][6] ;
   wire \SUMB[7][5] ;
   wire \SUMB[7][4] ;
   wire \SUMB[7][3] ;
   wire \SUMB[7][2] ;
   wire \SUMB[7][1] ;
   wire \SUMB[7][0] ;
   wire \SUMB[6][6] ;
   wire \SUMB[6][5] ;
   wire \SUMB[6][4] ;
   wire \SUMB[6][3] ;
   wire \SUMB[6][2] ;
   wire \SUMB[6][1] ;
   wire \SUMB[5][6] ;
   wire \SUMB[5][5] ;
   wire \SUMB[5][4] ;
   wire \SUMB[5][3] ;
   wire \SUMB[5][2] ;
   wire \SUMB[5][1] ;
   wire \SUMB[4][6] ;
   wire \SUMB[4][5] ;
   wire \SUMB[4][4] ;
   wire \SUMB[4][3] ;
   wire \SUMB[4][2] ;
   wire \SUMB[4][1] ;
   wire \SUMB[3][6] ;
   wire \SUMB[3][5] ;
   wire \SUMB[3][4] ;
   wire \SUMB[3][3] ;
   wire \SUMB[3][2] ;
   wire \SUMB[3][1] ;
   wire \SUMB[2][6] ;
   wire \SUMB[2][5] ;
   wire \SUMB[2][4] ;
   wire \SUMB[2][3] ;
   wire \SUMB[2][2] ;
   wire \SUMB[2][1] ;
   wire \SUMB[1][6] ;
   wire \SUMB[1][5] ;
   wire \SUMB[1][4] ;
   wire \SUMB[1][3] ;
   wire \SUMB[1][2] ;
   wire \SUMB[1][1] ;
   wire \A1[12] ;
   wire \A1[11] ;
   wire \A1[10] ;
   wire \A1[9] ;
   wire \A1[8] ;
   wire \A1[7] ;
   wire \A1[6] ;
   wire \A1[4] ;
   wire \A1[3] ;
   wire \A1[2] ;
   wire \A1[1] ;
   wire \A1[0] ;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n30;

   ADDFX2M S2_6_5 (.S(\SUMB[6][5] ), 
	.CO(\CARRYB[6][5] ), 
	.CI(\SUMB[5][6] ), 
	.B(\CARRYB[5][5] ), 
	.A(\ab[6][5] ));
   ADDFX2M S2_6_4 (.S(\SUMB[6][4] ), 
	.CO(\CARRYB[6][4] ), 
	.CI(\SUMB[5][5] ), 
	.B(\CARRYB[5][4] ), 
	.A(\ab[6][4] ));
   ADDFX2M S2_5_5 (.S(\SUMB[5][5] ), 
	.CO(\CARRYB[5][5] ), 
	.CI(\SUMB[4][6] ), 
	.B(\CARRYB[4][5] ), 
	.A(\ab[5][5] ));
   ADDFX2M S2_6_3 (.S(\SUMB[6][3] ), 
	.CO(\CARRYB[6][3] ), 
	.CI(\SUMB[5][4] ), 
	.B(\CARRYB[5][3] ), 
	.A(\ab[6][3] ));
   ADDFX2M S2_5_4 (.S(\SUMB[5][4] ), 
	.CO(\CARRYB[5][4] ), 
	.CI(\SUMB[4][5] ), 
	.B(\CARRYB[4][4] ), 
	.A(\ab[5][4] ));
   ADDFX2M S1_6_0 (.S(\A1[4] ), 
	.CO(\CARRYB[6][0] ), 
	.CI(\SUMB[5][1] ), 
	.B(\CARRYB[5][0] ), 
	.A(\ab[6][0] ));
   ADDFX2M S2_6_1 (.S(\SUMB[6][1] ), 
	.CO(\CARRYB[6][1] ), 
	.CI(\SUMB[5][2] ), 
	.B(\CARRYB[5][1] ), 
	.A(\ab[6][1] ));
   ADDFX2M S2_6_2 (.S(\SUMB[6][2] ), 
	.CO(\CARRYB[6][2] ), 
	.CI(\SUMB[5][3] ), 
	.B(\CARRYB[5][2] ), 
	.A(\ab[6][2] ));
   ADDFX2M S2_4_5 (.S(\SUMB[4][5] ), 
	.CO(\CARRYB[4][5] ), 
	.CI(\SUMB[3][6] ), 
	.B(\CARRYB[3][5] ), 
	.A(\ab[4][5] ));
   ADDFX2M S1_5_0 (.S(\A1[3] ), 
	.CO(\CARRYB[5][0] ), 
	.CI(\SUMB[4][1] ), 
	.B(\CARRYB[4][0] ), 
	.A(\ab[5][0] ));
   ADDFX2M S2_5_1 (.S(\SUMB[5][1] ), 
	.CO(\CARRYB[5][1] ), 
	.CI(\SUMB[4][2] ), 
	.B(\CARRYB[4][1] ), 
	.A(\ab[5][1] ));
   ADDFX2M S2_5_2 (.S(\SUMB[5][2] ), 
	.CO(\CARRYB[5][2] ), 
	.CI(\SUMB[4][3] ), 
	.B(\CARRYB[4][2] ), 
	.A(\ab[5][2] ));
   ADDFX2M S2_5_3 (.S(\SUMB[5][3] ), 
	.CO(\CARRYB[5][3] ), 
	.CI(\SUMB[4][4] ), 
	.B(\CARRYB[4][3] ), 
	.A(\ab[5][3] ));
   ADDFX2M S1_4_0 (.S(\A1[2] ), 
	.CO(\CARRYB[4][0] ), 
	.CI(\SUMB[3][1] ), 
	.B(\CARRYB[3][0] ), 
	.A(\ab[4][0] ));
   ADDFX2M S2_4_1 (.S(\SUMB[4][1] ), 
	.CO(\CARRYB[4][1] ), 
	.CI(\SUMB[3][2] ), 
	.B(\CARRYB[3][1] ), 
	.A(\ab[4][1] ));
   ADDFX2M S2_4_2 (.S(\SUMB[4][2] ), 
	.CO(\CARRYB[4][2] ), 
	.CI(\SUMB[3][3] ), 
	.B(\CARRYB[3][2] ), 
	.A(\ab[4][2] ));
   ADDFX2M S2_4_3 (.S(\SUMB[4][3] ), 
	.CO(\CARRYB[4][3] ), 
	.CI(\SUMB[3][4] ), 
	.B(\CARRYB[3][3] ), 
	.A(\ab[4][3] ));
   ADDFX2M S2_4_4 (.S(\SUMB[4][4] ), 
	.CO(\CARRYB[4][4] ), 
	.CI(\SUMB[3][5] ), 
	.B(\CARRYB[3][4] ), 
	.A(\ab[4][4] ));
   ADDFX2M S1_3_0 (.S(\A1[1] ), 
	.CO(\CARRYB[3][0] ), 
	.CI(\SUMB[2][1] ), 
	.B(\CARRYB[2][0] ), 
	.A(\ab[3][0] ));
   ADDFX2M S2_3_1 (.S(\SUMB[3][1] ), 
	.CO(\CARRYB[3][1] ), 
	.CI(\SUMB[2][2] ), 
	.B(\CARRYB[2][1] ), 
	.A(\ab[3][1] ));
   ADDFX2M S2_3_2 (.S(\SUMB[3][2] ), 
	.CO(\CARRYB[3][2] ), 
	.CI(\SUMB[2][3] ), 
	.B(\CARRYB[2][2] ), 
	.A(\ab[3][2] ));
   ADDFX2M S2_3_3 (.S(\SUMB[3][3] ), 
	.CO(\CARRYB[3][3] ), 
	.CI(\SUMB[2][4] ), 
	.B(\CARRYB[2][3] ), 
	.A(\ab[3][3] ));
   ADDFX2M S2_3_4 (.S(\SUMB[3][4] ), 
	.CO(\CARRYB[3][4] ), 
	.CI(\SUMB[2][5] ), 
	.B(\CARRYB[2][4] ), 
	.A(\ab[3][4] ));
   ADDFX2M S2_3_5 (.S(\SUMB[3][5] ), 
	.CO(\CARRYB[3][5] ), 
	.CI(\SUMB[2][6] ), 
	.B(\CARRYB[2][5] ), 
	.A(\ab[3][5] ));
   ADDFX2M S3_6_6 (.S(\SUMB[6][6] ), 
	.CO(\CARRYB[6][6] ), 
	.CI(\ab[5][7] ), 
	.B(\CARRYB[5][6] ), 
	.A(\ab[6][6] ));
   ADDFX2M S3_5_6 (.S(\SUMB[5][6] ), 
	.CO(\CARRYB[5][6] ), 
	.CI(\ab[4][7] ), 
	.B(\CARRYB[4][6] ), 
	.A(\ab[5][6] ));
   ADDFX2M S3_4_6 (.S(\SUMB[4][6] ), 
	.CO(\CARRYB[4][6] ), 
	.CI(\ab[3][7] ), 
	.B(\CARRYB[3][6] ), 
	.A(\ab[4][6] ));
   ADDFX2M S3_3_6 (.S(\SUMB[3][6] ), 
	.CO(\CARRYB[3][6] ), 
	.CI(\ab[2][7] ), 
	.B(\CARRYB[2][6] ), 
	.A(\ab[3][6] ));
   ADDFX2M S3_2_6 (.S(\SUMB[2][6] ), 
	.CO(\CARRYB[2][6] ), 
	.CI(\ab[1][7] ), 
	.B(n8), 
	.A(\ab[2][6] ));
   ADDFX2M S1_2_0 (.S(\A1[0] ), 
	.CO(\CARRYB[2][0] ), 
	.CI(\SUMB[1][1] ), 
	.B(n9), 
	.A(\ab[2][0] ));
   ADDFX2M S2_2_1 (.S(\SUMB[2][1] ), 
	.CO(\CARRYB[2][1] ), 
	.CI(\SUMB[1][2] ), 
	.B(n7), 
	.A(\ab[2][1] ));
   ADDFX2M S2_2_2 (.S(\SUMB[2][2] ), 
	.CO(\CARRYB[2][2] ), 
	.CI(\SUMB[1][3] ), 
	.B(n6), 
	.A(\ab[2][2] ));
   ADDFX2M S2_2_3 (.S(\SUMB[2][3] ), 
	.CO(\CARRYB[2][3] ), 
	.CI(\SUMB[1][4] ), 
	.B(n5), 
	.A(\ab[2][3] ));
   ADDFX2M S2_2_4 (.S(\SUMB[2][4] ), 
	.CO(\CARRYB[2][4] ), 
	.CI(\SUMB[1][5] ), 
	.B(n4), 
	.A(\ab[2][4] ));
   ADDFX2M S2_2_5 (.S(\SUMB[2][5] ), 
	.CO(\CARRYB[2][5] ), 
	.CI(\SUMB[1][6] ), 
	.B(n3), 
	.A(\ab[2][5] ));
   ADDFX2M S5_6 (.S(\SUMB[7][6] ), 
	.CO(\CARRYB[7][6] ), 
	.CI(\ab[6][7] ), 
	.B(\CARRYB[6][6] ), 
	.A(\ab[7][6] ));
   ADDFX2M S4_5 (.S(\SUMB[7][5] ), 
	.CO(\CARRYB[7][5] ), 
	.CI(\SUMB[6][6] ), 
	.B(\CARRYB[6][5] ), 
	.A(\ab[7][5] ));
   ADDFX2M S4_4 (.S(\SUMB[7][4] ), 
	.CO(\CARRYB[7][4] ), 
	.CI(\SUMB[6][5] ), 
	.B(\CARRYB[6][4] ), 
	.A(\ab[7][4] ));
   ADDFX2M S4_3 (.S(\SUMB[7][3] ), 
	.CO(\CARRYB[7][3] ), 
	.CI(\SUMB[6][4] ), 
	.B(\CARRYB[6][3] ), 
	.A(\ab[7][3] ));
   ADDFX2M S4_2 (.S(\SUMB[7][2] ), 
	.CO(\CARRYB[7][2] ), 
	.CI(\SUMB[6][3] ), 
	.B(\CARRYB[6][2] ), 
	.A(\ab[7][2] ));
   ADDFX2M S4_0 (.S(\SUMB[7][0] ), 
	.CO(\CARRYB[7][0] ), 
	.CI(\SUMB[6][1] ), 
	.B(\CARRYB[6][0] ), 
	.A(\ab[7][0] ));
   ADDFX2M S4_1 (.S(\SUMB[7][1] ), 
	.CO(\CARRYB[7][1] ), 
	.CI(\SUMB[6][2] ), 
	.B(\CARRYB[6][1] ), 
	.A(\ab[7][1] ));
   AND2X2M U2 (.Y(n3), 
	.B(\ab[1][5] ), 
	.A(\ab[0][6] ));
   AND2X2M U3 (.Y(n4), 
	.B(\ab[1][4] ), 
	.A(\ab[0][5] ));
   AND2X2M U4 (.Y(n5), 
	.B(\ab[1][3] ), 
	.A(\ab[0][4] ));
   AND2X2M U5 (.Y(n6), 
	.B(\ab[1][2] ), 
	.A(\ab[0][3] ));
   AND2X2M U6 (.Y(n7), 
	.B(\ab[1][1] ), 
	.A(\ab[0][2] ));
   AND2X2M U7 (.Y(n8), 
	.B(\ab[1][6] ), 
	.A(\ab[0][7] ));
   AND2X2M U8 (.Y(n9), 
	.B(\ab[1][0] ), 
	.A(\ab[0][1] ));
   AND2X2M U9 (.Y(n10), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   INVX2M U10 (.Y(n22), 
	.A(\ab[0][6] ));
   CLKXOR2X2M U11 (.Y(\A1[7] ), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   CLKXOR2X2M U12 (.Y(PRODUCT[1]), 
	.B(\ab[0][1] ), 
	.A(\ab[1][0] ));
   CLKXOR2X2M U13 (.Y(\A1[12] ), 
	.B(\ab[7][7] ), 
	.A(\CARRYB[7][6] ));
   CLKXOR2X2M U14 (.Y(\A1[8] ), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   CLKXOR2X2M U15 (.Y(\A1[10] ), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   CLKXOR2X2M U16 (.Y(\A1[9] ), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   CLKXOR2X2M U17 (.Y(\A1[11] ), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   INVX2M U18 (.Y(n23), 
	.A(\ab[0][7] ));
   INVX2M U19 (.Y(n21), 
	.A(\ab[0][5] ));
   INVX2M U20 (.Y(n20), 
	.A(\ab[0][4] ));
   INVX2M U21 (.Y(n19), 
	.A(\ab[0][3] ));
   INVX2M U22 (.Y(n18), 
	.A(\ab[0][2] ));
   XNOR2X2M U23 (.Y(\A1[6] ), 
	.B(n17), 
	.A(\CARRYB[7][0] ));
   INVX2M U24 (.Y(n17), 
	.A(\SUMB[7][1] ));
   AND2X2M U25 (.Y(n11), 
	.B(\SUMB[7][1] ), 
	.A(\CARRYB[7][0] ));
   AND2X2M U26 (.Y(n12), 
	.B(\SUMB[7][2] ), 
	.A(\CARRYB[7][1] ));
   AND2X2M U27 (.Y(n13), 
	.B(\SUMB[7][4] ), 
	.A(\CARRYB[7][3] ));
   AND2X2M U28 (.Y(n14), 
	.B(\SUMB[7][6] ), 
	.A(\CARRYB[7][5] ));
   AND2X2M U29 (.Y(n15), 
	.B(\SUMB[7][3] ), 
	.A(\CARRYB[7][2] ));
   AND2X2M U30 (.Y(n16), 
	.B(\SUMB[7][5] ), 
	.A(\CARRYB[7][4] ));
   XNOR2X2M U31 (.Y(\SUMB[1][6] ), 
	.B(n23), 
	.A(\ab[1][6] ));
   XNOR2X2M U32 (.Y(\SUMB[1][5] ), 
	.B(n22), 
	.A(\ab[1][5] ));
   XNOR2X2M U33 (.Y(\SUMB[1][4] ), 
	.B(n21), 
	.A(\ab[1][4] ));
   XNOR2X2M U34 (.Y(\SUMB[1][3] ), 
	.B(n20), 
	.A(\ab[1][3] ));
   XNOR2X2M U35 (.Y(\SUMB[1][2] ), 
	.B(n19), 
	.A(\ab[1][2] ));
   XNOR2X2M U36 (.Y(\SUMB[1][1] ), 
	.B(n18), 
	.A(\ab[1][1] ));
   INVX2M U52 (.Y(n30), 
	.A(B[1]));
   NOR2X1M U54 (.Y(\ab[7][7] ), 
	.B(n147), 
	.A(n150));
   NOR2X1M U55 (.Y(\ab[7][6] ), 
	.B(n139), 
	.A(n150));
   NOR2X1M U56 (.Y(\ab[7][5] ), 
	.B(n148), 
	.A(n150));
   NOR2X1M U57 (.Y(\ab[7][4] ), 
	.B(n149), 
	.A(n150));
   NOR2X1M U58 (.Y(\ab[7][3] ), 
	.B(n138), 
	.A(n150));
   NOR2X1M U59 (.Y(\ab[7][2] ), 
	.B(n136), 
	.A(n150));
   NOR2X1M U60 (.Y(\ab[7][1] ), 
	.B(n30), 
	.A(n150));
   NOR2X1M U61 (.Y(\ab[7][0] ), 
	.B(n134), 
	.A(n150));
   NOR2X1M U62 (.Y(\ab[6][7] ), 
	.B(n151), 
	.A(n147));
   NOR2X1M U63 (.Y(\ab[6][6] ), 
	.B(n151), 
	.A(n139));
   NOR2X1M U64 (.Y(\ab[6][5] ), 
	.B(n151), 
	.A(n148));
   NOR2X1M U65 (.Y(\ab[6][4] ), 
	.B(n151), 
	.A(n149));
   NOR2X1M U66 (.Y(\ab[6][3] ), 
	.B(n151), 
	.A(n138));
   NOR2X1M U67 (.Y(\ab[6][2] ), 
	.B(n151), 
	.A(n136));
   NOR2X1M U68 (.Y(\ab[6][1] ), 
	.B(n151), 
	.A(n30));
   NOR2X1M U69 (.Y(\ab[6][0] ), 
	.B(n151), 
	.A(n134));
   NOR2X1M U70 (.Y(\ab[5][7] ), 
	.B(n152), 
	.A(n147));
   NOR2X1M U71 (.Y(\ab[5][6] ), 
	.B(n152), 
	.A(n139));
   NOR2X1M U72 (.Y(\ab[5][5] ), 
	.B(n152), 
	.A(n148));
   NOR2X1M U73 (.Y(\ab[5][4] ), 
	.B(n152), 
	.A(n149));
   NOR2X1M U74 (.Y(\ab[5][3] ), 
	.B(n152), 
	.A(n138));
   NOR2X1M U75 (.Y(\ab[5][2] ), 
	.B(n152), 
	.A(n136));
   NOR2X1M U76 (.Y(\ab[5][1] ), 
	.B(n152), 
	.A(n30));
   NOR2X1M U77 (.Y(\ab[5][0] ), 
	.B(n152), 
	.A(n134));
   NOR2X1M U78 (.Y(\ab[4][7] ), 
	.B(n153), 
	.A(n147));
   NOR2X1M U79 (.Y(\ab[4][6] ), 
	.B(n153), 
	.A(n139));
   NOR2X1M U80 (.Y(\ab[4][5] ), 
	.B(n153), 
	.A(n148));
   NOR2X1M U81 (.Y(\ab[4][4] ), 
	.B(n153), 
	.A(n149));
   NOR2X1M U82 (.Y(\ab[4][3] ), 
	.B(n153), 
	.A(n138));
   NOR2X1M U83 (.Y(\ab[4][2] ), 
	.B(n153), 
	.A(n136));
   NOR2X1M U84 (.Y(\ab[4][1] ), 
	.B(n153), 
	.A(n30));
   NOR2X1M U85 (.Y(\ab[4][0] ), 
	.B(n153), 
	.A(n134));
   NOR2X1M U86 (.Y(\ab[3][7] ), 
	.B(n154), 
	.A(n147));
   NOR2X1M U87 (.Y(\ab[3][6] ), 
	.B(n154), 
	.A(n139));
   NOR2X1M U88 (.Y(\ab[3][5] ), 
	.B(n154), 
	.A(n148));
   NOR2X1M U89 (.Y(\ab[3][4] ), 
	.B(n154), 
	.A(n149));
   NOR2X1M U90 (.Y(\ab[3][3] ), 
	.B(n154), 
	.A(n138));
   NOR2X1M U91 (.Y(\ab[3][2] ), 
	.B(n154), 
	.A(n136));
   NOR2X1M U92 (.Y(\ab[3][1] ), 
	.B(n154), 
	.A(n30));
   NOR2X1M U93 (.Y(\ab[3][0] ), 
	.B(n154), 
	.A(n134));
   NOR2X1M U94 (.Y(\ab[2][7] ), 
	.B(n155), 
	.A(n147));
   NOR2X1M U95 (.Y(\ab[2][6] ), 
	.B(n155), 
	.A(n139));
   NOR2X1M U96 (.Y(\ab[2][5] ), 
	.B(n155), 
	.A(n148));
   NOR2X1M U97 (.Y(\ab[2][4] ), 
	.B(n155), 
	.A(n149));
   NOR2X1M U98 (.Y(\ab[2][3] ), 
	.B(n155), 
	.A(n138));
   NOR2X1M U99 (.Y(\ab[2][2] ), 
	.B(n155), 
	.A(n136));
   NOR2X1M U100 (.Y(\ab[2][1] ), 
	.B(n155), 
	.A(n30));
   NOR2X1M U101 (.Y(\ab[2][0] ), 
	.B(n155), 
	.A(n134));
   NOR2X1M U102 (.Y(\ab[1][7] ), 
	.B(n156), 
	.A(n147));
   NOR2X1M U103 (.Y(\ab[1][6] ), 
	.B(n156), 
	.A(n139));
   NOR2X1M U104 (.Y(\ab[1][5] ), 
	.B(n156), 
	.A(n148));
   NOR2X1M U105 (.Y(\ab[1][4] ), 
	.B(n156), 
	.A(n149));
   NOR2X1M U106 (.Y(\ab[1][3] ), 
	.B(n156), 
	.A(n138));
   NOR2X1M U107 (.Y(\ab[1][2] ), 
	.B(n156), 
	.A(n136));
   NOR2X1M U108 (.Y(\ab[1][1] ), 
	.B(n156), 
	.A(n30));
   NOR2X1M U109 (.Y(\ab[1][0] ), 
	.B(n156), 
	.A(n134));
   NOR2X1M U110 (.Y(\ab[0][7] ), 
	.B(n157), 
	.A(n147));
   NOR2X1M U111 (.Y(\ab[0][6] ), 
	.B(n157), 
	.A(n139));
   NOR2X1M U112 (.Y(\ab[0][5] ), 
	.B(n157), 
	.A(n148));
   NOR2X1M U113 (.Y(\ab[0][4] ), 
	.B(n157), 
	.A(n149));
   NOR2X1M U114 (.Y(\ab[0][3] ), 
	.B(n157), 
	.A(n138));
   NOR2X1M U115 (.Y(\ab[0][2] ), 
	.B(n157), 
	.A(n136));
   NOR2X1M U116 (.Y(\ab[0][1] ), 
	.B(n157), 
	.A(n30));
   NOR2X1M U117 (.Y(PRODUCT[0]), 
	.B(n157), 
	.A(n134));
   ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 (.A({ 1'b0,
		\A1[12] ,
		\A1[11] ,
		\A1[10] ,
		\A1[9] ,
		\A1[8] ,
		\A1[7] ,
		\A1[6] ,
		\SUMB[7][0] ,
		\A1[4] ,
		\A1[3] ,
		\A1[2] ,
		\A1[1] ,
		\A1[0]  }), 
	.B({ n10,
		n14,
		n16,
		n13,
		n15,
		n12,
		n11,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0,
		1'b0 }), 
	.CI(1'b0), 
	.SUM({ PRODUCT[15],
		PRODUCT[14],
		PRODUCT[13],
		PRODUCT[12],
		PRODUCT[11],
		PRODUCT[10],
		PRODUCT[9],
		PRODUCT[8],
		PRODUCT[7],
		PRODUCT[6],
		PRODUCT[5],
		PRODUCT[4],
		PRODUCT[3],
		PRODUCT[2] }));
endmodule

module ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 (
	A, 
	B, 
	EN, 
	ALU_FUN, 
	CLK, 
	RST, 
	ALU_OUT, 
	OUT_VALID, 
	test_si, 
	test_se, 
	FE_OFN2_REF_RST_M);
   input [7:0] A;
   input [7:0] B;
   input EN;
   input [3:0] ALU_FUN;
   input CLK;
   input RST;
   output [15:0] ALU_OUT;
   output OUT_VALID;
   input test_si;
   input test_se;
   input FE_OFN2_REF_RST_M;

   // Internal wires
   wire N91;
   wire N92;
   wire N93;
   wire N94;
   wire N95;
   wire N96;
   wire N97;
   wire N98;
   wire N99;
   wire N100;
   wire N101;
   wire N102;
   wire N103;
   wire N104;
   wire N105;
   wire N106;
   wire N107;
   wire N108;
   wire N109;
   wire N110;
   wire N111;
   wire N112;
   wire N113;
   wire N114;
   wire N115;
   wire N116;
   wire N117;
   wire N118;
   wire N119;
   wire N120;
   wire N121;
   wire N122;
   wire N123;
   wire N124;
   wire N125;
   wire N126;
   wire N127;
   wire N128;
   wire N129;
   wire N130;
   wire N131;
   wire N132;
   wire N157;
   wire N158;
   wire N159;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire [15:0] ALU_OUT_Comb;

   SDFFRHQX1M \ALU_OUT_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[0]), 
	.D(ALU_OUT_Comb[0]), 
	.CK(CLK));
   OAI2BB1X2M U23 (.Y(n64), 
	.B0(n118), 
	.A1N(n122), 
	.A0N(n145));
   OAI2BB1X2M U24 (.Y(n65), 
	.B0(n118), 
	.A1N(n116), 
	.A0N(n117));
   NOR2BX2M U25 (.Y(n54), 
	.B(n142), 
	.AN(n123));
   AND2X2M U26 (.Y(n59), 
	.B(n122), 
	.A(n116));
   NOR2BX2M U27 (.Y(n48), 
	.B(n146), 
	.AN(n52));
   AND2X2M U28 (.Y(n67), 
	.B(n122), 
	.A(n123));
   INVX2M U29 (.Y(n146), 
	.A(EN));
   NOR2X2M U31 (.Y(n58), 
	.B(n142), 
	.A(n124));
   INVX2M U32 (.Y(n142), 
	.A(n117));
   INVX2M U33 (.Y(n143), 
	.A(n108));
   OAI2BB1X2M U34 (.Y(ALU_OUT_Comb[9]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N118));
   OAI2BB1X2M U35 (.Y(ALU_OUT_Comb[10]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N119));
   OAI2BB1X2M U36 (.Y(ALU_OUT_Comb[11]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N120));
   OAI2BB1X2M U37 (.Y(ALU_OUT_Comb[12]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N121));
   OAI2BB1X2M U38 (.Y(ALU_OUT_Comb[13]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N122));
   OAI2BB1X2M U39 (.Y(ALU_OUT_Comb[14]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N123));
   OAI2BB1X2M U40 (.Y(ALU_OUT_Comb[15]), 
	.B0(n49), 
	.A1N(n48), 
	.A0N(N124));
   INVX2M U41 (.Y(n145), 
	.A(n124));
   NOR3BX2M U42 (.Y(n66), 
	.C(ALU_FUN[2]), 
	.B(n144), 
	.AN(n122));
   NOR3X2M U43 (.Y(n52), 
	.C(n144), 
	.B(ALU_FUN[2]), 
	.A(n142));
   NOR2X2M U44 (.Y(n123), 
	.B(ALU_FUN[1]), 
	.A(ALU_FUN[2]));
   AND3X2M U45 (.Y(n63), 
	.C(ALU_FUN[3]), 
	.B(n141), 
	.A(n123));
   NAND3X2M U46 (.Y(n53), 
	.C(ALU_FUN[3]), 
	.B(n141), 
	.A(n145));
   NAND2X2M U47 (.Y(n124), 
	.B(ALU_FUN[1]), 
	.A(ALU_FUN[2]));
   INVX2M U48 (.Y(n141), 
	.A(ALU_FUN[0]));
   NOR2X2M U49 (.Y(n122), 
	.B(ALU_FUN[3]), 
	.A(n141));
   NOR2X2M U50 (.Y(n117), 
	.B(ALU_FUN[0]), 
	.A(ALU_FUN[3]));
   NAND3X2M U51 (.Y(n108), 
	.C(n116), 
	.B(ALU_FUN[0]), 
	.A(ALU_FUN[3]));
   INVX2M U52 (.Y(n144), 
	.A(ALU_FUN[1]));
   NAND2X2M U53 (.Y(n49), 
	.B(n140), 
	.A(EN));
   NAND3X2M U54 (.Y(n118), 
	.C(ALU_FUN[3]), 
	.B(ALU_FUN[0]), 
	.A(n123));
   AND2X2M U55 (.Y(n116), 
	.B(n144), 
	.A(ALU_FUN[2]));
   AND4X2M U56 (.Y(n107), 
	.D(n141), 
	.C(ALU_FUN[3]), 
	.B(n116), 
	.A(N159));
   INVX2M U57 (.Y(n139), 
	.A(B[6]));
   OAI222X1M U58 (.Y(n71), 
	.C1(n152), 
	.C0(n53), 
	.B1(n73), 
	.B0(B[6]), 
	.A1(n139), 
	.A0(n72));
   AOI221XLM U59 (.Y(n73), 
	.C0(n58), 
	.B1(n151), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[6]));
   AOI221XLM U60 (.Y(n72), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[6]), 
	.A1(n151), 
	.A0(n63));
   AOI31X2M U61 (.Y(ALU_OUT_Comb[2]), 
	.B0(n146), 
	.A2(n94), 
	.A1(n93), 
	.A0(n92));
   AOI22X1M U62 (.Y(n92), 
	.B1(n54), 
	.B0(N93), 
	.A1(n67), 
	.A0(N102));
   AOI221XLM U63 (.Y(n94), 
	.C0(n95), 
	.B1(n155), 
	.B0(n58), 
	.A1(n143), 
	.A0(A[3]));
   AOI222X1M U64 (.Y(n93), 
	.C1(n66), 
	.C0(N127), 
	.B1(n59), 
	.B0(A[2]), 
	.A1(n52), 
	.A0(N111));
   AOI31X2M U65 (.Y(ALU_OUT_Comb[3]), 
	.B0(n146), 
	.A2(n88), 
	.A1(n87), 
	.A0(n86));
   AOI22X1M U66 (.Y(n86), 
	.B1(n54), 
	.B0(N94), 
	.A1(n67), 
	.A0(N103));
   AOI221XLM U67 (.Y(n88), 
	.C0(n89), 
	.B1(n154), 
	.B0(n58), 
	.A1(n143), 
	.A0(A[4]));
   AOI222X1M U68 (.Y(n87), 
	.C1(n66), 
	.C0(N128), 
	.B1(n59), 
	.B0(A[3]), 
	.A1(n52), 
	.A0(N112));
   AOI31X2M U69 (.Y(ALU_OUT_Comb[4]), 
	.B0(n146), 
	.A2(n82), 
	.A1(n81), 
	.A0(n80));
   AOI22X1M U70 (.Y(n80), 
	.B1(n54), 
	.B0(N95), 
	.A1(n67), 
	.A0(N104));
   AOI221XLM U71 (.Y(n82), 
	.C0(n83), 
	.B1(n153), 
	.B0(n58), 
	.A1(A[5]), 
	.A0(n143));
   AOI222X1M U72 (.Y(n81), 
	.C1(n66), 
	.C0(N129), 
	.B1(n59), 
	.B0(A[4]), 
	.A1(n52), 
	.A0(N113));
   AOI31X2M U73 (.Y(ALU_OUT_Comb[5]), 
	.B0(n146), 
	.A2(n76), 
	.A1(n75), 
	.A0(n74));
   AOI22X1M U74 (.Y(n74), 
	.B1(n54), 
	.B0(N96), 
	.A1(n67), 
	.A0(N105));
   AOI221XLM U75 (.Y(n76), 
	.C0(n77), 
	.B1(n152), 
	.B0(n58), 
	.A1(A[6]), 
	.A0(n143));
   AOI222X1M U76 (.Y(n75), 
	.C1(n66), 
	.C0(N130), 
	.B1(n59), 
	.B0(A[5]), 
	.A1(n52), 
	.A0(N114));
   AOI31X2M U77 (.Y(ALU_OUT_Comb[6]), 
	.B0(n146), 
	.A2(n70), 
	.A1(n69), 
	.A0(n68));
   AOI22X1M U78 (.Y(n68), 
	.B1(n54), 
	.B0(N97), 
	.A1(n67), 
	.A0(N106));
   AOI221XLM U79 (.Y(n70), 
	.C0(n71), 
	.B1(n151), 
	.B0(n58), 
	.A1(A[7]), 
	.A0(n143));
   AOI222X1M U80 (.Y(n69), 
	.C1(n66), 
	.C0(N131), 
	.B1(A[6]), 
	.B0(n59), 
	.A1(n52), 
	.A0(N115));
   AOI31X2M U81 (.Y(ALU_OUT_Comb[7]), 
	.B0(n146), 
	.A2(n57), 
	.A1(n56), 
	.A0(n55));
   AOI22X1M U82 (.Y(n56), 
	.B1(n52), 
	.B0(N116), 
	.A1(n66), 
	.A0(N132));
   AOI22X1M U83 (.Y(n55), 
	.B1(n54), 
	.B0(N98), 
	.A1(n67), 
	.A0(N107));
   AOI221XLM U84 (.Y(n57), 
	.C0(n60), 
	.B1(A[7]), 
	.B0(n59), 
	.A1(n150), 
	.A0(n58));
   AOI31X2M U85 (.Y(ALU_OUT_Comb[0]), 
	.B0(n146), 
	.A2(n112), 
	.A1(n111), 
	.A0(n110));
   AOI22X1M U86 (.Y(n110), 
	.B1(n54), 
	.B0(N91), 
	.A1(n67), 
	.A0(N100));
   AOI211X2M U87 (.Y(n112), 
	.C0(n114), 
	.B0(n113), 
	.A1(n157), 
	.A0(n58));
   AOI222X1M U88 (.Y(n111), 
	.C1(n66), 
	.C0(N125), 
	.B1(n59), 
	.B0(A[0]), 
	.A1(n52), 
	.A0(N109));
   AOI31X2M U89 (.Y(ALU_OUT_Comb[1]), 
	.B0(n146), 
	.A2(n100), 
	.A1(n99), 
	.A0(n98));
   AOI211X2M U90 (.Y(n100), 
	.C0(n102), 
	.B0(n101), 
	.A1(n143), 
	.A0(A[2]));
   AOI222X1M U91 (.Y(n99), 
	.C1(n59), 
	.C0(A[1]), 
	.B1(n156), 
	.B0(n58), 
	.A1(n66), 
	.A0(N126));
   AOI222X1M U92 (.Y(n98), 
	.C1(n67), 
	.C0(N101), 
	.B1(n52), 
	.B0(N110), 
	.A1(n54), 
	.A0(N92));
   INVX2M U93 (.Y(n140), 
	.A(n109));
   AOI211X2M U94 (.Y(n109), 
	.C0(n64), 
	.B0(n58), 
	.A1(n67), 
	.A0(N108));
   AOI21X2M U95 (.Y(ALU_OUT_Comb[8]), 
	.B0(n146), 
	.A1(n51), 
	.A0(n50));
   AOI21X2M U96 (.Y(n50), 
	.B0(n140), 
	.A1(n54), 
	.A0(N99));
   AOI2BB2XLM U97 (.Y(n51), 
	.B1(n52), 
	.B0(N117), 
	.A1N(n53), 
	.A0N(n150));
   INVX2M U99 (.Y(n156), 
	.A(A[1]));
   INVX2M U100 (.Y(n157), 
	.A(A[0]));
   INVX2M U101 (.Y(n151), 
	.A(A[6]));
   INVX2M U102 (.Y(n150), 
	.A(A[7]));
   INVX2M U103 (.Y(n154), 
	.A(A[3]));
   INVX2M U104 (.Y(n155), 
	.A(A[2]));
   INVX2M U105 (.Y(n152), 
	.A(A[5]));
   INVX2M U106 (.Y(n153), 
	.A(A[4]));
   OAI222X1M U107 (.Y(n95), 
	.C1(n156), 
	.C0(n53), 
	.B1(n97), 
	.B0(B[2]), 
	.A1(n136), 
	.A0(n96));
   AOI221XLM U108 (.Y(n97), 
	.C0(n58), 
	.B1(n155), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[2]));
   AOI221XLM U109 (.Y(n96), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[2]), 
	.A1(n155), 
	.A0(n63));
   OAI222X1M U110 (.Y(n89), 
	.C1(n155), 
	.C0(n53), 
	.B1(n91), 
	.B0(B[3]), 
	.A1(n138), 
	.A0(n90));
   AOI221XLM U111 (.Y(n91), 
	.C0(n58), 
	.B1(n154), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[3]));
   AOI221XLM U112 (.Y(n90), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[3]), 
	.A1(n154), 
	.A0(n63));
   OAI222X1M U113 (.Y(n83), 
	.C1(n154), 
	.C0(n53), 
	.B1(n85), 
	.B0(B[4]), 
	.A1(n149), 
	.A0(n84));
   INVX2M U114 (.Y(n149), 
	.A(B[4]));
   AOI221XLM U115 (.Y(n85), 
	.C0(n58), 
	.B1(n153), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[4]));
   AOI221XLM U116 (.Y(n84), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[4]), 
	.A1(n153), 
	.A0(n63));
   OAI222X1M U117 (.Y(n77), 
	.C1(n153), 
	.C0(n53), 
	.B1(n79), 
	.B0(B[5]), 
	.A1(n148), 
	.A0(n78));
   INVX2M U118 (.Y(n148), 
	.A(B[5]));
   AOI221XLM U119 (.Y(n79), 
	.C0(n58), 
	.B1(n152), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[5]));
   AOI221XLM U120 (.Y(n78), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[5]), 
	.A1(n152), 
	.A0(n63));
   OAI222X1M U121 (.Y(n60), 
	.C1(n151), 
	.C0(n53), 
	.B1(n62), 
	.B0(B[7]), 
	.A1(n147), 
	.A0(n61));
   INVX2M U122 (.Y(n147), 
	.A(B[7]));
   AOI221XLM U123 (.Y(n62), 
	.C0(n58), 
	.B1(n150), 
	.B0(n64), 
	.A1(A[7]), 
	.A0(n63));
   AOI221XLM U124 (.Y(n61), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[7]), 
	.A1(n150), 
	.A0(n63));
   INVX2M U125 (.Y(n135), 
	.A(n31));
   OAI2B2X1M U126 (.Y(n114), 
	.B1(n156), 
	.B0(n108), 
	.A1N(B[0]), 
	.A0(n115));
   AOI221XLM U127 (.Y(n115), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[0]), 
	.A1(n157), 
	.A0(n63));
   OAI2B2X1M U128 (.Y(n102), 
	.B1(n157), 
	.B0(n53), 
	.A1N(B[1]), 
	.A0(n103));
   AOI221XLM U129 (.Y(n103), 
	.C0(n59), 
	.B1(n65), 
	.B0(A[1]), 
	.A1(n156), 
	.A0(n63));
   INVX2M U130 (.Y(n137), 
	.A(n42));
   OAI21X2M U131 (.Y(n113), 
	.B0(n120), 
	.A1(n119), 
	.A0(B[0]));
   AOI31X2M U132 (.Y(n120), 
	.B0(n107), 
	.A2(n121), 
	.A1(ALU_FUN[3]), 
	.A0(N157));
   AOI221XLM U133 (.Y(n119), 
	.C0(n58), 
	.B1(n157), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[0]));
   NOR3X2M U134 (.Y(n121), 
	.C(ALU_FUN[0]), 
	.B(ALU_FUN[2]), 
	.A(n144));
   OAI21X2M U135 (.Y(n101), 
	.B0(n105), 
	.A1(n104), 
	.A0(B[1]));
   AOI31X2M U136 (.Y(n105), 
	.B0(n107), 
	.A2(n106), 
	.A1(ALU_FUN[3]), 
	.A0(N158));
   AOI221XLM U137 (.Y(n104), 
	.C0(n58), 
	.B1(n156), 
	.B0(n64), 
	.A1(n63), 
	.A0(A[1]));
   NOR3X2M U138 (.Y(n106), 
	.C(n144), 
	.B(ALU_FUN[2]), 
	.A(n141));
   INVX2M U147 (.Y(n134), 
	.A(B[0]));
   INVX2M U148 (.Y(n136), 
	.A(B[2]));
   INVX2M U149 (.Y(n138), 
	.A(B[3]));
   NOR2X1M U150 (.Y(n130), 
	.B(B[7]), 
	.A(n150));
   NAND2BX1M U151 (.Y(n46), 
	.B(A[4]), 
	.AN(B[4]));
   NAND2BX1M U152 (.Y(n35), 
	.B(B[4]), 
	.AN(A[4]));
   CLKNAND2X2M U153 (.Y(n125), 
	.B(n35), 
	.A(n46));
   NOR2X1M U154 (.Y(n43), 
	.B(A[3]), 
	.A(n138));
   NOR2X1M U155 (.Y(n34), 
	.B(A[2]), 
	.A(n136));
   NOR2X1M U156 (.Y(n31), 
	.B(A[0]), 
	.A(n134));
   CLKNAND2X2M U157 (.Y(n45), 
	.B(n136), 
	.A(A[2]));
   NAND2BX1M U158 (.Y(n40), 
	.B(n45), 
	.AN(n34));
   AOI21X1M U159 (.Y(n32), 
	.B0(B[1]), 
	.A1(n156), 
	.A0(n31));
   AOI211X1M U160 (.Y(n33), 
	.C0(n32), 
	.B0(n40), 
	.A1(n135), 
	.A0(A[1]));
   CLKNAND2X2M U161 (.Y(n44), 
	.B(n138), 
	.A(A[3]));
   OAI31X1M U162 (.Y(n36), 
	.B0(n44), 
	.A2(n33), 
	.A1(n34), 
	.A0(n43));
   NAND2BX1M U163 (.Y(n128), 
	.B(B[5]), 
	.AN(A[5]));
   OAI211X1M U164 (.Y(n37), 
	.C0(n128), 
	.B0(n35), 
	.A1(n36), 
	.A0(n125));
   NAND2BX1M U165 (.Y(n47), 
	.B(A[5]), 
	.AN(B[5]));
   XNOR2X1M U166 (.Y(n127), 
	.B(B[6]), 
	.A(A[6]));
   AOI32X1M U167 (.Y(n38), 
	.B1(n151), 
	.B0(B[6]), 
	.A2(n127), 
	.A1(n47), 
	.A0(n37));
   CLKNAND2X2M U168 (.Y(n131), 
	.B(n150), 
	.A(B[7]));
   OAI21X1M U169 (.Y(N159), 
	.B0(n131), 
	.A1(n38), 
	.A0(n130));
   CLKNAND2X2M U170 (.Y(n41), 
	.B(n134), 
	.A(A[0]));
   OA21X1M U171 (.Y(n39), 
	.B0(B[1]), 
	.A1(n156), 
	.A0(n41));
   AOI211X1M U172 (.Y(n42), 
	.C0(n39), 
	.B0(n40), 
	.A1(n156), 
	.A0(n41));
   AOI31X1M U173 (.Y(n126), 
	.B0(n43), 
	.A2(n44), 
	.A1(n45), 
	.A0(n137));
   OAI2B11X1M U174 (.Y(n129), 
	.C0(n46), 
	.B0(n47), 
	.A1N(n126), 
	.A0(n125));
   AOI32X1M U175 (.Y(n132), 
	.B1(n139), 
	.B0(A[6]), 
	.A2(n127), 
	.A1(n128), 
	.A0(n129));
   AOI2B1X1M U176 (.Y(n133), 
	.B0(n130), 
	.A1N(n132), 
	.A0(n131));
   CLKINVX1M U177 (.Y(N158), 
	.A(n133));
   NOR2X1M U178 (.Y(N157), 
	.B(N158), 
	.A(N159));
   ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 (.a({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.b({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.quotient({ N132,
		N131,
		N130,
		N129,
		N128,
		N127,
		N126,
		N125 }), 
	.n157(n157), 
	.n156(n156), 
	.n155(n155), 
	.n154(n154), 
	.n153(n153), 
	.n152(n152), 
	.n151(n151), 
	.n134(n134), 
	.n136(n136), 
	.n138(n138), 
	.n149(n149), 
	.n148(n148), 
	.n139(n139), 
	.n147(n147));
   ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.DIFF({ N108,
		N107,
		N106,
		N105,
		N104,
		N103,
		N102,
		N101,
		N100 }), 
	.n157(n157), 
	.n134(n134), 
	.n136(n136), 
	.n138(n138), 
	.n149(n149), 
	.n148(n148), 
	.n139(n139), 
	.n147(n147));
   ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 (.A({ 1'b0,
		A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ 1'b0,
		B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.CI(1'b0), 
	.SUM({ N99,
		N98,
		N97,
		N96,
		N95,
		N94,
		N93,
		N92,
		N91 }));
   ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 (.A({ A[7],
		A[6],
		A[5],
		A[4],
		A[3],
		A[2],
		A[1],
		A[0] }), 
	.B({ B[7],
		B[6],
		B[5],
		B[4],
		B[3],
		B[2],
		B[1],
		B[0] }), 
	.TC(1'b0), 
	.PRODUCT({ N124,
		N123,
		N122,
		N121,
		N120,
		N119,
		N118,
		N117,
		N116,
		N115,
		N114,
		N113,
		N112,
		N111,
		N110,
		N109 }), 
	.n157(n157), 
	.n156(n156), 
	.n155(n155), 
	.n154(n154), 
	.n153(n153), 
	.n152(n152), 
	.n151(n151), 
	.n150(n150), 
	.n134(n134), 
	.n136(n136), 
	.n138(n138), 
	.n149(n149), 
	.n148(n148), 
	.n139(n139), 
	.n147(n147));
   SDFFRQX1M OUT_VALID_reg (.SI(ALU_OUT[15]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(OUT_VALID), 
	.D(EN), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[15]  (.SI(ALU_OUT[14]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[15]), 
	.D(ALU_OUT_Comb[15]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[14]  (.SI(ALU_OUT[13]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[14]), 
	.D(ALU_OUT_Comb[14]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[13]  (.SI(ALU_OUT[12]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[13]), 
	.D(ALU_OUT_Comb[13]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[12]  (.SI(ALU_OUT[11]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[12]), 
	.D(ALU_OUT_Comb[12]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[11]  (.SI(ALU_OUT[10]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[11]), 
	.D(ALU_OUT_Comb[11]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[10]  (.SI(ALU_OUT[9]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[10]), 
	.D(ALU_OUT_Comb[10]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[9]  (.SI(ALU_OUT[8]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[9]), 
	.D(ALU_OUT_Comb[9]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[8]  (.SI(ALU_OUT[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[8]), 
	.D(ALU_OUT_Comb[8]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[7]  (.SI(ALU_OUT[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[7]), 
	.D(ALU_OUT_Comb[7]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[6]  (.SI(ALU_OUT[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[6]), 
	.D(ALU_OUT_Comb[6]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[5]  (.SI(ALU_OUT[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[5]), 
	.D(ALU_OUT_Comb[5]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[4]  (.SI(ALU_OUT[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[4]), 
	.D(ALU_OUT_Comb[4]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[3]  (.SI(ALU_OUT[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[3]), 
	.D(ALU_OUT_Comb[3]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[2]  (.SI(ALU_OUT[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[2]), 
	.D(ALU_OUT_Comb[2]), 
	.CK(CLK));
   SDFFRQX1M \ALU_OUT_reg[1]  (.SI(ALU_OUT[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(ALU_OUT[1]), 
	.D(ALU_OUT_Comb[1]), 
	.CK(CLK));
endmodule

module SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_test_1 (
	CLK, 
	RST, 
	ALU_OUT, 
	OUT_Valid, 
	RdData, 
	RdData_Valid, 
	RX_P_Data, 
	RX_D_VLD, 
	FIFO_FULL, 
	ALU_FUN, 
	EN, 
	CLK_EN, 
	Address, 
	WrEN, 
	RdEn, 
	WrData, 
	TX_P_Data, 
	TX_D_VLD, 
	clk_div_en, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN1_REF_RST_M, 
	FE_OFN2_REF_RST_M);
   input CLK;
   input RST;
   input [15:0] ALU_OUT;
   input OUT_Valid;
   input [7:0] RdData;
   input RdData_Valid;
   input [7:0] RX_P_Data;
   input RX_D_VLD;
   input FIFO_FULL;
   output [3:0] ALU_FUN;
   output EN;
   output CLK_EN;
   output [3:0] Address;
   output WrEN;
   output RdEn;
   output [7:0] WrData;
   output [7:0] TX_P_Data;
   output TX_D_VLD;
   output clk_div_en;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN1_REF_RST_M;
   input FE_OFN2_REF_RST_M;

   // Internal wires
   wire LTIE_LTIELO_NET;
   wire n1;
   wire n19;
   wire n20;
   wire n21;
   wire n23;
   wire n24;
   wire n27;
   wire n36;
   wire n37;
   wire n48;
   wire n54;
   wire n55;
   wire n57;
   wire n58;
   wire n64;
   wire n66;
   wire n67;
   wire n69;
   wire n70;
   wire n71;
   wire n74;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n90;
   wire n91;
   wire n92;
   wire n94;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n143;
   wire n145;
   wire n147;
   wire n149;
   wire n151;
   wire n153;
   wire n155;
   wire n157;
   wire n159;
   wire n161;
   wire n163;
   wire n165;
   wire n167;
   wire n169;
   wire n171;
   wire n173;
   wire n175;
   wire n177;
   wire n179;
   wire n181;
   wire n183;
   wire n185;
   wire n187;
   wire n189;
   wire n191;
   wire n193;
   wire n195;
   wire n197;
   wire n199;
   wire n201;
   wire n203;
   wire n205;
   wire n207;
   wire n209;
   wire n211;
   wire n213;
   wire n215;
   wire n217;
   wire n219;
   wire n221;
   wire n223;
   wire n225;
   wire n227;
   wire n229;
   wire n231;
   wire n233;
   wire n235;
   wire n237;
   wire n247;
   wire n248;
   wire n249;
   wire n250;
   wire n251;
   wire n252;
   wire n253;
   wire n254;
   wire n255;
   wire n256;
   wire n257;
   wire n258;
   wire n259;
   wire n133;
   wire n135;
   wire n136;
   wire n137;
   wire n260;
   wire n261;
   wire n262;
   wire n263;
   wire n264;
   wire n265;
   wire n266;
   wire n267;
   wire n268;
   wire n269;
   wire n270;
   wire n271;
   wire n272;
   wire n273;
   wire n274;
   wire n275;
   wire n276;
   wire n277;
   wire n278;
   wire n279;
   wire n280;
   wire n281;
   wire n282;
   wire n283;
   wire n284;
   wire n285;
   wire n286;
   wire n288;
   wire n289;
   wire n290;
   wire n291;
   wire n292;
   wire n293;
   wire n294;
   wire n295;
   wire n296;
   wire n297;
   wire n298;
   wire n299;
   wire n300;
   wire n301;
   wire n302;
   wire n303;
   wire n304;
   wire n305;
   wire n306;
   wire n307;
   wire n308;
   wire n309;
   wire n310;
   wire n311;
   wire n312;
   wire n313;
   wire n314;
   wire n315;
   wire n316;
   wire n317;
   wire n318;
   wire n319;
   wire n321;
   wire n322;
   wire n323;
   wire n324;
   wire n325;
   wire n326;
   wire n327;
   wire n328;
   wire n331;
   wire n333;
   wire n4;
   wire [4:0] state;
   wire [7:0] data_reg;
   wire [7:0] alu_a_reg;
   wire [7:0] alu_b_reg;
   wire [15:0] alu_res_reg;
   wire [7:0] rd_data_reg;

   assign test_so2 = state[4] ;

   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRX1M \addr_reg_reg[3]  (.SI(n326), 
	.SE(test_se), 
	.RN(RST), 
	.QN(n307), 
	.Q(n325), 
	.D(n250), 
	.CK(CLK));
   SDFFRX1M \addr_reg_reg[2]  (.SI(n327), 
	.SE(test_se), 
	.RN(RST), 
	.QN(n308), 
	.Q(n326), 
	.D(n249), 
	.CK(CLK));
   SDFFRX1M \addr_reg_reg[1]  (.SI(n328), 
	.SE(test_se), 
	.RN(RST), 
	.QN(n309), 
	.Q(n327), 
	.D(n248), 
	.CK(CLK));
   SDFFRX1M \addr_reg_reg[0]  (.SI(test_si1), 
	.SE(test_se), 
	.RN(RST), 
	.QN(n310), 
	.Q(n328), 
	.D(n247), 
	.CK(CLK));
   SDFFRX1M \alu_fun_reg_reg[3]  (.SI(n322), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.QN(n281), 
	.Q(n321), 
	.D(n253), 
	.CK(CLK));
   SDFFRX1M \alu_fun_reg_reg[2]  (.SI(n323), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.QN(n280), 
	.Q(n322), 
	.D(n252), 
	.CK(CLK));
   SDFFRX1M \alu_fun_reg_reg[1]  (.SI(n324), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.QN(n279), 
	.Q(n323), 
	.D(n251), 
	.CK(CLK));
   SDFFRX1M \alu_fun_reg_reg[0]  (.SI(alu_b_reg[7]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.QN(n282), 
	.Q(n324), 
	.D(n254), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[7]  (.SI(alu_b_reg[6]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[7]), 
	.D(n235), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[6]  (.SI(alu_b_reg[5]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[6]), 
	.D(n233), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[5]  (.SI(test_si2), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[5]), 
	.D(n231), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[3]  (.SI(alu_b_reg[2]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[3]), 
	.D(n227), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[2]  (.SI(alu_b_reg[1]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[2]), 
	.D(n225), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[1]  (.SI(alu_b_reg[0]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[1]), 
	.D(n223), 
	.CK(CLK));
   SDFFRQX1M \alu_b_reg_reg[0]  (.SI(alu_a_reg[7]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[0]), 
	.D(n237), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[7]  (.SI(data_reg[6]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[7]), 
	.D(n157), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[6]  (.SI(data_reg[5]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[6]), 
	.D(n155), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[5]  (.SI(data_reg[4]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[5]), 
	.D(n153), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[4]  (.SI(data_reg[3]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[4]), 
	.D(n151), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[3]  (.SI(data_reg[2]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[3]), 
	.D(n149), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[2]  (.SI(data_reg[1]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[2]), 
	.D(n147), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[1]  (.SI(data_reg[0]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[1]), 
	.D(n145), 
	.CK(CLK));
   SDFFRQX1M \data_reg_reg[0]  (.SI(alu_res_reg[15]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(data_reg[0]), 
	.D(n143), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[7]  (.SI(alu_a_reg[6]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_a_reg[7]), 
	.D(n219), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[6]  (.SI(alu_a_reg[5]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_a_reg[6]), 
	.D(n217), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[5]  (.SI(alu_a_reg[4]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_a_reg[5]), 
	.D(n215), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[4]  (.SI(alu_a_reg[3]), 
	.SE(n333), 
	.RN(RST), 
	.Q(alu_a_reg[4]), 
	.D(n213), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[3]  (.SI(alu_a_reg[2]), 
	.SE(n333), 
	.RN(RST), 
	.Q(alu_a_reg[3]), 
	.D(n211), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[2]  (.SI(alu_a_reg[1]), 
	.SE(n333), 
	.RN(RST), 
	.Q(alu_a_reg[2]), 
	.D(n209), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[1]  (.SI(alu_a_reg[0]), 
	.SE(n333), 
	.RN(RST), 
	.Q(alu_a_reg[1]), 
	.D(n207), 
	.CK(CLK));
   SDFFRQX1M \alu_a_reg_reg[0]  (.SI(n325), 
	.SE(n333), 
	.RN(RST), 
	.Q(alu_a_reg[0]), 
	.D(n221), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[7]  (.SI(rd_data_reg[6]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[7]), 
	.D(n203), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[6]  (.SI(rd_data_reg[5]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[6]), 
	.D(n201), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[5]  (.SI(rd_data_reg[4]), 
	.SE(n333), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(rd_data_reg[5]), 
	.D(n199), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[4]  (.SI(rd_data_reg[3]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[4]), 
	.D(n197), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[3]  (.SI(rd_data_reg[2]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[3]), 
	.D(n195), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[2]  (.SI(rd_data_reg[1]), 
	.SE(n333), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(rd_data_reg[2]), 
	.D(n193), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[1]  (.SI(rd_data_reg[0]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[1]), 
	.D(n191), 
	.CK(CLK));
   SDFFRQX1M \rd_data_reg_reg[0]  (.SI(data_reg[7]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(rd_data_reg[0]), 
	.D(n205), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[15]  (.SI(alu_res_reg[14]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_res_reg[15]), 
	.D(n187), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[14]  (.SI(alu_res_reg[13]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[14]), 
	.D(n185), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[13]  (.SI(alu_res_reg[12]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[13]), 
	.D(n183), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[12]  (.SI(alu_res_reg[11]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[12]), 
	.D(n181), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[11]  (.SI(alu_res_reg[10]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[11]), 
	.D(n179), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[10]  (.SI(alu_res_reg[9]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[10]), 
	.D(n177), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[9]  (.SI(alu_res_reg[8]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[9]), 
	.D(n175), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[8]  (.SI(alu_res_reg[7]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[8]), 
	.D(n173), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[7]  (.SI(alu_res_reg[6]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[7]), 
	.D(n171), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[6]  (.SI(alu_res_reg[5]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[6]), 
	.D(n169), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[5]  (.SI(alu_res_reg[4]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[5]), 
	.D(n167), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[4]  (.SI(alu_res_reg[3]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[4]), 
	.D(n165), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[3]  (.SI(alu_res_reg[2]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[3]), 
	.D(n163), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[2]  (.SI(alu_res_reg[1]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[2]), 
	.D(n161), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[1]  (.SI(alu_res_reg[0]), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[1]), 
	.D(n159), 
	.CK(CLK));
   SDFFRQX1M \alu_res_reg_reg[0]  (.SI(n321), 
	.SE(test_se), 
	.RN(FE_OFN1_REF_RST_M), 
	.Q(alu_res_reg[0]), 
	.D(n189), 
	.CK(CLK));
   SDFFRQX1M \state_reg[4]  (.SI(state[3]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(state[4]), 
	.D(n255), 
	.CK(CLK));
   SDFFRQX1M \state_reg[2]  (.SI(state[1]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(state[2]), 
	.D(n257), 
	.CK(CLK));
   SDFFRQX1M \state_reg[1]  (.SI(state[0]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(state[1]), 
	.D(n258), 
	.CK(CLK));
   SDFFRQX1M \state_reg[0]  (.SI(rd_data_reg[7]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(state[0]), 
	.D(n259), 
	.CK(CLK));
   SDFFRQX1M \state_reg[3]  (.SI(state[2]), 
	.SE(test_se), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(state[3]), 
	.D(n256), 
	.CK(CLK));
   NOR2X2M U66 (.Y(Address[2]), 
	.B(n308), 
	.A(n126));
   NOR2X2M U67 (.Y(ALU_FUN[2]), 
	.B(n280), 
	.A(n125));
   NOR2X2M U68 (.Y(ALU_FUN[0]), 
	.B(n282), 
	.A(n125));
   NOR3X2M U69 (.Y(n20), 
	.C(n274), 
	.B(state[4]), 
	.A(state[2]));
   NOR3X2M U70 (.Y(n108), 
	.C(n278), 
	.B(state[4]), 
	.A(n274));
   OAI221X1M U71 (.Y(n67), 
	.C0(n105), 
	.B1(n96), 
	.B0(RdData_Valid), 
	.A1(n104), 
	.A0(RX_D_VLD));
   NOR3X2M U72 (.Y(n109), 
	.C(state[1]), 
	.B(state[4]), 
	.A(state[2]));
   OAI21X2M U73 (.Y(n58), 
	.B0(RX_D_VLD), 
	.A1(n264), 
	.A0(n64));
   OAI21X2M U74 (.Y(n48), 
	.B0(RX_D_VLD), 
	.A1(n55), 
	.A0(n54));
   NOR2X2M U76 (.Y(RdEn), 
	.B(n275), 
	.A(n262));
   NOR2BX2M U77 (.Y(n126), 
	.B(RdEn), 
	.AN(n113));
   NOR2X2M U78 (.Y(n55), 
	.B(n271), 
	.A(n275));
   INVX2M U79 (.Y(n272), 
	.A(n96));
   INVX2M U80 (.Y(n264), 
	.A(n70));
   INVX2M U81 (.Y(n260), 
	.A(n75));
   INVX2M U82 (.Y(n266), 
	.A(n78));
   NOR2X2M U83 (.Y(n125), 
	.B(EN), 
	.A(n267));
   INVX2M U84 (.Y(EN), 
	.A(n88));
   NOR3BX2M U85 (.Y(n100), 
	.C(n92), 
	.B(n55), 
	.AN(n36));
   OAI21X2M U86 (.Y(Address[0]), 
	.B0(n87), 
	.A1(n310), 
	.A0(n126));
   NOR3X2M U87 (.Y(n107), 
	.C(n69), 
	.B(n115), 
	.A(n116));
   NOR2BX2M U88 (.Y(n116), 
	.B(n262), 
	.AN(n108));
   NOR2X2M U89 (.Y(Address[1]), 
	.B(n309), 
	.A(n126));
   OAI221X1M U90 (.Y(n256), 
	.C0(n36), 
	.B1(n276), 
	.B0(n135), 
	.A1(n67), 
	.A0(n71));
   NOR4X1M U91 (.Y(n71), 
	.D(n75), 
	.C(n74), 
	.B(n64), 
	.A(n266));
   NOR4BX1M U92 (.Y(n74), 
	.D(n313), 
	.C(n317), 
	.B(n77), 
	.AN(n76));
   NAND4X2M U93 (.Y(n77), 
	.D(n314), 
	.C(n315), 
	.B(n318), 
	.A(n319));
   OAI22X1M U94 (.Y(n259), 
	.B1(n67), 
	.B0(n97), 
	.A1(n268), 
	.A0(n135));
   NOR4BX1M U95 (.Y(n97), 
	.D(n272), 
	.C(n267), 
	.B(n98), 
	.AN(n87));
   NAND2X2M U96 (.Y(n98), 
	.B(n100), 
	.A(n99));
   AOI31X2M U97 (.Y(n99), 
	.B0(n270), 
	.A2(n102), 
	.A1(n319), 
	.A0(n269));
   NOR2X2M U98 (.Y(Address[3]), 
	.B(n307), 
	.A(n126));
   INVX2M U99 (.Y(n135), 
	.A(n67));
   NAND2X2M U100 (.Y(n113), 
	.B(n20), 
	.A(n128));
   AO21XLM U101 (.Y(n92), 
	.B0(n64), 
	.A1(n19), 
	.A0(n20));
   NOR2X2M U102 (.Y(TX_D_VLD), 
	.B(n107), 
	.A(FIFO_FULL));
   INVX2M U103 (.Y(n275), 
	.A(n127));
   INVX2M U104 (.Y(n262), 
	.A(n128));
   INVX2M U105 (.Y(n271), 
	.A(n19));
   NOR3X2M U107 (.Y(n115), 
	.C(n124), 
	.B(n274), 
	.A(n271));
   AOI32X1M U108 (.Y(n88), 
	.B1(n127), 
	.B0(n110), 
	.A2(n19), 
	.A1(n274), 
	.A0(n277));
   INVX2M U109 (.Y(n277), 
	.A(n124));
   NOR2X2M U110 (.Y(n110), 
	.B(n276), 
	.A(n268));
   OAI222X1M U111 (.Y(WrData[0]), 
	.C1(n113), 
	.C0(n306), 
	.B1(n86), 
	.B0(n291), 
	.A1(n87), 
	.A0(n283));
   OAI222X1M U112 (.Y(WrData[1]), 
	.C1(n113), 
	.C0(n305), 
	.B1(n86), 
	.B0(n298), 
	.A1(n87), 
	.A0(n290));
   OAI222X1M U113 (.Y(WrData[2]), 
	.C1(n113), 
	.C0(n304), 
	.B1(n86), 
	.B0(n297), 
	.A1(n87), 
	.A0(n289));
   OAI222X1M U114 (.Y(WrData[3]), 
	.C1(n113), 
	.C0(n303), 
	.B1(n86), 
	.B0(n296), 
	.A1(n87), 
	.A0(n288));
   OAI222X1M U115 (.Y(WrData[4]), 
	.C1(n113), 
	.C0(n302), 
	.B1(n86), 
	.B0(n295), 
	.A1(n87), 
	.A0(n331));
   OAI222X1M U116 (.Y(WrData[5]), 
	.C1(n113), 
	.C0(n301), 
	.B1(n86), 
	.B0(n294), 
	.A1(n87), 
	.A0(n286));
   OAI222X1M U117 (.Y(WrData[6]), 
	.C1(n113), 
	.C0(n300), 
	.B1(n86), 
	.B0(n293), 
	.A1(n87), 
	.A0(n285));
   OAI222X1M U118 (.Y(WrData[7]), 
	.C1(n113), 
	.C0(n299), 
	.B1(n86), 
	.B0(n292), 
	.A1(n87), 
	.A0(n284));
   NAND4X2M U119 (.Y(n75), 
	.D(n88), 
	.C(n87), 
	.B(n86), 
	.A(n85));
   OAI22X1M U120 (.Y(n143), 
	.B1(n306), 
	.B0(n273), 
	.A1(n319), 
	.A0(n1));
   OAI22X1M U121 (.Y(n145), 
	.B1(n305), 
	.B0(n273), 
	.A1(n318), 
	.A0(n1));
   OAI22X1M U122 (.Y(n147), 
	.B1(n304), 
	.B0(n273), 
	.A1(n317), 
	.A0(n1));
   OAI22X1M U123 (.Y(n149), 
	.B1(n303), 
	.B0(n273), 
	.A1(n316), 
	.A0(n1));
   OAI22X1M U124 (.Y(n151), 
	.B1(n302), 
	.B0(n273), 
	.A1(n315), 
	.A0(n1));
   OAI22X1M U125 (.Y(n153), 
	.B1(n301), 
	.B0(n273), 
	.A1(n314), 
	.A0(n1));
   OAI22X1M U126 (.Y(n155), 
	.B1(n300), 
	.B0(n273), 
	.A1(n313), 
	.A0(n1));
   OAI22X1M U127 (.Y(n157), 
	.B1(n299), 
	.B0(n273), 
	.A1(n312), 
	.A0(n1));
   NOR2X2M U128 (.Y(n133), 
	.B(n23), 
	.A(n311));
   NOR2X2M U129 (.Y(n21), 
	.B(n23), 
	.A(n311));
   NAND2X2M U130 (.Y(n57), 
	.B(n276), 
	.A(n109));
   OAI22X1M U131 (.Y(n247), 
	.B1(n310), 
	.B0(n136), 
	.A1(n48), 
	.A0(n319));
   OAI22X1M U132 (.Y(n248), 
	.B1(n309), 
	.B0(n136), 
	.A1(n48), 
	.A0(n318));
   OAI22X1M U133 (.Y(n249), 
	.B1(n308), 
	.B0(n136), 
	.A1(n48), 
	.A0(n317));
   OAI22X1M U134 (.Y(n250), 
	.B1(n307), 
	.B0(n136), 
	.A1(n48), 
	.A0(n316));
   OAI22X1M U135 (.Y(n254), 
	.B1(n282), 
	.B0(n263), 
	.A1(n58), 
	.A0(n319));
   OAI22X1M U136 (.Y(n253), 
	.B1(n281), 
	.B0(n263), 
	.A1(n58), 
	.A0(n316));
   OAI22X1M U137 (.Y(n252), 
	.B1(n280), 
	.B0(n263), 
	.A1(n58), 
	.A0(n317));
   OAI22X1M U138 (.Y(n251), 
	.B1(n279), 
	.B0(n263), 
	.A1(n58), 
	.A0(n318));
   NAND2X2M U139 (.Y(n86), 
	.B(n20), 
	.A(n110));
   NAND2X2M U140 (.Y(n96), 
	.B(n19), 
	.A(n108));
   INVX2M U141 (.Y(n273), 
	.A(n1));
   NAND2X2M U142 (.Y(n70), 
	.B(n110), 
	.A(n108));
   NAND2X2M U143 (.Y(n78), 
	.B(n109), 
	.A(n110));
   INVX2M U144 (.Y(n136), 
	.A(n48));
   INVX2M U145 (.Y(n263), 
	.A(n58));
   INVX2M U146 (.Y(n267), 
	.A(n23));
   INVX2M U147 (.Y(n270), 
	.A(n85));
   NAND3X2M U148 (.Y(WrEN), 
	.C(n113), 
	.B(n87), 
	.A(n86));
   INVX2M U149 (.Y(n269), 
	.A(n83));
   OAI22X1M U150 (.Y(n207), 
	.B1(n298), 
	.B0(n27), 
	.A1(n137), 
	.A0(n318));
   OAI22X1M U151 (.Y(n209), 
	.B1(n297), 
	.B0(n27), 
	.A1(n137), 
	.A0(n317));
   OAI22X1M U152 (.Y(n211), 
	.B1(n296), 
	.B0(n27), 
	.A1(n137), 
	.A0(n316));
   OAI22X1M U153 (.Y(n213), 
	.B1(n295), 
	.B0(n27), 
	.A1(n137), 
	.A0(n315));
   OAI22X1M U154 (.Y(n215), 
	.B1(n294), 
	.B0(n27), 
	.A1(n137), 
	.A0(n314));
   OAI22X1M U155 (.Y(n217), 
	.B1(n293), 
	.B0(n27), 
	.A1(n137), 
	.A0(n313));
   OAI22X1M U156 (.Y(n219), 
	.B1(n292), 
	.B0(n27), 
	.A1(n137), 
	.A0(n312));
   OAI22X1M U157 (.Y(n221), 
	.B1(n291), 
	.B0(n27), 
	.A1(n137), 
	.A0(n319));
   OAI22X1M U158 (.Y(n223), 
	.B1(n290), 
	.B0(n265), 
	.A1(n37), 
	.A0(n318));
   OAI22X1M U159 (.Y(n225), 
	.B1(n289), 
	.B0(n265), 
	.A1(n37), 
	.A0(n317));
   OAI22X1M U160 (.Y(n227), 
	.B1(n288), 
	.B0(n265), 
	.A1(n37), 
	.A0(n316));
   OAI22X1M U161 (.Y(n229), 
	.B1(n331), 
	.B0(n265), 
	.A1(n37), 
	.A0(n315));
   OAI22X1M U162 (.Y(n231), 
	.B1(n286), 
	.B0(n265), 
	.A1(n37), 
	.A0(n314));
   OAI22X1M U163 (.Y(n233), 
	.B1(n285), 
	.B0(n265), 
	.A1(n37), 
	.A0(n313));
   OAI22X1M U164 (.Y(n235), 
	.B1(n284), 
	.B0(n265), 
	.A1(n37), 
	.A0(n312));
   OAI22X1M U165 (.Y(n237), 
	.B1(n283), 
	.B0(n265), 
	.A1(n37), 
	.A0(n319));
   INVX2M U166 (.Y(n265), 
	.A(n37));
   INVX2M U167 (.Y(n137), 
	.A(n27));
   NOR2X2M U168 (.Y(ALU_FUN[1]), 
	.B(n279), 
	.A(n125));
   NOR2X2M U169 (.Y(ALU_FUN[3]), 
	.B(n281), 
	.A(n125));
   AOI22X1M U170 (.Y(n105), 
	.B1(n311), 
	.B0(n267), 
	.A1(n261), 
	.A0(FIFO_FULL));
   AND4X2M U171 (.Y(n104), 
	.D(n57), 
	.C(n78), 
	.B(n100), 
	.A(n70));
   INVX2M U172 (.Y(n261), 
	.A(n107));
   NOR3BX2M U173 (.Y(n64), 
	.C(n276), 
	.B(state[0]), 
	.AN(n20));
   NOR3X2M U174 (.Y(n127), 
	.C(n278), 
	.B(state[4]), 
	.A(state[1]));
   NOR2X2M U175 (.Y(n19), 
	.B(state[3]), 
	.A(state[0]));
   NAND3X2M U176 (.Y(n87), 
	.C(n127), 
	.B(n268), 
	.A(state[3]));
   OAI22X1M U177 (.Y(n257), 
	.B1(n67), 
	.B0(n80), 
	.A1(n278), 
	.A0(n135));
   NOR4X1M U178 (.Y(n80), 
	.D(n272), 
	.C(RdEn), 
	.B(n55), 
	.A(n81));
   OAI31X1M U179 (.Y(n81), 
	.B0(n260), 
	.A2(n83), 
	.A1(n315), 
	.A0(n82));
   NAND3X2M U180 (.Y(n82), 
	.C(RX_P_Data[0]), 
	.B(n313), 
	.A(n317));
   OAI22X1M U181 (.Y(n258), 
	.B1(n67), 
	.B0(n90), 
	.A1(n274), 
	.A0(n135));
   NOR4X1M U182 (.Y(n90), 
	.D(n94), 
	.C(n270), 
	.B(n92), 
	.A(n91));
   NOR3X2M U183 (.Y(n94), 
	.C(state[1]), 
	.B(state[4]), 
	.A(n262));
   NAND4BX1M U184 (.Y(n91), 
	.D(n88), 
	.C(n78), 
	.B(n96), 
	.AN(n69));
   NOR3X4M U186 (.Y(n69), 
	.C(n262), 
	.B(state[1]), 
	.A(n124));
   NOR2X2M U187 (.Y(n128), 
	.B(state[3]), 
	.A(n268));
   NAND2X2M U188 (.Y(n124), 
	.B(n278), 
	.A(state[4]));
   INVX2M U189 (.Y(n268), 
	.A(state[0]));
   OAI2BB2X1M U190 (.Y(n255), 
	.B1(n67), 
	.B0(n66), 
	.A1N(state[4]), 
	.A0N(n67));
   NOR3X2M U191 (.Y(n66), 
	.C(n69), 
	.B(n267), 
	.A(n264));
   INVX2M U192 (.Y(n274), 
	.A(state[1]));
   INVX2M U193 (.Y(n276), 
	.A(state[3]));
   INVX2M U194 (.Y(n278), 
	.A(state[2]));
   NOR2X2M U195 (.Y(TX_P_Data[0]), 
	.B(n123), 
	.A(FIFO_FULL));
   AOI222X1M U196 (.Y(n123), 
	.C1(rd_data_reg[0]), 
	.C0(n116), 
	.B1(alu_res_reg[0]), 
	.B0(n69), 
	.A1(alu_res_reg[8]), 
	.A0(n115));
   NOR2X2M U197 (.Y(TX_P_Data[1]), 
	.B(n122), 
	.A(FIFO_FULL));
   AOI222X1M U198 (.Y(n122), 
	.C1(rd_data_reg[1]), 
	.C0(n116), 
	.B1(alu_res_reg[1]), 
	.B0(n69), 
	.A1(alu_res_reg[9]), 
	.A0(n115));
   NOR2X2M U199 (.Y(TX_P_Data[2]), 
	.B(n121), 
	.A(FIFO_FULL));
   AOI222X1M U200 (.Y(n121), 
	.C1(rd_data_reg[2]), 
	.C0(n116), 
	.B1(alu_res_reg[2]), 
	.B0(n69), 
	.A1(alu_res_reg[10]), 
	.A0(n115));
   NOR2X2M U201 (.Y(TX_P_Data[3]), 
	.B(n120), 
	.A(FIFO_FULL));
   AOI222X1M U202 (.Y(n120), 
	.C1(rd_data_reg[3]), 
	.C0(n116), 
	.B1(alu_res_reg[3]), 
	.B0(n69), 
	.A1(alu_res_reg[11]), 
	.A0(n115));
   NOR2X2M U203 (.Y(TX_P_Data[4]), 
	.B(n119), 
	.A(FIFO_FULL));
   AOI222X1M U204 (.Y(n119), 
	.C1(rd_data_reg[4]), 
	.C0(n116), 
	.B1(alu_res_reg[4]), 
	.B0(n69), 
	.A1(alu_res_reg[12]), 
	.A0(n115));
   NOR2X2M U205 (.Y(TX_P_Data[5]), 
	.B(n118), 
	.A(FIFO_FULL));
   AOI222X1M U206 (.Y(n118), 
	.C1(rd_data_reg[5]), 
	.C0(n116), 
	.B1(alu_res_reg[5]), 
	.B0(n69), 
	.A1(alu_res_reg[13]), 
	.A0(n115));
   NOR2X2M U207 (.Y(TX_P_Data[6]), 
	.B(n117), 
	.A(FIFO_FULL));
   AOI222X1M U208 (.Y(n117), 
	.C1(rd_data_reg[6]), 
	.C0(n116), 
	.B1(alu_res_reg[6]), 
	.B0(n69), 
	.A1(alu_res_reg[14]), 
	.A0(n115));
   NOR2X2M U209 (.Y(TX_P_Data[7]), 
	.B(n114), 
	.A(FIFO_FULL));
   AOI222X1M U210 (.Y(n114), 
	.C1(rd_data_reg[7]), 
	.C0(n116), 
	.B1(alu_res_reg[7]), 
	.B0(n69), 
	.A1(alu_res_reg[15]), 
	.A0(n115));
   NOR2X2M U211 (.Y(n54), 
	.B(n57), 
	.A(n268));
   NOR4X1M U212 (.Y(n76), 
	.D(state[0]), 
	.C(n316), 
	.B(n312), 
	.A(n57));
   NAND3X2M U213 (.Y(n1), 
	.C(RX_D_VLD), 
	.B(n20), 
	.A(n19));
   NAND3X2M U214 (.Y(n23), 
	.C(state[3]), 
	.B(n268), 
	.A(n108));
   NAND4X2M U215 (.Y(n85), 
	.D(n103), 
	.C(n76), 
	.B(RX_P_Data[4]), 
	.A(RX_P_Data[6]));
   NOR4X1M U216 (.Y(n103), 
	.D(n317), 
	.C(n319), 
	.B(RX_P_Data[1]), 
	.A(RX_P_Data[5]));
   INVX2M U217 (.Y(n317), 
	.A(RX_P_Data[2]));
   INVX2M U218 (.Y(n319), 
	.A(RX_P_Data[0]));
   NAND3X2M U219 (.Y(n36), 
	.C(n109), 
	.B(n268), 
	.A(state[3]));
   INVX2M U220 (.Y(n316), 
	.A(RX_P_Data[3]));
   NAND3X2M U221 (.Y(n83), 
	.C(n76), 
	.B(RX_P_Data[1]), 
	.A(RX_P_Data[5]));
   INVX2M U283 (.Y(n312), 
	.A(RX_P_Data[7]));
   AND2X2M U284 (.Y(n24), 
	.B(n272), 
	.A(RdData_Valid));
   AO2B2X2M U285 (.Y(n191), 
	.B1(n24), 
	.B0(RdData[1]), 
	.A1N(n24), 
	.A0(rd_data_reg[1]));
   AO2B2X2M U286 (.Y(n193), 
	.B1(n24), 
	.B0(RdData[2]), 
	.A1N(n24), 
	.A0(rd_data_reg[2]));
   AO2B2X2M U287 (.Y(n195), 
	.B1(n24), 
	.B0(RdData[3]), 
	.A1N(n24), 
	.A0(rd_data_reg[3]));
   AO2B2X2M U288 (.Y(n197), 
	.B1(n24), 
	.B0(RdData[4]), 
	.A1N(n24), 
	.A0(rd_data_reg[4]));
   AO2B2X2M U289 (.Y(n199), 
	.B1(n24), 
	.B0(RdData[5]), 
	.A1N(n24), 
	.A0(rd_data_reg[5]));
   AO2B2X2M U290 (.Y(n201), 
	.B1(n24), 
	.B0(RdData[6]), 
	.A1N(n24), 
	.A0(rd_data_reg[6]));
   AO2B2X2M U291 (.Y(n203), 
	.B1(n24), 
	.B0(RdData[7]), 
	.A1N(n24), 
	.A0(rd_data_reg[7]));
   AO2B2X2M U292 (.Y(n205), 
	.B1(n24), 
	.B0(RdData[0]), 
	.A1N(n24), 
	.A0(rd_data_reg[0]));
   AO2B2X2M U293 (.Y(n159), 
	.B1(n133), 
	.B0(ALU_OUT[1]), 
	.A1N(n133), 
	.A0(alu_res_reg[1]));
   AO2B2X2M U294 (.Y(n161), 
	.B1(n21), 
	.B0(ALU_OUT[2]), 
	.A1N(n21), 
	.A0(alu_res_reg[2]));
   AO2B2X2M U295 (.Y(n163), 
	.B1(n133), 
	.B0(ALU_OUT[3]), 
	.A1N(n133), 
	.A0(alu_res_reg[3]));
   AO2B2X2M U296 (.Y(n165), 
	.B1(n21), 
	.B0(ALU_OUT[4]), 
	.A1N(n21), 
	.A0(alu_res_reg[4]));
   AO2B2X2M U297 (.Y(n167), 
	.B1(n133), 
	.B0(ALU_OUT[5]), 
	.A1N(n133), 
	.A0(alu_res_reg[5]));
   AO2B2X2M U298 (.Y(n169), 
	.B1(n21), 
	.B0(ALU_OUT[6]), 
	.A1N(n21), 
	.A0(alu_res_reg[6]));
   AO2B2X2M U299 (.Y(n171), 
	.B1(n133), 
	.B0(ALU_OUT[7]), 
	.A1N(n133), 
	.A0(alu_res_reg[7]));
   AO2B2X2M U300 (.Y(n173), 
	.B1(n21), 
	.B0(ALU_OUT[8]), 
	.A1N(n21), 
	.A0(alu_res_reg[8]));
   AO2B2X2M U301 (.Y(n175), 
	.B1(n133), 
	.B0(ALU_OUT[9]), 
	.A1N(n133), 
	.A0(alu_res_reg[9]));
   AO2B2X2M U302 (.Y(n177), 
	.B1(n21), 
	.B0(ALU_OUT[10]), 
	.A1N(n21), 
	.A0(alu_res_reg[10]));
   AO2B2X2M U303 (.Y(n179), 
	.B1(n133), 
	.B0(ALU_OUT[11]), 
	.A1N(n133), 
	.A0(alu_res_reg[11]));
   AO2B2X2M U304 (.Y(n181), 
	.B1(n21), 
	.B0(ALU_OUT[12]), 
	.A1N(n21), 
	.A0(alu_res_reg[12]));
   AO2B2X2M U305 (.Y(n183), 
	.B1(n133), 
	.B0(ALU_OUT[13]), 
	.A1N(n133), 
	.A0(alu_res_reg[13]));
   AO2B2X2M U306 (.Y(n185), 
	.B1(n21), 
	.B0(ALU_OUT[14]), 
	.A1N(n21), 
	.A0(alu_res_reg[14]));
   AO2B2X2M U307 (.Y(n187), 
	.B1(n133), 
	.B0(ALU_OUT[15]), 
	.A1N(n133), 
	.A0(alu_res_reg[15]));
   AO2B2X2M U308 (.Y(n189), 
	.B1(n21), 
	.B0(ALU_OUT[0]), 
	.A1N(n21), 
	.A0(alu_res_reg[0]));
   NAND2X2M U309 (.Y(n37), 
	.B(RX_D_VLD), 
	.A(n266));
   NOR3X2M U310 (.Y(n102), 
	.C(RX_P_Data[4]), 
	.B(RX_P_Data[6]), 
	.A(RX_P_Data[2]));
   INVX2M U311 (.Y(n318), 
	.A(RX_P_Data[1]));
   INVX2M U312 (.Y(n313), 
	.A(RX_P_Data[6]));
   INVX2M U313 (.Y(n314), 
	.A(RX_P_Data[5]));
   INVX2M U314 (.Y(n315), 
	.A(RX_P_Data[4]));
   NOR2BX2M U316 (.Y(n27), 
	.B(n36), 
	.AN(RX_D_VLD));
   INVX2M U317 (.Y(n306), 
	.A(data_reg[0]));
   INVX2M U318 (.Y(n305), 
	.A(data_reg[1]));
   INVX2M U319 (.Y(n304), 
	.A(data_reg[2]));
   INVX2M U320 (.Y(n303), 
	.A(data_reg[3]));
   INVX2M U321 (.Y(n302), 
	.A(data_reg[4]));
   INVX2M U322 (.Y(n301), 
	.A(data_reg[5]));
   INVX2M U323 (.Y(n300), 
	.A(data_reg[6]));
   INVX2M U324 (.Y(n299), 
	.A(data_reg[7]));
   INVX2M U325 (.Y(n291), 
	.A(alu_a_reg[0]));
   INVX2M U326 (.Y(n298), 
	.A(alu_a_reg[1]));
   INVX2M U327 (.Y(n297), 
	.A(alu_a_reg[2]));
   INVX2M U328 (.Y(n296), 
	.A(alu_a_reg[3]));
   INVX2M U329 (.Y(n295), 
	.A(alu_a_reg[4]));
   INVX2M U330 (.Y(n294), 
	.A(alu_a_reg[5]));
   INVX2M U331 (.Y(n293), 
	.A(alu_a_reg[6]));
   INVX2M U332 (.Y(n292), 
	.A(alu_a_reg[7]));
   INVX2M U333 (.Y(n283), 
	.A(alu_b_reg[0]));
   INVX2M U334 (.Y(n290), 
	.A(alu_b_reg[1]));
   INVX2M U335 (.Y(n289), 
	.A(alu_b_reg[2]));
   INVX2M U336 (.Y(n288), 
	.A(alu_b_reg[3]));
   INVX2M U338 (.Y(n286), 
	.A(alu_b_reg[5]));
   INVX2M U339 (.Y(n285), 
	.A(alu_b_reg[6]));
   INVX2M U340 (.Y(n284), 
	.A(alu_b_reg[7]));
   INVX2M U341 (.Y(n311), 
	.A(OUT_Valid));
   INVX2M U342 (.Y(CLK_EN), 
	.A(n125));
   INVXLM U343 (.Y(n331), 
	.A(test_so1));
   DLY1X4M U345 (.Y(n333), 
	.A(test_se));
   SDFFRHQX1M \alu_b_reg_reg[4]  (.SI(alu_b_reg[3]), 
	.SE(n333), 
	.RN(FE_OFN2_REF_RST_M), 
	.Q(alu_b_reg[4]), 
	.D(n229), 
	.CK(CLK));
   INVX2M U3 (.Y(clk_div_en), 
	.A(LTIE_LTIELO_NET));
   INVXLM U5 (.Y(n4), 
	.A(alu_b_reg[4]));
   INVX2M U6 (.Y(test_so1), 
	.A(n4));
endmodule

module DF_SYNC_WIDTH4_test_0 (
	dest_clk, 
	dest_rst_n, 
	async_in, 
	sync_out, 
	test_si, 
	test_se);
   input dest_clk;
   input dest_rst_n;
   input [3:0] async_in;
   output [3:0] sync_out;
   input test_si;
   input test_se;

   // Internal wires
   wire [3:0] sync_ff1;

   SDFFRQX1M \sync_out_reg[3]  (.SI(sync_out[2]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[3]), 
	.D(sync_ff1[3]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_out_reg[2]  (.SI(sync_out[1]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[2]), 
	.D(sync_ff1[2]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_out_reg[1]  (.SI(sync_out[0]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[1]), 
	.D(sync_ff1[1]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_out_reg[0]  (.SI(sync_ff1[3]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[0]), 
	.D(sync_ff1[0]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_ff1_reg[3]  (.SI(sync_ff1[2]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[3]), 
	.D(async_in[3]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_ff1_reg[2]  (.SI(sync_ff1[1]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[2]), 
	.D(async_in[2]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_ff1_reg[1]  (.SI(sync_ff1[0]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[1]), 
	.D(async_in[1]), 
	.CK(dest_clk));
   SDFFRQX1M \sync_ff1_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[0]), 
	.D(async_in[0]), 
	.CK(dest_clk));
endmodule

module DF_SYNC_WIDTH4_test_1 (
	dest_clk, 
	dest_rst_n, 
	async_in, 
	sync_out, 
	test_si, 
	test_se);
   input dest_clk;
   input dest_rst_n;
   input [3:0] async_in;
   output [3:0] sync_out;
   input test_si;
   input test_se;

   // Internal wires
   wire [3:0] sync_ff1;

   SDFFRQX2M \sync_out_reg[3]  (.SI(sync_out[2]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[3]), 
	.D(sync_ff1[3]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_out_reg[2]  (.SI(sync_out[1]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[2]), 
	.D(sync_ff1[2]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_out_reg[1]  (.SI(sync_out[0]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[1]), 
	.D(sync_ff1[1]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_out_reg[0]  (.SI(sync_ff1[3]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_out[0]), 
	.D(sync_ff1[0]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_ff1_reg[3]  (.SI(sync_ff1[2]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[3]), 
	.D(async_in[3]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_ff1_reg[2]  (.SI(sync_ff1[1]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[2]), 
	.D(async_in[2]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_ff1_reg[1]  (.SI(sync_ff1[0]), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[1]), 
	.D(async_in[1]), 
	.CK(dest_clk));
   SDFFRQX2M \sync_ff1_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(dest_rst_n), 
	.Q(sync_ff1[0]), 
	.D(async_in[0]), 
	.CK(dest_clk));
endmodule

module FIFO_WR_ADDR_WIDTH3_test_1 (
	wclk, 
	wrst_n, 
	winc, 
	wq2_rptr, 
	waddr, 
	wptr, 
	wfull, 
	test_si, 
	test_se, 
	winc_valid);
   input wclk;
   input wrst_n;
   input winc;
   input [3:0] wq2_rptr;
   output [2:0] waddr;
   output [3:0] wptr;
   output wfull;
   input test_si;
   input test_se;
   input winc_valid;

   // Internal wires
   wire \wbin[3] ;
   wire wfull_next;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire [3:0] wbin_next;
   wire [2:0] wptr_next;

   SDFFRQX1M \wbin_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(waddr[0]), 
	.D(wbin_next[0]), 
	.CK(wclk));
   SDFFRQX1M \wbin_reg[1]  (.SI(waddr[0]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(waddr[1]), 
	.D(wbin_next[1]), 
	.CK(wclk));
   SDFFRQX1M \wbin_reg[2]  (.SI(waddr[1]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(waddr[2]), 
	.D(wbin_next[2]), 
	.CK(wclk));
   SDFFRQX1M \wptr_reg[3]  (.SI(wptr[2]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[3]), 
	.D(wbin_next[3]), 
	.CK(wclk));
   SDFFRQX1M \wbin_reg[3]  (.SI(waddr[2]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(\wbin[3] ), 
	.D(wbin_next[3]), 
	.CK(wclk));
   SDFFRQX1M \wptr_reg[0]  (.SI(wfull), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[0]), 
	.D(wptr_next[0]), 
	.CK(wclk));
   SDFFRQX1M \wptr_reg[2]  (.SI(wptr[1]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[2]), 
	.D(wptr_next[2]), 
	.CK(wclk));
   SDFFRQX1M \wptr_reg[1]  (.SI(wptr[0]), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wptr[1]), 
	.D(wptr_next[1]), 
	.CK(wclk));
   SDFFRQX1M wfull_reg (.SI(\wbin[3] ), 
	.SE(test_se), 
	.RN(wrst_n), 
	.Q(wfull), 
	.D(wfull_next), 
	.CK(wclk));
   CLKXOR2X2M U21 (.Y(wptr_next[0]), 
	.B(wbin_next[0]), 
	.A(wbin_next[1]));
   CLKXOR2X2M U22 (.Y(wptr_next[1]), 
	.B(wbin_next[1]), 
	.A(wbin_next[2]));
   CLKXOR2X2M U23 (.Y(wptr_next[2]), 
	.B(wbin_next[2]), 
	.A(wbin_next[3]));
   XNOR2X2M U24 (.Y(wbin_next[2]), 
	.B(waddr[2]), 
	.A(n16));
   NAND2X2M U25 (.Y(n16), 
	.B(n15), 
	.A(waddr[1]));
   XNOR2X2M U26 (.Y(wbin_next[3]), 
	.B(\wbin[3] ), 
	.A(n14));
   NAND3X2M U27 (.Y(n14), 
	.C(waddr[2]), 
	.B(n15), 
	.A(waddr[1]));
   NOR4X1M U28 (.Y(wfull_next), 
	.D(n13), 
	.C(n12), 
	.B(n11), 
	.A(n10));
   XNOR2X2M U29 (.Y(n11), 
	.B(wq2_rptr[3]), 
	.A(wbin_next[3]));
   XNOR2X2M U30 (.Y(n10), 
	.B(wq2_rptr[2]), 
	.A(wptr_next[2]));
   CLKXOR2X2M U31 (.Y(n12), 
	.B(wptr_next[0]), 
	.A(wq2_rptr[0]));
   NOR2BX2M U32 (.Y(n17), 
	.B(wfull), 
	.AN(winc));
   AND2X2M U33 (.Y(n15), 
	.B(n17), 
	.A(waddr[0]));
   CLKXOR2X2M U34 (.Y(wbin_next[1]), 
	.B(waddr[1]), 
	.A(n15));
   CLKXOR2X2M U35 (.Y(n13), 
	.B(wptr_next[1]), 
	.A(wq2_rptr[1]));
   CLKXOR2X2M U36 (.Y(wbin_next[0]), 
	.B(waddr[0]), 
	.A(n17));
endmodule

module FIFO_RD_ADDR_WIDTH3_test_1 (
	rclk, 
	rrst_n, 
	rinc, 
	rq2_wptr, 
	raddr, 
	rptr, 
	rempty, 
	test_si2, 
	test_si1, 
	test_se, 
	FE_OFN0_UART_RST_M, 
	rinc_valid);
   input rclk;
   input rrst_n;
   input rinc;
   input [3:0] rq2_wptr;
   output [2:0] raddr;
   output [3:0] rptr;
   output rempty;
   input test_si2;
   input test_si1;
   input test_se;
   input FE_OFN0_UART_RST_M;
   input rinc_valid;

   // Internal wires
   wire \rbin[3] ;
   wire N8;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire [3:0] rbin_next;
   wire [2:0] rptr_next;

   SDFFRQX2M \rbin_reg[3]  (.SI(raddr[2]), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(\rbin[3] ), 
	.D(rbin_next[3]), 
	.CK(rclk));
   SDFFSQX2M rempty_reg (.SN(FE_OFN0_UART_RST_M), 
	.SI(\rbin[3] ), 
	.SE(test_se), 
	.Q(rempty), 
	.D(N8), 
	.CK(rclk));
   SDFFRQX4M \rbin_reg[0]  (.SI(test_si1), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(raddr[0]), 
	.D(rbin_next[0]), 
	.CK(rclk));
   SDFFRQX2M \rbin_reg[1]  (.SI(test_si2), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(raddr[1]), 
	.D(rbin_next[1]), 
	.CK(rclk));
   SDFFRQX2M \rbin_reg[2]  (.SI(raddr[1]), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(raddr[2]), 
	.D(rbin_next[2]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[0]  (.SI(rempty), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[0]), 
	.D(rptr_next[0]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[1]  (.SI(rptr[0]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[1]), 
	.D(rptr_next[1]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[3]  (.SI(rptr[2]), 
	.SE(test_se), 
	.RN(rrst_n), 
	.Q(rptr[3]), 
	.D(rbin_next[3]), 
	.CK(rclk));
   SDFFRQX2M \rptr_reg[2]  (.SI(rptr[1]), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(rptr[2]), 
	.D(rptr_next[2]), 
	.CK(rclk));
   CLKXOR2X2M U12 (.Y(rptr_next[1]), 
	.B(rbin_next[1]), 
	.A(rbin_next[2]));
   CLKXOR2X2M U13 (.Y(rptr_next[2]), 
	.B(rbin_next[2]), 
	.A(rbin_next[3]));
   CLKXOR2X2M U14 (.Y(rptr_next[0]), 
	.B(rbin_next[0]), 
	.A(rbin_next[1]));
   XNOR2X2M U15 (.Y(rbin_next[3]), 
	.B(\rbin[3] ), 
	.A(n19));
   NAND2X2M U16 (.Y(n19), 
	.B(raddr[2]), 
	.A(n18));
   XNOR2X2M U17 (.Y(rbin_next[1]), 
	.B(raddr[1]), 
	.A(n17));
   NOR2BX2M U18 (.Y(n16), 
	.B(rempty), 
	.AN(rinc));
   NOR2BX2M U19 (.Y(n18), 
	.B(n17), 
	.AN(raddr[1]));
   NOR4X1M U20 (.Y(N8), 
	.D(n15), 
	.C(n14), 
	.B(n13), 
	.A(n12));
   CLKXOR2X2M U21 (.Y(n14), 
	.B(rptr_next[0]), 
	.A(rq2_wptr[0]));
   CLKXOR2X2M U22 (.Y(n13), 
	.B(rbin_next[3]), 
	.A(rq2_wptr[3]));
   CLKXOR2X2M U23 (.Y(n12), 
	.B(rptr_next[2]), 
	.A(rq2_wptr[2]));
   NAND2X2M U24 (.Y(n17), 
	.B(n16), 
	.A(raddr[0]));
   CLKXOR2X2M U25 (.Y(rbin_next[2]), 
	.B(raddr[2]), 
	.A(n18));
   CLKXOR2X2M U26 (.Y(n15), 
	.B(rptr_next[1]), 
	.A(rq2_wptr[1]));
   CLKXOR2X2M U27 (.Y(rbin_next[0]), 
	.B(raddr[0]), 
	.A(n16));
endmodule

module FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3_test_1 (
	wclk, 
	winc_valid, 
	waddr, 
	wdata, 
	rclk, 
	rrst_n, 
	rinc_valid, 
	raddr, 
	rdata, 
	test_si, 
	test_so, 
	test_se);
   input wclk;
   input winc_valid;
   input [2:0] waddr;
   input [7:0] wdata;
   input rclk;
   input rrst_n;
   input rinc_valid;
   input [2:0] raddr;
   output [7:0] rdata;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N10;
   wire N11;
   wire N12;
   wire \mem[0][7] ;
   wire \mem[0][6] ;
   wire \mem[0][5] ;
   wire \mem[0][4] ;
   wire \mem[0][3] ;
   wire \mem[0][2] ;
   wire \mem[0][1] ;
   wire \mem[0][0] ;
   wire \mem[1][7] ;
   wire \mem[1][6] ;
   wire \mem[1][5] ;
   wire \mem[1][4] ;
   wire \mem[1][3] ;
   wire \mem[1][2] ;
   wire \mem[1][1] ;
   wire \mem[1][0] ;
   wire \mem[2][7] ;
   wire \mem[2][6] ;
   wire \mem[2][5] ;
   wire \mem[2][4] ;
   wire \mem[2][3] ;
   wire \mem[2][2] ;
   wire \mem[2][1] ;
   wire \mem[2][0] ;
   wire \mem[3][7] ;
   wire \mem[3][6] ;
   wire \mem[3][5] ;
   wire \mem[3][4] ;
   wire \mem[3][3] ;
   wire \mem[3][2] ;
   wire \mem[3][1] ;
   wire \mem[3][0] ;
   wire \mem[4][7] ;
   wire \mem[4][6] ;
   wire \mem[4][5] ;
   wire \mem[4][4] ;
   wire \mem[4][3] ;
   wire \mem[4][2] ;
   wire \mem[4][1] ;
   wire \mem[4][0] ;
   wire \mem[5][7] ;
   wire \mem[5][6] ;
   wire \mem[5][5] ;
   wire \mem[5][4] ;
   wire \mem[5][3] ;
   wire \mem[5][2] ;
   wire \mem[5][1] ;
   wire \mem[5][0] ;
   wire \mem[6][7] ;
   wire \mem[6][6] ;
   wire \mem[6][5] ;
   wire \mem[6][4] ;
   wire \mem[6][3] ;
   wire \mem[6][2] ;
   wire \mem[6][1] ;
   wire \mem[6][0] ;
   wire \mem[7][7] ;
   wire \mem[7][6] ;
   wire \mem[7][5] ;
   wire \mem[7][4] ;
   wire \mem[7][3] ;
   wire \mem[7][2] ;
   wire \mem[7][1] ;
   wire \mem[7][0] ;
   wire n75;
   wire n76;
   wire n77;
   wire n78;
   wire n79;
   wire n80;
   wire n81;
   wire n82;
   wire n83;
   wire n84;
   wire n85;
   wire n86;
   wire n87;
   wire n88;
   wire n89;
   wire n90;
   wire n91;
   wire n92;
   wire n93;
   wire n94;
   wire n95;
   wire n96;
   wire n97;
   wire n98;
   wire n99;
   wire n100;
   wire n101;
   wire n102;
   wire n103;
   wire n104;
   wire n105;
   wire n106;
   wire n107;
   wire n108;
   wire n109;
   wire n110;
   wire n111;
   wire n112;
   wire n113;
   wire n114;
   wire n115;
   wire n116;
   wire n117;
   wire n118;
   wire n119;
   wire n120;
   wire n121;
   wire n122;
   wire n123;
   wire n124;
   wire n125;
   wire n126;
   wire n127;
   wire n128;
   wire n129;
   wire n130;
   wire n131;
   wire n132;
   wire n133;
   wire n134;
   wire n135;
   wire n136;
   wire n137;
   wire n138;
   wire n139;
   wire n140;
   wire n141;
   wire n142;
   wire n143;
   wire n144;
   wire n145;
   wire n146;
   wire n147;
   wire n148;
   wire n65;
   wire n66;
   wire n67;
   wire n68;
   wire n69;
   wire n70;
   wire n71;
   wire n72;
   wire n73;
   wire n74;
   wire n149;
   wire n150;
   wire n151;
   wire n152;
   wire n153;
   wire n154;
   wire n155;
   wire n156;
   wire n157;
   wire n158;
   wire n159;
   wire n160;
   wire n161;
   wire n162;
   wire n163;
   wire n164;
   wire n165;
   wire n166;
   wire n167;
   wire n168;
   wire n169;
   wire n170;
   wire n171;
   wire n172;
   wire n173;
   wire n174;
   wire n175;
   wire n176;
   wire n177;
   wire n182;
   wire n183;
   wire n184;
   wire n185;
   wire n186;
   wire n187;
   wire n188;
   wire n189;
   wire n190;
   wire n191;
   wire n194;
   wire n195;
   wire n196;

   assign N10 = raddr[0] ;
   assign N11 = raddr[1] ;
   assign N12 = raddr[2] ;
   assign test_so = \mem[7][7]  ;

   SDFFQX2M \mem_reg[0][7]  (.SI(\mem[0][6] ), 
	.SE(n194), 
	.Q(\mem[0][7] ), 
	.D(n148), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][6]  (.SI(\mem[0][5] ), 
	.SE(n196), 
	.Q(\mem[0][6] ), 
	.D(n147), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][5]  (.SI(\mem[0][4] ), 
	.SE(n195), 
	.Q(\mem[0][5] ), 
	.D(n146), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][4]  (.SI(\mem[0][3] ), 
	.SE(n194), 
	.Q(\mem[0][4] ), 
	.D(n145), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][3]  (.SI(\mem[0][2] ), 
	.SE(n196), 
	.Q(\mem[0][3] ), 
	.D(n144), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][2]  (.SI(\mem[0][1] ), 
	.SE(n195), 
	.Q(\mem[0][2] ), 
	.D(n143), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][1]  (.SI(\mem[0][0] ), 
	.SE(n194), 
	.Q(\mem[0][1] ), 
	.D(n142), 
	.CK(wclk));
   SDFFQX2M \mem_reg[0][0]  (.SI(test_si), 
	.SE(n196), 
	.Q(\mem[0][0] ), 
	.D(n141), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][7]  (.SI(\mem[1][6] ), 
	.SE(n195), 
	.Q(\mem[1][7] ), 
	.D(n140), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][6]  (.SI(\mem[1][5] ), 
	.SE(n194), 
	.Q(\mem[1][6] ), 
	.D(n139), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][5]  (.SI(\mem[1][4] ), 
	.SE(n196), 
	.Q(\mem[1][5] ), 
	.D(n138), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][4]  (.SI(\mem[1][3] ), 
	.SE(n195), 
	.Q(\mem[1][4] ), 
	.D(n137), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][3]  (.SI(\mem[1][2] ), 
	.SE(n194), 
	.Q(\mem[1][3] ), 
	.D(n136), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][2]  (.SI(\mem[1][1] ), 
	.SE(n196), 
	.Q(\mem[1][2] ), 
	.D(n135), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][1]  (.SI(\mem[1][0] ), 
	.SE(n195), 
	.Q(\mem[1][1] ), 
	.D(n134), 
	.CK(wclk));
   SDFFQX2M \mem_reg[1][0]  (.SI(\mem[0][7] ), 
	.SE(n194), 
	.Q(\mem[1][0] ), 
	.D(n133), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][7]  (.SI(\mem[4][6] ), 
	.SE(n196), 
	.Q(\mem[4][7] ), 
	.D(n116), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][6]  (.SI(\mem[4][5] ), 
	.SE(n195), 
	.Q(\mem[4][6] ), 
	.D(n115), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][5]  (.SI(\mem[4][4] ), 
	.SE(n194), 
	.Q(\mem[4][5] ), 
	.D(n114), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][4]  (.SI(\mem[4][3] ), 
	.SE(n196), 
	.Q(\mem[4][4] ), 
	.D(n113), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][3]  (.SI(\mem[4][2] ), 
	.SE(n195), 
	.Q(\mem[4][3] ), 
	.D(n112), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][2]  (.SI(\mem[4][1] ), 
	.SE(n194), 
	.Q(\mem[4][2] ), 
	.D(n111), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][1]  (.SI(\mem[4][0] ), 
	.SE(n196), 
	.Q(\mem[4][1] ), 
	.D(n110), 
	.CK(wclk));
   SDFFQX2M \mem_reg[4][0]  (.SI(\mem[3][7] ), 
	.SE(n195), 
	.Q(\mem[4][0] ), 
	.D(n109), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][7]  (.SI(\mem[5][6] ), 
	.SE(n194), 
	.Q(\mem[5][7] ), 
	.D(n108), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][6]  (.SI(\mem[5][5] ), 
	.SE(n196), 
	.Q(\mem[5][6] ), 
	.D(n107), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][5]  (.SI(\mem[5][4] ), 
	.SE(n195), 
	.Q(\mem[5][5] ), 
	.D(n106), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][4]  (.SI(\mem[5][3] ), 
	.SE(n194), 
	.Q(\mem[5][4] ), 
	.D(n105), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][3]  (.SI(\mem[5][2] ), 
	.SE(n196), 
	.Q(\mem[5][3] ), 
	.D(n104), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][2]  (.SI(\mem[5][1] ), 
	.SE(n195), 
	.Q(\mem[5][2] ), 
	.D(n103), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][1]  (.SI(\mem[5][0] ), 
	.SE(n194), 
	.Q(\mem[5][1] ), 
	.D(n102), 
	.CK(wclk));
   SDFFQX2M \mem_reg[5][0]  (.SI(\mem[4][7] ), 
	.SE(n196), 
	.Q(\mem[5][0] ), 
	.D(n101), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][7]  (.SI(\mem[6][6] ), 
	.SE(n195), 
	.Q(\mem[6][7] ), 
	.D(n100), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][6]  (.SI(\mem[6][5] ), 
	.SE(n194), 
	.Q(\mem[6][6] ), 
	.D(n99), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][5]  (.SI(\mem[6][4] ), 
	.SE(n196), 
	.Q(\mem[6][5] ), 
	.D(n98), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][4]  (.SI(\mem[6][3] ), 
	.SE(n195), 
	.Q(\mem[6][4] ), 
	.D(n97), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][3]  (.SI(\mem[6][2] ), 
	.SE(n194), 
	.Q(\mem[6][3] ), 
	.D(n96), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][2]  (.SI(\mem[6][1] ), 
	.SE(n196), 
	.Q(\mem[6][2] ), 
	.D(n95), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][1]  (.SI(\mem[6][0] ), 
	.SE(n195), 
	.Q(\mem[6][1] ), 
	.D(n94), 
	.CK(wclk));
   SDFFQX2M \mem_reg[6][0]  (.SI(\mem[5][7] ), 
	.SE(n194), 
	.Q(\mem[6][0] ), 
	.D(n93), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][7]  (.SI(\mem[7][6] ), 
	.SE(n196), 
	.Q(\mem[7][7] ), 
	.D(n92), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][6]  (.SI(\mem[7][5] ), 
	.SE(n195), 
	.Q(\mem[7][6] ), 
	.D(n91), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][5]  (.SI(\mem[7][4] ), 
	.SE(n194), 
	.Q(\mem[7][5] ), 
	.D(n90), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][4]  (.SI(\mem[7][3] ), 
	.SE(n196), 
	.Q(\mem[7][4] ), 
	.D(n89), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][3]  (.SI(\mem[7][2] ), 
	.SE(n195), 
	.Q(\mem[7][3] ), 
	.D(n88), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][2]  (.SI(\mem[7][1] ), 
	.SE(n194), 
	.Q(\mem[7][2] ), 
	.D(n87), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][1]  (.SI(\mem[7][0] ), 
	.SE(n196), 
	.Q(\mem[7][1] ), 
	.D(n86), 
	.CK(wclk));
   SDFFQX2M \mem_reg[7][0]  (.SI(\mem[6][7] ), 
	.SE(n195), 
	.Q(\mem[7][0] ), 
	.D(n85), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][7]  (.SI(\mem[2][6] ), 
	.SE(n194), 
	.Q(\mem[2][7] ), 
	.D(n132), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][6]  (.SI(\mem[2][5] ), 
	.SE(n196), 
	.Q(\mem[2][6] ), 
	.D(n131), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][5]  (.SI(\mem[2][4] ), 
	.SE(n195), 
	.Q(\mem[2][5] ), 
	.D(n130), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][4]  (.SI(\mem[2][3] ), 
	.SE(n194), 
	.Q(\mem[2][4] ), 
	.D(n129), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][3]  (.SI(\mem[2][2] ), 
	.SE(n196), 
	.Q(\mem[2][3] ), 
	.D(n128), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][2]  (.SI(\mem[2][1] ), 
	.SE(n195), 
	.Q(\mem[2][2] ), 
	.D(n127), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][1]  (.SI(\mem[2][0] ), 
	.SE(n194), 
	.Q(\mem[2][1] ), 
	.D(n126), 
	.CK(wclk));
   SDFFQX2M \mem_reg[2][0]  (.SI(\mem[1][7] ), 
	.SE(n196), 
	.Q(\mem[2][0] ), 
	.D(n125), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][7]  (.SI(\mem[3][6] ), 
	.SE(n195), 
	.Q(\mem[3][7] ), 
	.D(n124), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][6]  (.SI(\mem[3][5] ), 
	.SE(n194), 
	.Q(\mem[3][6] ), 
	.D(n123), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][5]  (.SI(\mem[3][4] ), 
	.SE(n196), 
	.Q(\mem[3][5] ), 
	.D(n122), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][4]  (.SI(\mem[3][3] ), 
	.SE(n195), 
	.Q(\mem[3][4] ), 
	.D(n121), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][3]  (.SI(\mem[3][2] ), 
	.SE(n194), 
	.Q(\mem[3][3] ), 
	.D(n120), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][2]  (.SI(\mem[3][1] ), 
	.SE(n196), 
	.Q(\mem[3][2] ), 
	.D(n119), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][1]  (.SI(\mem[3][0] ), 
	.SE(n195), 
	.Q(\mem[3][1] ), 
	.D(n118), 
	.CK(wclk));
   SDFFQX2M \mem_reg[3][0]  (.SI(\mem[2][7] ), 
	.SE(n194), 
	.Q(\mem[3][0] ), 
	.D(n117), 
	.CK(wclk));
   NOR2X2M U70 (.Y(n171), 
	.B(n176), 
	.A(n175));
   NAND3X2M U71 (.Y(n79), 
	.C(n76), 
	.B(n191), 
	.A(n190));
   NAND3X2M U72 (.Y(n84), 
	.C(n81), 
	.B(n191), 
	.A(n190));
   NOR2X2M U73 (.Y(n168), 
	.B(N12), 
	.A(N11));
   NOR2X2M U74 (.Y(n169), 
	.B(N12), 
	.A(n176));
   NOR2X2M U75 (.Y(n172), 
	.B(N11), 
	.A(n175));
   INVX2M U76 (.Y(n175), 
	.A(N12));
   INVX2M U77 (.Y(n176), 
	.A(N11));
   INVX2M U78 (.Y(n189), 
	.A(wdata[0]));
   INVX2M U79 (.Y(n188), 
	.A(wdata[1]));
   INVX2M U80 (.Y(n187), 
	.A(wdata[2]));
   INVX2M U81 (.Y(n186), 
	.A(wdata[3]));
   INVX2M U82 (.Y(n185), 
	.A(wdata[4]));
   INVX2M U83 (.Y(n184), 
	.A(wdata[5]));
   INVX2M U84 (.Y(n183), 
	.A(wdata[6]));
   INVX2M U85 (.Y(n182), 
	.A(wdata[7]));
   NAND3X2M U86 (.Y(n78), 
	.C(waddr[0]), 
	.B(n191), 
	.A(n76));
   NAND3X2M U87 (.Y(n75), 
	.C(waddr[1]), 
	.B(n76), 
	.A(waddr[0]));
   NOR2BX2M U88 (.Y(n81), 
	.B(waddr[2]), 
	.AN(winc_valid));
   OAI2BB2X1M U89 (.Y(n85), 
	.B1(n189), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][0] ));
   OAI2BB2X1M U90 (.Y(n86), 
	.B1(n188), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][1] ));
   OAI2BB2X1M U91 (.Y(n87), 
	.B1(n187), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][2] ));
   OAI2BB2X1M U92 (.Y(n88), 
	.B1(n186), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][3] ));
   OAI2BB2X1M U93 (.Y(n89), 
	.B1(n185), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][4] ));
   OAI2BB2X1M U94 (.Y(n90), 
	.B1(n184), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][5] ));
   OAI2BB2X1M U95 (.Y(n91), 
	.B1(n183), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][6] ));
   OAI2BB2X1M U96 (.Y(n92), 
	.B1(n182), 
	.B0(n75), 
	.A1N(n75), 
	.A0N(\mem[7][7] ));
   OAI2BB2X1M U97 (.Y(n101), 
	.B1(n78), 
	.B0(n189), 
	.A1N(n78), 
	.A0N(\mem[5][0] ));
   OAI2BB2X1M U98 (.Y(n102), 
	.B1(n78), 
	.B0(n188), 
	.A1N(n78), 
	.A0N(\mem[5][1] ));
   OAI2BB2X1M U99 (.Y(n103), 
	.B1(n78), 
	.B0(n187), 
	.A1N(n78), 
	.A0N(\mem[5][2] ));
   OAI2BB2X1M U100 (.Y(n104), 
	.B1(n78), 
	.B0(n186), 
	.A1N(n78), 
	.A0N(\mem[5][3] ));
   OAI2BB2X1M U101 (.Y(n105), 
	.B1(n78), 
	.B0(n185), 
	.A1N(n78), 
	.A0N(\mem[5][4] ));
   OAI2BB2X1M U102 (.Y(n106), 
	.B1(n78), 
	.B0(n184), 
	.A1N(n78), 
	.A0N(\mem[5][5] ));
   OAI2BB2X1M U103 (.Y(n107), 
	.B1(n78), 
	.B0(n183), 
	.A1N(n78), 
	.A0N(\mem[5][6] ));
   OAI2BB2X1M U104 (.Y(n108), 
	.B1(n78), 
	.B0(n182), 
	.A1N(n78), 
	.A0N(\mem[5][7] ));
   OAI2BB2X1M U105 (.Y(n141), 
	.B1(n84), 
	.B0(n189), 
	.A1N(n84), 
	.A0N(\mem[0][0] ));
   OAI2BB2X1M U106 (.Y(n142), 
	.B1(n84), 
	.B0(n188), 
	.A1N(n84), 
	.A0N(\mem[0][1] ));
   OAI2BB2X1M U107 (.Y(n143), 
	.B1(n84), 
	.B0(n187), 
	.A1N(n84), 
	.A0N(\mem[0][2] ));
   OAI2BB2X1M U108 (.Y(n144), 
	.B1(n84), 
	.B0(n186), 
	.A1N(n84), 
	.A0N(\mem[0][3] ));
   OAI2BB2X1M U109 (.Y(n145), 
	.B1(n84), 
	.B0(n185), 
	.A1N(n84), 
	.A0N(\mem[0][4] ));
   OAI2BB2X1M U110 (.Y(n146), 
	.B1(n84), 
	.B0(n184), 
	.A1N(n84), 
	.A0N(\mem[0][5] ));
   OAI2BB2X1M U111 (.Y(n147), 
	.B1(n84), 
	.B0(n183), 
	.A1N(n84), 
	.A0N(\mem[0][6] ));
   OAI2BB2X1M U112 (.Y(n148), 
	.B1(n84), 
	.B0(n182), 
	.A1N(n84), 
	.A0N(\mem[0][7] ));
   OAI2BB2X1M U113 (.Y(n109), 
	.B1(n79), 
	.B0(n189), 
	.A1N(n79), 
	.A0N(\mem[4][0] ));
   OAI2BB2X1M U114 (.Y(n110), 
	.B1(n79), 
	.B0(n188), 
	.A1N(n79), 
	.A0N(\mem[4][1] ));
   OAI2BB2X1M U115 (.Y(n111), 
	.B1(n79), 
	.B0(n187), 
	.A1N(n79), 
	.A0N(\mem[4][2] ));
   OAI2BB2X1M U116 (.Y(n112), 
	.B1(n79), 
	.B0(n186), 
	.A1N(n79), 
	.A0N(\mem[4][3] ));
   OAI2BB2X1M U117 (.Y(n113), 
	.B1(n79), 
	.B0(n185), 
	.A1N(n79), 
	.A0N(\mem[4][4] ));
   OAI2BB2X1M U118 (.Y(n114), 
	.B1(n79), 
	.B0(n184), 
	.A1N(n79), 
	.A0N(\mem[4][5] ));
   OAI2BB2X1M U119 (.Y(n115), 
	.B1(n79), 
	.B0(n183), 
	.A1N(n79), 
	.A0N(\mem[4][6] ));
   OAI2BB2X1M U120 (.Y(n116), 
	.B1(n79), 
	.B0(n182), 
	.A1N(n79), 
	.A0N(\mem[4][7] ));
   OAI2BB2X1M U121 (.Y(n93), 
	.B1(n77), 
	.B0(n189), 
	.A1N(n77), 
	.A0N(\mem[6][0] ));
   OAI2BB2X1M U122 (.Y(n94), 
	.B1(n77), 
	.B0(n188), 
	.A1N(n77), 
	.A0N(\mem[6][1] ));
   OAI2BB2X1M U123 (.Y(n95), 
	.B1(n77), 
	.B0(n187), 
	.A1N(n77), 
	.A0N(\mem[6][2] ));
   OAI2BB2X1M U124 (.Y(n96), 
	.B1(n77), 
	.B0(n186), 
	.A1N(n77), 
	.A0N(\mem[6][3] ));
   OAI2BB2X1M U125 (.Y(n97), 
	.B1(n77), 
	.B0(n185), 
	.A1N(n77), 
	.A0N(\mem[6][4] ));
   OAI2BB2X1M U126 (.Y(n98), 
	.B1(n77), 
	.B0(n184), 
	.A1N(n77), 
	.A0N(\mem[6][5] ));
   OAI2BB2X1M U127 (.Y(n99), 
	.B1(n77), 
	.B0(n183), 
	.A1N(n77), 
	.A0N(\mem[6][6] ));
   OAI2BB2X1M U128 (.Y(n100), 
	.B1(n77), 
	.B0(n182), 
	.A1N(n77), 
	.A0N(\mem[6][7] ));
   OAI2BB2X1M U129 (.Y(n117), 
	.B1(n80), 
	.B0(n189), 
	.A1N(n80), 
	.A0N(\mem[3][0] ));
   OAI2BB2X1M U130 (.Y(n118), 
	.B1(n80), 
	.B0(n188), 
	.A1N(n80), 
	.A0N(\mem[3][1] ));
   OAI2BB2X1M U131 (.Y(n119), 
	.B1(n80), 
	.B0(n187), 
	.A1N(n80), 
	.A0N(\mem[3][2] ));
   OAI2BB2X1M U132 (.Y(n120), 
	.B1(n80), 
	.B0(n186), 
	.A1N(n80), 
	.A0N(\mem[3][3] ));
   OAI2BB2X1M U133 (.Y(n121), 
	.B1(n80), 
	.B0(n185), 
	.A1N(n80), 
	.A0N(\mem[3][4] ));
   OAI2BB2X1M U134 (.Y(n122), 
	.B1(n80), 
	.B0(n184), 
	.A1N(n80), 
	.A0N(\mem[3][5] ));
   OAI2BB2X1M U135 (.Y(n123), 
	.B1(n80), 
	.B0(n183), 
	.A1N(n80), 
	.A0N(\mem[3][6] ));
   OAI2BB2X1M U136 (.Y(n124), 
	.B1(n80), 
	.B0(n182), 
	.A1N(n80), 
	.A0N(\mem[3][7] ));
   OAI2BB2X1M U137 (.Y(n125), 
	.B1(n82), 
	.B0(n189), 
	.A1N(n82), 
	.A0N(\mem[2][0] ));
   OAI2BB2X1M U138 (.Y(n126), 
	.B1(n82), 
	.B0(n188), 
	.A1N(n82), 
	.A0N(\mem[2][1] ));
   OAI2BB2X1M U139 (.Y(n127), 
	.B1(n82), 
	.B0(n187), 
	.A1N(n82), 
	.A0N(\mem[2][2] ));
   OAI2BB2X1M U140 (.Y(n128), 
	.B1(n82), 
	.B0(n186), 
	.A1N(n82), 
	.A0N(\mem[2][3] ));
   OAI2BB2X1M U141 (.Y(n129), 
	.B1(n82), 
	.B0(n185), 
	.A1N(n82), 
	.A0N(\mem[2][4] ));
   OAI2BB2X1M U142 (.Y(n130), 
	.B1(n82), 
	.B0(n184), 
	.A1N(n82), 
	.A0N(\mem[2][5] ));
   OAI2BB2X1M U143 (.Y(n131), 
	.B1(n82), 
	.B0(n183), 
	.A1N(n82), 
	.A0N(\mem[2][6] ));
   OAI2BB2X1M U144 (.Y(n132), 
	.B1(n82), 
	.B0(n182), 
	.A1N(n82), 
	.A0N(\mem[2][7] ));
   OAI2BB2X1M U145 (.Y(n133), 
	.B1(n83), 
	.B0(n189), 
	.A1N(n83), 
	.A0N(\mem[1][0] ));
   OAI2BB2X1M U146 (.Y(n134), 
	.B1(n83), 
	.B0(n188), 
	.A1N(n83), 
	.A0N(\mem[1][1] ));
   OAI2BB2X1M U147 (.Y(n135), 
	.B1(n83), 
	.B0(n187), 
	.A1N(n83), 
	.A0N(\mem[1][2] ));
   OAI2BB2X1M U148 (.Y(n136), 
	.B1(n83), 
	.B0(n186), 
	.A1N(n83), 
	.A0N(\mem[1][3] ));
   OAI2BB2X1M U149 (.Y(n137), 
	.B1(n83), 
	.B0(n185), 
	.A1N(n83), 
	.A0N(\mem[1][4] ));
   OAI2BB2X1M U150 (.Y(n138), 
	.B1(n83), 
	.B0(n184), 
	.A1N(n83), 
	.A0N(\mem[1][5] ));
   OAI2BB2X1M U151 (.Y(n139), 
	.B1(n83), 
	.B0(n183), 
	.A1N(n83), 
	.A0N(\mem[1][6] ));
   OAI2BB2X1M U152 (.Y(n140), 
	.B1(n83), 
	.B0(n182), 
	.A1N(n83), 
	.A0N(\mem[1][7] ));
   AND2X2M U153 (.Y(n76), 
	.B(waddr[2]), 
	.A(winc_valid));
   NAND3X2M U154 (.Y(n77), 
	.C(waddr[1]), 
	.B(n190), 
	.A(n76));
   NAND3X2M U155 (.Y(n80), 
	.C(n81), 
	.B(waddr[0]), 
	.A(waddr[1]));
   NAND3X2M U156 (.Y(n82), 
	.C(n81), 
	.B(n190), 
	.A(waddr[1]));
   NAND3X2M U157 (.Y(n83), 
	.C(n81), 
	.B(n191), 
	.A(waddr[0]));
   INVX2M U158 (.Y(n177), 
	.A(N10));
   INVX2M U159 (.Y(n191), 
	.A(waddr[1]));
   INVX2M U160 (.Y(n190), 
	.A(waddr[0]));
   AO22X1M U161 (.Y(n65), 
	.B1(n168), 
	.B0(\mem[1][0] ), 
	.A1(n169), 
	.A0(\mem[3][0] ));
   AOI221XLM U162 (.Y(n68), 
	.C0(n65), 
	.B1(n171), 
	.B0(\mem[7][0] ), 
	.A1(n172), 
	.A0(\mem[5][0] ));
   AO22X1M U163 (.Y(n66), 
	.B1(n168), 
	.B0(\mem[0][0] ), 
	.A1(n169), 
	.A0(\mem[2][0] ));
   AOI221XLM U164 (.Y(n67), 
	.C0(n66), 
	.B1(n171), 
	.B0(\mem[6][0] ), 
	.A1(n172), 
	.A0(\mem[4][0] ));
   OAI22X1M U165 (.Y(rdata[0]), 
	.B1(n67), 
	.B0(N10), 
	.A1(n68), 
	.A0(n177));
   AO22X1M U166 (.Y(n69), 
	.B1(n168), 
	.B0(\mem[1][1] ), 
	.A1(n169), 
	.A0(\mem[3][1] ));
   AOI221XLM U167 (.Y(n72), 
	.C0(n69), 
	.B1(n171), 
	.B0(\mem[7][1] ), 
	.A1(n172), 
	.A0(\mem[5][1] ));
   AO22X1M U168 (.Y(n70), 
	.B1(n168), 
	.B0(\mem[0][1] ), 
	.A1(n169), 
	.A0(\mem[2][1] ));
   AOI221XLM U169 (.Y(n71), 
	.C0(n70), 
	.B1(n171), 
	.B0(\mem[6][1] ), 
	.A1(n172), 
	.A0(\mem[4][1] ));
   OAI22X1M U170 (.Y(rdata[1]), 
	.B1(n71), 
	.B0(N10), 
	.A1(n72), 
	.A0(n177));
   AO22X1M U171 (.Y(n73), 
	.B1(n168), 
	.B0(\mem[1][2] ), 
	.A1(n169), 
	.A0(\mem[3][2] ));
   AOI221XLM U172 (.Y(n150), 
	.C0(n73), 
	.B1(n171), 
	.B0(\mem[7][2] ), 
	.A1(n172), 
	.A0(\mem[5][2] ));
   AO22X1M U173 (.Y(n74), 
	.B1(n168), 
	.B0(\mem[0][2] ), 
	.A1(n169), 
	.A0(\mem[2][2] ));
   AOI221XLM U174 (.Y(n149), 
	.C0(n74), 
	.B1(n171), 
	.B0(\mem[6][2] ), 
	.A1(n172), 
	.A0(\mem[4][2] ));
   OAI22X1M U175 (.Y(rdata[2]), 
	.B1(n149), 
	.B0(N10), 
	.A1(n150), 
	.A0(n177));
   AO22X1M U176 (.Y(n151), 
	.B1(n168), 
	.B0(\mem[1][3] ), 
	.A1(n169), 
	.A0(\mem[3][3] ));
   AOI221XLM U177 (.Y(n154), 
	.C0(n151), 
	.B1(n171), 
	.B0(\mem[7][3] ), 
	.A1(n172), 
	.A0(\mem[5][3] ));
   AO22X1M U178 (.Y(n152), 
	.B1(n168), 
	.B0(\mem[0][3] ), 
	.A1(n169), 
	.A0(\mem[2][3] ));
   AOI221XLM U179 (.Y(n153), 
	.C0(n152), 
	.B1(n171), 
	.B0(\mem[6][3] ), 
	.A1(n172), 
	.A0(\mem[4][3] ));
   OAI22X1M U180 (.Y(rdata[3]), 
	.B1(n153), 
	.B0(N10), 
	.A1(n154), 
	.A0(n177));
   AO22X1M U181 (.Y(n155), 
	.B1(n168), 
	.B0(\mem[1][4] ), 
	.A1(n169), 
	.A0(\mem[3][4] ));
   AOI221XLM U182 (.Y(n158), 
	.C0(n155), 
	.B1(n171), 
	.B0(\mem[7][4] ), 
	.A1(n172), 
	.A0(\mem[5][4] ));
   AO22X1M U183 (.Y(n156), 
	.B1(n168), 
	.B0(\mem[0][4] ), 
	.A1(n169), 
	.A0(\mem[2][4] ));
   AOI221XLM U184 (.Y(n157), 
	.C0(n156), 
	.B1(n171), 
	.B0(\mem[6][4] ), 
	.A1(n172), 
	.A0(\mem[4][4] ));
   OAI22X1M U185 (.Y(rdata[4]), 
	.B1(n157), 
	.B0(N10), 
	.A1(n158), 
	.A0(n177));
   AO22X1M U186 (.Y(n159), 
	.B1(n168), 
	.B0(\mem[1][5] ), 
	.A1(n169), 
	.A0(\mem[3][5] ));
   AOI221XLM U187 (.Y(n162), 
	.C0(n159), 
	.B1(n171), 
	.B0(\mem[7][5] ), 
	.A1(n172), 
	.A0(\mem[5][5] ));
   AO22X1M U188 (.Y(n160), 
	.B1(n168), 
	.B0(\mem[0][5] ), 
	.A1(n169), 
	.A0(\mem[2][5] ));
   AOI221XLM U189 (.Y(n161), 
	.C0(n160), 
	.B1(n171), 
	.B0(\mem[6][5] ), 
	.A1(n172), 
	.A0(\mem[4][5] ));
   OAI22X1M U190 (.Y(rdata[5]), 
	.B1(n161), 
	.B0(N10), 
	.A1(n162), 
	.A0(n177));
   AO22X1M U191 (.Y(n163), 
	.B1(n168), 
	.B0(\mem[1][6] ), 
	.A1(n169), 
	.A0(\mem[3][6] ));
   AOI221XLM U192 (.Y(n166), 
	.C0(n163), 
	.B1(n171), 
	.B0(\mem[7][6] ), 
	.A1(n172), 
	.A0(\mem[5][6] ));
   AO22X1M U193 (.Y(n164), 
	.B1(n168), 
	.B0(\mem[0][6] ), 
	.A1(n169), 
	.A0(\mem[2][6] ));
   AOI221XLM U194 (.Y(n165), 
	.C0(n164), 
	.B1(n171), 
	.B0(\mem[6][6] ), 
	.A1(n172), 
	.A0(\mem[4][6] ));
   OAI22X1M U195 (.Y(rdata[6]), 
	.B1(n165), 
	.B0(N10), 
	.A1(n166), 
	.A0(n177));
   AO22X1M U196 (.Y(n167), 
	.B1(n168), 
	.B0(\mem[1][7] ), 
	.A1(n169), 
	.A0(\mem[3][7] ));
   AOI221XLM U197 (.Y(n174), 
	.C0(n167), 
	.B1(n171), 
	.B0(\mem[7][7] ), 
	.A1(n172), 
	.A0(\mem[5][7] ));
   AO22X1M U198 (.Y(n170), 
	.B1(n168), 
	.B0(\mem[0][7] ), 
	.A1(n169), 
	.A0(\mem[2][7] ));
   AOI221XLM U199 (.Y(n173), 
	.C0(n170), 
	.B1(n171), 
	.B0(\mem[6][7] ), 
	.A1(n172), 
	.A0(\mem[4][7] ));
   OAI22X1M U200 (.Y(rdata[7]), 
	.B1(n173), 
	.B0(N10), 
	.A1(n177), 
	.A0(n174));
   DLY1X4M U201 (.Y(n194), 
	.A(test_se));
   DLY1X4M U202 (.Y(n195), 
	.A(test_se));
   DLY1X4M U203 (.Y(n196), 
	.A(test_se));
endmodule

module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_test_1 (
	W_CLK, 
	W_RST, 
	W_INC, 
	WR_DATA, 
	FULL, 
	R_CLK, 
	R_RST, 
	R_INC, 
	RD_DATA, 
	EMPTY, 
	test_si2, 
	test_si1, 
	test_so2, 
	test_so1, 
	test_se, 
	FE_OFN0_UART_RST_M);
   input W_CLK;
   input W_RST;
   input W_INC;
   input [7:0] WR_DATA;
   output FULL;
   input R_CLK;
   input R_RST;
   input R_INC;
   output [7:0] RD_DATA;
   output EMPTY;
   input test_si2;
   input test_si1;
   output test_so2;
   output test_so1;
   input test_se;
   input FE_OFN0_UART_RST_M;

   // Internal wires
   wire winc_valid;
   wire rinc_valid;
   wire n2;
   wire [3:0] rptr;
   wire [3:0] wq2_rptr;
   wire [3:0] wptr;
   wire [3:0] rq2_wptr;
   wire [2:0] waddr;
   wire [2:0] raddr;

   assign test_so2 = wptr[3] ;
   assign test_so1 = raddr[0] ;

   NOR2BX2M U1 (.Y(rinc_valid), 
	.B(EMPTY), 
	.AN(R_INC));
   NOR2BX2M U2 (.Y(winc_valid), 
	.B(FULL), 
	.AN(W_INC));
   DF_SYNC_WIDTH4_test_0 sync_r2w (.dest_clk(W_CLK), 
	.dest_rst_n(W_RST), 
	.async_in({ rptr[3],
		rptr[2],
		rptr[1],
		rptr[0] }), 
	.sync_out({ wq2_rptr[3],
		wq2_rptr[2],
		wq2_rptr[1],
		wq2_rptr[0] }), 
	.test_si(test_si1), 
	.test_se(test_se));
   DF_SYNC_WIDTH4_test_1 sync_w2r (.dest_clk(R_CLK), 
	.dest_rst_n(R_RST), 
	.async_in({ wptr[3],
		wptr[2],
		wptr[1],
		wptr[0] }), 
	.sync_out({ rq2_wptr[3],
		rq2_wptr[2],
		rq2_wptr[1],
		rq2_wptr[0] }), 
	.test_si(wq2_rptr[3]), 
	.test_se(test_se));
   FIFO_WR_ADDR_WIDTH3_test_1 u_fifo_wr (.wclk(W_CLK), 
	.wrst_n(W_RST), 
	.winc(W_INC), 
	.wq2_rptr({ wq2_rptr[3],
		wq2_rptr[2],
		wq2_rptr[1],
		wq2_rptr[0] }), 
	.waddr({ waddr[2],
		waddr[1],
		waddr[0] }), 
	.wptr({ wptr[3],
		wptr[2],
		wptr[1],
		wptr[0] }), 
	.wfull(FULL), 
	.test_si(rptr[3]), 
	.test_se(test_se), 
	.winc_valid(winc_valid));
   FIFO_RD_ADDR_WIDTH3_test_1 u_fifo_rd (.rclk(R_CLK), 
	.rrst_n(R_RST), 
	.rinc(R_INC), 
	.rq2_wptr({ rq2_wptr[3],
		rq2_wptr[2],
		rq2_wptr[1],
		rq2_wptr[0] }), 
	.raddr({ raddr[2],
		raddr[1],
		raddr[0] }), 
	.rptr({ rptr[3],
		rptr[2],
		rptr[1],
		rptr[0] }), 
	.rempty(EMPTY), 
	.test_si2(test_si2), 
	.test_si1(n2), 
	.test_se(test_se), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M), 
	.rinc_valid(rinc_valid));
   FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3_test_1 u_fifo_mem_cntrl (.wclk(W_CLK), 
	.winc_valid(winc_valid), 
	.waddr({ waddr[2],
		waddr[1],
		waddr[0] }), 
	.wdata({ WR_DATA[7],
		WR_DATA[6],
		WR_DATA[5],
		WR_DATA[4],
		WR_DATA[3],
		WR_DATA[2],
		WR_DATA[1],
		WR_DATA[0] }), 
	.rclk(R_CLK), 
	.rrst_n(R_RST), 
	.rinc_valid(rinc_valid), 
	.raddr({ raddr[2],
		raddr[1],
		raddr[0] }), 
	.rdata({ RD_DATA[7],
		RD_DATA[6],
		RD_DATA[5],
		RD_DATA[4],
		RD_DATA[3],
		RD_DATA[2],
		RD_DATA[1],
		RD_DATA[0] }), 
	.test_si(rq2_wptr[3]), 
	.test_so(n2), 
	.test_se(test_se));
endmodule

module CLKDIV_MUX_WIDTH8 (
	IN, 
	OUT);
   input [5:0] IN;
   output [7:0] OUT;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n14;
   wire n15;
   wire n16;
   wire n17;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   NAND4BX1M U11 (.Y(n6), 
	.D(n14), 
	.C(n15), 
	.B(IN[3]), 
	.AN(IN[4]));
   NAND4BX1M U12 (.Y(n7), 
	.D(n14), 
	.C(n15), 
	.B(IN[4]), 
	.AN(IN[3]));
   NOR3X2M U13 (.Y(OUT[1]), 
	.C(IN[0]), 
	.B(IN[1]), 
	.A(n7));
   NOR4X1M U14 (.Y(OUT[3]), 
	.D(IN[4]), 
	.C(IN[5]), 
	.B(IN[3]), 
	.A(n5));
   NAND3X2M U15 (.Y(n5), 
	.C(IN[2]), 
	.B(n16), 
	.A(n17));
   NOR3X2M U16 (.Y(OUT[2]), 
	.C(IN[0]), 
	.B(IN[1]), 
	.A(n6));
   INVX2M U17 (.Y(n15), 
	.A(IN[2]));
   INVX2M U18 (.Y(n17), 
	.A(IN[0]));
   INVX2M U19 (.Y(n16), 
	.A(IN[1]));
   INVX2M U20 (.Y(n14), 
	.A(IN[5]));
   OAI211X2M U21 (.Y(OUT[0]), 
	.C0(n16), 
	.B0(n17), 
	.A1(n9), 
	.A0(n8));
   NOR4X1M U22 (.Y(n8), 
	.D(n15), 
	.C(IN[3]), 
	.B(IN[4]), 
	.A(IN[5]));
   NAND2X2M U23 (.Y(n9), 
	.B(n6), 
	.A(n7));
   INVX2M U3 (.Y(OUT[7]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U5 (.Y(OUT[6]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U7 (.Y(OUT[5]), 
	.A(HTIE_LTIEHI_NET));
   INVX2M U9 (.Y(OUT[4]), 
	.A(HTIE_LTIEHI_NET));
endmodule

module INT_CLK_DIV_0_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
endmodule

module INT_CLK_DIV_test_1 (
	REF_CLK, 
	RST, 
	CLK_EN, 
	DIV_RATIO, 
	O_DIV_CLK, 
	test_si, 
	test_so, 
	test_se);
   input REF_CLK;
   input RST;
   input CLK_EN;
   input [7:0] DIV_RATIO;
   output O_DIV_CLK;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;
   wire FE_UNCONNECTED_0;
   wire N7;
   wire N8;
   wire div_clk_reg;
   wire odd_flag;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N24;
   wire N25;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N103;
   wire N104;
   wire N105;
   wire N106;
   wire N107;
   wire N108;
   wire N109;
   wire N110;
   wire N119;
   wire n37;
   wire n38;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire [7:0] counter;

   assign N8 = CLK_EN ;
   assign test_so = odd_flag ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M div_clk_reg_reg (.SI(counter[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(div_clk_reg), 
	.D(n37), 
	.CK(REF_CLK));
   SDFFRQX2M odd_flag_reg (.SI(div_clk_reg), 
	.SE(test_se), 
	.RN(RST), 
	.Q(odd_flag), 
	.D(n38), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[7]), 
	.D(N110), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[0]), 
	.D(N103), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[6]), 
	.D(N109), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[1]), 
	.D(N104), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[4]  (.SI(counter[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[4]), 
	.D(N107), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[3]), 
	.D(N106), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[2]), 
	.D(N105), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[5]), 
	.D(N108), 
	.CK(REF_CLK));
   CLKXOR2X2M U9 (.Y(n1), 
	.B(n5), 
	.A(DIV_RATIO[6]));
   OR2X2M U10 (.Y(n14), 
	.B(n7), 
	.A(n15));
   OR2X2M U11 (.Y(n2), 
	.B(DIV_RATIO[1]), 
	.A(DIV_RATIO[2]));
   MX2X2M U12 (.Y(N119), 
	.S0(N7), 
	.B(REF_CLK), 
	.A(div_clk_reg));
   MX2X2M U13 (.Y(O_DIV_CLK), 
	.S0(HTIE_LTIEHI_NET), 
	.B(N119), 
	.A(LTIE_LTIELO_NET));
   OAI2BB1X1M U14 (.Y(N19), 
	.B0(n2), 
	.A1N(DIV_RATIO[2]), 
	.A0N(DIV_RATIO[1]));
   OR2X1M U19 (.Y(n3), 
	.B(DIV_RATIO[3]), 
	.A(n2));
   OAI2BB1X1M U20 (.Y(N20), 
	.B0(n3), 
	.A1N(DIV_RATIO[3]), 
	.A0N(n2));
   OR2X1M U21 (.Y(n4), 
	.B(DIV_RATIO[4]), 
	.A(n3));
   OAI2BB1X1M U22 (.Y(N21), 
	.B0(n4), 
	.A1N(DIV_RATIO[4]), 
	.A0N(n3));
   OR2X1M U23 (.Y(n5), 
	.B(DIV_RATIO[5]), 
	.A(n4));
   OAI2BB1X1M U24 (.Y(N22), 
	.B0(n5), 
	.A1N(DIV_RATIO[5]), 
	.A0N(n4));
   NOR3X1M U25 (.Y(N25), 
	.C(n5), 
	.B(DIV_RATIO[7]), 
	.A(DIV_RATIO[6]));
   OAI21X1M U26 (.Y(n6), 
	.B0(DIV_RATIO[7]), 
	.A1(n5), 
	.A0(DIV_RATIO[6]));
   NAND2BX1M U27 (.Y(N24), 
	.B(n6), 
	.AN(N25));
   NOR2X1M U28 (.Y(n38), 
	.B(n8), 
	.A(n7));
   MXI2X1M U29 (.Y(n8), 
	.S0(odd_flag), 
	.B(n10), 
	.A(n9));
   CLKNAND2X2M U30 (.Y(n10), 
	.B(n11), 
	.A(DIV_RATIO[0]));
   NOR2BX1M U31 (.Y(n9), 
	.B(n12), 
	.AN(DIV_RATIO[0]));
   MXI2X1M U32 (.Y(n37), 
	.S0(div_clk_reg), 
	.B(n14), 
	.A(n13));
   NAND2BX1M U33 (.Y(n13), 
	.B(n15), 
	.AN(n7));
   CLKINVX1M U34 (.Y(N7), 
	.A(n16));
   NOR2BX1M U35 (.Y(N110), 
	.B(n14), 
	.AN(N35));
   NOR2BX1M U36 (.Y(N109), 
	.B(n14), 
	.AN(N34));
   NOR2BX1M U37 (.Y(N108), 
	.B(n14), 
	.AN(N33));
   NOR2BX1M U38 (.Y(N107), 
	.B(n14), 
	.AN(N32));
   NOR2BX1M U39 (.Y(N106), 
	.B(n14), 
	.AN(N31));
   NOR2BX1M U40 (.Y(N105), 
	.B(n14), 
	.AN(N30));
   NOR2BX1M U41 (.Y(N104), 
	.B(n14), 
	.AN(N29));
   NOR2BX1M U42 (.Y(N103), 
	.B(n14), 
	.AN(n62));
   CLKNAND2X2M U43 (.Y(n7), 
	.B(n16), 
	.A(HTIE_LTIEHI_NET));
   NAND4X1M U44 (.Y(n16), 
	.D(n30), 
	.C(n29), 
	.B(n28), 
	.A(n17));
   NOR4X1M U45 (.Y(n30), 
	.D(DIV_RATIO[4]), 
	.C(DIV_RATIO[5]), 
	.B(DIV_RATIO[6]), 
	.A(DIV_RATIO[7]));
   MXI2X1M U46 (.Y(n15), 
	.S0(n32), 
	.B(n31), 
	.A(n12));
   AND2X1M U47 (.Y(n32), 
	.B(odd_flag), 
	.A(DIV_RATIO[0]));
   CLKINVX1M U48 (.Y(n31), 
	.A(n11));
   OAI211X1M U49 (.Y(n11), 
	.C0(n35), 
	.B0(n34), 
	.A1(n33), 
	.A0(DIV_RATIO[7]));
   OAI21X1M U50 (.Y(n34), 
	.B0(n39), 
	.A1(n36), 
	.A0(counter[5]));
   AOI21X1M U51 (.Y(n39), 
	.B0(n40), 
	.A1(n33), 
	.A0(DIV_RATIO[7]));
   AOI221XLM U52 (.Y(n40), 
	.C0(n42), 
	.B1(n36), 
	.B0(counter[5]), 
	.A1(n41), 
	.A0(counter[4]));
   AOI221XLM U53 (.Y(n42), 
	.C0(n45), 
	.B1(n44), 
	.B0(DIV_RATIO[5]), 
	.A1(n43), 
	.A0(DIV_RATIO[4]));
   AOI221XLM U54 (.Y(n45), 
	.C0(n47), 
	.B1(n46), 
	.B0(counter[3]), 
	.A1(n28), 
	.A0(counter[2]));
   AOI221XLM U55 (.Y(n47), 
	.C0(n50), 
	.B1(n49), 
	.B0(DIV_RATIO[2]), 
	.A1(n48), 
	.A0(DIV_RATIO[3]));
   AOI211X1M U56 (.Y(n50), 
	.C0(counter[0]), 
	.B0(n29), 
	.A1(n17), 
	.A0(counter[1]));
   CLKINVX1M U57 (.Y(n29), 
	.A(DIV_RATIO[1]));
   CLKINVX1M U58 (.Y(n17), 
	.A(DIV_RATIO[2]));
   CLKINVX1M U59 (.Y(n46), 
	.A(DIV_RATIO[4]));
   CLKINVX1M U60 (.Y(n28), 
	.A(DIV_RATIO[3]));
   CLKINVX1M U61 (.Y(n41), 
	.A(DIV_RATIO[5]));
   CLKINVX1M U62 (.Y(n36), 
	.A(DIV_RATIO[6]));
   AOI2B1X1M U63 (.Y(n12), 
	.B0(n51), 
	.A1N(N25), 
	.A0(counter[7]));
   AOI221XLM U64 (.Y(n51), 
	.C0(n52), 
	.B1(N25), 
	.B0(n35), 
	.A1(N24), 
	.A0(n33));
   OA22X1M U65 (.Y(n52), 
	.B1(n33), 
	.B0(N24), 
	.A1(n54), 
	.A0(n53));
   NOR2X1M U66 (.Y(n54), 
	.B(n1), 
	.A(counter[5]));
   AOI221XLM U67 (.Y(n53), 
	.C0(n56), 
	.B1(n1), 
	.B0(counter[5]), 
	.A1(n55), 
	.A0(counter[4]));
   AOI221XLM U68 (.Y(n56), 
	.C0(n57), 
	.B1(n44), 
	.B0(N22), 
	.A1(n43), 
	.A0(N21));
   AOI222X1M U69 (.Y(n57), 
	.C1(n61), 
	.C0(counter[3]), 
	.B1(n60), 
	.B0(n59), 
	.A1(n58), 
	.A0(counter[2]));
   CLKINVX1M U70 (.Y(n61), 
	.A(N21));
   OAI211X1M U71 (.Y(n60), 
	.C0(n29), 
	.B0(n62), 
	.A1(n49), 
	.A0(N19));
   CLKINVX1M U72 (.Y(n62), 
	.A(counter[0]));
   AOI22X1M U73 (.Y(n59), 
	.B1(n49), 
	.B0(N19), 
	.A1(n48), 
	.A0(N20));
   CLKINVX1M U74 (.Y(n49), 
	.A(counter[1]));
   CLKINVX1M U75 (.Y(n48), 
	.A(counter[2]));
   CLKINVX1M U76 (.Y(n58), 
	.A(N20));
   CLKINVX1M U77 (.Y(n44), 
	.A(counter[4]));
   CLKINVX1M U78 (.Y(n43), 
	.A(counter[3]));
   CLKINVX1M U79 (.Y(n55), 
	.A(N22));
   CLKINVX1M U80 (.Y(n35), 
	.A(counter[7]));
   CLKINVX1M U81 (.Y(n33), 
	.A(counter[6]));
   INT_CLK_DIV_0_DW01_inc_0 r84 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		counter[0] }), 
	.SUM({ N35,
		N34,
		N33,
		N32,
		N31,
		N30,
		N29,
		FE_UNCONNECTED_0 }));
endmodule

module INT_CLK_DIV_1_DW01_inc_0 (
	A, 
	SUM);
   input [7:0] A;
   output [7:0] SUM;

   // Internal wires
   wire [7:2] carry;

   ADDHX1M U1_1_6 (.S(SUM[6]), 
	.CO(carry[7]), 
	.B(carry[6]), 
	.A(A[6]));
   ADDHX1M U1_1_1 (.S(SUM[1]), 
	.CO(carry[2]), 
	.B(A[0]), 
	.A(A[1]));
   ADDHX1M U1_1_4 (.S(SUM[4]), 
	.CO(carry[5]), 
	.B(carry[4]), 
	.A(A[4]));
   ADDHX1M U1_1_3 (.S(SUM[3]), 
	.CO(carry[4]), 
	.B(carry[3]), 
	.A(A[3]));
   ADDHX1M U1_1_2 (.S(SUM[2]), 
	.CO(carry[3]), 
	.B(carry[2]), 
	.A(A[2]));
   ADDHX1M U1_1_5 (.S(SUM[5]), 
	.CO(carry[6]), 
	.B(carry[5]), 
	.A(A[5]));
   CLKXOR2X2M U1 (.Y(SUM[7]), 
	.B(A[7]), 
	.A(carry[7]));
endmodule

module INT_CLK_DIV_test_0 (
	REF_CLK, 
	RST, 
	CLK_EN, 
	DIV_RATIO, 
	O_DIV_CLK, 
	test_si, 
	test_so, 
	test_se);
   input REF_CLK;
   input RST;
   input CLK_EN;
   input [7:0] DIV_RATIO;
   output O_DIV_CLK;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;
   wire FE_UNCONNECTED_0;
   wire N7;
   wire N8;
   wire div_clk_reg;
   wire odd_flag;
   wire N19;
   wire N20;
   wire N21;
   wire N22;
   wire N24;
   wire N25;
   wire N29;
   wire N30;
   wire N31;
   wire N32;
   wire N33;
   wire N34;
   wire N35;
   wire N103;
   wire N104;
   wire N105;
   wire N106;
   wire N107;
   wire N108;
   wire N109;
   wire N110;
   wire N119;
   wire n1;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;
   wire n61;
   wire n62;
   wire n63;
   wire n64;
   wire [7:0] counter;

   assign N8 = CLK_EN ;
   assign test_so = odd_flag ;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   SDFFRQX2M div_clk_reg_reg (.SI(counter[7]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(div_clk_reg), 
	.D(n64), 
	.CK(REF_CLK));
   SDFFRQX2M odd_flag_reg (.SI(div_clk_reg), 
	.SE(test_se), 
	.RN(RST), 
	.Q(odd_flag), 
	.D(n63), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[7]  (.SI(counter[6]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[7]), 
	.D(N110), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[0]), 
	.D(N103), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[6]  (.SI(counter[5]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[6]), 
	.D(N109), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[1]), 
	.D(N104), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[4]  (.SI(counter[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[4]), 
	.D(N107), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[3]  (.SI(counter[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[3]), 
	.D(N106), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[2]  (.SI(counter[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[2]), 
	.D(N105), 
	.CK(REF_CLK));
   SDFFRQX2M \counter_reg[5]  (.SI(counter[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(counter[5]), 
	.D(N108), 
	.CK(REF_CLK));
   CLKXOR2X2M U9 (.Y(n1), 
	.B(n5), 
	.A(LTIE_LTIELO_NET));
   OR2X2M U10 (.Y(n2), 
	.B(DIV_RATIO[1]), 
	.A(DIV_RATIO[2]));
   OR2X2M U11 (.Y(n14), 
	.B(n7), 
	.A(n15));
   MX2X2M U12 (.Y(N119), 
	.S0(N7), 
	.B(REF_CLK), 
	.A(div_clk_reg));
   MX2X2M U13 (.Y(O_DIV_CLK), 
	.S0(HTIE_LTIEHI_NET), 
	.B(N119), 
	.A(LTIE_LTIELO_NET));
   OAI2BB1X1M U14 (.Y(N19), 
	.B0(n2), 
	.A1N(DIV_RATIO[2]), 
	.A0N(DIV_RATIO[1]));
   OR2X1M U19 (.Y(n3), 
	.B(DIV_RATIO[3]), 
	.A(n2));
   OAI2BB1X1M U20 (.Y(N20), 
	.B0(n3), 
	.A1N(DIV_RATIO[3]), 
	.A0N(n2));
   OR2X1M U21 (.Y(n4), 
	.B(LTIE_LTIELO_NET), 
	.A(n3));
   OAI2BB1X1M U22 (.Y(N21), 
	.B0(n4), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n3));
   OR2X1M U23 (.Y(n5), 
	.B(LTIE_LTIELO_NET), 
	.A(n4));
   OAI2BB1X1M U24 (.Y(N22), 
	.B0(n5), 
	.A1N(LTIE_LTIELO_NET), 
	.A0N(n4));
   NOR3X1M U25 (.Y(N25), 
	.C(n5), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   OAI21X1M U26 (.Y(n6), 
	.B0(LTIE_LTIELO_NET), 
	.A1(n5), 
	.A0(LTIE_LTIELO_NET));
   NAND2BX1M U27 (.Y(N24), 
	.B(n6), 
	.AN(N25));
   NOR2X1M U28 (.Y(n63), 
	.B(n8), 
	.A(n7));
   MXI2X1M U29 (.Y(n8), 
	.S0(odd_flag), 
	.B(n10), 
	.A(n9));
   CLKNAND2X2M U30 (.Y(n10), 
	.B(n11), 
	.A(DIV_RATIO[0]));
   NOR2BX1M U31 (.Y(n9), 
	.B(n12), 
	.AN(DIV_RATIO[0]));
   MXI2X1M U32 (.Y(n64), 
	.S0(div_clk_reg), 
	.B(n14), 
	.A(n13));
   NAND2BX1M U33 (.Y(n13), 
	.B(n15), 
	.AN(n7));
   CLKINVX1M U34 (.Y(N7), 
	.A(n16));
   NOR2BX1M U35 (.Y(N110), 
	.B(n14), 
	.AN(N35));
   NOR2BX1M U36 (.Y(N109), 
	.B(n14), 
	.AN(N34));
   NOR2BX1M U37 (.Y(N108), 
	.B(n14), 
	.AN(N33));
   NOR2BX1M U38 (.Y(N107), 
	.B(n14), 
	.AN(N32));
   NOR2BX1M U39 (.Y(N106), 
	.B(n14), 
	.AN(N31));
   NOR2BX1M U40 (.Y(N105), 
	.B(n14), 
	.AN(N30));
   NOR2BX1M U41 (.Y(N104), 
	.B(n14), 
	.AN(N29));
   NOR2BX1M U42 (.Y(N103), 
	.B(n14), 
	.AN(n62));
   CLKNAND2X2M U43 (.Y(n7), 
	.B(n16), 
	.A(HTIE_LTIEHI_NET));
   NAND4X1M U44 (.Y(n16), 
	.D(n30), 
	.C(n29), 
	.B(n28), 
	.A(n17));
   NOR4X1M U45 (.Y(n30), 
	.D(LTIE_LTIELO_NET), 
	.C(LTIE_LTIELO_NET), 
	.B(LTIE_LTIELO_NET), 
	.A(LTIE_LTIELO_NET));
   MXI2X1M U46 (.Y(n15), 
	.S0(n32), 
	.B(n31), 
	.A(n12));
   AND2X1M U47 (.Y(n32), 
	.B(odd_flag), 
	.A(DIV_RATIO[0]));
   CLKINVX1M U48 (.Y(n31), 
	.A(n11));
   OAI211X1M U49 (.Y(n11), 
	.C0(n35), 
	.B0(n34), 
	.A1(n33), 
	.A0(LTIE_LTIELO_NET));
   OAI21X1M U50 (.Y(n34), 
	.B0(n39), 
	.A1(n36), 
	.A0(counter[5]));
   AOI21X1M U51 (.Y(n39), 
	.B0(n40), 
	.A1(n33), 
	.A0(LTIE_LTIELO_NET));
   AOI221XLM U52 (.Y(n40), 
	.C0(n42), 
	.B1(n36), 
	.B0(counter[5]), 
	.A1(n41), 
	.A0(counter[4]));
   AOI221XLM U53 (.Y(n42), 
	.C0(n45), 
	.B1(n44), 
	.B0(LTIE_LTIELO_NET), 
	.A1(n43), 
	.A0(LTIE_LTIELO_NET));
   AOI221XLM U54 (.Y(n45), 
	.C0(n47), 
	.B1(n46), 
	.B0(counter[3]), 
	.A1(n28), 
	.A0(counter[2]));
   AOI221XLM U55 (.Y(n47), 
	.C0(n50), 
	.B1(n49), 
	.B0(DIV_RATIO[2]), 
	.A1(n48), 
	.A0(DIV_RATIO[3]));
   AOI211X1M U56 (.Y(n50), 
	.C0(counter[0]), 
	.B0(n29), 
	.A1(n17), 
	.A0(counter[1]));
   CLKINVX1M U57 (.Y(n29), 
	.A(DIV_RATIO[1]));
   CLKINVX1M U58 (.Y(n17), 
	.A(DIV_RATIO[2]));
   CLKINVX1M U59 (.Y(n46), 
	.A(LTIE_LTIELO_NET));
   CLKINVX1M U60 (.Y(n28), 
	.A(DIV_RATIO[3]));
   CLKINVX1M U61 (.Y(n41), 
	.A(LTIE_LTIELO_NET));
   CLKINVX1M U62 (.Y(n36), 
	.A(LTIE_LTIELO_NET));
   AOI2B1X1M U63 (.Y(n12), 
	.B0(n51), 
	.A1N(N25), 
	.A0(counter[7]));
   AOI221XLM U64 (.Y(n51), 
	.C0(n52), 
	.B1(N25), 
	.B0(n35), 
	.A1(N24), 
	.A0(n33));
   OA22X1M U65 (.Y(n52), 
	.B1(n33), 
	.B0(N24), 
	.A1(n54), 
	.A0(n53));
   NOR2X1M U66 (.Y(n54), 
	.B(n1), 
	.A(counter[5]));
   AOI221XLM U67 (.Y(n53), 
	.C0(n56), 
	.B1(n1), 
	.B0(counter[5]), 
	.A1(n55), 
	.A0(counter[4]));
   AOI221XLM U68 (.Y(n56), 
	.C0(n57), 
	.B1(n44), 
	.B0(N22), 
	.A1(n43), 
	.A0(N21));
   AOI222X1M U69 (.Y(n57), 
	.C1(n61), 
	.C0(counter[3]), 
	.B1(n60), 
	.B0(n59), 
	.A1(n58), 
	.A0(counter[2]));
   CLKINVX1M U70 (.Y(n61), 
	.A(N21));
   OAI211X1M U71 (.Y(n60), 
	.C0(n29), 
	.B0(n62), 
	.A1(n49), 
	.A0(N19));
   CLKINVX1M U72 (.Y(n62), 
	.A(counter[0]));
   AOI22X1M U73 (.Y(n59), 
	.B1(n49), 
	.B0(N19), 
	.A1(n48), 
	.A0(N20));
   CLKINVX1M U74 (.Y(n49), 
	.A(counter[1]));
   CLKINVX1M U75 (.Y(n48), 
	.A(counter[2]));
   CLKINVX1M U76 (.Y(n58), 
	.A(N20));
   CLKINVX1M U77 (.Y(n44), 
	.A(counter[4]));
   CLKINVX1M U78 (.Y(n43), 
	.A(counter[3]));
   CLKINVX1M U79 (.Y(n55), 
	.A(N22));
   CLKINVX1M U80 (.Y(n35), 
	.A(counter[7]));
   CLKINVX1M U81 (.Y(n33), 
	.A(counter[6]));
   INT_CLK_DIV_1_DW01_inc_0 r84 (.A({ counter[7],
		counter[6],
		counter[5],
		counter[4],
		counter[3],
		counter[2],
		counter[1],
		counter[0] }), 
	.SUM({ N35,
		N34,
		N33,
		N32,
		N31,
		N30,
		N29,
		FE_UNCONNECTED_0 }));
endmodule

module PULSE_GEN_test_1 (
	clk, 
	rst, 
	lvl_sig, 
	pulse_sig, 
	test_si, 
	test_so, 
	test_se);
   input clk;
   input rst;
   input lvl_sig;
   output pulse_sig;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire pls_flop;
   wire rcv_flop;

   assign test_so = rcv_flop ;

   SDFFRQX2M rcv_flop_reg (.SI(pls_flop), 
	.SE(test_se), 
	.RN(rst), 
	.Q(rcv_flop), 
	.D(lvl_sig), 
	.CK(clk));
   SDFFRQX2M pls_flop_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(rst), 
	.Q(pls_flop), 
	.D(rcv_flop), 
	.CK(clk));
   NOR2BX2M U5 (.Y(pulse_sig), 
	.B(pls_flop), 
	.AN(rcv_flop));
endmodule

module FSM_test_1 (
	DATA_VALID, 
	PAR_EN, 
	SER_DONE, 
	RST, 
	CLK, 
	MUX_SEL, 
	BUSY, 
	LOAD, 
	SER_EN, 
	test_si, 
	test_so, 
	test_se);
   input DATA_VALID;
   input PAR_EN;
   input SER_DONE;
   input RST;
   input CLK;
   output [2:0] MUX_SEL;
   output BUSY;
   output LOAD;
   output SER_EN;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire FE_OFN5_LOAD;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n4;
   wire n5;
   wire [2:0] current_st;

   assign test_so = current_st[2] ;

   BUFX2M FE_OFC5_LOAD (.Y(LOAD), 
	.A(FE_OFN5_LOAD));
   SDFFRQX2M \current_st_reg[2]  (.SI(current_st[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_st[2]), 
	.D(n13), 
	.CK(CLK));
   SDFFRQX2M \current_st_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_st[0]), 
	.D(n15), 
	.CK(CLK));
   SDFFRQX2M \current_st_reg[1]  (.SI(current_st[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(current_st[1]), 
	.D(n14), 
	.CK(CLK));
   NOR2X2M U6 (.Y(SER_EN), 
	.B(n8), 
	.A(SER_DONE));
   NAND2X2M U7 (.Y(MUX_SEL[0]), 
	.B(n5), 
	.A(n11));
   NAND2X2M U8 (.Y(BUSY), 
	.B(n9), 
	.A(MUX_SEL[0]));
   AOI21BX2M U9 (.Y(MUX_SEL[2]), 
	.B0N(n9), 
	.A1(n5), 
	.A0(n11));
   NOR3X2M U10 (.Y(FE_OFN5_LOAD), 
	.C(current_st[1]), 
	.B(current_st[2]), 
	.A(n4));
   NAND3X2M U11 (.Y(n8), 
	.C(current_st[1]), 
	.B(n5), 
	.A(n4));
   INVX2M U12 (.Y(n5), 
	.A(current_st[2]));
   INVX2M U13 (.Y(n4), 
	.A(current_st[0]));
   OAI21BX1M U14 (.Y(n7), 
	.B0N(SER_EN), 
	.A1(DATA_VALID), 
	.A0(current_st[1]));
   NAND2X2M U15 (.Y(n9), 
	.B(current_st[1]), 
	.A(current_st[0]));
   OAI21X2M U16 (.Y(n14), 
	.B0(MUX_SEL[0]), 
	.A1(n9), 
	.A0(current_st[2]));
   AOI21X2M U17 (.Y(n15), 
	.B0(n7), 
	.A1(n10), 
	.A0(n8));
   OR2X2M U18 (.Y(n10), 
	.B(current_st[2]), 
	.A(n11));
   CLKXOR2X2M U19 (.Y(n11), 
	.B(current_st[1]), 
	.A(current_st[0]));
   NOR2BX2M U20 (.Y(n13), 
	.B(n7), 
	.AN(n6));
   OAI22X1M U21 (.Y(n6), 
	.B1(n9), 
	.B0(current_st[2]), 
	.A1(n8), 
	.A0(PAR_EN));
   NAND2X2M U22 (.Y(MUX_SEL[1]), 
	.B(current_st[0]), 
	.A(n12));
   CLKXOR2X2M U23 (.Y(n12), 
	.B(n5), 
	.A(current_st[1]));
endmodule

module SERIALIZER_test_1 (
	CLK, 
	RST, 
	LOAD, 
	P_DATA, 
	SER_EN, 
	SER_DONE, 
	SER_DATA, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input LOAD;
   input [7:0] P_DATA;
   input SER_EN;
   output SER_DONE;
   output SER_DATA;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire N25;
   wire n13;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n15;
   wire n39;
   wire n40;
   wire n42;
   wire n44;
   wire n45;
   wire [7:1] shift_reg;
   wire [2:0] counter;

   assign test_so = shift_reg[7] ;
   assign SER_DONE = N25 ;

   SDFFSQX2M \shift_reg_reg[7]  (.SN(RST), 
	.SI(shift_reg[6]), 
	.SE(n45), 
	.Q(shift_reg[7]), 
	.D(n28), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[6]  (.SN(RST), 
	.SI(shift_reg[5]), 
	.SE(n45), 
	.Q(shift_reg[6]), 
	.D(n29), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[5]  (.SN(RST), 
	.SI(shift_reg[4]), 
	.SE(n45), 
	.Q(shift_reg[5]), 
	.D(n30), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[4]  (.SN(RST), 
	.SI(shift_reg[3]), 
	.SE(n45), 
	.Q(shift_reg[4]), 
	.D(n31), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[3]  (.SN(RST), 
	.SI(shift_reg[2]), 
	.SE(n45), 
	.Q(shift_reg[3]), 
	.D(n32), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[2]  (.SN(RST), 
	.SI(shift_reg[1]), 
	.SE(n45), 
	.Q(shift_reg[2]), 
	.D(n33), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[1]  (.SN(RST), 
	.SI(SER_DATA), 
	.SE(n45), 
	.Q(shift_reg[1]), 
	.D(n34), 
	.CK(CLK));
   SDFFSQX2M \shift_reg_reg[0]  (.SN(RST), 
	.SI(n42), 
	.SE(n45), 
	.Q(SER_DATA), 
	.D(n35), 
	.CK(CLK));
   SDFFRQX2M \counter_reg[1]  (.SI(counter[0]), 
	.SE(n45), 
	.RN(RST), 
	.Q(counter[1]), 
	.D(n36), 
	.CK(CLK));
   SDFFRQX2M \counter_reg[0]  (.SI(test_si), 
	.SE(n45), 
	.RN(RST), 
	.Q(counter[0]), 
	.D(n38), 
	.CK(CLK));
   SDFFRX1M \counter_reg[2]  (.SI(counter[1]), 
	.SE(n45), 
	.RN(RST), 
	.QN(n13), 
	.Q(n42), 
	.D(n37), 
	.CK(CLK));
   NOR2X2M U14 (.Y(n16), 
	.B(n18), 
	.A(LOAD));
   INVX2M U15 (.Y(n15), 
	.A(n18));
   AOI21X2M U16 (.Y(n26), 
	.B0(n16), 
	.A1(n18), 
	.A0(n39));
   NOR3BX4M U18 (.Y(n18), 
	.C(LOAD), 
	.B(N25), 
	.AN(SER_EN));
   OAI32X1M U20 (.Y(n36), 
	.B1(n40), 
	.B0(n26), 
	.A2(n39), 
	.A1(counter[1]), 
	.A0(n15));
   OAI2BB1X2M U21 (.Y(n35), 
	.B0(n25), 
	.A1N(n16), 
	.A0N(SER_DATA));
   AOI22X1M U22 (.Y(n25), 
	.B1(n18), 
	.B0(shift_reg[1]), 
	.A1(LOAD), 
	.A0(P_DATA[0]));
   OAI2BB1X2M U23 (.Y(n34), 
	.B0(n24), 
	.A1N(shift_reg[1]), 
	.A0N(n16));
   AOI22X1M U24 (.Y(n24), 
	.B1(n18), 
	.B0(shift_reg[2]), 
	.A1(LOAD), 
	.A0(P_DATA[1]));
   OAI2BB1X2M U25 (.Y(n32), 
	.B0(n22), 
	.A1N(shift_reg[3]), 
	.A0N(n16));
   AOI22X1M U26 (.Y(n22), 
	.B1(n18), 
	.B0(shift_reg[4]), 
	.A1(LOAD), 
	.A0(P_DATA[3]));
   OAI2BB1X2M U27 (.Y(n31), 
	.B0(n21), 
	.A1N(shift_reg[4]), 
	.A0N(n16));
   AOI22X1M U28 (.Y(n21), 
	.B1(n18), 
	.B0(shift_reg[5]), 
	.A1(LOAD), 
	.A0(P_DATA[4]));
   OAI2BB1X2M U29 (.Y(n30), 
	.B0(n20), 
	.A1N(shift_reg[5]), 
	.A0N(n16));
   AOI22X1M U30 (.Y(n20), 
	.B1(n18), 
	.B0(shift_reg[6]), 
	.A1(LOAD), 
	.A0(P_DATA[5]));
   OAI2BB1X2M U31 (.Y(n29), 
	.B0(n19), 
	.A1N(shift_reg[6]), 
	.A0N(n16));
   AOI22X1M U32 (.Y(n19), 
	.B1(shift_reg[7]), 
	.B0(n18), 
	.A1(LOAD), 
	.A0(P_DATA[6]));
   OAI2BB1X2M U33 (.Y(n33), 
	.B0(n23), 
	.A1N(shift_reg[2]), 
	.A0N(n16));
   AOI22X1M U34 (.Y(n23), 
	.B1(n18), 
	.B0(shift_reg[3]), 
	.A1(LOAD), 
	.A0(P_DATA[2]));
   OAI2BB1X2M U35 (.Y(n28), 
	.B0(n17), 
	.A1N(shift_reg[7]), 
	.A0N(n16));
   AOI21X2M U36 (.Y(n17), 
	.B0(n18), 
	.A1(LOAD), 
	.A0(P_DATA[7]));
   OAI32X1M U37 (.Y(n37), 
	.B1(n13), 
	.B0(n27), 
	.A2(n40), 
	.A1(n39), 
	.A0(n15));
   AND2X2M U38 (.Y(n27), 
	.B(n15), 
	.A(n26));
   NOR3X2M U39 (.Y(N25), 
	.C(n13), 
	.B(n39), 
	.A(n40));
   OAI2BB2X1M U40 (.Y(n38), 
	.B1(n15), 
	.B0(counter[0]), 
	.A1N(n16), 
	.A0N(counter[0]));
   INVX2M U41 (.Y(n39), 
	.A(counter[0]));
   INVX2M U42 (.Y(n40), 
	.A(counter[1]));
   INVXLM U43 (.Y(n44), 
	.A(test_se));
   CLKINVX2M U44 (.Y(n45), 
	.A(n44));
endmodule

module Parity_Calc_test_1 (
	CLK, 
	RST, 
	LOAD, 
	P_DATA, 
	PAR_TYP, 
	PAR_BIT, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input LOAD;
   input [7:0] P_DATA;
   input PAR_TYP;
   output PAR_BIT;
   input test_si;
   input test_se;

   // Internal wires
   wire n1;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n8;
   wire n2;

   SDFFRQX2M PAR_BIT_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(PAR_BIT), 
	.D(n8), 
	.CK(CLK));
   XOR3XLM U2 (.Y(n3), 
	.C(n6), 
	.B(P_DATA[4]), 
	.A(P_DATA[5]));
   CLKXOR2X2M U3 (.Y(n6), 
	.B(P_DATA[6]), 
	.A(P_DATA[7]));
   XNOR2X2M U4 (.Y(n5), 
	.B(P_DATA[2]), 
	.A(P_DATA[3]));
   OAI2BB2X1M U5 (.Y(n8), 
	.B1(n2), 
	.B0(n1), 
	.A1N(n2), 
	.A0N(PAR_BIT));
   INVX2M U6 (.Y(n2), 
	.A(LOAD));
   XOR3XLM U7 (.Y(n1), 
	.C(n4), 
	.B(PAR_TYP), 
	.A(n3));
   XOR3XLM U8 (.Y(n4), 
	.C(n5), 
	.B(P_DATA[0]), 
	.A(P_DATA[1]));
endmodule

module MUX4x1 (
	START_BIT, 
	STOP_BIT, 
	SER_DATA, 
	PAR_BIT, 
	MUX_SEL, 
	TX_OUT);
   input START_BIT;
   input STOP_BIT;
   input SER_DATA;
   input PAR_BIT;
   input [2:0] MUX_SEL;
   output TX_OUT;

   // Internal wires
   wire HTIE_LTIEHI_NET;
   wire LTIE_LTIELO_NET;
   wire FE_OFN4_UART_TX_O;
   wire n4;
   wire n5;
   wire n1;
   wire n2;
   wire n3;

   TIEHIM HTIE_LTIEHI (.Y(HTIE_LTIEHI_NET));
   TIELOM LTIE_LTIELO (.Y(LTIE_LTIELO_NET));
   BUFX2M FE_OFC4_UART_TX_O (.Y(TX_OUT), 
	.A(FE_OFN4_UART_TX_O));
   OAI221X1M U2 (.Y(FE_OFN4_UART_TX_O), 
	.C0(n2), 
	.B1(n3), 
	.B0(n5), 
	.A1(n4), 
	.A0(MUX_SEL[1]));
   INVX2M U3 (.Y(n1), 
	.A(MUX_SEL[0]));
   INVX2M U4 (.Y(n2), 
	.A(MUX_SEL[2]));
   INVX2M U5 (.Y(n3), 
	.A(MUX_SEL[1]));
   AOI22X1M U6 (.Y(n5), 
	.B1(MUX_SEL[0]), 
	.B0(PAR_BIT), 
	.A1(n1), 
	.A0(SER_DATA));
   AOI22X1M U7 (.Y(n4), 
	.B1(MUX_SEL[0]), 
	.B0(HTIE_LTIEHI_NET), 
	.A1(n1), 
	.A0(LTIE_LTIELO_NET));
endmodule

module UART_TX_TOP_test_1 (
	CLK, 
	RST, 
	DATA_VALID, 
	PAR_EN, 
	PAR_TYP, 
	P_DATA, 
	TX_OUT, 
	BUSY, 
	test_si, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input DATA_VALID;
   input PAR_EN;
   input PAR_TYP;
   input [7:0] P_DATA;
   output TX_OUT;
   output BUSY;
   input test_si;
   output test_so;
   input test_se;

   // Internal wires
   wire SER_DONE;
   wire LOAD;
   wire SER_EN;
   wire SER_DATA;
   wire PAR_BIT;
   wire n3;
   wire [2:0] MUX_SEL;

   FSM_test_1 U_FSM (.DATA_VALID(DATA_VALID), 
	.PAR_EN(PAR_EN), 
	.SER_DONE(SER_DONE), 
	.RST(RST), 
	.CLK(CLK), 
	.MUX_SEL({ MUX_SEL[2],
		MUX_SEL[1],
		MUX_SEL[0] }), 
	.BUSY(BUSY), 
	.LOAD(LOAD), 
	.SER_EN(SER_EN), 
	.test_si(test_si), 
	.test_so(n3), 
	.test_se(test_se));
   SERIALIZER_test_1 U_SERIALIZER (.CLK(CLK), 
	.RST(RST), 
	.LOAD(LOAD), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.SER_EN(SER_EN), 
	.SER_DONE(SER_DONE), 
	.SER_DATA(SER_DATA), 
	.test_si(PAR_BIT), 
	.test_so(test_so), 
	.test_se(test_se));
   Parity_Calc_test_1 U_PARITY (.CLK(CLK), 
	.RST(RST), 
	.LOAD(LOAD), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.PAR_TYP(PAR_TYP), 
	.PAR_BIT(PAR_BIT), 
	.test_si(n3), 
	.test_se(test_se));
   MUX4x1 U_MUX (.START_BIT(1'b0), 
	.STOP_BIT(1'b1), 
	.SER_DATA(SER_DATA), 
	.PAR_BIT(PAR_BIT), 
	.MUX_SEL({ MUX_SEL[2],
		MUX_SEL[1],
		MUX_SEL[0] }), 
	.TX_OUT(TX_OUT));
endmodule

module uart_rx_fsm_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	PAR_EN, 
	sample_valid, 
	strt_glitch, 
	par_err, 
	stp_err, 
	bit_cnt, 
	dat_samp_en, 
	deser_en, 
	strt_chk_en, 
	par_chk_en, 
	stp_chk_en, 
	enable, 
	data_valid, 
	test_so, 
	test_se);
   input CLK;
   input RST;
   input RX_IN;
   input PAR_EN;
   input sample_valid;
   input strt_glitch;
   input par_err;
   input stp_err;
   input [3:0] bit_cnt;
   output dat_samp_en;
   output deser_en;
   output strt_chk_en;
   output par_chk_en;
   output stp_chk_en;
   output enable;
   output data_valid;
   output test_so;
   input test_se;

   // Internal wires
   wire parity_error;
   wire n12;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n34;
   wire n35;
   wire n36;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire [2:0] Current_st;

   assign test_so = parity_error ;

   SDFFRQX2M parity_error_reg (.SI(Current_st[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(parity_error), 
	.D(n6), 
	.CK(CLK));
   SDFFRQX2M \Current_st_reg[2]  (.SI(Current_st[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Current_st[2]), 
	.D(n35), 
	.CK(CLK));
   SDFFRQX2M \Current_st_reg[1]  (.SI(Current_st[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Current_st[1]), 
	.D(n34), 
	.CK(CLK));
   SDFFRQX2M \Current_st_reg[0]  (.SI(par_err), 
	.SE(test_se), 
	.RN(RST), 
	.Q(Current_st[0]), 
	.D(n36), 
	.CK(CLK));
   NOR2X2M U7 (.Y(n16), 
	.B(n9), 
	.A(n28));
   OAI22X1M U8 (.Y(n35), 
	.B1(n11), 
	.B0(n17), 
	.A1(n19), 
	.A0(n8));
   NAND2BX2M U9 (.Y(n30), 
	.B(n9), 
	.AN(n28));
   NOR2X2M U10 (.Y(n17), 
	.B(n8), 
	.A(n10));
   NAND2X2M U11 (.Y(dat_samp_en), 
	.B(n30), 
	.A(n31));
   NAND2X2M U12 (.Y(n15), 
	.B(n9), 
	.A(n29));
   INVX2M U13 (.Y(n10), 
	.A(n32));
   NAND2X2M U14 (.Y(n24), 
	.B(n12), 
	.A(n30));
   NOR2X2M U15 (.Y(strt_chk_en), 
	.B(n7), 
	.A(n12));
   AOI2B1X1M U16 (.Y(n19), 
	.B0(n16), 
	.A1N(n20), 
	.A0(n10));
   NOR2X2M U17 (.Y(stp_chk_en), 
	.B(n7), 
	.A(n30));
   INVX2M U18 (.Y(par_chk_en), 
	.A(n14));
   NOR4BX1M U19 (.Y(n31), 
	.D(n10), 
	.C(n16), 
	.B(n5), 
	.AN(n12));
   NOR2X2M U20 (.Y(n5), 
	.B(n15), 
	.A(RX_IN));
   NOR2X2M U21 (.Y(n29), 
	.B(Current_st[2]), 
	.A(Current_st[1]));
   OAI221X1M U22 (.Y(n36), 
	.C0(n18), 
	.B1(n9), 
	.B0(n22), 
	.A1(n21), 
	.A0(n8));
   AOI21BX2M U23 (.Y(n21), 
	.B0N(n15), 
	.A1(n10), 
	.A0(PAR_EN));
   AOI21X2M U24 (.Y(n22), 
	.B0(n8), 
	.A1(n20), 
	.A0(n10));
   OAI2B11X2M U25 (.Y(n34), 
	.C0(n19), 
	.B0(n18), 
	.A1N(Current_st[1]), 
	.A0(n17));
   INVX2M U26 (.Y(n8), 
	.A(n23));
   OAI31X1M U27 (.Y(n23), 
	.B0(n26), 
	.A2(n25), 
	.A1(n10), 
	.A0(n24));
   OAI21X2M U28 (.Y(n26), 
	.B0(sample_valid), 
	.A1(n27), 
	.A0(Current_st[0]));
   AOI22X1M U29 (.Y(n25), 
	.B1(n9), 
	.B0(n27), 
	.A1(n28), 
	.A0(Current_st[0]));
   NAND2X2M U30 (.Y(n12), 
	.B(n29), 
	.A(Current_st[0]));
   NAND3X2M U31 (.Y(n32), 
	.C(Current_st[1]), 
	.B(n11), 
	.A(Current_st[0]));
   NAND2X2M U32 (.Y(n27), 
	.B(n29), 
	.A(RX_IN));
   INVX2M U33 (.Y(n9), 
	.A(Current_st[0]));
   OAI21X2M U34 (.Y(enable), 
	.B0(n31), 
	.A1(n30), 
	.A0(sample_valid));
   NAND2X2M U35 (.Y(n28), 
	.B(Current_st[1]), 
	.A(Current_st[2]));
   INVX2M U36 (.Y(n11), 
	.A(Current_st[2]));
   OR3X2M U37 (.Y(n18), 
	.C(n12), 
	.B(n8), 
	.A(strt_glitch));
   INVX2M U38 (.Y(n6), 
	.A(n13));
   AOI32X1M U39 (.Y(n13), 
	.B1(par_err), 
	.B0(par_chk_en), 
	.A2(n15), 
	.A1(n14), 
	.A0(parity_error));
   NOR2X2M U40 (.Y(deser_en), 
	.B(n32), 
	.A(n7));
   NAND4BBX1M U41 (.Y(n20), 
	.D(bit_cnt[0]), 
	.C(bit_cnt[3]), 
	.BN(bit_cnt[1]), 
	.AN(bit_cnt[2]));
   NOR3BX2M U42 (.Y(data_valid), 
	.C(parity_error), 
	.B(stp_err), 
	.AN(stp_chk_en));
   NAND2X2M U43 (.Y(n14), 
	.B(sample_valid), 
	.A(n16));
   INVX2M U44 (.Y(n7), 
	.A(sample_valid));
endmodule

module edge_bit_counter_test_1 (
	CLK, 
	RST, 
	Prescale, 
	enable, 
	edge_cnt, 
	bit_cnt, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input [5:0] Prescale;
   input enable;
   output [5:0] edge_cnt;
   output [3:0] bit_cnt;
   input test_si;
   input test_se;

   // Internal wires
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N13;
   wire N20;
   wire N21;
   wire N22;
   wire N23;
   wire N36;
   wire N37;
   wire N38;
   wire N39;
   wire N40;
   wire N41;
   wire n17;
   wire n18;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire \add_35/carry[5] ;
   wire \add_35/carry[4] ;
   wire \add_35/carry[3] ;
   wire \add_35/carry[2] ;
   wire n1;
   wire n2;
   wire n13;
   wire n14;
   wire n15;
   wire n16;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n31;
   wire n32;
   wire n33;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;

   SDFFRQX2M \bit_cnt_reg[3]  (.SI(bit_cnt[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[3]), 
	.D(n26), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[1]  (.SI(bit_cnt[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[1]), 
	.D(n24), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[2]  (.SI(bit_cnt[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[2]), 
	.D(n23), 
	.CK(CLK));
   SDFFRQX2M \bit_cnt_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(bit_cnt[0]), 
	.D(n25), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[5]  (.SI(edge_cnt[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[5]), 
	.D(N41), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[0]  (.SI(bit_cnt[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[0]), 
	.D(N36), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[3]  (.SI(edge_cnt[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[3]), 
	.D(N39), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[2]  (.SI(edge_cnt[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[2]), 
	.D(N38), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[1]  (.SI(edge_cnt[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[1]), 
	.D(N37), 
	.CK(CLK));
   SDFFRQX2M \edge_cnt_reg[4]  (.SI(edge_cnt[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(edge_cnt[4]), 
	.D(N40), 
	.CK(CLK));
   INVX2M U7 (.Y(n36), 
	.A(n20));
   NOR2X2M U14 (.Y(n20), 
	.B(N13), 
	.A(n37));
   NOR2BX2M U15 (.Y(N37), 
	.B(n36), 
	.AN(N20));
   NOR2BX2M U16 (.Y(N38), 
	.B(n36), 
	.AN(N21));
   NOR2BX2M U17 (.Y(N39), 
	.B(n36), 
	.AN(N22));
   NOR2BX2M U18 (.Y(N40), 
	.B(n36), 
	.AN(N23));
   OAI32X1M U19 (.Y(n25), 
	.B1(n36), 
	.B0(n38), 
	.A2(n20), 
	.A1(bit_cnt[0]), 
	.A0(n37));
   OAI22X1M U20 (.Y(n24), 
	.B1(n37), 
	.B0(n19), 
	.A1(n36), 
	.A0(n39));
   AOI32X1M U21 (.Y(n19), 
	.B1(n38), 
	.B0(bit_cnt[1]), 
	.A2(bit_cnt[0]), 
	.A1(n39), 
	.A0(n36));
   INVX2M U22 (.Y(n39), 
	.A(bit_cnt[1]));
   AND3X2M U23 (.Y(n18), 
	.C(bit_cnt[0]), 
	.B(bit_cnt[1]), 
	.A(N13));
   OR2X2M U24 (.Y(n2), 
	.B(Prescale[0]), 
	.A(Prescale[1]));
   INVX2M U25 (.Y(n16), 
	.A(Prescale[3]));
   NOR2X2M U26 (.Y(N36), 
	.B(n36), 
	.A(edge_cnt[0]));
   NOR2X2M U27 (.Y(N41), 
	.B(n36), 
	.A(n1));
   XNOR2X2M U28 (.Y(n1), 
	.B(edge_cnt[5]), 
	.A(\add_35/carry[5] ));
   NOR2X2M U29 (.Y(n26), 
	.B(n37), 
	.A(n21));
   CLKXOR2X2M U30 (.Y(n21), 
	.B(bit_cnt[3]), 
	.A(n22));
   NAND2X2M U31 (.Y(n22), 
	.B(bit_cnt[2]), 
	.A(n18));
   NOR2X2M U32 (.Y(n23), 
	.B(n37), 
	.A(n17));
   XNOR2X2M U33 (.Y(n17), 
	.B(bit_cnt[2]), 
	.A(n18));
   INVX2M U34 (.Y(n37), 
	.A(enable));
   ADDHX1M U35 (.S(N20), 
	.CO(\add_35/carry[2] ), 
	.B(edge_cnt[0]), 
	.A(edge_cnt[1]));
   ADDHX1M U36 (.S(N21), 
	.CO(\add_35/carry[3] ), 
	.B(\add_35/carry[2] ), 
	.A(edge_cnt[2]));
   ADDHX1M U37 (.S(N22), 
	.CO(\add_35/carry[4] ), 
	.B(\add_35/carry[3] ), 
	.A(edge_cnt[3]));
   INVX2M U38 (.Y(n38), 
	.A(bit_cnt[0]));
   ADDHX1M U39 (.S(N23), 
	.CO(\add_35/carry[5] ), 
	.B(\add_35/carry[4] ), 
	.A(edge_cnt[4]));
   CLKINVX1M U40 (.Y(N7), 
	.A(Prescale[0]));
   OAI2BB1X1M U41 (.Y(N8), 
	.B0(n2), 
	.A1N(Prescale[1]), 
	.A0N(Prescale[0]));
   NOR2X1M U42 (.Y(n13), 
	.B(Prescale[2]), 
	.A(n2));
   AO21XLM U43 (.Y(N9), 
	.B0(n13), 
	.A1(Prescale[2]), 
	.A0(n2));
   CLKNAND2X2M U44 (.Y(n14), 
	.B(n16), 
	.A(n13));
   OAI21X1M U45 (.Y(N10), 
	.B0(n14), 
	.A1(n16), 
	.A0(n13));
   XNOR2X1M U46 (.Y(N11), 
	.B(n14), 
	.A(Prescale[4]));
   NOR2X1M U47 (.Y(n15), 
	.B(n14), 
	.A(Prescale[4]));
   CLKXOR2X2M U48 (.Y(N12), 
	.B(n15), 
	.A(Prescale[5]));
   NOR2BX1M U49 (.Y(n27), 
	.B(N7), 
	.AN(edge_cnt[0]));
   OAI2B2X1M U50 (.Y(n31), 
	.B1(n27), 
	.B0(edge_cnt[1]), 
	.A1N(N8), 
	.A0(n27));
   NOR2BX1M U51 (.Y(n28), 
	.B(edge_cnt[0]), 
	.AN(N7));
   OAI2B2X1M U52 (.Y(n30), 
	.B1(n28), 
	.B0(N8), 
	.A1N(edge_cnt[1]), 
	.A0(n28));
   XNOR2X1M U53 (.Y(n29), 
	.B(edge_cnt[5]), 
	.A(N12));
   NAND3X1M U54 (.Y(n35), 
	.C(n29), 
	.B(n30), 
	.A(n31));
   CLKXOR2X2M U55 (.Y(n34), 
	.B(edge_cnt[4]), 
	.A(N11));
   CLKXOR2X2M U56 (.Y(n33), 
	.B(edge_cnt[2]), 
	.A(N9));
   CLKXOR2X2M U57 (.Y(n32), 
	.B(edge_cnt[3]), 
	.A(N10));
   NOR4X1M U58 (.Y(N13), 
	.D(n32), 
	.C(n33), 
	.B(n34), 
	.A(n35));
endmodule

module data_sampling_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	Prescale, 
	dat_samp_en, 
	edge_cnt, 
	sample_valid, 
	sampled_bit, 
	test_si, 
	test_so, 
	test_se, 
	FE_OFN0_UART_RST_M);
   input CLK;
   input RST;
   input RX_IN;
   input [5:0] Prescale;
   input dat_samp_en;
   input [5:0] edge_cnt;
   output sample_valid;
   output sampled_bit;
   input test_si;
   output test_so;
   input test_se;
   input FE_OFN0_UART_RST_M;

   // Internal wires
   wire \sampled_ones[0] ;
   wire N7;
   wire N8;
   wire N9;
   wire N10;
   wire N11;
   wire N12;
   wire N16;
   wire N17;
   wire N18;
   wire N19;
   wire N20;
   wire N23;
   wire N24;
   wire N25;
   wire N26;
   wire N27;
   wire N28;
   wire n31;
   wire n32;
   wire n33;
   wire \add_34/carry[4] ;
   wire \add_34/carry[3] ;
   wire \add_34/carry[2] ;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;
   wire n11;
   wire n12;
   wire n13;
   wire n14;
   wire n19;
   wire n20;
   wire n21;
   wire n22;
   wire n23;
   wire n24;
   wire n25;
   wire n26;
   wire n27;
   wire n28;
   wire n29;
   wire n30;
   wire n34;
   wire n35;
   wire n36;
   wire n37;
   wire n38;
   wire n39;
   wire n40;
   wire n41;
   wire n42;
   wire n43;
   wire n44;
   wire n45;
   wire n46;
   wire n47;
   wire n48;
   wire n49;
   wire n50;
   wire n51;
   wire n52;
   wire n53;
   wire n54;
   wire n55;
   wire n56;
   wire n57;
   wire n58;
   wire n59;
   wire n60;

   SDFFRQX2M \sampled_ones_reg[0]  (.SI(sampled_bit), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(\sampled_ones[0] ), 
	.D(n33), 
	.CK(CLK));
   SDFFSQX2M sampled_bit_reg (.SN(RST), 
	.SI(sample_valid), 
	.SE(test_se), 
	.Q(sampled_bit), 
	.D(n31), 
	.CK(CLK));
   SDFFRQX2M sample_valid_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(sample_valid), 
	.D(n60), 
	.CK(CLK));
   SDFFRX1M \sampled_ones_reg[1]  (.SI(\sampled_ones[0] ), 
	.SE(test_se), 
	.RN(RST), 
	.QN(test_so), 
	.Q(n59), 
	.D(n32), 
	.CK(CLK));
   OR2X2M U7 (.Y(n5), 
	.B(Prescale[0]), 
	.A(Prescale[1]));
   OR2X2M U8 (.Y(n2), 
	.B(Prescale[1]), 
	.A(Prescale[2]));
   ADDHX1M U9 (.S(N19), 
	.CO(N20), 
	.B(\add_34/carry[4] ), 
	.A(Prescale[5]));
   INVX2M U10 (.Y(n9), 
	.A(Prescale[3]));
   ADDHX1M U11 (.S(N17), 
	.CO(\add_34/carry[3] ), 
	.B(\add_34/carry[2] ), 
	.A(Prescale[3]));
   ADDHX1M U13 (.S(N18), 
	.CO(\add_34/carry[4] ), 
	.B(\add_34/carry[3] ), 
	.A(Prescale[4]));
   ADDHX1M U14 (.S(N16), 
	.CO(\add_34/carry[2] ), 
	.B(Prescale[1]), 
	.A(Prescale[2]));
   CLKINVX1M U15 (.Y(N7), 
	.A(Prescale[1]));
   OAI2BB1X1M U16 (.Y(N8), 
	.B0(n2), 
	.A1N(Prescale[2]), 
	.A0N(Prescale[1]));
   OR2X1M U17 (.Y(n3), 
	.B(Prescale[3]), 
	.A(n2));
   OAI2BB1X1M U18 (.Y(N9), 
	.B0(n3), 
	.A1N(Prescale[3]), 
	.A0N(n2));
   XNOR2X1M U19 (.Y(N10), 
	.B(n3), 
	.A(Prescale[4]));
   NOR3X1M U20 (.Y(N12), 
	.C(n3), 
	.B(Prescale[5]), 
	.A(Prescale[4]));
   OAI21X1M U21 (.Y(n4), 
	.B0(Prescale[5]), 
	.A1(n3), 
	.A0(Prescale[4]));
   NAND2BX1M U22 (.Y(N11), 
	.B(n4), 
	.AN(N12));
   CLKINVX1M U23 (.Y(N23), 
	.A(Prescale[0]));
   OAI2BB1X1M U24 (.Y(N24), 
	.B0(n5), 
	.A1N(Prescale[1]), 
	.A0N(Prescale[0]));
   NOR2X1M U25 (.Y(n6), 
	.B(Prescale[2]), 
	.A(n5));
   AO21XLM U26 (.Y(N25), 
	.B0(n6), 
	.A1(Prescale[2]), 
	.A0(n5));
   CLKNAND2X2M U27 (.Y(n7), 
	.B(n9), 
	.A(n6));
   OAI21X1M U28 (.Y(N26), 
	.B0(n7), 
	.A1(n9), 
	.A0(n6));
   XNOR2X1M U29 (.Y(N27), 
	.B(n7), 
	.A(Prescale[4]));
   NOR2X1M U30 (.Y(n8), 
	.B(n7), 
	.A(Prescale[4]));
   CLKXOR2X2M U31 (.Y(N28), 
	.B(n8), 
	.A(Prescale[5]));
   MXI2X1M U32 (.Y(n33), 
	.S0(\sampled_ones[0] ), 
	.B(n11), 
	.A(n10));
   CLKINVX1M U33 (.Y(n11), 
	.A(n12));
   CLKNAND2X2M U34 (.Y(n10), 
	.B(n13), 
	.A(RX_IN));
   MXI2X1M U35 (.Y(n32), 
	.S0(n59), 
	.B(n19), 
	.A(n14));
   AOI2BB1X1M U36 (.Y(n19), 
	.B0(n12), 
	.A1N(n20), 
	.A0N(\sampled_ones[0] ));
   OAI32X1M U37 (.Y(n12), 
	.B1(n20), 
	.B0(RX_IN), 
	.A2(n23), 
	.A1(n22), 
	.A0(n21));
   NAND3X1M U38 (.Y(n14), 
	.C(\sampled_ones[0] ), 
	.B(n13), 
	.A(RX_IN));
   CLKINVX1M U39 (.Y(n13), 
	.A(n20));
   CLKNAND2X2M U40 (.Y(n20), 
	.B(n23), 
	.A(dat_samp_en));
   CLKMX2X2M U41 (.Y(n31), 
	.S0(n60), 
	.B(n59), 
	.A(sampled_bit));
   NOR3BX1M U42 (.Y(n60), 
	.C(n21), 
	.B(n23), 
	.AN(n22));
   CLKINVX1M U43 (.Y(n21), 
	.A(dat_samp_en));
   OAI211X1M U44 (.Y(n23), 
	.C0(n27), 
	.B0(n26), 
	.A1(n25), 
	.A0(n24));
   NAND4X1M U45 (.Y(n27), 
	.D(n34), 
	.C(n30), 
	.B(n29), 
	.A(n28));
   NOR3X1M U46 (.Y(n34), 
	.C(n36), 
	.B(edge_cnt[5]), 
	.A(n35));
   CLKXOR2X2M U47 (.Y(n36), 
	.B(Prescale[1]), 
	.A(edge_cnt[0]));
   CLKXOR2X2M U48 (.Y(n35), 
	.B(Prescale[5]), 
	.A(edge_cnt[4]));
   XNOR2X1M U49 (.Y(n30), 
	.B(Prescale[3]), 
	.A(edge_cnt[2]));
   XNOR2X1M U50 (.Y(n29), 
	.B(Prescale[4]), 
	.A(edge_cnt[3]));
   XNOR2X1M U51 (.Y(n28), 
	.B(Prescale[2]), 
	.A(edge_cnt[1]));
   NAND4X1M U52 (.Y(n26), 
	.D(n40), 
	.C(n39), 
	.B(n38), 
	.A(n37));
   NOR3X1M U53 (.Y(n40), 
	.C(n43), 
	.B(n42), 
	.A(n41));
   CLKXOR2X2M U54 (.Y(n43), 
	.B(N11), 
	.A(edge_cnt[4]));
   CLKXOR2X2M U55 (.Y(n42), 
	.B(N7), 
	.A(edge_cnt[0]));
   CLKXOR2X2M U56 (.Y(n41), 
	.B(N12), 
	.A(edge_cnt[5]));
   XNOR2X1M U57 (.Y(n39), 
	.B(N9), 
	.A(edge_cnt[2]));
   XNOR2X1M U58 (.Y(n38), 
	.B(N10), 
	.A(edge_cnt[3]));
   XNOR2X1M U59 (.Y(n37), 
	.B(N8), 
	.A(edge_cnt[1]));
   NAND3X1M U60 (.Y(n25), 
	.C(n46), 
	.B(n45), 
	.A(n44));
   CLKXOR2X2M U61 (.Y(n46), 
	.B(N19), 
	.A(n47));
   CLKINVX1M U62 (.Y(n47), 
	.A(edge_cnt[4]));
   XNOR2X1M U63 (.Y(n45), 
	.B(N20), 
	.A(edge_cnt[5]));
   XNOR2X1M U64 (.Y(n44), 
	.B(N18), 
	.A(edge_cnt[3]));
   NAND3X1M U65 (.Y(n24), 
	.C(n50), 
	.B(n49), 
	.A(n48));
   XNOR2X1M U66 (.Y(n50), 
	.B(N16), 
	.A(edge_cnt[1]));
   XNOR2X1M U67 (.Y(n49), 
	.B(N17), 
	.A(edge_cnt[2]));
   CLKXOR2X2M U68 (.Y(n48), 
	.B(N7), 
	.A(n51));
   CLKINVX1M U69 (.Y(n51), 
	.A(edge_cnt[0]));
   AND4X1M U70 (.Y(n22), 
	.D(n55), 
	.C(n54), 
	.B(n53), 
	.A(n52));
   NOR3X1M U71 (.Y(n55), 
	.C(n58), 
	.B(n57), 
	.A(n56));
   CLKXOR2X2M U72 (.Y(n58), 
	.B(N27), 
	.A(edge_cnt[4]));
   CLKXOR2X2M U73 (.Y(n57), 
	.B(N24), 
	.A(edge_cnt[1]));
   CLKXOR2X2M U74 (.Y(n56), 
	.B(N23), 
	.A(edge_cnt[0]));
   XNOR2X1M U75 (.Y(n54), 
	.B(N25), 
	.A(edge_cnt[2]));
   XNOR2X1M U76 (.Y(n53), 
	.B(N26), 
	.A(edge_cnt[3]));
   XNOR2X1M U77 (.Y(n52), 
	.B(N28), 
	.A(edge_cnt[5]));
endmodule

module strt_check (
	strt_chk_en, 
	sampled_bit, 
	strt_glitch);
   input strt_chk_en;
   input sampled_bit;
   output strt_glitch;

   AND2X2M U2 (.Y(strt_glitch), 
	.B(sampled_bit), 
	.A(strt_chk_en));
endmodule

module deserializer_test_1 (
	CLK, 
	RST, 
	deser_en, 
	sample_valid, 
	sampled_bit, 
	P_DATA, 
	test_si, 
	test_se, 
	FE_OFN0_UART_RST_M);
   input CLK;
   input RST;
   input deser_en;
   input sample_valid;
   input sampled_bit;
   output [7:0] P_DATA;
   input test_si;
   input test_se;
   input FE_OFN0_UART_RST_M;

   // Internal wires
   wire n1;
   wire n11;
   wire n13;
   wire n15;
   wire n17;
   wire n19;
   wire n21;
   wire n23;
   wire n25;
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;

   SDFFRQX2M \P_DATA_reg[0]  (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[0]), 
	.D(n11), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[5]  (.SI(P_DATA[4]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[5]), 
	.D(n21), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[1]  (.SI(P_DATA[0]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[1]), 
	.D(n13), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[4]  (.SI(P_DATA[3]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[4]), 
	.D(n19), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[7]  (.SI(P_DATA[6]), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(P_DATA[7]), 
	.D(n25), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[3]  (.SI(P_DATA[2]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[3]), 
	.D(n17), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[6]  (.SI(P_DATA[5]), 
	.SE(test_se), 
	.RN(FE_OFN0_UART_RST_M), 
	.Q(P_DATA[6]), 
	.D(n23), 
	.CK(CLK));
   SDFFRQX2M \P_DATA_reg[2]  (.SI(P_DATA[1]), 
	.SE(test_se), 
	.RN(RST), 
	.Q(P_DATA[2]), 
	.D(n15), 
	.CK(CLK));
   OAI22X1M U2 (.Y(n13), 
	.B1(n7), 
	.B0(n1), 
	.A1(n8), 
	.A0(n9));
   OAI22X1M U3 (.Y(n15), 
	.B1(n6), 
	.B0(n1), 
	.A1(n7), 
	.A0(n9));
   OAI22X1M U4 (.Y(n17), 
	.B1(n5), 
	.B0(n1), 
	.A1(n6), 
	.A0(n9));
   OAI22X1M U5 (.Y(n19), 
	.B1(n4), 
	.B0(n1), 
	.A1(n5), 
	.A0(n9));
   OAI22X1M U6 (.Y(n21), 
	.B1(n3), 
	.B0(n1), 
	.A1(n4), 
	.A0(n9));
   OAI22X1M U7 (.Y(n23), 
	.B1(n2), 
	.B0(n1), 
	.A1(n3), 
	.A0(n9));
   INVX2M U8 (.Y(n9), 
	.A(n1));
   NAND2X2M U9 (.Y(n1), 
	.B(deser_en), 
	.A(sample_valid));
   OAI2BB2X1M U10 (.Y(n11), 
	.B1(n8), 
	.B0(n1), 
	.A1N(n1), 
	.A0N(P_DATA[0]));
   OAI2BB2X1M U11 (.Y(n25), 
	.B1(n2), 
	.B0(n9), 
	.A1N(n9), 
	.A0N(sampled_bit));
   INVX2M U12 (.Y(n7), 
	.A(P_DATA[2]));
   INVX2M U13 (.Y(n3), 
	.A(P_DATA[6]));
   INVX2M U14 (.Y(n2), 
	.A(P_DATA[7]));
   INVX2M U15 (.Y(n6), 
	.A(P_DATA[3]));
   INVX2M U16 (.Y(n5), 
	.A(P_DATA[4]));
   INVX2M U17 (.Y(n4), 
	.A(P_DATA[5]));
   INVX2M U18 (.Y(n8), 
	.A(P_DATA[1]));
endmodule

module parity_check_test_1 (
	CLK, 
	RST, 
	par_chk_en, 
	strt_chk_en, 
	PAR_TYP, 
	data, 
	sampled_bit, 
	par_err, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input par_chk_en;
   input strt_chk_en;
   input PAR_TYP;
   input [7:0] data;
   input sampled_bit;
   output par_err;
   input test_si;
   input test_se;

   // Internal wires
   wire n2;
   wire n3;
   wire n4;
   wire n5;
   wire n6;
   wire n7;
   wire n8;
   wire n9;
   wire n10;

   SDFFRQX4M par_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.Q(par_err), 
	.D(n10), 
	.CK(CLK));
   OAI31X1M U4 (.Y(n10), 
	.B0(n4), 
	.A2(n3), 
	.A1(strt_chk_en), 
	.A0(n2));
   NAND2X2M U5 (.Y(n4), 
	.B(n3), 
	.A(par_err));
   NOR2X2M U6 (.Y(n3), 
	.B(strt_chk_en), 
	.A(par_chk_en));
   XOR3XLM U7 (.Y(n2), 
	.C(n7), 
	.B(n6), 
	.A(n5));
   XNOR2X2M U8 (.Y(n7), 
	.B(PAR_TYP), 
	.A(sampled_bit));
   XOR3XLM U9 (.Y(n6), 
	.C(n8), 
	.B(data[4]), 
	.A(data[5]));
   XNOR2X2M U10 (.Y(n8), 
	.B(data[6]), 
	.A(data[7]));
   XOR3XLM U11 (.Y(n5), 
	.C(n9), 
	.B(data[0]), 
	.A(data[1]));
   XNOR2X2M U12 (.Y(n9), 
	.B(data[2]), 
	.A(data[3]));
endmodule

module stop_check_test_1 (
	CLK, 
	RST, 
	stp_chk_en, 
	strt_chk_en, 
	sampled_bit, 
	stp_err, 
	test_si, 
	test_se);
   input CLK;
   input RST;
   input stp_chk_en;
   input strt_chk_en;
   input sampled_bit;
   output stp_err;
   input test_si;
   input test_se;

   // Internal wires
   wire n2;
   wire n4;
   wire n5;

   SDFFRX2M stp_err_reg (.SI(test_si), 
	.SE(test_se), 
	.RN(RST), 
	.QN(n2), 
	.Q(stp_err), 
	.D(n4), 
	.CK(CLK));
   OAI32X1M U5 (.Y(n4), 
	.B1(n5), 
	.B0(sampled_bit), 
	.A2(stp_chk_en), 
	.A1(strt_chk_en), 
	.A0(n2));
   INVX2M U6 (.Y(n5), 
	.A(stp_chk_en));
endmodule

module UART_RX_TOP_test_1 (
	CLK, 
	RST, 
	RX_IN, 
	Prescale, 
	PAR_EN, 
	PAR_TYP, 
	P_DATA, 
	data_valid, 
	par_err, 
	stp_err, 
	test_si2, 
	test_si1, 
	test_so1, 
	test_se, 
	FE_OFN0_UART_RST_M);
   input CLK;
   input RST;
   input RX_IN;
   input [5:0] Prescale;
   input PAR_EN;
   input PAR_TYP;
   output [7:0] P_DATA;
   output data_valid;
   output par_err;
   output stp_err;
   input test_si2;
   input test_si1;
   output test_so1;
   input test_se;
   input FE_OFN0_UART_RST_M;

   // Internal wires
   wire sample_valid;
   wire strt_glitch;
   wire dat_samp_en;
   wire deser_en;
   wire strt_chk_en;
   wire par_chk_en;
   wire stp_chk_en;
   wire enable;
   wire sampled_bit;
   wire n3;
   wire [3:0] bit_cnt;
   wire [5:0] edge_cnt;

   uart_rx_fsm_test_1 U_UART_RX_FSM (.CLK(CLK), 
	.RST(FE_OFN0_UART_RST_M), 
	.RX_IN(RX_IN), 
	.PAR_EN(PAR_EN), 
	.sample_valid(sample_valid), 
	.strt_glitch(strt_glitch), 
	.par_err(par_err), 
	.stp_err(stp_err), 
	.bit_cnt({ bit_cnt[3],
		bit_cnt[2],
		bit_cnt[1],
		bit_cnt[0] }), 
	.dat_samp_en(dat_samp_en), 
	.deser_en(deser_en), 
	.strt_chk_en(strt_chk_en), 
	.par_chk_en(par_chk_en), 
	.stp_chk_en(stp_chk_en), 
	.enable(enable), 
	.data_valid(data_valid), 
	.test_so(test_so1), 
	.test_se(test_se));
   edge_bit_counter_test_1 U_EDGE_BIT_COUNTER (.CLK(CLK), 
	.RST(FE_OFN0_UART_RST_M), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.enable(enable), 
	.edge_cnt({ edge_cnt[5],
		edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.bit_cnt({ bit_cnt[3],
		bit_cnt[2],
		bit_cnt[1],
		bit_cnt[0] }), 
	.test_si(P_DATA[7]), 
	.test_se(test_se));
   data_sampling_test_1 U_DATA_SAMPLING (.CLK(CLK), 
	.RST(RST), 
	.RX_IN(RX_IN), 
	.Prescale({ Prescale[5],
		Prescale[4],
		Prescale[3],
		Prescale[2],
		Prescale[1],
		Prescale[0] }), 
	.dat_samp_en(dat_samp_en), 
	.edge_cnt({ edge_cnt[5],
		edge_cnt[4],
		edge_cnt[3],
		edge_cnt[2],
		edge_cnt[1],
		edge_cnt[0] }), 
	.sample_valid(sample_valid), 
	.sampled_bit(sampled_bit), 
	.test_si(test_si1), 
	.test_so(n3), 
	.test_se(test_se), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M));
   strt_check U_STRT_CHECK (.strt_chk_en(strt_chk_en), 
	.sampled_bit(sampled_bit), 
	.strt_glitch(strt_glitch));
   deserializer_test_1 U_DESERIALIZER (.CLK(CLK), 
	.RST(RST), 
	.deser_en(deser_en), 
	.sample_valid(sample_valid), 
	.sampled_bit(sampled_bit), 
	.P_DATA({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.test_si(n3), 
	.test_se(test_se), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M));
   parity_check_test_1 U_PARITY_CHECK (.CLK(CLK), 
	.RST(FE_OFN0_UART_RST_M), 
	.par_chk_en(par_chk_en), 
	.strt_chk_en(strt_chk_en), 
	.PAR_TYP(PAR_TYP), 
	.data({ P_DATA[7],
		P_DATA[6],
		P_DATA[5],
		P_DATA[4],
		P_DATA[3],
		P_DATA[2],
		P_DATA[1],
		P_DATA[0] }), 
	.sampled_bit(sampled_bit), 
	.par_err(par_err), 
	.test_si(edge_cnt[5]), 
	.test_se(test_se));
   stop_check_test_1 U_STOP_CHECK (.CLK(CLK), 
	.RST(FE_OFN0_UART_RST_M), 
	.stp_chk_en(stp_chk_en), 
	.strt_chk_en(strt_chk_en), 
	.sampled_bit(sampled_bit), 
	.stp_err(stp_err), 
	.test_si(test_si2), 
	.test_se(test_se));
endmodule

module UART_TOP_DATA_WIDTH8_test_1 (
	RX_CLK, 
	TX_CLK, 
	RST_N, 
	RX_IN, 
	TX_OUT, 
	PRESCALE, 
	PAR_EN, 
	PAR_TYP, 
	TX_P_DATA, 
	F_EMPTY, 
	RX_P_DATA, 
	RX_D_VLD, 
	PAR_ERR, 
	STP_ERR, 
	TX_BUSY, 
	test_si, 
	test_se, 
	FE_OFN0_UART_RST_M);
   input RX_CLK;
   input TX_CLK;
   input RST_N;
   input RX_IN;
   output TX_OUT;
   input [5:0] PRESCALE;
   input PAR_EN;
   input PAR_TYP;
   input [7:0] TX_P_DATA;
   input F_EMPTY;
   output [7:0] RX_P_DATA;
   output RX_D_VLD;
   output PAR_ERR;
   output STP_ERR;
   output TX_BUSY;
   input test_si;
   input test_se;
   input FE_OFN0_UART_RST_M;

   // Internal wires
   wire n1;
   wire n3;
   wire n4;

   INVX2M U1 (.Y(n1), 
	.A(F_EMPTY));
   UART_TX_TOP_test_1 u_uart_tx (.CLK(TX_CLK), 
	.RST(FE_OFN0_UART_RST_M), 
	.DATA_VALID(n1), 
	.PAR_EN(PAR_EN), 
	.PAR_TYP(PAR_TYP), 
	.P_DATA({ TX_P_DATA[7],
		TX_P_DATA[6],
		TX_P_DATA[5],
		TX_P_DATA[4],
		TX_P_DATA[3],
		TX_P_DATA[2],
		TX_P_DATA[1],
		TX_P_DATA[0] }), 
	.TX_OUT(TX_OUT), 
	.BUSY(TX_BUSY), 
	.test_si(n4), 
	.test_so(n3), 
	.test_se(test_se));
   UART_RX_TOP_test_1 u_uart_rx (.CLK(RX_CLK), 
	.RST(RST_N), 
	.RX_IN(RX_IN), 
	.Prescale({ PRESCALE[5],
		PRESCALE[4],
		PRESCALE[3],
		PRESCALE[2],
		PRESCALE[1],
		PRESCALE[0] }), 
	.PAR_EN(PAR_EN), 
	.PAR_TYP(PAR_TYP), 
	.P_DATA({ RX_P_DATA[7],
		RX_P_DATA[6],
		RX_P_DATA[5],
		RX_P_DATA[4],
		RX_P_DATA[3],
		RX_P_DATA[2],
		RX_P_DATA[1],
		RX_P_DATA[0] }), 
	.data_valid(RX_D_VLD), 
	.par_err(PAR_ERR), 
	.stp_err(STP_ERR), 
	.test_si2(n3), 
	.test_si1(test_si), 
	.test_so1(n4), 
	.test_se(test_se), 
	.FE_OFN0_UART_RST_M(FE_OFN0_UART_RST_M));
endmodule

