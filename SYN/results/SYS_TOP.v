/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Tue Oct  6 17:50:20 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;

  wire   [2:0] sync_reg;

  DFFRQX2M SYNC_RST_reg ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M sync_reg_reg_0_ ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  DFFRQX2M sync_reg_reg_2_ ( .D(RST), .CK(CLK), .RN(RST), .Q(sync_reg[2]) );
  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg[2]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
endmodule


module RST_SYNC_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;

  wire   [2:0] sync_reg;

  DFFRQX2M SYNC_RST_reg ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
  DFFRQX2M sync_reg_reg_0_ ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  DFFRQX2M sync_reg_reg_2_ ( .D(RST), .CK(CLK), .RN(RST), .Q(sync_reg[2]) );
  DFFRQX2M sync_reg_reg_1_ ( .D(sync_reg[2]), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
endmodule


module Data_sync_BUS_WIDTH8_NUM_STAGES2 ( Unsync_bus, bus_enable, CLK, RST, 
        sync_bus, enable_pulse );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST;
  output enable_pulse;
  wire   pulse_gen_ff, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [1:0] sync_reg;

  DFFRQX2M pulse_gen_ff_reg ( .D(sync_reg[0]), .CK(CLK), .RN(RST), .Q(
        pulse_gen_ff) );
  DFFRQX2M sync_reg_reg_0_ ( .D(sync_reg[1]), .CK(CLK), .RN(RST), .Q(
        sync_reg[0]) );
  DFFRQX2M sync_bus_reg_6_ ( .D(n8), .CK(CLK), .RN(RST), .Q(sync_bus[6]) );
  DFFRQX2M sync_bus_reg_4_ ( .D(n6), .CK(CLK), .RN(RST), .Q(sync_bus[4]) );
  DFFRQX2M sync_bus_reg_1_ ( .D(n3), .CK(CLK), .RN(RST), .Q(sync_bus[1]) );
  DFFRQX2M sync_bus_reg_5_ ( .D(n7), .CK(CLK), .RN(RST), .Q(sync_bus[5]) );
  DFFRQX2M enable_pulse_reg ( .D(n10), .CK(CLK), .RN(RST), .Q(enable_pulse) );
  DFFRQX2M sync_bus_reg_7_ ( .D(n9), .CK(CLK), .RN(RST), .Q(sync_bus[7]) );
  DFFRQX2M sync_bus_reg_3_ ( .D(n5), .CK(CLK), .RN(RST), .Q(sync_bus[3]) );
  DFFRQX2M sync_bus_reg_0_ ( .D(n2), .CK(CLK), .RN(RST), .Q(sync_bus[0]) );
  DFFRQX2M sync_bus_reg_2_ ( .D(n4), .CK(CLK), .RN(RST), .Q(sync_bus[2]) );
  DFFRQX2M sync_reg_reg_1_ ( .D(bus_enable), .CK(CLK), .RN(RST), .Q(
        sync_reg[1]) );
  INVX2M U3 ( .A(n1), .Y(n10) );
  NAND2BX2M U4 ( .AN(pulse_gen_ff), .B(sync_reg[0]), .Y(n1) );
  AO22X1M U5 ( .A0(Unsync_bus[0]), .A1(n10), .B0(sync_bus[0]), .B1(n1), .Y(n2)
         );
  AO22X1M U6 ( .A0(Unsync_bus[1]), .A1(n10), .B0(sync_bus[1]), .B1(n1), .Y(n3)
         );
  AO22X1M U7 ( .A0(Unsync_bus[2]), .A1(n10), .B0(sync_bus[2]), .B1(n1), .Y(n4)
         );
  AO22X1M U8 ( .A0(Unsync_bus[3]), .A1(n10), .B0(sync_bus[3]), .B1(n1), .Y(n5)
         );
  AO22X1M U9 ( .A0(Unsync_bus[4]), .A1(n10), .B0(sync_bus[4]), .B1(n1), .Y(n6)
         );
  AO22X1M U10 ( .A0(Unsync_bus[5]), .A1(n10), .B0(sync_bus[5]), .B1(n1), .Y(n7) );
  AO22X1M U11 ( .A0(Unsync_bus[6]), .A1(n10), .B0(sync_bus[6]), .B1(n1), .Y(n8) );
  AO22X1M U12 ( .A0(Unsync_bus[7]), .A1(n10), .B0(sync_bus[7]), .B1(n1), .Y(n9) );
endmodule


module REG_FILE_ADDR_WIDTH4_DATA_WIDTH8 ( RD_EN, WR_EN, RST, CLK, ADDRESS, 
        WR_DATA, RD_DATA, RdData_VLD, REG0, REG1, REG2, REG3 );
  input [3:0] ADDRESS;
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input RD_EN, WR_EN, RST, CLK;
  output RdData_VLD;
  wire   RF_15__7_, RF_15__6_, RF_15__5_, RF_15__4_, RF_15__3_, RF_15__2_,
         RF_15__1_, RF_15__0_, RF_14__7_, RF_14__6_, RF_14__5_, RF_14__4_,
         RF_14__3_, RF_14__2_, RF_14__1_, RF_14__0_, RF_13__7_, RF_13__6_,
         RF_13__5_, RF_13__4_, RF_13__3_, RF_13__2_, RF_13__1_, RF_13__0_,
         RF_12__7_, RF_12__6_, RF_12__5_, RF_12__4_, RF_12__3_, RF_12__2_,
         RF_12__1_, RF_12__0_, RF_11__7_, RF_11__6_, RF_11__5_, RF_11__4_,
         RF_11__3_, RF_11__2_, RF_11__1_, RF_11__0_, RF_10__7_, RF_10__6_,
         RF_10__5_, RF_10__4_, RF_10__3_, RF_10__2_, RF_10__1_, RF_10__0_,
         RF_9__7_, RF_9__6_, RF_9__5_, RF_9__4_, RF_9__3_, RF_9__2_, RF_9__1_,
         RF_9__0_, RF_8__7_, RF_8__6_, RF_8__5_, RF_8__4_, RF_8__3_, RF_8__2_,
         RF_8__1_, RF_8__0_, RF_7__7_, RF_7__6_, RF_7__5_, RF_7__4_, RF_7__3_,
         RF_7__2_, RF_7__1_, RF_7__0_, RF_6__7_, RF_6__6_, RF_6__5_, RF_6__4_,
         RF_6__3_, RF_6__2_, RF_6__1_, RF_6__0_, RF_5__7_, RF_5__6_, RF_5__5_,
         RF_5__4_, RF_5__3_, RF_5__2_, RF_5__1_, RF_5__0_, RF_4__7_, RF_4__6_,
         RF_4__5_, RF_4__4_, RF_4__3_, RF_4__2_, RF_4__1_, RF_4__0_, N19, N20,
         N21, N22, N23, N24, N25, N26, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176, n177, n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n178, n179, n180, n181, n182, n183,
         n184, n185, n186, n187, n188, n189, n190, n191, n192, n193, n194,
         n195, n196, n197, n198, n199, n200, n201, n202, n203, n204, n205,
         n206, n207, n208, n209, n210, n211, n212, n213, n214, n215, n216,
         n217, n218, n219, n220, n221, n222, n223, n224, n225, n226, n227,
         n228, n229, n230, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302;

  DFFRQX2M RD_DATA_reg_7_ ( .D(n177), .CK(CLK), .RN(n286), .Q(RD_DATA[7]) );
  DFFRQX2M RD_DATA_reg_6_ ( .D(n176), .CK(CLK), .RN(n278), .Q(RD_DATA[6]) );
  DFFRQX2M RD_DATA_reg_5_ ( .D(n175), .CK(CLK), .RN(n282), .Q(RD_DATA[5]) );
  DFFRQX2M RD_DATA_reg_4_ ( .D(n174), .CK(CLK), .RN(n279), .Q(RD_DATA[4]) );
  DFFRQX2M RD_DATA_reg_3_ ( .D(n173), .CK(CLK), .RN(n279), .Q(RD_DATA[3]) );
  DFFRQX2M RD_DATA_reg_2_ ( .D(n172), .CK(CLK), .RN(n279), .Q(RD_DATA[2]) );
  DFFRQX2M RD_DATA_reg_1_ ( .D(n171), .CK(CLK), .RN(n279), .Q(RD_DATA[1]) );
  DFFRQX2M RD_DATA_reg_0_ ( .D(n170), .CK(CLK), .RN(n279), .Q(RD_DATA[0]) );
  DFFSQX2M RF_reg_3__5_ ( .D(n71), .CK(CLK), .SN(n278), .Q(REG3[5]) );
  DFFRQX2M RF_reg_15__7_ ( .D(n169), .CK(CLK), .RN(n278), .Q(RF_15__7_) );
  DFFRQX2M RF_reg_15__6_ ( .D(n168), .CK(CLK), .RN(n278), .Q(RF_15__6_) );
  DFFRQX2M RF_reg_15__5_ ( .D(n167), .CK(CLK), .RN(n278), .Q(RF_15__5_) );
  DFFRQX2M RF_reg_15__4_ ( .D(n166), .CK(CLK), .RN(n278), .Q(RF_15__4_) );
  DFFRQX2M RF_reg_15__3_ ( .D(n165), .CK(CLK), .RN(n278), .Q(RF_15__3_) );
  DFFRQX2M RF_reg_15__2_ ( .D(n164), .CK(CLK), .RN(n278), .Q(RF_15__2_) );
  DFFRQX2M RF_reg_15__1_ ( .D(n163), .CK(CLK), .RN(n278), .Q(RF_15__1_) );
  DFFRQX2M RF_reg_15__0_ ( .D(n162), .CK(CLK), .RN(n278), .Q(RF_15__0_) );
  DFFRQX2M RF_reg_13__7_ ( .D(n153), .CK(CLK), .RN(n279), .Q(RF_13__7_) );
  DFFRQX2M RF_reg_13__6_ ( .D(n152), .CK(CLK), .RN(n279), .Q(RF_13__6_) );
  DFFRQX2M RF_reg_13__5_ ( .D(n151), .CK(CLK), .RN(n279), .Q(RF_13__5_) );
  DFFRQX2M RF_reg_13__4_ ( .D(n150), .CK(CLK), .RN(n279), .Q(RF_13__4_) );
  DFFRQX2M RF_reg_13__3_ ( .D(n149), .CK(CLK), .RN(n279), .Q(RF_13__3_) );
  DFFRQX2M RF_reg_13__2_ ( .D(n148), .CK(CLK), .RN(n279), .Q(RF_13__2_) );
  DFFRQX2M RF_reg_13__1_ ( .D(n147), .CK(CLK), .RN(n279), .Q(RF_13__1_) );
  DFFRQX2M RF_reg_13__0_ ( .D(n146), .CK(CLK), .RN(n279), .Q(RF_13__0_) );
  DFFRQX2M RF_reg_11__7_ ( .D(n137), .CK(CLK), .RN(n280), .Q(RF_11__7_) );
  DFFRQX2M RF_reg_11__6_ ( .D(n136), .CK(CLK), .RN(n280), .Q(RF_11__6_) );
  DFFRQX2M RF_reg_11__5_ ( .D(n135), .CK(CLK), .RN(n280), .Q(RF_11__5_) );
  DFFRQX2M RF_reg_11__4_ ( .D(n134), .CK(CLK), .RN(n280), .Q(RF_11__4_) );
  DFFRQX2M RF_reg_11__3_ ( .D(n133), .CK(CLK), .RN(n280), .Q(RF_11__3_) );
  DFFRQX2M RF_reg_11__2_ ( .D(n132), .CK(CLK), .RN(n280), .Q(RF_11__2_) );
  DFFRQX2M RF_reg_11__1_ ( .D(n131), .CK(CLK), .RN(n280), .Q(RF_11__1_) );
  DFFRQX2M RF_reg_11__0_ ( .D(n130), .CK(CLK), .RN(n280), .Q(RF_11__0_) );
  DFFRQX2M RF_reg_9__7_ ( .D(n121), .CK(CLK), .RN(n281), .Q(RF_9__7_) );
  DFFRQX2M RF_reg_9__6_ ( .D(n120), .CK(CLK), .RN(n281), .Q(RF_9__6_) );
  DFFRQX2M RF_reg_9__5_ ( .D(n119), .CK(CLK), .RN(n281), .Q(RF_9__5_) );
  DFFRQX2M RF_reg_9__4_ ( .D(n118), .CK(CLK), .RN(n281), .Q(RF_9__4_) );
  DFFRQX2M RF_reg_9__3_ ( .D(n117), .CK(CLK), .RN(n281), .Q(RF_9__3_) );
  DFFRQX2M RF_reg_9__2_ ( .D(n116), .CK(CLK), .RN(n281), .Q(RF_9__2_) );
  DFFRQX2M RF_reg_9__1_ ( .D(n115), .CK(CLK), .RN(n281), .Q(RF_9__1_) );
  DFFRQX2M RF_reg_9__0_ ( .D(n114), .CK(CLK), .RN(n283), .Q(RF_9__0_) );
  DFFRQX2M RF_reg_7__7_ ( .D(n105), .CK(CLK), .RN(n282), .Q(RF_7__7_) );
  DFFRQX2M RF_reg_7__6_ ( .D(n104), .CK(CLK), .RN(n282), .Q(RF_7__6_) );
  DFFRQX2M RF_reg_7__5_ ( .D(n103), .CK(CLK), .RN(n282), .Q(RF_7__5_) );
  DFFRQX2M RF_reg_7__4_ ( .D(n102), .CK(CLK), .RN(n282), .Q(RF_7__4_) );
  DFFRQX2M RF_reg_7__3_ ( .D(n101), .CK(CLK), .RN(n282), .Q(RF_7__3_) );
  DFFRQX2M RF_reg_7__2_ ( .D(n100), .CK(CLK), .RN(n284), .Q(RF_7__2_) );
  DFFRQX2M RF_reg_7__1_ ( .D(n99), .CK(CLK), .RN(n284), .Q(RF_7__1_) );
  DFFRQX2M RF_reg_7__0_ ( .D(n98), .CK(CLK), .RN(n284), .Q(RF_7__0_) );
  DFFRQX2M RF_reg_5__7_ ( .D(n89), .CK(CLK), .RN(n283), .Q(RF_5__7_) );
  DFFRQX2M RF_reg_5__6_ ( .D(n88), .CK(CLK), .RN(n283), .Q(RF_5__6_) );
  DFFRQX2M RF_reg_5__5_ ( .D(n87), .CK(CLK), .RN(n283), .Q(RF_5__5_) );
  DFFRQX2M RF_reg_5__4_ ( .D(n86), .CK(CLK), .RN(n283), .Q(RF_5__4_) );
  DFFRQX2M RF_reg_5__3_ ( .D(n85), .CK(CLK), .RN(n285), .Q(RF_5__3_) );
  DFFRQX2M RF_reg_5__2_ ( .D(n84), .CK(CLK), .RN(n285), .Q(RF_5__2_) );
  DFFRQX2M RF_reg_5__1_ ( .D(n83), .CK(CLK), .RN(n285), .Q(RF_5__1_) );
  DFFRQX2M RF_reg_5__0_ ( .D(n82), .CK(CLK), .RN(n285), .Q(RF_5__0_) );
  DFFRQX2M RF_reg_14__7_ ( .D(n161), .CK(CLK), .RN(n278), .Q(RF_14__7_) );
  DFFRQX2M RF_reg_14__6_ ( .D(n160), .CK(CLK), .RN(n278), .Q(RF_14__6_) );
  DFFRQX2M RF_reg_14__5_ ( .D(n159), .CK(CLK), .RN(n280), .Q(RF_14__5_) );
  DFFRQX2M RF_reg_14__4_ ( .D(n158), .CK(CLK), .RN(n280), .Q(RF_14__4_) );
  DFFRQX2M RF_reg_14__3_ ( .D(n157), .CK(CLK), .RN(n280), .Q(RF_14__3_) );
  DFFRQX2M RF_reg_14__2_ ( .D(n156), .CK(CLK), .RN(n280), .Q(RF_14__2_) );
  DFFRQX2M RF_reg_14__1_ ( .D(n155), .CK(CLK), .RN(n280), .Q(RF_14__1_) );
  DFFRQX2M RF_reg_14__0_ ( .D(n154), .CK(CLK), .RN(n279), .Q(RF_14__0_) );
  DFFRQX2M RF_reg_12__7_ ( .D(n145), .CK(CLK), .RN(n279), .Q(RF_12__7_) );
  DFFRQX2M RF_reg_12__6_ ( .D(n144), .CK(CLK), .RN(n281), .Q(RF_12__6_) );
  DFFRQX2M RF_reg_12__5_ ( .D(n143), .CK(CLK), .RN(n281), .Q(RF_12__5_) );
  DFFRQX2M RF_reg_12__4_ ( .D(n142), .CK(CLK), .RN(n281), .Q(RF_12__4_) );
  DFFRQX2M RF_reg_12__3_ ( .D(n141), .CK(CLK), .RN(n281), .Q(RF_12__3_) );
  DFFRQX2M RF_reg_12__2_ ( .D(n140), .CK(CLK), .RN(n281), .Q(RF_12__2_) );
  DFFRQX2M RF_reg_12__1_ ( .D(n139), .CK(CLK), .RN(n280), .Q(RF_12__1_) );
  DFFRQX2M RF_reg_12__0_ ( .D(n138), .CK(CLK), .RN(n280), .Q(RF_12__0_) );
  DFFRQX2M RF_reg_10__7_ ( .D(n129), .CK(CLK), .RN(n282), .Q(RF_10__7_) );
  DFFRQX2M RF_reg_10__6_ ( .D(n128), .CK(CLK), .RN(n282), .Q(RF_10__6_) );
  DFFRQX2M RF_reg_10__5_ ( .D(n127), .CK(CLK), .RN(n282), .Q(RF_10__5_) );
  DFFRQX2M RF_reg_10__4_ ( .D(n126), .CK(CLK), .RN(n282), .Q(RF_10__4_) );
  DFFRQX2M RF_reg_10__3_ ( .D(n125), .CK(CLK), .RN(n282), .Q(RF_10__3_) );
  DFFRQX2M RF_reg_10__2_ ( .D(n124), .CK(CLK), .RN(n281), .Q(RF_10__2_) );
  DFFRQX2M RF_reg_10__1_ ( .D(n123), .CK(CLK), .RN(n281), .Q(RF_10__1_) );
  DFFRQX2M RF_reg_10__0_ ( .D(n122), .CK(CLK), .RN(n281), .Q(RF_10__0_) );
  DFFRQX2M RF_reg_8__7_ ( .D(n113), .CK(CLK), .RN(n283), .Q(RF_8__7_) );
  DFFRQX2M RF_reg_8__6_ ( .D(n112), .CK(CLK), .RN(n283), .Q(RF_8__6_) );
  DFFRQX2M RF_reg_8__5_ ( .D(n111), .CK(CLK), .RN(n283), .Q(RF_8__5_) );
  DFFRQX2M RF_reg_8__4_ ( .D(n110), .CK(CLK), .RN(n283), .Q(RF_8__4_) );
  DFFRQX2M RF_reg_8__3_ ( .D(n109), .CK(CLK), .RN(n283), .Q(RF_8__3_) );
  DFFRQX2M RF_reg_8__2_ ( .D(n108), .CK(CLK), .RN(n282), .Q(RF_8__2_) );
  DFFRQX2M RF_reg_8__1_ ( .D(n107), .CK(CLK), .RN(n282), .Q(RF_8__1_) );
  DFFRQX2M RF_reg_8__0_ ( .D(n106), .CK(CLK), .RN(n282), .Q(RF_8__0_) );
  DFFRQX2M RF_reg_6__7_ ( .D(n97), .CK(CLK), .RN(n284), .Q(RF_6__7_) );
  DFFRQX2M RF_reg_6__6_ ( .D(n96), .CK(CLK), .RN(n284), .Q(RF_6__6_) );
  DFFRQX2M RF_reg_6__5_ ( .D(n95), .CK(CLK), .RN(n284), .Q(RF_6__5_) );
  DFFRQX2M RF_reg_6__4_ ( .D(n94), .CK(CLK), .RN(n283), .Q(RF_6__4_) );
  DFFRQX2M RF_reg_6__3_ ( .D(n93), .CK(CLK), .RN(n283), .Q(RF_6__3_) );
  DFFRQX2M RF_reg_6__2_ ( .D(n92), .CK(CLK), .RN(n283), .Q(RF_6__2_) );
  DFFRQX2M RF_reg_6__1_ ( .D(n91), .CK(CLK), .RN(n283), .Q(RF_6__1_) );
  DFFRQX2M RF_reg_6__0_ ( .D(n90), .CK(CLK), .RN(n283), .Q(RF_6__0_) );
  DFFRQX2M RF_reg_4__7_ ( .D(n81), .CK(CLK), .RN(n285), .Q(RF_4__7_) );
  DFFRQX2M RF_reg_4__6_ ( .D(n80), .CK(CLK), .RN(n285), .Q(RF_4__6_) );
  DFFRQX2M RF_reg_4__5_ ( .D(n79), .CK(CLK), .RN(n284), .Q(RF_4__5_) );
  DFFRQX2M RF_reg_4__4_ ( .D(n78), .CK(CLK), .RN(n284), .Q(RF_4__4_) );
  DFFRQX2M RF_reg_4__3_ ( .D(n77), .CK(CLK), .RN(n284), .Q(RF_4__3_) );
  DFFRQX2M RF_reg_4__2_ ( .D(n76), .CK(CLK), .RN(n284), .Q(RF_4__2_) );
  DFFRQX2M RF_reg_4__1_ ( .D(n75), .CK(CLK), .RN(n284), .Q(RF_4__1_) );
  DFFRQX2M RF_reg_4__0_ ( .D(n74), .CK(CLK), .RN(n284), .Q(RF_4__0_) );
  DFFRQX2M RF_reg_3__0_ ( .D(n66), .CK(CLK), .RN(n286), .Q(REG3[0]) );
  DFFSQX2M RF_reg_2__0_ ( .D(n58), .CK(CLK), .SN(n278), .Q(REG2[0]) );
  DFFRQX2M RF_reg_3__2_ ( .D(n68), .CK(CLK), .RN(n286), .Q(REG3[2]) );
  DFFRQX2M RF_reg_3__3_ ( .D(n69), .CK(CLK), .RN(n286), .Q(REG3[3]) );
  DFFRQX2M RF_reg_3__4_ ( .D(n70), .CK(CLK), .RN(n284), .Q(REG3[4]) );
  DFFRQX2M RF_reg_3__6_ ( .D(n72), .CK(CLK), .RN(n284), .Q(REG3[6]) );
  DFFRQX2M RF_reg_3__7_ ( .D(n73), .CK(CLK), .RN(n284), .Q(REG3[7]) );
  DFFRQX2M RdData_VLD_reg ( .D(n41), .CK(CLK), .RN(n282), .Q(RdData_VLD) );
  DFFRQX2M RF_reg_2__1_ ( .D(n59), .CK(CLK), .RN(n285), .Q(REG2[1]) );
  DFFRQX2M RF_reg_3__1_ ( .D(n67), .CK(CLK), .RN(n286), .Q(REG3[1]) );
  DFFRQX2M RF_reg_2__4_ ( .D(n62), .CK(CLK), .RN(n285), .Q(REG2[4]) );
  DFFRQX2M RF_reg_2__2_ ( .D(n60), .CK(CLK), .RN(n285), .Q(REG2[2]) );
  DFFRQX2M RF_reg_2__3_ ( .D(n61), .CK(CLK), .RN(n285), .Q(REG2[3]) );
  DFFSQX2M RF_reg_2__7_ ( .D(n65), .CK(CLK), .SN(n278), .Q(REG2[7]) );
  DFFRQX2M RF_reg_2__6_ ( .D(n64), .CK(CLK), .RN(n286), .Q(REG2[6]) );
  DFFRQX2M RF_reg_0__1_ ( .D(n43), .CK(CLK), .RN(n286), .Q(REG0[1]) );
  DFFRQX2M RF_reg_0__0_ ( .D(n42), .CK(CLK), .RN(n286), .Q(REG0[0]) );
  DFFRQX2M RF_reg_0__2_ ( .D(n44), .CK(CLK), .RN(n286), .Q(REG0[2]) );
  DFFRQX2M RF_reg_0__3_ ( .D(n45), .CK(CLK), .RN(n286), .Q(REG0[3]) );
  DFFRQX2M RF_reg_0__4_ ( .D(n46), .CK(CLK), .RN(n286), .Q(REG0[4]) );
  DFFRQX2M RF_reg_0__5_ ( .D(n47), .CK(CLK), .RN(n286), .Q(REG0[5]) );
  DFFRQX2M RF_reg_0__7_ ( .D(n49), .CK(CLK), .RN(n286), .Q(REG0[7]) );
  DFFRQX2M RF_reg_0__6_ ( .D(n48), .CK(CLK), .RN(n278), .Q(REG0[6]) );
  DFFRQX2M RF_reg_1__6_ ( .D(n56), .CK(CLK), .RN(n285), .Q(REG1[6]) );
  DFFRQX2M RF_reg_1__1_ ( .D(n51), .CK(CLK), .RN(n287), .Q(REG1[1]) );
  DFFRQX2M RF_reg_1__5_ ( .D(n55), .CK(CLK), .RN(n285), .Q(REG1[5]) );
  DFFRQX2M RF_reg_1__4_ ( .D(n54), .CK(CLK), .RN(n285), .Q(REG1[4]) );
  DFFRQX2M RF_reg_1__7_ ( .D(n57), .CK(CLK), .RN(n285), .Q(REG1[7]) );
  DFFRQX2M RF_reg_1__3_ ( .D(n53), .CK(CLK), .RN(n285), .Q(REG1[3]) );
  DFFRQX2M RF_reg_1__2_ ( .D(n52), .CK(CLK), .RN(n287), .Q(REG1[2]) );
  DFFRQX2M RF_reg_1__0_ ( .D(n50), .CK(CLK), .RN(n286), .Q(REG1[0]) );
  DFFRQX2M RF_reg_2__5_ ( .D(n63), .CK(CLK), .RN(n286), .Q(REG2[5]) );
  NOR2X2M U3 ( .A(n272), .B(ADDRESS[2]), .Y(n20) );
  NOR2X2M U4 ( .A(ADDRESS[1]), .B(ADDRESS[2]), .Y(n15) );
  INVX2M U5 ( .A(n1), .Y(n274) );
  OR2X2M U6 ( .A(n272), .B(n273), .Y(n1) );
  INVX2M U7 ( .A(n3), .Y(n275) );
  INVX2M U8 ( .A(n2), .Y(n277) );
  INVX2M U9 ( .A(n4), .Y(n276) );
  NAND2X2M U10 ( .A(n18), .B(n15), .Y(n17) );
  NAND2X2M U11 ( .A(n20), .B(n16), .Y(n19) );
  NAND2X2M U12 ( .A(n20), .B(n18), .Y(n21) );
  NAND2X2M U13 ( .A(n23), .B(n16), .Y(n22) );
  NAND2X2M U14 ( .A(n23), .B(n18), .Y(n24) );
  NAND2X2M U15 ( .A(n26), .B(n16), .Y(n25) );
  NAND2X2M U16 ( .A(n26), .B(n18), .Y(n28) );
  NAND2X2M U17 ( .A(n30), .B(n15), .Y(n29) );
  NAND2X2M U18 ( .A(n32), .B(n15), .Y(n31) );
  NAND2X2M U19 ( .A(n30), .B(n20), .Y(n33) );
  NAND2X2M U20 ( .A(n32), .B(n20), .Y(n34) );
  NAND2X2M U21 ( .A(n30), .B(n23), .Y(n35) );
  NAND2X2M U22 ( .A(n32), .B(n23), .Y(n36) );
  NAND2X2M U23 ( .A(n30), .B(n26), .Y(n37) );
  NAND2X2M U24 ( .A(n32), .B(n26), .Y(n39) );
  NAND2X2M U25 ( .A(n15), .B(n16), .Y(n14) );
  AND2X2M U26 ( .A(n27), .B(n273), .Y(n16) );
  AND2X2M U27 ( .A(n38), .B(n273), .Y(n30) );
  INVX2M U28 ( .A(n40), .Y(n301) );
  OR2X2M U29 ( .A(ADDRESS[0]), .B(ADDRESS[1]), .Y(n2) );
  OR2X2M U30 ( .A(n272), .B(ADDRESS[0]), .Y(n3) );
  OR2X2M U31 ( .A(n273), .B(ADDRESS[1]), .Y(n4) );
  INVX2M U32 ( .A(ADDRESS[0]), .Y(n273) );
  INVX2M U33 ( .A(ADDRESS[2]), .Y(n271) );
  INVX2M U34 ( .A(ADDRESS[1]), .Y(n272) );
  NAND2X2M U35 ( .A(RD_EN), .B(n302), .Y(n40) );
  NOR2X2M U36 ( .A(n302), .B(RD_EN), .Y(n13) );
  AND2X2M U37 ( .A(n27), .B(ADDRESS[0]), .Y(n18) );
  AND2X2M U38 ( .A(n38), .B(ADDRESS[0]), .Y(n32) );
  AND2X2M U39 ( .A(ADDRESS[2]), .B(n272), .Y(n23) );
  AND2X2M U40 ( .A(ADDRESS[2]), .B(ADDRESS[1]), .Y(n26) );
  NOR2BX2M U41 ( .AN(n13), .B(ADDRESS[3]), .Y(n27) );
  AND2X2M U42 ( .A(ADDRESS[3]), .B(n13), .Y(n38) );
  INVX2M U43 ( .A(ADDRESS[3]), .Y(n270) );
  BUFX2M U44 ( .A(n292), .Y(n278) );
  BUFX2M U45 ( .A(n289), .Y(n285) );
  BUFX2M U46 ( .A(n289), .Y(n284) );
  BUFX2M U47 ( .A(n290), .Y(n283) );
  BUFX2M U48 ( .A(n291), .Y(n281) );
  BUFX2M U49 ( .A(n291), .Y(n280) );
  BUFX2M U50 ( .A(n292), .Y(n279) );
  BUFX2M U51 ( .A(n290), .Y(n282) );
  BUFX2M U52 ( .A(n288), .Y(n286) );
  BUFX2M U53 ( .A(n288), .Y(n287) );
  INVX2M U54 ( .A(WR_DATA[0]), .Y(n293) );
  INVX2M U55 ( .A(WR_DATA[5]), .Y(n298) );
  INVX2M U56 ( .A(WR_DATA[7]), .Y(n300) );
  INVX2M U57 ( .A(WR_DATA[1]), .Y(n294) );
  INVX2M U58 ( .A(WR_DATA[2]), .Y(n295) );
  INVX2M U59 ( .A(WR_DATA[3]), .Y(n296) );
  INVX2M U60 ( .A(WR_DATA[4]), .Y(n297) );
  INVX2M U61 ( .A(WR_DATA[6]), .Y(n299) );
  INVX2M U62 ( .A(WR_EN), .Y(n302) );
  BUFX2M U63 ( .A(RST), .Y(n289) );
  BUFX2M U64 ( .A(RST), .Y(n291) );
  BUFX2M U65 ( .A(RST), .Y(n290) );
  BUFX2M U66 ( .A(RST), .Y(n292) );
  BUFX2M U67 ( .A(RST), .Y(n288) );
  AO22X1M U68 ( .A0(N26), .A1(n301), .B0(RD_DATA[0]), .B1(n40), .Y(n170) );
  AO22X1M U69 ( .A0(N25), .A1(n301), .B0(RD_DATA[1]), .B1(n40), .Y(n171) );
  AO22X1M U70 ( .A0(N24), .A1(n301), .B0(RD_DATA[2]), .B1(n40), .Y(n172) );
  AO22X1M U71 ( .A0(N23), .A1(n301), .B0(RD_DATA[3]), .B1(n40), .Y(n173) );
  AO22X1M U72 ( .A0(N22), .A1(n301), .B0(RD_DATA[4]), .B1(n40), .Y(n174) );
  AO22X1M U73 ( .A0(N21), .A1(n301), .B0(RD_DATA[5]), .B1(n40), .Y(n175) );
  AO22X1M U74 ( .A0(N20), .A1(n301), .B0(RD_DATA[6]), .B1(n40), .Y(n176) );
  AO22X1M U75 ( .A0(N19), .A1(n301), .B0(RD_DATA[7]), .B1(n40), .Y(n177) );
  OAI2BB2X1M U76 ( .B0(n14), .B1(n293), .A0N(REG0[0]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U77 ( .B0(n14), .B1(n294), .A0N(REG0[1]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U78 ( .B0(n14), .B1(n295), .A0N(REG0[2]), .A1N(n14), .Y(n44) );
  OAI2BB2X1M U79 ( .B0(n14), .B1(n296), .A0N(REG0[3]), .A1N(n14), .Y(n45) );
  OAI2BB2X1M U80 ( .B0(n14), .B1(n297), .A0N(REG0[4]), .A1N(n14), .Y(n46) );
  OAI2BB2X1M U81 ( .B0(n14), .B1(n298), .A0N(REG0[5]), .A1N(n14), .Y(n47) );
  OAI2BB2X1M U82 ( .B0(n14), .B1(n299), .A0N(REG0[6]), .A1N(n14), .Y(n48) );
  OAI2BB2X1M U83 ( .B0(n14), .B1(n300), .A0N(REG0[7]), .A1N(n14), .Y(n49) );
  OAI2BB2X1M U84 ( .B0(n294), .B1(n19), .A0N(REG2[1]), .A1N(n19), .Y(n59) );
  OAI2BB2X1M U85 ( .B0(n295), .B1(n19), .A0N(REG2[2]), .A1N(n19), .Y(n60) );
  OAI2BB2X1M U86 ( .B0(n296), .B1(n19), .A0N(REG2[3]), .A1N(n19), .Y(n61) );
  OAI2BB2X1M U87 ( .B0(n297), .B1(n19), .A0N(REG2[4]), .A1N(n19), .Y(n62) );
  OAI2BB2X1M U88 ( .B0(n298), .B1(n19), .A0N(REG2[5]), .A1N(n19), .Y(n63) );
  OAI2BB2X1M U89 ( .B0(n299), .B1(n19), .A0N(REG2[6]), .A1N(n19), .Y(n64) );
  OAI2BB2X1M U90 ( .B0(n293), .B1(n21), .A0N(REG3[0]), .A1N(n21), .Y(n66) );
  OAI2BB2X1M U91 ( .B0(n294), .B1(n21), .A0N(REG3[1]), .A1N(n21), .Y(n67) );
  OAI2BB2X1M U92 ( .B0(n295), .B1(n21), .A0N(REG3[2]), .A1N(n21), .Y(n68) );
  OAI2BB2X1M U93 ( .B0(n296), .B1(n21), .A0N(REG3[3]), .A1N(n21), .Y(n69) );
  OAI2BB2X1M U94 ( .B0(n297), .B1(n21), .A0N(REG3[4]), .A1N(n21), .Y(n70) );
  OAI2BB2X1M U95 ( .B0(n299), .B1(n21), .A0N(REG3[6]), .A1N(n21), .Y(n72) );
  OAI2BB2X1M U96 ( .B0(n300), .B1(n21), .A0N(REG3[7]), .A1N(n21), .Y(n73) );
  OAI2BB2X1M U97 ( .B0(n293), .B1(n17), .A0N(REG1[0]), .A1N(n17), .Y(n50) );
  OAI2BB2X1M U98 ( .B0(n294), .B1(n17), .A0N(REG1[1]), .A1N(n17), .Y(n51) );
  OAI2BB2X1M U99 ( .B0(n295), .B1(n17), .A0N(REG1[2]), .A1N(n17), .Y(n52) );
  OAI2BB2X1M U100 ( .B0(n296), .B1(n17), .A0N(REG1[3]), .A1N(n17), .Y(n53) );
  OAI2BB2X1M U101 ( .B0(n297), .B1(n17), .A0N(REG1[4]), .A1N(n17), .Y(n54) );
  OAI2BB2X1M U102 ( .B0(n298), .B1(n17), .A0N(REG1[5]), .A1N(n17), .Y(n55) );
  OAI2BB2X1M U103 ( .B0(n299), .B1(n17), .A0N(REG1[6]), .A1N(n17), .Y(n56) );
  OAI2BB2X1M U104 ( .B0(n300), .B1(n17), .A0N(REG1[7]), .A1N(n17), .Y(n57) );
  OAI2BB2X1M U105 ( .B0(n293), .B1(n29), .A0N(RF_8__0_), .A1N(n29), .Y(n106)
         );
  OAI2BB2X1M U106 ( .B0(n294), .B1(n29), .A0N(RF_8__1_), .A1N(n29), .Y(n107)
         );
  OAI2BB2X1M U107 ( .B0(n295), .B1(n29), .A0N(RF_8__2_), .A1N(n29), .Y(n108)
         );
  OAI2BB2X1M U108 ( .B0(n296), .B1(n29), .A0N(RF_8__3_), .A1N(n29), .Y(n109)
         );
  OAI2BB2X1M U109 ( .B0(n297), .B1(n29), .A0N(RF_8__4_), .A1N(n29), .Y(n110)
         );
  OAI2BB2X1M U110 ( .B0(n298), .B1(n29), .A0N(RF_8__5_), .A1N(n29), .Y(n111)
         );
  OAI2BB2X1M U111 ( .B0(n299), .B1(n29), .A0N(RF_8__6_), .A1N(n29), .Y(n112)
         );
  OAI2BB2X1M U112 ( .B0(n300), .B1(n29), .A0N(RF_8__7_), .A1N(n29), .Y(n113)
         );
  OAI2BB2X1M U113 ( .B0(n293), .B1(n31), .A0N(RF_9__0_), .A1N(n31), .Y(n114)
         );
  OAI2BB2X1M U114 ( .B0(n294), .B1(n31), .A0N(RF_9__1_), .A1N(n31), .Y(n115)
         );
  OAI2BB2X1M U115 ( .B0(n295), .B1(n31), .A0N(RF_9__2_), .A1N(n31), .Y(n116)
         );
  OAI2BB2X1M U116 ( .B0(n296), .B1(n31), .A0N(RF_9__3_), .A1N(n31), .Y(n117)
         );
  OAI2BB2X1M U117 ( .B0(n297), .B1(n31), .A0N(RF_9__4_), .A1N(n31), .Y(n118)
         );
  OAI2BB2X1M U118 ( .B0(n298), .B1(n31), .A0N(RF_9__5_), .A1N(n31), .Y(n119)
         );
  OAI2BB2X1M U119 ( .B0(n299), .B1(n31), .A0N(RF_9__6_), .A1N(n31), .Y(n120)
         );
  OAI2BB2X1M U120 ( .B0(n300), .B1(n31), .A0N(RF_9__7_), .A1N(n31), .Y(n121)
         );
  OAI2BB2X1M U121 ( .B0(n293), .B1(n33), .A0N(RF_10__0_), .A1N(n33), .Y(n122)
         );
  OAI2BB2X1M U122 ( .B0(n294), .B1(n33), .A0N(RF_10__1_), .A1N(n33), .Y(n123)
         );
  OAI2BB2X1M U123 ( .B0(n295), .B1(n33), .A0N(RF_10__2_), .A1N(n33), .Y(n124)
         );
  OAI2BB2X1M U124 ( .B0(n296), .B1(n33), .A0N(RF_10__3_), .A1N(n33), .Y(n125)
         );
  OAI2BB2X1M U125 ( .B0(n297), .B1(n33), .A0N(RF_10__4_), .A1N(n33), .Y(n126)
         );
  OAI2BB2X1M U126 ( .B0(n298), .B1(n33), .A0N(RF_10__5_), .A1N(n33), .Y(n127)
         );
  OAI2BB2X1M U127 ( .B0(n299), .B1(n33), .A0N(RF_10__6_), .A1N(n33), .Y(n128)
         );
  OAI2BB2X1M U128 ( .B0(n300), .B1(n33), .A0N(RF_10__7_), .A1N(n33), .Y(n129)
         );
  OAI2BB2X1M U129 ( .B0(n293), .B1(n34), .A0N(RF_11__0_), .A1N(n34), .Y(n130)
         );
  OAI2BB2X1M U130 ( .B0(n294), .B1(n34), .A0N(RF_11__1_), .A1N(n34), .Y(n131)
         );
  OAI2BB2X1M U131 ( .B0(n295), .B1(n34), .A0N(RF_11__2_), .A1N(n34), .Y(n132)
         );
  OAI2BB2X1M U132 ( .B0(n296), .B1(n34), .A0N(RF_11__3_), .A1N(n34), .Y(n133)
         );
  OAI2BB2X1M U133 ( .B0(n297), .B1(n34), .A0N(RF_11__4_), .A1N(n34), .Y(n134)
         );
  OAI2BB2X1M U134 ( .B0(n298), .B1(n34), .A0N(RF_11__5_), .A1N(n34), .Y(n135)
         );
  OAI2BB2X1M U135 ( .B0(n299), .B1(n34), .A0N(RF_11__6_), .A1N(n34), .Y(n136)
         );
  OAI2BB2X1M U136 ( .B0(n300), .B1(n34), .A0N(RF_11__7_), .A1N(n34), .Y(n137)
         );
  OAI2BB2X1M U137 ( .B0(n293), .B1(n22), .A0N(RF_4__0_), .A1N(n22), .Y(n74) );
  OAI2BB2X1M U138 ( .B0(n294), .B1(n22), .A0N(RF_4__1_), .A1N(n22), .Y(n75) );
  OAI2BB2X1M U139 ( .B0(n295), .B1(n22), .A0N(RF_4__2_), .A1N(n22), .Y(n76) );
  OAI2BB2X1M U140 ( .B0(n296), .B1(n22), .A0N(RF_4__3_), .A1N(n22), .Y(n77) );
  OAI2BB2X1M U141 ( .B0(n297), .B1(n22), .A0N(RF_4__4_), .A1N(n22), .Y(n78) );
  OAI2BB2X1M U142 ( .B0(n298), .B1(n22), .A0N(RF_4__5_), .A1N(n22), .Y(n79) );
  OAI2BB2X1M U143 ( .B0(n299), .B1(n22), .A0N(RF_4__6_), .A1N(n22), .Y(n80) );
  OAI2BB2X1M U144 ( .B0(n300), .B1(n22), .A0N(RF_4__7_), .A1N(n22), .Y(n81) );
  OAI2BB2X1M U145 ( .B0(n293), .B1(n24), .A0N(RF_5__0_), .A1N(n24), .Y(n82) );
  OAI2BB2X1M U146 ( .B0(n294), .B1(n24), .A0N(RF_5__1_), .A1N(n24), .Y(n83) );
  OAI2BB2X1M U147 ( .B0(n295), .B1(n24), .A0N(RF_5__2_), .A1N(n24), .Y(n84) );
  OAI2BB2X1M U148 ( .B0(n296), .B1(n24), .A0N(RF_5__3_), .A1N(n24), .Y(n85) );
  OAI2BB2X1M U149 ( .B0(n297), .B1(n24), .A0N(RF_5__4_), .A1N(n24), .Y(n86) );
  OAI2BB2X1M U150 ( .B0(n298), .B1(n24), .A0N(RF_5__5_), .A1N(n24), .Y(n87) );
  OAI2BB2X1M U151 ( .B0(n299), .B1(n24), .A0N(RF_5__6_), .A1N(n24), .Y(n88) );
  OAI2BB2X1M U152 ( .B0(n300), .B1(n24), .A0N(RF_5__7_), .A1N(n24), .Y(n89) );
  OAI2BB2X1M U153 ( .B0(n293), .B1(n25), .A0N(RF_6__0_), .A1N(n25), .Y(n90) );
  OAI2BB2X1M U154 ( .B0(n294), .B1(n25), .A0N(RF_6__1_), .A1N(n25), .Y(n91) );
  OAI2BB2X1M U155 ( .B0(n295), .B1(n25), .A0N(RF_6__2_), .A1N(n25), .Y(n92) );
  OAI2BB2X1M U156 ( .B0(n296), .B1(n25), .A0N(RF_6__3_), .A1N(n25), .Y(n93) );
  OAI2BB2X1M U157 ( .B0(n297), .B1(n25), .A0N(RF_6__4_), .A1N(n25), .Y(n94) );
  OAI2BB2X1M U158 ( .B0(n298), .B1(n25), .A0N(RF_6__5_), .A1N(n25), .Y(n95) );
  OAI2BB2X1M U159 ( .B0(n299), .B1(n25), .A0N(RF_6__6_), .A1N(n25), .Y(n96) );
  OAI2BB2X1M U160 ( .B0(n300), .B1(n25), .A0N(RF_6__7_), .A1N(n25), .Y(n97) );
  OAI2BB2X1M U161 ( .B0(n293), .B1(n28), .A0N(RF_7__0_), .A1N(n28), .Y(n98) );
  OAI2BB2X1M U162 ( .B0(n294), .B1(n28), .A0N(RF_7__1_), .A1N(n28), .Y(n99) );
  OAI2BB2X1M U163 ( .B0(n295), .B1(n28), .A0N(RF_7__2_), .A1N(n28), .Y(n100)
         );
  OAI2BB2X1M U164 ( .B0(n296), .B1(n28), .A0N(RF_7__3_), .A1N(n28), .Y(n101)
         );
  OAI2BB2X1M U165 ( .B0(n297), .B1(n28), .A0N(RF_7__4_), .A1N(n28), .Y(n102)
         );
  OAI2BB2X1M U166 ( .B0(n298), .B1(n28), .A0N(RF_7__5_), .A1N(n28), .Y(n103)
         );
  OAI2BB2X1M U167 ( .B0(n299), .B1(n28), .A0N(RF_7__6_), .A1N(n28), .Y(n104)
         );
  OAI2BB2X1M U168 ( .B0(n300), .B1(n28), .A0N(RF_7__7_), .A1N(n28), .Y(n105)
         );
  OAI2BB2X1M U169 ( .B0(n293), .B1(n35), .A0N(RF_12__0_), .A1N(n35), .Y(n138)
         );
  OAI2BB2X1M U170 ( .B0(n294), .B1(n35), .A0N(RF_12__1_), .A1N(n35), .Y(n139)
         );
  OAI2BB2X1M U171 ( .B0(n295), .B1(n35), .A0N(RF_12__2_), .A1N(n35), .Y(n140)
         );
  OAI2BB2X1M U172 ( .B0(n296), .B1(n35), .A0N(RF_12__3_), .A1N(n35), .Y(n141)
         );
  OAI2BB2X1M U173 ( .B0(n297), .B1(n35), .A0N(RF_12__4_), .A1N(n35), .Y(n142)
         );
  OAI2BB2X1M U174 ( .B0(n298), .B1(n35), .A0N(RF_12__5_), .A1N(n35), .Y(n143)
         );
  OAI2BB2X1M U175 ( .B0(n299), .B1(n35), .A0N(RF_12__6_), .A1N(n35), .Y(n144)
         );
  OAI2BB2X1M U176 ( .B0(n300), .B1(n35), .A0N(RF_12__7_), .A1N(n35), .Y(n145)
         );
  OAI2BB2X1M U177 ( .B0(n293), .B1(n36), .A0N(RF_13__0_), .A1N(n36), .Y(n146)
         );
  OAI2BB2X1M U178 ( .B0(n294), .B1(n36), .A0N(RF_13__1_), .A1N(n36), .Y(n147)
         );
  OAI2BB2X1M U179 ( .B0(n295), .B1(n36), .A0N(RF_13__2_), .A1N(n36), .Y(n148)
         );
  OAI2BB2X1M U180 ( .B0(n296), .B1(n36), .A0N(RF_13__3_), .A1N(n36), .Y(n149)
         );
  OAI2BB2X1M U181 ( .B0(n297), .B1(n36), .A0N(RF_13__4_), .A1N(n36), .Y(n150)
         );
  OAI2BB2X1M U182 ( .B0(n298), .B1(n36), .A0N(RF_13__5_), .A1N(n36), .Y(n151)
         );
  OAI2BB2X1M U183 ( .B0(n299), .B1(n36), .A0N(RF_13__6_), .A1N(n36), .Y(n152)
         );
  OAI2BB2X1M U184 ( .B0(n300), .B1(n36), .A0N(RF_13__7_), .A1N(n36), .Y(n153)
         );
  OAI2BB2X1M U185 ( .B0(n293), .B1(n37), .A0N(RF_14__0_), .A1N(n37), .Y(n154)
         );
  OAI2BB2X1M U186 ( .B0(n294), .B1(n37), .A0N(RF_14__1_), .A1N(n37), .Y(n155)
         );
  OAI2BB2X1M U187 ( .B0(n295), .B1(n37), .A0N(RF_14__2_), .A1N(n37), .Y(n156)
         );
  OAI2BB2X1M U188 ( .B0(n296), .B1(n37), .A0N(RF_14__3_), .A1N(n37), .Y(n157)
         );
  OAI2BB2X1M U189 ( .B0(n297), .B1(n37), .A0N(RF_14__4_), .A1N(n37), .Y(n158)
         );
  OAI2BB2X1M U190 ( .B0(n298), .B1(n37), .A0N(RF_14__5_), .A1N(n37), .Y(n159)
         );
  OAI2BB2X1M U191 ( .B0(n299), .B1(n37), .A0N(RF_14__6_), .A1N(n37), .Y(n160)
         );
  OAI2BB2X1M U192 ( .B0(n300), .B1(n37), .A0N(RF_14__7_), .A1N(n37), .Y(n161)
         );
  OAI2BB2X1M U193 ( .B0(n293), .B1(n39), .A0N(RF_15__0_), .A1N(n39), .Y(n162)
         );
  OAI2BB2X1M U194 ( .B0(n294), .B1(n39), .A0N(RF_15__1_), .A1N(n39), .Y(n163)
         );
  OAI2BB2X1M U195 ( .B0(n295), .B1(n39), .A0N(RF_15__2_), .A1N(n39), .Y(n164)
         );
  OAI2BB2X1M U196 ( .B0(n296), .B1(n39), .A0N(RF_15__3_), .A1N(n39), .Y(n165)
         );
  OAI2BB2X1M U197 ( .B0(n297), .B1(n39), .A0N(RF_15__4_), .A1N(n39), .Y(n166)
         );
  OAI2BB2X1M U198 ( .B0(n298), .B1(n39), .A0N(RF_15__5_), .A1N(n39), .Y(n167)
         );
  OAI2BB2X1M U199 ( .B0(n299), .B1(n39), .A0N(RF_15__6_), .A1N(n39), .Y(n168)
         );
  OAI2BB2X1M U200 ( .B0(n300), .B1(n39), .A0N(RF_15__7_), .A1N(n39), .Y(n169)
         );
  OAI2BB2X1M U201 ( .B0(n293), .B1(n19), .A0N(REG2[0]), .A1N(n19), .Y(n58) );
  OAI2BB2X1M U202 ( .B0(n300), .B1(n19), .A0N(REG2[7]), .A1N(n19), .Y(n65) );
  OAI2BB2X1M U203 ( .B0(n298), .B1(n21), .A0N(REG3[5]), .A1N(n21), .Y(n71) );
  AO21XLM U204 ( .A0(RdData_VLD), .A1(n13), .B0(n301), .Y(n41) );
  AOI22X1M U205 ( .A0(RF_10__0_), .A1(n275), .B0(RF_11__0_), .B1(n274), .Y(n6)
         );
  AOI22X1M U206 ( .A0(RF_8__0_), .A1(n277), .B0(RF_9__0_), .B1(n276), .Y(n5)
         );
  CLKNAND2X2M U207 ( .A(ADDRESS[3]), .B(n271), .Y(n254) );
  AOI21X1M U208 ( .A0(n6), .A1(n5), .B0(n254), .Y(n181) );
  AOI22X1M U209 ( .A0(RF_14__0_), .A1(n275), .B0(RF_15__0_), .B1(n274), .Y(n8)
         );
  AOI22X1M U210 ( .A0(RF_12__0_), .A1(n277), .B0(RF_13__0_), .B1(n276), .Y(n7)
         );
  CLKNAND2X2M U211 ( .A(ADDRESS[3]), .B(ADDRESS[2]), .Y(n257) );
  AOI21X1M U212 ( .A0(n8), .A1(n7), .B0(n257), .Y(n180) );
  AOI22X1M U213 ( .A0(REG2[0]), .A1(n275), .B0(REG3[0]), .B1(n274), .Y(n10) );
  AOI22X1M U214 ( .A0(REG0[0]), .A1(n277), .B0(REG1[0]), .B1(n276), .Y(n9) );
  CLKNAND2X2M U215 ( .A(n271), .B(n270), .Y(n260) );
  AOI21X1M U216 ( .A0(n10), .A1(n9), .B0(n260), .Y(n179) );
  AOI22X1M U217 ( .A0(RF_6__0_), .A1(n275), .B0(RF_7__0_), .B1(n274), .Y(n12)
         );
  AOI22X1M U218 ( .A0(RF_4__0_), .A1(n277), .B0(RF_5__0_), .B1(n276), .Y(n11)
         );
  CLKNAND2X2M U219 ( .A(ADDRESS[2]), .B(n270), .Y(n263) );
  AOI21X1M U220 ( .A0(n12), .A1(n11), .B0(n263), .Y(n178) );
  OR4X1M U221 ( .A(n181), .B(n180), .C(n179), .D(n178), .Y(N26) );
  AOI22X1M U222 ( .A0(RF_10__1_), .A1(n275), .B0(RF_11__1_), .B1(n274), .Y(
        n183) );
  AOI22X1M U223 ( .A0(RF_8__1_), .A1(n277), .B0(RF_9__1_), .B1(n276), .Y(n182)
         );
  AOI21X1M U224 ( .A0(n183), .A1(n182), .B0(n254), .Y(n193) );
  AOI22X1M U225 ( .A0(RF_14__1_), .A1(n275), .B0(RF_15__1_), .B1(n274), .Y(
        n185) );
  AOI22X1M U226 ( .A0(RF_12__1_), .A1(n277), .B0(RF_13__1_), .B1(n276), .Y(
        n184) );
  AOI21X1M U227 ( .A0(n185), .A1(n184), .B0(n257), .Y(n192) );
  AOI22X1M U228 ( .A0(REG2[1]), .A1(n275), .B0(REG3[1]), .B1(n274), .Y(n187)
         );
  AOI22X1M U229 ( .A0(REG0[1]), .A1(n277), .B0(REG1[1]), .B1(n276), .Y(n186)
         );
  AOI21X1M U230 ( .A0(n187), .A1(n186), .B0(n260), .Y(n191) );
  AOI22X1M U231 ( .A0(RF_6__1_), .A1(n275), .B0(RF_7__1_), .B1(n274), .Y(n189)
         );
  AOI22X1M U232 ( .A0(RF_4__1_), .A1(n277), .B0(RF_5__1_), .B1(n276), .Y(n188)
         );
  AOI21X1M U233 ( .A0(n189), .A1(n188), .B0(n263), .Y(n190) );
  OR4X1M U234 ( .A(n193), .B(n192), .C(n191), .D(n190), .Y(N25) );
  AOI22X1M U235 ( .A0(RF_10__2_), .A1(n275), .B0(RF_11__2_), .B1(n274), .Y(
        n195) );
  AOI22X1M U236 ( .A0(RF_8__2_), .A1(n277), .B0(RF_9__2_), .B1(n276), .Y(n194)
         );
  AOI21X1M U237 ( .A0(n195), .A1(n194), .B0(n254), .Y(n205) );
  AOI22X1M U238 ( .A0(RF_14__2_), .A1(n275), .B0(RF_15__2_), .B1(n274), .Y(
        n197) );
  AOI22X1M U239 ( .A0(RF_12__2_), .A1(n277), .B0(RF_13__2_), .B1(n276), .Y(
        n196) );
  AOI21X1M U240 ( .A0(n197), .A1(n196), .B0(n257), .Y(n204) );
  AOI22X1M U241 ( .A0(REG2[2]), .A1(n275), .B0(REG3[2]), .B1(n274), .Y(n199)
         );
  AOI22X1M U242 ( .A0(REG0[2]), .A1(n277), .B0(REG1[2]), .B1(n276), .Y(n198)
         );
  AOI21X1M U243 ( .A0(n199), .A1(n198), .B0(n260), .Y(n203) );
  AOI22X1M U244 ( .A0(RF_6__2_), .A1(n275), .B0(RF_7__2_), .B1(n274), .Y(n201)
         );
  AOI22X1M U245 ( .A0(RF_4__2_), .A1(n277), .B0(RF_5__2_), .B1(n276), .Y(n200)
         );
  AOI21X1M U246 ( .A0(n201), .A1(n200), .B0(n263), .Y(n202) );
  OR4X1M U247 ( .A(n205), .B(n204), .C(n203), .D(n202), .Y(N24) );
  AOI22X1M U248 ( .A0(RF_10__3_), .A1(n275), .B0(RF_11__3_), .B1(n274), .Y(
        n207) );
  AOI22X1M U249 ( .A0(RF_8__3_), .A1(n277), .B0(RF_9__3_), .B1(n276), .Y(n206)
         );
  AOI21X1M U250 ( .A0(n207), .A1(n206), .B0(n254), .Y(n217) );
  AOI22X1M U251 ( .A0(RF_14__3_), .A1(n275), .B0(RF_15__3_), .B1(n274), .Y(
        n209) );
  AOI22X1M U252 ( .A0(RF_12__3_), .A1(n277), .B0(RF_13__3_), .B1(n276), .Y(
        n208) );
  AOI21X1M U253 ( .A0(n209), .A1(n208), .B0(n257), .Y(n216) );
  AOI22X1M U254 ( .A0(REG2[3]), .A1(n275), .B0(REG3[3]), .B1(n274), .Y(n211)
         );
  AOI22X1M U255 ( .A0(REG0[3]), .A1(n277), .B0(REG1[3]), .B1(n276), .Y(n210)
         );
  AOI21X1M U256 ( .A0(n211), .A1(n210), .B0(n260), .Y(n215) );
  AOI22X1M U257 ( .A0(RF_6__3_), .A1(n275), .B0(RF_7__3_), .B1(n274), .Y(n213)
         );
  AOI22X1M U258 ( .A0(RF_4__3_), .A1(n277), .B0(RF_5__3_), .B1(n276), .Y(n212)
         );
  AOI21X1M U259 ( .A0(n213), .A1(n212), .B0(n263), .Y(n214) );
  OR4X1M U260 ( .A(n217), .B(n216), .C(n215), .D(n214), .Y(N23) );
  AOI22X1M U261 ( .A0(RF_10__4_), .A1(n275), .B0(RF_11__4_), .B1(n274), .Y(
        n219) );
  AOI22X1M U262 ( .A0(RF_8__4_), .A1(n277), .B0(RF_9__4_), .B1(n276), .Y(n218)
         );
  AOI21X1M U263 ( .A0(n219), .A1(n218), .B0(n254), .Y(n229) );
  AOI22X1M U264 ( .A0(RF_14__4_), .A1(n275), .B0(RF_15__4_), .B1(n274), .Y(
        n221) );
  AOI22X1M U265 ( .A0(RF_12__4_), .A1(n277), .B0(RF_13__4_), .B1(n276), .Y(
        n220) );
  AOI21X1M U266 ( .A0(n221), .A1(n220), .B0(n257), .Y(n228) );
  AOI22X1M U267 ( .A0(REG2[4]), .A1(n275), .B0(REG3[4]), .B1(n274), .Y(n223)
         );
  AOI22X1M U268 ( .A0(REG0[4]), .A1(n277), .B0(REG1[4]), .B1(n276), .Y(n222)
         );
  AOI21X1M U269 ( .A0(n223), .A1(n222), .B0(n260), .Y(n227) );
  AOI22X1M U270 ( .A0(RF_6__4_), .A1(n275), .B0(RF_7__4_), .B1(n274), .Y(n225)
         );
  AOI22X1M U271 ( .A0(RF_4__4_), .A1(n277), .B0(RF_5__4_), .B1(n276), .Y(n224)
         );
  AOI21X1M U272 ( .A0(n225), .A1(n224), .B0(n263), .Y(n226) );
  OR4X1M U273 ( .A(n229), .B(n228), .C(n227), .D(n226), .Y(N22) );
  AOI22X1M U274 ( .A0(RF_10__5_), .A1(n275), .B0(RF_11__5_), .B1(n274), .Y(
        n231) );
  AOI22X1M U275 ( .A0(RF_8__5_), .A1(n277), .B0(RF_9__5_), .B1(n276), .Y(n230)
         );
  AOI21X1M U276 ( .A0(n231), .A1(n230), .B0(n254), .Y(n241) );
  AOI22X1M U277 ( .A0(RF_14__5_), .A1(n275), .B0(RF_15__5_), .B1(n274), .Y(
        n233) );
  AOI22X1M U278 ( .A0(RF_12__5_), .A1(n277), .B0(RF_13__5_), .B1(n276), .Y(
        n232) );
  AOI21X1M U279 ( .A0(n233), .A1(n232), .B0(n257), .Y(n240) );
  AOI22X1M U280 ( .A0(REG2[5]), .A1(n275), .B0(REG3[5]), .B1(n274), .Y(n235)
         );
  AOI22X1M U281 ( .A0(REG0[5]), .A1(n277), .B0(REG1[5]), .B1(n276), .Y(n234)
         );
  AOI21X1M U282 ( .A0(n235), .A1(n234), .B0(n260), .Y(n239) );
  AOI22X1M U283 ( .A0(RF_6__5_), .A1(n275), .B0(RF_7__5_), .B1(n274), .Y(n237)
         );
  AOI22X1M U284 ( .A0(RF_4__5_), .A1(n277), .B0(RF_5__5_), .B1(n276), .Y(n236)
         );
  AOI21X1M U285 ( .A0(n237), .A1(n236), .B0(n263), .Y(n238) );
  OR4X1M U286 ( .A(n241), .B(n240), .C(n239), .D(n238), .Y(N21) );
  AOI22X1M U287 ( .A0(RF_10__6_), .A1(n275), .B0(RF_11__6_), .B1(n274), .Y(
        n243) );
  AOI22X1M U288 ( .A0(RF_8__6_), .A1(n277), .B0(RF_9__6_), .B1(n276), .Y(n242)
         );
  AOI21X1M U289 ( .A0(n243), .A1(n242), .B0(n254), .Y(n253) );
  AOI22X1M U290 ( .A0(RF_14__6_), .A1(n275), .B0(RF_15__6_), .B1(n274), .Y(
        n245) );
  AOI22X1M U291 ( .A0(RF_12__6_), .A1(n277), .B0(RF_13__6_), .B1(n276), .Y(
        n244) );
  AOI21X1M U292 ( .A0(n245), .A1(n244), .B0(n257), .Y(n252) );
  AOI22X1M U293 ( .A0(REG2[6]), .A1(n275), .B0(REG3[6]), .B1(n274), .Y(n247)
         );
  AOI22X1M U294 ( .A0(REG0[6]), .A1(n277), .B0(REG1[6]), .B1(n276), .Y(n246)
         );
  AOI21X1M U295 ( .A0(n247), .A1(n246), .B0(n260), .Y(n251) );
  AOI22X1M U296 ( .A0(RF_6__6_), .A1(n275), .B0(RF_7__6_), .B1(n274), .Y(n249)
         );
  AOI22X1M U297 ( .A0(RF_4__6_), .A1(n277), .B0(RF_5__6_), .B1(n276), .Y(n248)
         );
  AOI21X1M U298 ( .A0(n249), .A1(n248), .B0(n263), .Y(n250) );
  OR4X1M U299 ( .A(n253), .B(n252), .C(n251), .D(n250), .Y(N20) );
  AOI22X1M U300 ( .A0(RF_10__7_), .A1(n275), .B0(RF_11__7_), .B1(n274), .Y(
        n256) );
  AOI22X1M U301 ( .A0(RF_8__7_), .A1(n277), .B0(RF_9__7_), .B1(n276), .Y(n255)
         );
  AOI21X1M U302 ( .A0(n256), .A1(n255), .B0(n254), .Y(n269) );
  AOI22X1M U303 ( .A0(RF_14__7_), .A1(n275), .B0(RF_15__7_), .B1(n274), .Y(
        n259) );
  AOI22X1M U304 ( .A0(RF_12__7_), .A1(n277), .B0(RF_13__7_), .B1(n276), .Y(
        n258) );
  AOI21X1M U305 ( .A0(n259), .A1(n258), .B0(n257), .Y(n268) );
  AOI22X1M U306 ( .A0(REG2[7]), .A1(n275), .B0(REG3[7]), .B1(n274), .Y(n262)
         );
  AOI22X1M U307 ( .A0(REG0[7]), .A1(n277), .B0(REG1[7]), .B1(n276), .Y(n261)
         );
  AOI21X1M U308 ( .A0(n262), .A1(n261), .B0(n260), .Y(n267) );
  AOI22X1M U309 ( .A0(RF_6__7_), .A1(n275), .B0(RF_7__7_), .B1(n274), .Y(n265)
         );
  AOI22X1M U310 ( .A0(RF_4__7_), .A1(n277), .B0(RF_5__7_), .B1(n276), .Y(n264)
         );
  AOI21X1M U311 ( .A0(n265), .A1(n264), .B0(n263), .Y(n266) );
  OR4X1M U312 ( .A(n269), .B(n268), .C(n267), .D(n266), .Y(N19) );
endmodule


module CLK_GATE ( CLK_EN, CLK, GATED_CLK );
  input CLK_EN, CLK;
  output GATED_CLK;


  TLATNCAX12M U0_TLATNCAX12M ( .E(CLK_EN), .CK(CLK), .ECK(GATED_CLK) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   u_div_SumTmp_1__0_, u_div_SumTmp_1__1_, u_div_SumTmp_1__2_,
         u_div_SumTmp_1__3_, u_div_SumTmp_1__4_, u_div_SumTmp_1__5_,
         u_div_SumTmp_1__6_, u_div_SumTmp_2__0_, u_div_SumTmp_2__1_,
         u_div_SumTmp_2__2_, u_div_SumTmp_2__3_, u_div_SumTmp_2__4_,
         u_div_SumTmp_2__5_, u_div_SumTmp_3__0_, u_div_SumTmp_3__1_,
         u_div_SumTmp_3__2_, u_div_SumTmp_3__3_, u_div_SumTmp_3__4_,
         u_div_SumTmp_4__0_, u_div_SumTmp_4__1_, u_div_SumTmp_4__2_,
         u_div_SumTmp_4__3_, u_div_SumTmp_5__0_, u_div_SumTmp_5__1_,
         u_div_SumTmp_5__2_, u_div_SumTmp_6__0_, u_div_SumTmp_6__1_,
         u_div_SumTmp_7__0_, u_div_CryTmp_0__1_, u_div_CryTmp_0__2_,
         u_div_CryTmp_0__3_, u_div_CryTmp_0__4_, u_div_CryTmp_0__5_,
         u_div_CryTmp_0__6_, u_div_CryTmp_0__7_, u_div_CryTmp_1__1_,
         u_div_CryTmp_1__2_, u_div_CryTmp_1__3_, u_div_CryTmp_1__4_,
         u_div_CryTmp_1__5_, u_div_CryTmp_1__6_, u_div_CryTmp_1__7_,
         u_div_CryTmp_2__1_, u_div_CryTmp_2__2_, u_div_CryTmp_2__3_,
         u_div_CryTmp_2__4_, u_div_CryTmp_2__5_, u_div_CryTmp_2__6_,
         u_div_CryTmp_3__1_, u_div_CryTmp_3__2_, u_div_CryTmp_3__3_,
         u_div_CryTmp_3__4_, u_div_CryTmp_3__5_, u_div_CryTmp_4__1_,
         u_div_CryTmp_4__2_, u_div_CryTmp_4__3_, u_div_CryTmp_4__4_,
         u_div_CryTmp_5__1_, u_div_CryTmp_5__2_, u_div_CryTmp_5__3_,
         u_div_CryTmp_6__1_, u_div_CryTmp_6__2_, u_div_CryTmp_7__1_,
         u_div_PartRem_1__1_, u_div_PartRem_1__2_, u_div_PartRem_1__3_,
         u_div_PartRem_1__4_, u_div_PartRem_1__5_, u_div_PartRem_1__6_,
         u_div_PartRem_1__7_, u_div_PartRem_2__1_, u_div_PartRem_2__2_,
         u_div_PartRem_2__3_, u_div_PartRem_2__4_, u_div_PartRem_2__5_,
         u_div_PartRem_2__6_, u_div_PartRem_3__1_, u_div_PartRem_3__2_,
         u_div_PartRem_3__3_, u_div_PartRem_3__4_, u_div_PartRem_3__5_,
         u_div_PartRem_4__1_, u_div_PartRem_4__2_, u_div_PartRem_4__3_,
         u_div_PartRem_4__4_, u_div_PartRem_5__1_, u_div_PartRem_5__2_,
         u_div_PartRem_5__3_, u_div_PartRem_6__1_, u_div_PartRem_6__2_,
         u_div_PartRem_7__1_, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M u_div_u_fa_PartRem_0_2_5 ( .A(u_div_PartRem_3__5_), .B(n13), .CI(
        u_div_CryTmp_2__5_), .CO(u_div_CryTmp_2__6_), .S(u_div_SumTmp_2__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_3 ( .A(u_div_PartRem_5__3_), .B(n15), .CI(
        u_div_CryTmp_4__3_), .CO(u_div_CryTmp_4__4_), .S(u_div_SumTmp_4__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_2 ( .A(u_div_PartRem_6__2_), .B(n16), .CI(
        u_div_CryTmp_5__2_), .CO(u_div_CryTmp_5__3_), .S(u_div_SumTmp_5__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_6_1 ( .A(u_div_PartRem_7__1_), .B(n17), .CI(
        u_div_CryTmp_6__1_), .CO(u_div_CryTmp_6__2_), .S(u_div_SumTmp_6__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_4 ( .A(u_div_PartRem_4__4_), .B(n14), .CI(
        u_div_CryTmp_3__4_), .CO(u_div_CryTmp_3__5_), .S(u_div_SumTmp_3__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_6 ( .A(u_div_PartRem_1__6_), .B(n12), .CI(
        u_div_CryTmp_0__6_), .CO(u_div_CryTmp_0__7_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_7 ( .A(u_div_PartRem_1__7_), .B(n11), .CI(
        u_div_CryTmp_0__7_), .CO(quotient[0]) );
  ADDFX2M u_div_u_fa_PartRem_0_0_1 ( .A(u_div_PartRem_1__1_), .B(n17), .CI(
        u_div_CryTmp_0__1_), .CO(u_div_CryTmp_0__2_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_1 ( .A(u_div_PartRem_2__1_), .B(n17), .CI(
        u_div_CryTmp_1__1_), .CO(u_div_CryTmp_1__2_), .S(u_div_SumTmp_1__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_1 ( .A(u_div_PartRem_3__1_), .B(n17), .CI(
        u_div_CryTmp_2__1_), .CO(u_div_CryTmp_2__2_), .S(u_div_SumTmp_2__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_1 ( .A(u_div_PartRem_4__1_), .B(n17), .CI(
        u_div_CryTmp_3__1_), .CO(u_div_CryTmp_3__2_), .S(u_div_SumTmp_3__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_1 ( .A(u_div_PartRem_5__1_), .B(n17), .CI(
        u_div_CryTmp_4__1_), .CO(u_div_CryTmp_4__2_), .S(u_div_SumTmp_4__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_5_1 ( .A(u_div_PartRem_6__1_), .B(n17), .CI(
        u_div_CryTmp_5__1_), .CO(u_div_CryTmp_5__2_), .S(u_div_SumTmp_5__1_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_4 ( .A(u_div_PartRem_1__4_), .B(n14), .CI(
        u_div_CryTmp_0__4_), .CO(u_div_CryTmp_0__5_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_5 ( .A(u_div_PartRem_1__5_), .B(n13), .CI(
        u_div_CryTmp_0__5_), .CO(u_div_CryTmp_0__6_) );
  ADDFX2M u_div_u_fa_PartRem_0_1_5 ( .A(u_div_PartRem_2__5_), .B(n13), .CI(
        u_div_CryTmp_1__5_), .CO(u_div_CryTmp_1__6_), .S(u_div_SumTmp_1__5_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_4 ( .A(u_div_PartRem_2__4_), .B(n14), .CI(
        u_div_CryTmp_1__4_), .CO(u_div_CryTmp_1__5_), .S(u_div_SumTmp_1__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_0_2 ( .A(u_div_PartRem_1__2_), .B(n16), .CI(
        u_div_CryTmp_0__2_), .CO(u_div_CryTmp_0__3_) );
  ADDFX2M u_div_u_fa_PartRem_0_0_3 ( .A(u_div_PartRem_1__3_), .B(n15), .CI(
        u_div_CryTmp_0__3_), .CO(u_div_CryTmp_0__4_) );
  ADDFX2M u_div_u_fa_PartRem_0_2_4 ( .A(u_div_PartRem_3__4_), .B(n14), .CI(
        u_div_CryTmp_2__4_), .CO(u_div_CryTmp_2__5_), .S(u_div_SumTmp_2__4_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_3 ( .A(u_div_PartRem_2__3_), .B(n15), .CI(
        u_div_CryTmp_1__3_), .CO(u_div_CryTmp_1__4_), .S(u_div_SumTmp_1__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_3 ( .A(u_div_PartRem_3__3_), .B(n15), .CI(
        u_div_CryTmp_2__3_), .CO(u_div_CryTmp_2__4_), .S(u_div_SumTmp_2__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_2 ( .A(u_div_PartRem_2__2_), .B(n16), .CI(
        u_div_CryTmp_1__2_), .CO(u_div_CryTmp_1__3_), .S(u_div_SumTmp_1__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_3 ( .A(u_div_PartRem_4__3_), .B(n15), .CI(
        u_div_CryTmp_3__3_), .CO(u_div_CryTmp_3__4_), .S(u_div_SumTmp_3__3_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_2_2 ( .A(u_div_PartRem_3__2_), .B(n16), .CI(
        u_div_CryTmp_2__2_), .CO(u_div_CryTmp_2__3_), .S(u_div_SumTmp_2__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_3_2 ( .A(u_div_PartRem_4__2_), .B(n16), .CI(
        u_div_CryTmp_3__2_), .CO(u_div_CryTmp_3__3_), .S(u_div_SumTmp_3__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_4_2 ( .A(u_div_PartRem_5__2_), .B(n16), .CI(
        u_div_CryTmp_4__2_), .CO(u_div_CryTmp_4__3_), .S(u_div_SumTmp_4__2_)
         );
  ADDFX2M u_div_u_fa_PartRem_0_1_6 ( .A(u_div_PartRem_2__6_), .B(n12), .CI(
        u_div_CryTmp_1__6_), .CO(u_div_CryTmp_1__7_), .S(u_div_SumTmp_1__6_)
         );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(u_div_SumTmp_7__0_) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(u_div_SumTmp_6__0_) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(u_div_SumTmp_5__0_) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(u_div_SumTmp_4__0_) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(u_div_SumTmp_3__0_) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(u_div_SumTmp_2__0_) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(u_div_CryTmp_7__1_) );
  NAND2X2M U9 ( .A(n3), .B(n4), .Y(u_div_CryTmp_5__1_) );
  INVX2M U10 ( .A(a[5]), .Y(n4) );
  INVX2M U11 ( .A(n18), .Y(n3) );
  NAND2X2M U12 ( .A(n5), .B(n6), .Y(u_div_CryTmp_4__1_) );
  INVX2M U13 ( .A(a[4]), .Y(n6) );
  INVX2M U14 ( .A(n18), .Y(n5) );
  NAND2X2M U15 ( .A(n5), .B(n7), .Y(u_div_CryTmp_3__1_) );
  INVX2M U16 ( .A(a[3]), .Y(n7) );
  NAND2X2M U17 ( .A(n5), .B(n8), .Y(u_div_CryTmp_2__1_) );
  INVX2M U18 ( .A(a[2]), .Y(n8) );
  NAND2X2M U19 ( .A(n5), .B(n9), .Y(u_div_CryTmp_1__1_) );
  INVX2M U20 ( .A(a[1]), .Y(n9) );
  NAND2X2M U21 ( .A(n5), .B(n10), .Y(u_div_CryTmp_0__1_) );
  INVX2M U22 ( .A(a[0]), .Y(n10) );
  NAND2X2M U23 ( .A(n1), .B(n2), .Y(u_div_CryTmp_6__1_) );
  INVX2M U24 ( .A(a[6]), .Y(n2) );
  INVX2M U25 ( .A(n18), .Y(n1) );
  XNOR2X2M U26 ( .A(n18), .B(a[1]), .Y(u_div_SumTmp_1__0_) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(u_div_PartRem_2__6_), .B(u_div_SumTmp_1__6_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__7_) );
  CLKMX2X2M U35 ( .A(u_div_PartRem_3__5_), .B(u_div_SumTmp_2__5_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__6_) );
  CLKMX2X2M U36 ( .A(u_div_PartRem_4__4_), .B(u_div_SumTmp_3__4_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__5_) );
  CLKMX2X2M U37 ( .A(u_div_PartRem_5__3_), .B(u_div_SumTmp_4__3_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__4_) );
  CLKMX2X2M U38 ( .A(u_div_PartRem_6__2_), .B(u_div_SumTmp_5__2_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__3_) );
  CLKMX2X2M U39 ( .A(u_div_PartRem_7__1_), .B(u_div_SumTmp_6__1_), .S0(
        quotient[6]), .Y(u_div_PartRem_6__2_) );
  CLKMX2X2M U40 ( .A(a[7]), .B(u_div_SumTmp_7__0_), .S0(quotient[7]), .Y(
        u_div_PartRem_7__1_) );
  CLKMX2X2M U41 ( .A(u_div_PartRem_2__5_), .B(u_div_SumTmp_1__5_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__6_) );
  CLKMX2X2M U42 ( .A(u_div_PartRem_3__4_), .B(u_div_SumTmp_2__4_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__5_) );
  CLKMX2X2M U43 ( .A(u_div_PartRem_4__3_), .B(u_div_SumTmp_3__3_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__4_) );
  CLKMX2X2M U44 ( .A(u_div_PartRem_5__2_), .B(u_div_SumTmp_4__2_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__3_) );
  CLKMX2X2M U45 ( .A(u_div_PartRem_6__1_), .B(u_div_SumTmp_5__1_), .S0(
        quotient[5]), .Y(u_div_PartRem_5__2_) );
  CLKMX2X2M U46 ( .A(a[6]), .B(u_div_SumTmp_6__0_), .S0(quotient[6]), .Y(
        u_div_PartRem_6__1_) );
  CLKMX2X2M U47 ( .A(u_div_PartRem_2__4_), .B(u_div_SumTmp_1__4_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__5_) );
  CLKMX2X2M U48 ( .A(u_div_PartRem_3__3_), .B(u_div_SumTmp_2__3_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__4_) );
  CLKMX2X2M U49 ( .A(u_div_PartRem_4__2_), .B(u_div_SumTmp_3__2_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__3_) );
  CLKMX2X2M U50 ( .A(u_div_PartRem_5__1_), .B(u_div_SumTmp_4__1_), .S0(
        quotient[4]), .Y(u_div_PartRem_4__2_) );
  CLKMX2X2M U51 ( .A(a[5]), .B(u_div_SumTmp_5__0_), .S0(quotient[5]), .Y(
        u_div_PartRem_5__1_) );
  CLKMX2X2M U52 ( .A(u_div_PartRem_2__3_), .B(u_div_SumTmp_1__3_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__4_) );
  CLKMX2X2M U53 ( .A(u_div_PartRem_3__2_), .B(u_div_SumTmp_2__2_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__3_) );
  CLKMX2X2M U54 ( .A(u_div_PartRem_4__1_), .B(u_div_SumTmp_3__1_), .S0(
        quotient[3]), .Y(u_div_PartRem_3__2_) );
  CLKMX2X2M U55 ( .A(a[4]), .B(u_div_SumTmp_4__0_), .S0(quotient[4]), .Y(
        u_div_PartRem_4__1_) );
  CLKMX2X2M U56 ( .A(u_div_PartRem_2__2_), .B(u_div_SumTmp_1__2_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__3_) );
  CLKMX2X2M U57 ( .A(u_div_PartRem_3__1_), .B(u_div_SumTmp_2__1_), .S0(
        quotient[2]), .Y(u_div_PartRem_2__2_) );
  CLKMX2X2M U58 ( .A(a[3]), .B(u_div_SumTmp_3__0_), .S0(quotient[3]), .Y(
        u_div_PartRem_3__1_) );
  CLKMX2X2M U59 ( .A(u_div_PartRem_2__1_), .B(u_div_SumTmp_1__1_), .S0(
        quotient[1]), .Y(u_div_PartRem_1__2_) );
  CLKMX2X2M U60 ( .A(a[2]), .B(u_div_SumTmp_2__0_), .S0(quotient[2]), .Y(
        u_div_PartRem_2__1_) );
  CLKMX2X2M U61 ( .A(a[1]), .B(u_div_SumTmp_1__0_), .S0(quotient[1]), .Y(
        u_div_PartRem_1__1_) );
  AND4X1M U62 ( .A(u_div_CryTmp_7__1_), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(u_div_CryTmp_6__2_), .Y(quotient[6]) );
  AND2X1M U64 ( .A(u_div_CryTmp_5__3_), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(u_div_CryTmp_4__4_), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(u_div_CryTmp_3__5_), .Y(quotient[3]) );
  AND2X1M U69 ( .A(u_div_CryTmp_2__6_), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(u_div_CryTmp_1__7_), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [8:1] carry;

  ADDFX2M U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  INVX2M U1 ( .A(carry[8]), .Y(DIFF[8]) );
  INVX2M U2 ( .A(B[6]), .Y(n4) );
  XNOR2X2M U3 ( .A(n10), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U4 ( .A(B[0]), .Y(n10) );
  INVX2M U5 ( .A(B[7]), .Y(n3) );
  INVX2M U6 ( .A(B[2]), .Y(n8) );
  INVX2M U7 ( .A(B[3]), .Y(n7) );
  INVX2M U8 ( .A(B[4]), .Y(n6) );
  INVX2M U9 ( .A(B[5]), .Y(n5) );
  INVX2M U10 ( .A(B[1]), .Y(n9) );
  NAND2X2M U11 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U12 ( .A(A[0]), .Y(n1) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [7:2] carry;

  ADDFX2M U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  ADDFX2M U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  ADDFX2M U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5])
         );
  ADDFX2M U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4])
         );
  ADDFX2M U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3])
         );
  ADDFX2M U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2])
         );
  ADDFX2M U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6])
         );
  AND2X2M U1 ( .A(B[0]), .B(A[0]), .Y(n1) );
  CLKXOR2X2M U2 ( .A(B[0]), .B(A[0]), .Y(SUM[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16,
         n17, n18, n19, n20;
  assign SUM[6] = A[6];
  assign SUM[5] = A[5];
  assign SUM[4] = A[4];
  assign SUM[3] = A[3];
  assign SUM[2] = A[2];
  assign SUM[1] = A[1];
  assign SUM[0] = A[0];

  AOI21BX2M U2 ( .A0(n11), .A1(A[12]), .B0N(n12), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n8) );
  XNOR2X2M U4 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  XNOR2X2M U5 ( .A(A[7]), .B(n2), .Y(SUM[7]) );
  INVX2M U6 ( .A(B[7]), .Y(n2) );
  XNOR2X1M U7 ( .A(n3), .B(n4), .Y(SUM[9]) );
  NOR2X1M U8 ( .A(n5), .B(n6), .Y(n4) );
  CLKXOR2X2M U9 ( .A(n7), .B(n8), .Y(SUM[8]) );
  NAND2BX1M U10 ( .AN(n9), .B(n10), .Y(n7) );
  OAI21X1M U11 ( .A0(A[12]), .A1(n11), .B0(B[12]), .Y(n12) );
  XOR3XLM U12 ( .A(B[12]), .B(A[12]), .C(n11), .Y(SUM[12]) );
  OAI21BX1M U13 ( .A0(n13), .A1(n14), .B0N(n15), .Y(n11) );
  XNOR2X1M U14 ( .A(n14), .B(n16), .Y(SUM[11]) );
  NOR2X1M U15 ( .A(n15), .B(n13), .Y(n16) );
  NOR2X1M U16 ( .A(B[11]), .B(A[11]), .Y(n13) );
  AND2X1M U17 ( .A(B[11]), .B(A[11]), .Y(n15) );
  OA21X1M U18 ( .A0(n17), .A1(n18), .B0(n19), .Y(n14) );
  CLKXOR2X2M U19 ( .A(n20), .B(n18), .Y(SUM[10]) );
  AOI2BB1X1M U20 ( .A0N(n3), .A1N(n6), .B0(n5), .Y(n18) );
  AND2X1M U21 ( .A(B[9]), .B(A[9]), .Y(n5) );
  NOR2X1M U22 ( .A(B[9]), .B(A[9]), .Y(n6) );
  OA21X1M U23 ( .A0(n8), .A1(n9), .B0(n10), .Y(n3) );
  CLKNAND2X2M U24 ( .A(B[8]), .B(A[8]), .Y(n10) );
  NOR2X1M U25 ( .A(B[8]), .B(A[8]), .Y(n9) );
  NAND2BX1M U26 ( .AN(n17), .B(n19), .Y(n20) );
  CLKNAND2X2M U27 ( .A(B[10]), .B(A[10]), .Y(n19) );
  NOR2X1M U28 ( .A(B[10]), .B(A[10]), .Y(n17) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   ab_7__7_, ab_7__6_, ab_7__5_, ab_7__4_, ab_7__3_, ab_7__2_, ab_7__1_,
         ab_7__0_, ab_6__7_, ab_6__6_, ab_6__5_, ab_6__4_, ab_6__3_, ab_6__2_,
         ab_6__1_, ab_6__0_, ab_5__7_, ab_5__6_, ab_5__5_, ab_5__4_, ab_5__3_,
         ab_5__2_, ab_5__1_, ab_5__0_, ab_4__7_, ab_4__6_, ab_4__5_, ab_4__4_,
         ab_4__3_, ab_4__2_, ab_4__1_, ab_4__0_, ab_3__7_, ab_3__6_, ab_3__5_,
         ab_3__4_, ab_3__3_, ab_3__2_, ab_3__1_, ab_3__0_, ab_2__7_, ab_2__6_,
         ab_2__5_, ab_2__4_, ab_2__3_, ab_2__2_, ab_2__1_, ab_2__0_, ab_1__7_,
         ab_1__6_, ab_1__5_, ab_1__4_, ab_1__3_, ab_1__2_, ab_1__1_, ab_1__0_,
         ab_0__7_, ab_0__6_, ab_0__5_, ab_0__4_, ab_0__3_, ab_0__2_, ab_0__1_,
         CARRYB_7__6_, CARRYB_7__5_, CARRYB_7__4_, CARRYB_7__3_, CARRYB_7__2_,
         CARRYB_7__1_, CARRYB_7__0_, CARRYB_6__6_, CARRYB_6__5_, CARRYB_6__4_,
         CARRYB_6__3_, CARRYB_6__2_, CARRYB_6__1_, CARRYB_6__0_, CARRYB_5__6_,
         CARRYB_5__5_, CARRYB_5__4_, CARRYB_5__3_, CARRYB_5__2_, CARRYB_5__1_,
         CARRYB_5__0_, CARRYB_4__6_, CARRYB_4__5_, CARRYB_4__4_, CARRYB_4__3_,
         CARRYB_4__2_, CARRYB_4__1_, CARRYB_4__0_, CARRYB_3__6_, CARRYB_3__5_,
         CARRYB_3__4_, CARRYB_3__3_, CARRYB_3__2_, CARRYB_3__1_, CARRYB_3__0_,
         CARRYB_2__6_, CARRYB_2__5_, CARRYB_2__4_, CARRYB_2__3_, CARRYB_2__2_,
         CARRYB_2__1_, CARRYB_2__0_, SUMB_7__6_, SUMB_7__5_, SUMB_7__4_,
         SUMB_7__3_, SUMB_7__2_, SUMB_7__1_, SUMB_7__0_, SUMB_6__6_,
         SUMB_6__5_, SUMB_6__4_, SUMB_6__3_, SUMB_6__2_, SUMB_6__1_,
         SUMB_5__6_, SUMB_5__5_, SUMB_5__4_, SUMB_5__3_, SUMB_5__2_,
         SUMB_5__1_, SUMB_4__6_, SUMB_4__5_, SUMB_4__4_, SUMB_4__3_,
         SUMB_4__2_, SUMB_4__1_, SUMB_3__6_, SUMB_3__5_, SUMB_3__4_,
         SUMB_3__3_, SUMB_3__2_, SUMB_3__1_, SUMB_2__6_, SUMB_2__5_,
         SUMB_2__4_, SUMB_2__3_, SUMB_2__2_, SUMB_2__1_, SUMB_1__6_,
         SUMB_1__5_, SUMB_1__4_, SUMB_1__3_, SUMB_1__2_, SUMB_1__1_, A1_12_,
         A1_11_, A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, A1_4_, A1_3_, A1_2_,
         A1_1_, A1_0_, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14,
         n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, A1_12_, A1_11_, 
        A1_10_, A1_9_, A1_8_, A1_7_, A1_6_, SUMB_7__0_, A1_4_, A1_3_, A1_2_, 
        A1_1_, A1_0_}), .B({n10, n16, n14, n13, n15, n11, n12, 1'b0, 1'b0, 
        1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  ADDFX2M S5_6 ( .A(ab_7__6_), .B(CARRYB_6__6_), .CI(ab_6__7_), .CO(
        CARRYB_7__6_), .S(SUMB_7__6_) );
  ADDFX2M S1_6_0 ( .A(ab_6__0_), .B(CARRYB_5__0_), .CI(SUMB_5__1_), .CO(
        CARRYB_6__0_), .S(A1_4_) );
  ADDFX2M S1_5_0 ( .A(ab_5__0_), .B(CARRYB_4__0_), .CI(SUMB_4__1_), .CO(
        CARRYB_5__0_), .S(A1_3_) );
  ADDFX2M S1_4_0 ( .A(ab_4__0_), .B(CARRYB_3__0_), .CI(SUMB_3__1_), .CO(
        CARRYB_4__0_), .S(A1_2_) );
  ADDFX2M S1_3_0 ( .A(ab_3__0_), .B(CARRYB_2__0_), .CI(SUMB_2__1_), .CO(
        CARRYB_3__0_), .S(A1_1_) );
  ADDFX2M S1_2_0 ( .A(ab_2__0_), .B(n6), .CI(SUMB_1__1_), .CO(CARRYB_2__0_), 
        .S(A1_0_) );
  ADDFX2M S3_6_6 ( .A(ab_6__6_), .B(CARRYB_5__6_), .CI(ab_5__7_), .CO(
        CARRYB_6__6_), .S(SUMB_6__6_) );
  ADDFX2M S2_6_5 ( .A(ab_6__5_), .B(CARRYB_5__5_), .CI(SUMB_5__6_), .CO(
        CARRYB_6__5_), .S(SUMB_6__5_) );
  ADDFX2M S3_5_6 ( .A(ab_5__6_), .B(CARRYB_4__6_), .CI(ab_4__7_), .CO(
        CARRYB_5__6_), .S(SUMB_5__6_) );
  ADDFX2M S4_0 ( .A(ab_7__0_), .B(CARRYB_6__0_), .CI(SUMB_6__1_), .CO(
        CARRYB_7__0_), .S(SUMB_7__0_) );
  ADDFX2M S4_5 ( .A(ab_7__5_), .B(CARRYB_6__5_), .CI(SUMB_6__6_), .CO(
        CARRYB_7__5_), .S(SUMB_7__5_) );
  ADDFX2M S4_4 ( .A(ab_7__4_), .B(CARRYB_6__4_), .CI(SUMB_6__5_), .CO(
        CARRYB_7__4_), .S(SUMB_7__4_) );
  ADDFX2M S2_6_2 ( .A(ab_6__2_), .B(CARRYB_5__2_), .CI(SUMB_5__3_), .CO(
        CARRYB_6__2_), .S(SUMB_6__2_) );
  ADDFX2M S2_6_1 ( .A(ab_6__1_), .B(CARRYB_5__1_), .CI(SUMB_5__2_), .CO(
        CARRYB_6__1_), .S(SUMB_6__1_) );
  ADDFX2M S2_5_3 ( .A(ab_5__3_), .B(CARRYB_4__3_), .CI(SUMB_4__4_), .CO(
        CARRYB_5__3_), .S(SUMB_5__3_) );
  ADDFX2M S2_5_2 ( .A(ab_5__2_), .B(CARRYB_4__2_), .CI(SUMB_4__3_), .CO(
        CARRYB_5__2_), .S(SUMB_5__2_) );
  ADDFX2M S2_5_1 ( .A(ab_5__1_), .B(CARRYB_4__1_), .CI(SUMB_4__2_), .CO(
        CARRYB_5__1_), .S(SUMB_5__1_) );
  ADDFX2M S2_4_4 ( .A(ab_4__4_), .B(CARRYB_3__4_), .CI(SUMB_3__5_), .CO(
        CARRYB_4__4_), .S(SUMB_4__4_) );
  ADDFX2M S2_4_2 ( .A(ab_4__2_), .B(CARRYB_3__2_), .CI(SUMB_3__3_), .CO(
        CARRYB_4__2_), .S(SUMB_4__2_) );
  ADDFX2M S2_4_1 ( .A(ab_4__1_), .B(CARRYB_3__1_), .CI(SUMB_3__2_), .CO(
        CARRYB_4__1_), .S(SUMB_4__1_) );
  ADDFX2M S2_3_5 ( .A(ab_3__5_), .B(CARRYB_2__5_), .CI(SUMB_2__6_), .CO(
        CARRYB_3__5_), .S(SUMB_3__5_) );
  ADDFX2M S2_3_4 ( .A(ab_3__4_), .B(CARRYB_2__4_), .CI(SUMB_2__5_), .CO(
        CARRYB_3__4_), .S(SUMB_3__4_) );
  ADDFX2M S2_3_2 ( .A(ab_3__2_), .B(CARRYB_2__2_), .CI(SUMB_2__3_), .CO(
        CARRYB_3__2_), .S(SUMB_3__2_) );
  ADDFX2M S2_3_1 ( .A(ab_3__1_), .B(CARRYB_2__1_), .CI(SUMB_2__2_), .CO(
        CARRYB_3__1_), .S(SUMB_3__1_) );
  ADDFX2M S2_2_1 ( .A(ab_2__1_), .B(n5), .CI(SUMB_1__2_), .CO(CARRYB_2__1_), 
        .S(SUMB_2__1_) );
  ADDFX2M S2_6_4 ( .A(ab_6__4_), .B(CARRYB_5__4_), .CI(SUMB_5__5_), .CO(
        CARRYB_6__4_), .S(SUMB_6__4_) );
  ADDFX2M S2_5_5 ( .A(ab_5__5_), .B(CARRYB_4__5_), .CI(SUMB_4__6_), .CO(
        CARRYB_5__5_), .S(SUMB_5__5_) );
  ADDFX2M S2_6_3 ( .A(ab_6__3_), .B(CARRYB_5__3_), .CI(SUMB_5__4_), .CO(
        CARRYB_6__3_), .S(SUMB_6__3_) );
  ADDFX2M S3_4_6 ( .A(ab_4__6_), .B(CARRYB_3__6_), .CI(ab_3__7_), .CO(
        CARRYB_4__6_), .S(SUMB_4__6_) );
  ADDFX2M S2_5_4 ( .A(ab_5__4_), .B(CARRYB_4__4_), .CI(SUMB_4__5_), .CO(
        CARRYB_5__4_), .S(SUMB_5__4_) );
  ADDFX2M S2_4_3 ( .A(ab_4__3_), .B(CARRYB_3__3_), .CI(SUMB_3__4_), .CO(
        CARRYB_4__3_), .S(SUMB_4__3_) );
  ADDFX2M S2_4_5 ( .A(ab_4__5_), .B(CARRYB_3__5_), .CI(SUMB_3__6_), .CO(
        CARRYB_4__5_), .S(SUMB_4__5_) );
  ADDFX2M S2_3_3 ( .A(ab_3__3_), .B(CARRYB_2__3_), .CI(SUMB_2__4_), .CO(
        CARRYB_3__3_), .S(SUMB_3__3_) );
  ADDFX2M S3_3_6 ( .A(ab_3__6_), .B(CARRYB_2__6_), .CI(ab_2__7_), .CO(
        CARRYB_3__6_), .S(SUMB_3__6_) );
  ADDFX2M S3_2_6 ( .A(ab_2__6_), .B(n9), .CI(ab_1__7_), .CO(CARRYB_2__6_), .S(
        SUMB_2__6_) );
  ADDFX2M S2_2_5 ( .A(ab_2__5_), .B(n8), .CI(SUMB_1__6_), .CO(CARRYB_2__5_), 
        .S(SUMB_2__5_) );
  ADDFX2M S2_2_4 ( .A(ab_2__4_), .B(n7), .CI(SUMB_1__5_), .CO(CARRYB_2__4_), 
        .S(SUMB_2__4_) );
  ADDFX2M S2_2_3 ( .A(ab_2__3_), .B(n4), .CI(SUMB_1__4_), .CO(CARRYB_2__3_), 
        .S(SUMB_2__3_) );
  ADDFX2M S4_1 ( .A(ab_7__1_), .B(CARRYB_6__1_), .CI(SUMB_6__2_), .CO(
        CARRYB_7__1_), .S(SUMB_7__1_) );
  ADDFX2M S4_3 ( .A(ab_7__3_), .B(CARRYB_6__3_), .CI(SUMB_6__4_), .CO(
        CARRYB_7__3_), .S(SUMB_7__3_) );
  ADDFX2M S4_2 ( .A(ab_7__2_), .B(CARRYB_6__2_), .CI(SUMB_6__3_), .CO(
        CARRYB_7__2_), .S(SUMB_7__2_) );
  ADDFX2M S2_2_2 ( .A(ab_2__2_), .B(n3), .CI(SUMB_1__3_), .CO(CARRYB_2__2_), 
        .S(SUMB_2__2_) );
  AND2X2M U2 ( .A(ab_0__3_), .B(ab_1__2_), .Y(n3) );
  AND2X2M U3 ( .A(ab_0__4_), .B(ab_1__3_), .Y(n4) );
  AND2X2M U4 ( .A(ab_0__2_), .B(ab_1__1_), .Y(n5) );
  AND2X2M U5 ( .A(ab_0__1_), .B(ab_1__0_), .Y(n6) );
  AND2X2M U6 ( .A(ab_0__5_), .B(ab_1__4_), .Y(n7) );
  AND2X2M U7 ( .A(ab_0__6_), .B(ab_1__5_), .Y(n8) );
  AND2X2M U8 ( .A(ab_0__7_), .B(ab_1__6_), .Y(n9) );
  AND2X2M U9 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(n10) );
  INVX2M U10 ( .A(ab_0__6_), .Y(n22) );
  CLKXOR2X2M U11 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(A1_7_) );
  CLKXOR2X2M U12 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(A1_8_) );
  INVX2M U13 ( .A(ab_0__4_), .Y(n20) );
  INVX2M U14 ( .A(ab_0__5_), .Y(n21) );
  INVX2M U15 ( .A(ab_0__3_), .Y(n19) );
  INVX2M U16 ( .A(ab_0__7_), .Y(n23) );
  AND2X2M U17 ( .A(CARRYB_7__1_), .B(SUMB_7__2_), .Y(n11) );
  AND2X2M U18 ( .A(CARRYB_7__0_), .B(SUMB_7__1_), .Y(n12) );
  CLKXOR2X2M U19 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(A1_10_) );
  CLKXOR2X2M U20 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(A1_11_) );
  INVX2M U21 ( .A(ab_0__2_), .Y(n18) );
  AND2X2M U22 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(n13) );
  AND2X2M U23 ( .A(CARRYB_7__4_), .B(SUMB_7__5_), .Y(n14) );
  CLKXOR2X2M U24 ( .A(CARRYB_7__3_), .B(SUMB_7__4_), .Y(A1_9_) );
  AND2X2M U25 ( .A(CARRYB_7__2_), .B(SUMB_7__3_), .Y(n15) );
  CLKXOR2X2M U26 ( .A(CARRYB_7__6_), .B(ab_7__7_), .Y(A1_12_) );
  INVX2M U27 ( .A(SUMB_7__1_), .Y(n17) );
  AND2X2M U28 ( .A(CARRYB_7__5_), .B(SUMB_7__6_), .Y(n16) );
  CLKXOR2X2M U29 ( .A(ab_1__0_), .B(ab_0__1_), .Y(PRODUCT[1]) );
  XNOR2X2M U30 ( .A(ab_1__3_), .B(n20), .Y(SUMB_1__3_) );
  XNOR2X2M U31 ( .A(ab_1__4_), .B(n21), .Y(SUMB_1__4_) );
  XNOR2X2M U32 ( .A(ab_1__5_), .B(n22), .Y(SUMB_1__5_) );
  XNOR2X2M U33 ( .A(ab_1__6_), .B(n23), .Y(SUMB_1__6_) );
  XNOR2X2M U34 ( .A(ab_1__2_), .B(n19), .Y(SUMB_1__2_) );
  INVX2M U35 ( .A(A[1]), .Y(n38) );
  INVX2M U36 ( .A(A[0]), .Y(n39) );
  INVX2M U37 ( .A(B[6]), .Y(n25) );
  XNOR2X2M U38 ( .A(ab_1__1_), .B(n18), .Y(SUMB_1__1_) );
  INVX2M U39 ( .A(A[3]), .Y(n36) );
  INVX2M U40 ( .A(A[2]), .Y(n37) );
  INVX2M U41 ( .A(A[4]), .Y(n35) );
  XNOR2X2M U42 ( .A(CARRYB_7__0_), .B(n17), .Y(A1_6_) );
  INVX2M U43 ( .A(A[7]), .Y(n32) );
  INVX2M U44 ( .A(A[6]), .Y(n33) );
  INVX2M U45 ( .A(A[5]), .Y(n34) );
  INVX2M U46 ( .A(B[3]), .Y(n28) );
  INVX2M U47 ( .A(B[7]), .Y(n24) );
  INVX2M U48 ( .A(B[4]), .Y(n27) );
  INVX2M U49 ( .A(B[5]), .Y(n26) );
  INVX2M U50 ( .A(B[0]), .Y(n31) );
  INVX2M U51 ( .A(B[2]), .Y(n29) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(ab_7__7_) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(ab_7__6_) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(ab_7__5_) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(ab_7__4_) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(ab_7__3_) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(ab_7__2_) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(ab_7__1_) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(ab_7__0_) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(ab_6__7_) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(ab_6__6_) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(ab_6__5_) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(ab_6__4_) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(ab_6__3_) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(ab_6__2_) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(ab_6__1_) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(ab_6__0_) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(ab_5__7_) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(ab_5__6_) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(ab_5__5_) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(ab_5__4_) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(ab_5__3_) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(ab_5__2_) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(ab_5__1_) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(ab_5__0_) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(ab_4__7_) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(ab_4__6_) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(ab_4__5_) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(ab_4__4_) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(ab_4__3_) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(ab_4__2_) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(ab_4__1_) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(ab_4__0_) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(ab_3__7_) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(ab_3__6_) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(ab_3__5_) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(ab_3__4_) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(ab_3__3_) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(ab_3__2_) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(ab_3__1_) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(ab_3__0_) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(ab_2__7_) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(ab_2__6_) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(ab_2__5_) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(ab_2__4_) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(ab_2__3_) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(ab_2__2_) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(ab_2__1_) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(ab_2__0_) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(ab_1__7_) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(ab_1__6_) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(ab_1__5_) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(ab_1__4_) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(ab_1__3_) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(ab_1__2_) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(ab_1__1_) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(ab_1__0_) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(ab_0__7_) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(ab_0__6_) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(ab_0__5_) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(ab_0__4_) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(ab_0__3_) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(ab_0__2_) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(ab_0__1_) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16 ( A, B, EN, ALU_FUN, CLK, RST, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n31, n32,
         n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44, n45, n46,
         n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60,
         n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74,
         n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88,
         n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101,
         n102, n103, n104, n105, n106, n107, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4, SYNOPSYS_UNCONNECTED_5,
         SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7,
         SYNOPSYS_UNCONNECTED_8;
  wire   [15:0] ALU_OUT_Comb;

  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, 
        N129, N128, N127, N126, N125}), .remainder({SYNOPSYS_UNCONNECTED_1, 
        SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, SYNOPSYS_UNCONNECTED_4, 
        SYNOPSYS_UNCONNECTED_5, SYNOPSYS_UNCONNECTED_6, SYNOPSYS_UNCONNECTED_7, 
        SYNOPSYS_UNCONNECTED_8}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n12, n11, n10, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, 
        N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n12, n11, n10, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, 
        N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n12, n11, n10, n9, n8, 
        n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109}) );
  DFFRQX2M ALU_OUT_reg_15_ ( .D(ALU_OUT_Comb[15]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[15]) );
  DFFRQX2M ALU_OUT_reg_14_ ( .D(ALU_OUT_Comb[14]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[14]) );
  DFFRQX2M ALU_OUT_reg_13_ ( .D(ALU_OUT_Comb[13]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[13]) );
  DFFRQX2M ALU_OUT_reg_12_ ( .D(ALU_OUT_Comb[12]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[12]) );
  DFFRQX2M ALU_OUT_reg_11_ ( .D(ALU_OUT_Comb[11]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[11]) );
  DFFRQX2M ALU_OUT_reg_10_ ( .D(ALU_OUT_Comb[10]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[10]) );
  DFFRQX2M ALU_OUT_reg_9_ ( .D(ALU_OUT_Comb[9]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[9]) );
  DFFRQX2M ALU_OUT_reg_8_ ( .D(ALU_OUT_Comb[8]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[8]) );
  DFFRQX2M ALU_OUT_reg_7_ ( .D(ALU_OUT_Comb[7]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[7]) );
  DFFRQX2M ALU_OUT_reg_6_ ( .D(ALU_OUT_Comb[6]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[6]) );
  DFFRQX2M ALU_OUT_reg_5_ ( .D(ALU_OUT_Comb[5]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[5]) );
  DFFRQX2M ALU_OUT_reg_4_ ( .D(ALU_OUT_Comb[4]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[4]) );
  DFFRQX2M ALU_OUT_reg_3_ ( .D(ALU_OUT_Comb[3]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[3]) );
  DFFRQX2M ALU_OUT_reg_2_ ( .D(ALU_OUT_Comb[2]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[2]) );
  DFFRQX2M ALU_OUT_reg_1_ ( .D(ALU_OUT_Comb[1]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[1]) );
  DFFRQX2M ALU_OUT_reg_0_ ( .D(ALU_OUT_Comb[0]), .CK(CLK), .RN(RST), .Q(
        ALU_OUT[0]) );
  DFFRQX2M OUT_VALID_reg ( .D(EN), .CK(CLK), .RN(RST), .Q(OUT_VALID) );
  BUFX2M U3 ( .A(A[6]), .Y(n11) );
  OAI2BB1X2M U4 ( .A0N(N124), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[15]) );
  OAI2BB1X2M U7 ( .A0N(N123), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U8 ( .A0N(N121), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U9 ( .A0N(N122), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U10 ( .A0N(N118), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U11 ( .A0N(N119), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U12 ( .A0N(N120), .A1N(n31), .B0(n32), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U13 ( .A0N(n129), .A1N(n105), .B0(n101), .Y(n47) );
  OAI2BB1X2M U14 ( .A0N(n100), .A1N(n99), .B0(n101), .Y(n48) );
  AND2X2M U15 ( .A(n99), .B(n105), .Y(n42) );
  NOR2BX2M U16 ( .AN(n35), .B(n124), .Y(n31) );
  BUFX2M U17 ( .A(n41), .Y(n13) );
  NOR2X2M U18 ( .A(n107), .B(n126), .Y(n41) );
  AND2X2M U19 ( .A(n106), .B(n105), .Y(n50) );
  INVX2M U20 ( .A(n100), .Y(n126) );
  INVX2M U21 ( .A(n107), .Y(n129) );
  NOR2BX2M U22 ( .AN(n106), .B(n126), .Y(n37) );
  INVX2M U23 ( .A(EN), .Y(n124) );
  INVX2M U24 ( .A(n91), .Y(n127) );
  NOR3BX2M U25 ( .AN(n105), .B(n128), .C(ALU_FUN[2]), .Y(n49) );
  NOR3X2M U26 ( .A(n126), .B(ALU_FUN[2]), .C(n128), .Y(n35) );
  NOR2X2M U27 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n106) );
  AND3X2M U28 ( .A(n106), .B(n125), .C(n3), .Y(n46) );
  NAND2X2M U29 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n107) );
  INVX2M U30 ( .A(ALU_FUN[0]), .Y(n125) );
  NOR2X2M U31 ( .A(n125), .B(n3), .Y(n105) );
  NOR2X2M U32 ( .A(n3), .B(ALU_FUN[0]), .Y(n100) );
  INVX2M U33 ( .A(ALU_FUN[1]), .Y(n128) );
  NAND2X2M U34 ( .A(EN), .B(n123), .Y(n32) );
  NAND3X2M U35 ( .A(n106), .B(ALU_FUN[0]), .C(n3), .Y(n101) );
  AND2X2M U36 ( .A(ALU_FUN[2]), .B(n128), .Y(n99) );
  AND4X2M U37 ( .A(N159), .B(n99), .C(n3), .D(n125), .Y(n90) );
  NAND3X2M U38 ( .A(n129), .B(n125), .C(n3), .Y(n36) );
  NAND3X2M U39 ( .A(n3), .B(ALU_FUN[0]), .C(n99), .Y(n91) );
  AOI31X2M U40 ( .A0(n93), .A1(n94), .A2(n95), .B0(n124), .Y(ALU_OUT_Comb[0])
         );
  AOI22X1M U41 ( .A0(N100), .A1(n50), .B0(N91), .B1(n37), .Y(n93) );
  AOI211X2M U42 ( .A0(n13), .A1(n140), .B0(n96), .C0(n97), .Y(n95) );
  AOI222X1M U43 ( .A0(N109), .A1(n35), .B0(n5), .B1(n42), .C0(N125), .C1(n49), 
        .Y(n94) );
  AOI31X2M U44 ( .A0(n81), .A1(n82), .A2(n83), .B0(n124), .Y(ALU_OUT_Comb[1])
         );
  AOI222X1M U45 ( .A0(N92), .A1(n37), .B0(N110), .B1(n35), .C0(N101), .C1(n50), 
        .Y(n81) );
  AOI211X2M U46 ( .A0(n7), .A1(n127), .B0(n84), .C0(n85), .Y(n83) );
  AOI222X1M U47 ( .A0(N126), .A1(n49), .B0(n13), .B1(n139), .C0(n6), .C1(n42), 
        .Y(n82) );
  AOI31X2M U48 ( .A0(n75), .A1(n76), .A2(n77), .B0(n124), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U49 ( .A0(N102), .A1(n50), .B0(N93), .B1(n37), .Y(n75) );
  AOI221XLM U50 ( .A0(n8), .A1(n127), .B0(n13), .B1(n138), .C0(n78), .Y(n77)
         );
  AOI222X1M U51 ( .A0(N111), .A1(n35), .B0(n7), .B1(n42), .C0(N127), .C1(n49), 
        .Y(n76) );
  AOI31X2M U52 ( .A0(n69), .A1(n70), .A2(n71), .B0(n124), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U53 ( .A0(N103), .A1(n50), .B0(N94), .B1(n37), .Y(n69) );
  AOI221XLM U54 ( .A0(n9), .A1(n127), .B0(n13), .B1(n137), .C0(n72), .Y(n71)
         );
  AOI222X1M U55 ( .A0(N112), .A1(n35), .B0(n8), .B1(n42), .C0(N128), .C1(n49), 
        .Y(n70) );
  AOI31X2M U56 ( .A0(n63), .A1(n64), .A2(n65), .B0(n124), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U57 ( .A0(N104), .A1(n50), .B0(N95), .B1(n37), .Y(n63) );
  AOI221XLM U58 ( .A0(n127), .A1(n10), .B0(n13), .B1(n136), .C0(n66), .Y(n65)
         );
  AOI222X1M U59 ( .A0(N113), .A1(n35), .B0(n9), .B1(n42), .C0(N129), .C1(n49), 
        .Y(n64) );
  AOI31X2M U60 ( .A0(n57), .A1(n58), .A2(n59), .B0(n124), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U61 ( .A0(N105), .A1(n50), .B0(N96), .B1(n37), .Y(n57) );
  AOI221XLM U62 ( .A0(n127), .A1(n11), .B0(n13), .B1(n135), .C0(n60), .Y(n59)
         );
  AOI222X1M U63 ( .A0(N114), .A1(n35), .B0(n10), .B1(n42), .C0(N130), .C1(n49), 
        .Y(n58) );
  AOI31X2M U64 ( .A0(n38), .A1(n39), .A2(n40), .B0(n124), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U65 ( .A0(N107), .A1(n50), .B0(N98), .B1(n37), .Y(n38) );
  AOI221XLM U66 ( .A0(n13), .A1(n133), .B0(n42), .B1(n12), .C0(n43), .Y(n40)
         );
  AOI22X1M U67 ( .A0(N132), .A1(n49), .B0(N116), .B1(n35), .Y(n39) );
  AOI21X2M U68 ( .A0(n33), .A1(n34), .B0(n124), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U69 ( .A0(N99), .A1(n37), .B0(n123), .Y(n33) );
  AOI2BB2XLM U70 ( .B0(N117), .B1(n35), .A0N(n133), .A1N(n36), .Y(n34) );
  AOI31X2M U71 ( .A0(n51), .A1(n52), .A2(n53), .B0(n124), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U72 ( .A0(N106), .A1(n50), .B0(N97), .B1(n37), .Y(n51) );
  AOI221XLM U73 ( .A0(n127), .A1(n12), .B0(n13), .B1(n134), .C0(n54), .Y(n53)
         );
  AOI222X1M U74 ( .A0(N115), .A1(n35), .B0(n42), .B1(n11), .C0(N131), .C1(n49), 
        .Y(n52) );
  OAI222X1M U75 ( .A0(n55), .A1(n122), .B0(n4), .B1(n56), .C0(n36), .C1(n135), 
        .Y(n54) );
  AOI221XLM U76 ( .A0(n11), .A1(n46), .B0(n47), .B1(n134), .C0(n13), .Y(n56)
         );
  AOI221XLM U77 ( .A0(n46), .A1(n134), .B0(n11), .B1(n48), .C0(n42), .Y(n55)
         );
  INVX2M U78 ( .A(n25), .Y(n120) );
  INVX2M U79 ( .A(n92), .Y(n123) );
  AOI211X2M U80 ( .A0(N108), .A1(n50), .B0(n13), .C0(n47), .Y(n92) );
  INVX2M U81 ( .A(n116), .Y(N158) );
  INVX2M U82 ( .A(n4), .Y(n122) );
  BUFX2M U83 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U84 ( .A(n6), .Y(n139) );
  INVX2M U85 ( .A(n5), .Y(n140) );
  INVX2M U86 ( .A(n11), .Y(n134) );
  INVX2M U87 ( .A(n12), .Y(n133) );
  INVX2M U88 ( .A(n8), .Y(n137) );
  INVX2M U89 ( .A(n7), .Y(n138) );
  INVX2M U90 ( .A(n10), .Y(n135) );
  INVX2M U91 ( .A(n9), .Y(n136) );
  BUFX2M U92 ( .A(B[6]), .Y(n4) );
  BUFX2M U93 ( .A(A[7]), .Y(n12) );
  BUFX2M U94 ( .A(A[5]), .Y(n10) );
  BUFX2M U95 ( .A(A[4]), .Y(n9) );
  BUFX2M U96 ( .A(A[3]), .Y(n8) );
  BUFX2M U97 ( .A(A[2]), .Y(n7) );
  BUFX2M U98 ( .A(A[1]), .Y(n6) );
  BUFX2M U99 ( .A(A[0]), .Y(n5) );
  OAI2B2X1M U100 ( .A1N(B[1]), .A0(n86), .B0(n36), .B1(n140), .Y(n85) );
  AOI221XLM U101 ( .A0(n46), .A1(n139), .B0(n6), .B1(n48), .C0(n42), .Y(n86)
         );
  OAI222X1M U102 ( .A0(n79), .A1(n119), .B0(B[2]), .B1(n80), .C0(n36), .C1(
        n139), .Y(n78) );
  AOI221XLM U103 ( .A0(n7), .A1(n46), .B0(n47), .B1(n138), .C0(n13), .Y(n80)
         );
  AOI221XLM U104 ( .A0(n46), .A1(n138), .B0(n7), .B1(n48), .C0(n42), .Y(n79)
         );
  OAI222X1M U105 ( .A0(n73), .A1(n121), .B0(B[3]), .B1(n74), .C0(n36), .C1(
        n138), .Y(n72) );
  AOI221XLM U106 ( .A0(n8), .A1(n46), .B0(n47), .B1(n137), .C0(n13), .Y(n74)
         );
  AOI221XLM U107 ( .A0(n46), .A1(n137), .B0(n8), .B1(n48), .C0(n42), .Y(n73)
         );
  OAI222X1M U108 ( .A0(n67), .A1(n132), .B0(B[4]), .B1(n68), .C0(n36), .C1(
        n137), .Y(n66) );
  INVX2M U109 ( .A(B[4]), .Y(n132) );
  AOI221XLM U110 ( .A0(n9), .A1(n46), .B0(n47), .B1(n136), .C0(n13), .Y(n68)
         );
  AOI221XLM U111 ( .A0(n46), .A1(n136), .B0(n9), .B1(n48), .C0(n42), .Y(n67)
         );
  OAI222X1M U112 ( .A0(n61), .A1(n131), .B0(B[5]), .B1(n62), .C0(n36), .C1(
        n136), .Y(n60) );
  INVX2M U113 ( .A(B[5]), .Y(n131) );
  AOI221XLM U114 ( .A0(n10), .A1(n46), .B0(n47), .B1(n135), .C0(n13), .Y(n62)
         );
  AOI221XLM U115 ( .A0(n46), .A1(n135), .B0(n10), .B1(n48), .C0(n42), .Y(n61)
         );
  OAI222X1M U116 ( .A0(n44), .A1(n130), .B0(B[7]), .B1(n45), .C0(n36), .C1(
        n134), .Y(n43) );
  INVX2M U117 ( .A(B[7]), .Y(n130) );
  AOI221XLM U118 ( .A0(n46), .A1(n12), .B0(n47), .B1(n133), .C0(n13), .Y(n45)
         );
  AOI221XLM U119 ( .A0(n46), .A1(n133), .B0(n12), .B1(n48), .C0(n42), .Y(n44)
         );
  OAI21X2M U120 ( .A0(B[0]), .A1(n102), .B0(n103), .Y(n96) );
  AOI221XLM U121 ( .A0(n5), .A1(n46), .B0(n47), .B1(n140), .C0(n13), .Y(n102)
         );
  AOI31X2M U122 ( .A0(N157), .A1(n3), .A2(n104), .B0(n90), .Y(n103) );
  NOR3X2M U123 ( .A(n128), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n104) );
  OAI2B2X1M U124 ( .A1N(B[0]), .A0(n98), .B0(n91), .B1(n139), .Y(n97) );
  AOI221XLM U125 ( .A0(n46), .A1(n140), .B0(n5), .B1(n48), .C0(n42), .Y(n98)
         );
  INVX2M U126 ( .A(n14), .Y(n118) );
  OAI21X2M U127 ( .A0(B[1]), .A1(n87), .B0(n88), .Y(n84) );
  AOI221XLM U128 ( .A0(n6), .A1(n46), .B0(n47), .B1(n139), .C0(n13), .Y(n87)
         );
  AOI31X2M U129 ( .A0(N158), .A1(n3), .A2(n89), .B0(n90), .Y(n88) );
  NOR3X2M U130 ( .A(n125), .B(ALU_FUN[2]), .C(n128), .Y(n89) );
  INVX2M U131 ( .A(B[0]), .Y(n117) );
  INVX2M U132 ( .A(B[2]), .Y(n119) );
  INVX2M U133 ( .A(B[3]), .Y(n121) );
  NOR2X1M U134 ( .A(n133), .B(B[7]), .Y(n113) );
  NAND2BX1M U135 ( .AN(B[4]), .B(n9), .Y(n29) );
  NAND2BX1M U136 ( .AN(n9), .B(B[4]), .Y(n18) );
  CLKNAND2X2M U137 ( .A(n29), .B(n18), .Y(n108) );
  NOR2X1M U138 ( .A(n121), .B(n8), .Y(n26) );
  NOR2X1M U139 ( .A(n119), .B(n7), .Y(n17) );
  NOR2X1M U140 ( .A(n117), .B(n5), .Y(n14) );
  CLKNAND2X2M U141 ( .A(n7), .B(n119), .Y(n28) );
  NAND2BX1M U142 ( .AN(n17), .B(n28), .Y(n23) );
  AOI21X1M U143 ( .A0(n14), .A1(n139), .B0(B[1]), .Y(n15) );
  AOI211X1M U144 ( .A0(n6), .A1(n118), .B0(n23), .C0(n15), .Y(n16) );
  CLKNAND2X2M U145 ( .A(n8), .B(n121), .Y(n27) );
  OAI31X1M U146 ( .A0(n26), .A1(n17), .A2(n16), .B0(n27), .Y(n19) );
  NAND2BX1M U147 ( .AN(n10), .B(B[5]), .Y(n111) );
  OAI211X1M U148 ( .A0(n108), .A1(n19), .B0(n18), .C0(n111), .Y(n20) );
  NAND2BX1M U149 ( .AN(B[5]), .B(n10), .Y(n30) );
  XNOR2X1M U150 ( .A(n11), .B(n4), .Y(n110) );
  AOI32X1M U151 ( .A0(n20), .A1(n30), .A2(n110), .B0(n4), .B1(n134), .Y(n21)
         );
  CLKNAND2X2M U152 ( .A(B[7]), .B(n133), .Y(n114) );
  OAI21X1M U153 ( .A0(n113), .A1(n21), .B0(n114), .Y(N159) );
  CLKNAND2X2M U154 ( .A(n5), .B(n117), .Y(n24) );
  OA21X1M U155 ( .A0(n24), .A1(n139), .B0(B[1]), .Y(n22) );
  AOI211X1M U156 ( .A0(n24), .A1(n139), .B0(n23), .C0(n22), .Y(n25) );
  AOI31X1M U157 ( .A0(n120), .A1(n28), .A2(n27), .B0(n26), .Y(n109) );
  OAI2B11X1M U158 ( .A1N(n109), .A0(n108), .B0(n30), .C0(n29), .Y(n112) );
  AOI32X1M U159 ( .A0(n112), .A1(n111), .A2(n110), .B0(n11), .B1(n122), .Y(
        n115) );
  AOI2B1X1M U160 ( .A1N(n115), .A0(n114), .B0(n113), .Y(n116) );
  NOR2X1M U161 ( .A(N159), .B(N158), .Y(N157) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4 ( CLK, RST, ALU_OUT, OUT_Valid, RdData, 
        RdData_Valid, RX_P_Data, RX_D_VLD, FIFO_FULL, ALU_FUN, EN, CLK_EN, 
        Address, WrEN, RdEn, WrData, TX_P_Data, TX_D_VLD, clk_div_en );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_Data;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_Data;
  input CLK, RST, OUT_Valid, RdData_Valid, RX_D_VLD, FIFO_FULL;
  output EN, CLK_EN, WrEN, RdEn, TX_D_VLD, clk_div_en;
  wire   n1, n19, n20, n21, n23, n24, n27, n36, n37, n48, n54, n55, n57, n58,
         n64, n66, n67, n69, n70, n71, n74, n75, n76, n77, n78, n80, n81, n82,
         n83, n85, n86, n87, n88, n90, n91, n92, n94, n96, n97, n98, n99, n100,
         n102, n103, n104, n105, n107, n108, n109, n110, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n26, n28,
         n29, n30, n31, n32, n33, n34, n35, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n49, n50, n51, n52, n53, n56, n59, n60, n61, n62, n63,
         n65, n68, n72, n73, n79, n84, n89, n93, n95, n101, n106, n111, n112,
         n129, n130, n131, n132, n133, n134, n135, n136, n137, n199, n200,
         n201, n202, n203;
  wire   [4:0] state;
  wire   [7:0] data_reg;
  wire   [7:0] alu_a_reg;
  wire   [7:0] alu_b_reg;
  wire   [15:0] alu_res_reg;
  wire   [7:0] rd_data_reg;
  assign clk_div_en = 1'b1;

  DFFRQX2M alu_res_reg_reg_0_ ( .D(n161), .CK(CLK), .RN(n5), .Q(alu_res_reg[0]) );
  DFFRQX2M alu_res_reg_reg_7_ ( .D(n152), .CK(CLK), .RN(n5), .Q(alu_res_reg[7]) );
  DFFRQX2M alu_res_reg_reg_6_ ( .D(n151), .CK(CLK), .RN(n5), .Q(alu_res_reg[6]) );
  DFFRQX2M alu_res_reg_reg_5_ ( .D(n150), .CK(CLK), .RN(n5), .Q(alu_res_reg[5]) );
  DFFRQX2M alu_res_reg_reg_4_ ( .D(n149), .CK(CLK), .RN(n5), .Q(alu_res_reg[4]) );
  DFFRQX2M alu_res_reg_reg_3_ ( .D(n148), .CK(CLK), .RN(n5), .Q(alu_res_reg[3]) );
  DFFRQX2M alu_res_reg_reg_2_ ( .D(n147), .CK(CLK), .RN(n5), .Q(alu_res_reg[2]) );
  DFFRQX2M alu_res_reg_reg_1_ ( .D(n146), .CK(CLK), .RN(n5), .Q(alu_res_reg[1]) );
  DFFRQX2M rd_data_reg_reg_0_ ( .D(n169), .CK(CLK), .RN(n6), .Q(rd_data_reg[0]) );
  DFFRQX2M rd_data_reg_reg_7_ ( .D(n168), .CK(CLK), .RN(n6), .Q(rd_data_reg[7]) );
  DFFRQX2M rd_data_reg_reg_6_ ( .D(n167), .CK(CLK), .RN(n6), .Q(rd_data_reg[6]) );
  DFFRQX2M rd_data_reg_reg_5_ ( .D(n166), .CK(CLK), .RN(n6), .Q(rd_data_reg[5]) );
  DFFRQX2M rd_data_reg_reg_4_ ( .D(n165), .CK(CLK), .RN(n6), .Q(rd_data_reg[4]) );
  DFFRQX2M rd_data_reg_reg_3_ ( .D(n164), .CK(CLK), .RN(n6), .Q(rd_data_reg[3]) );
  DFFRQX2M rd_data_reg_reg_2_ ( .D(n163), .CK(CLK), .RN(n6), .Q(rd_data_reg[2]) );
  DFFRQX2M rd_data_reg_reg_1_ ( .D(n162), .CK(CLK), .RN(n6), .Q(rd_data_reg[1]) );
  DFFRQX2M alu_res_reg_reg_15_ ( .D(n160), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[15]) );
  DFFRQX2M alu_res_reg_reg_14_ ( .D(n159), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[14]) );
  DFFRQX2M alu_res_reg_reg_13_ ( .D(n158), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[13]) );
  DFFRQX2M alu_res_reg_reg_12_ ( .D(n157), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[12]) );
  DFFRQX2M alu_res_reg_reg_11_ ( .D(n156), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[11]) );
  DFFRQX2M alu_res_reg_reg_10_ ( .D(n155), .CK(CLK), .RN(n5), .Q(
        alu_res_reg[10]) );
  DFFRQX2M alu_res_reg_reg_9_ ( .D(n154), .CK(CLK), .RN(n5), .Q(alu_res_reg[9]) );
  DFFRQX2M alu_res_reg_reg_8_ ( .D(n153), .CK(CLK), .RN(n5), .Q(alu_res_reg[8]) );
  DFFRQX2M alu_b_reg_reg_0_ ( .D(n185), .CK(CLK), .RN(n7), .Q(alu_b_reg[0]) );
  DFFRQX2M alu_b_reg_reg_7_ ( .D(n184), .CK(CLK), .RN(n7), .Q(alu_b_reg[7]) );
  DFFRQX2M alu_b_reg_reg_6_ ( .D(n183), .CK(CLK), .RN(n7), .Q(alu_b_reg[6]) );
  DFFRQX2M alu_b_reg_reg_5_ ( .D(n182), .CK(CLK), .RN(n7), .Q(alu_b_reg[5]) );
  DFFRQX2M alu_b_reg_reg_4_ ( .D(n181), .CK(CLK), .RN(n7), .Q(alu_b_reg[4]) );
  DFFRQX2M alu_b_reg_reg_3_ ( .D(n180), .CK(CLK), .RN(n7), .Q(alu_b_reg[3]) );
  DFFRQX2M alu_b_reg_reg_2_ ( .D(n179), .CK(CLK), .RN(n6), .Q(alu_b_reg[2]) );
  DFFRQX2M alu_b_reg_reg_1_ ( .D(n178), .CK(CLK), .RN(n6), .Q(alu_b_reg[1]) );
  DFFRQX2M alu_a_reg_reg_0_ ( .D(n177), .CK(CLK), .RN(n6), .Q(alu_a_reg[0]) );
  DFFRQX2M alu_a_reg_reg_7_ ( .D(n176), .CK(CLK), .RN(n6), .Q(alu_a_reg[7]) );
  DFFRQX2M alu_a_reg_reg_6_ ( .D(n175), .CK(CLK), .RN(n6), .Q(alu_a_reg[6]) );
  DFFRQX2M alu_a_reg_reg_5_ ( .D(n174), .CK(CLK), .RN(n6), .Q(alu_a_reg[5]) );
  DFFRQX2M alu_a_reg_reg_4_ ( .D(n173), .CK(CLK), .RN(n6), .Q(alu_a_reg[4]) );
  DFFRQX2M alu_a_reg_reg_3_ ( .D(n172), .CK(CLK), .RN(n6), .Q(alu_a_reg[3]) );
  DFFRQX2M alu_a_reg_reg_2_ ( .D(n171), .CK(CLK), .RN(n6), .Q(alu_a_reg[2]) );
  DFFRQX2M alu_a_reg_reg_1_ ( .D(n170), .CK(CLK), .RN(n6), .Q(alu_a_reg[1]) );
  DFFRQX2M data_reg_reg_7_ ( .D(n145), .CK(CLK), .RN(n5), .Q(data_reg[7]) );
  DFFRQX2M data_reg_reg_6_ ( .D(n144), .CK(CLK), .RN(n5), .Q(data_reg[6]) );
  DFFRQX2M data_reg_reg_5_ ( .D(n143), .CK(CLK), .RN(n4), .Q(data_reg[5]) );
  DFFRQX2M data_reg_reg_4_ ( .D(n142), .CK(CLK), .RN(n4), .Q(data_reg[4]) );
  DFFRQX2M data_reg_reg_3_ ( .D(n141), .CK(CLK), .RN(n4), .Q(data_reg[3]) );
  DFFRQX2M data_reg_reg_2_ ( .D(n140), .CK(CLK), .RN(n4), .Q(data_reg[2]) );
  DFFRQX2M data_reg_reg_1_ ( .D(n139), .CK(CLK), .RN(n4), .Q(data_reg[1]) );
  DFFRQX2M data_reg_reg_0_ ( .D(n138), .CK(CLK), .RN(n4), .Q(data_reg[0]) );
  DFFRX1M alu_fun_reg_reg_1_ ( .D(n190), .CK(CLK), .RN(n4), .QN(n45) );
  DFFRX1M alu_fun_reg_reg_2_ ( .D(n191), .CK(CLK), .RN(n4), .QN(n46) );
  DFFRX1M alu_fun_reg_reg_3_ ( .D(n192), .CK(CLK), .RN(n4), .QN(n47) );
  DFFRX1M alu_fun_reg_reg_0_ ( .D(n193), .CK(CLK), .RN(n4), .QN(n49) );
  DFFRX1M addr_reg_reg_3_ ( .D(n189), .CK(CLK), .RN(n4), .QN(n130) );
  DFFRX1M addr_reg_reg_2_ ( .D(n188), .CK(CLK), .RN(n4), .QN(n131) );
  DFFRX1M addr_reg_reg_1_ ( .D(n187), .CK(CLK), .RN(n4), .QN(n132) );
  DFFRX1M addr_reg_reg_0_ ( .D(n186), .CK(CLK), .RN(n4), .QN(n133) );
  DFFRQX2M state_reg_2_ ( .D(n196), .CK(CLK), .RN(n7), .Q(state[2]) );
  DFFRQX2M state_reg_0_ ( .D(n198), .CK(CLK), .RN(n7), .Q(state[0]) );
  DFFRQX2M state_reg_1_ ( .D(n197), .CK(CLK), .RN(n7), .Q(state[1]) );
  DFFRQX2M state_reg_3_ ( .D(n195), .CK(CLK), .RN(n7), .Q(state[3]) );
  DFFRQX2M state_reg_4_ ( .D(n194), .CK(CLK), .RN(n7), .Q(state[4]) );
  NOR2X2M U3 ( .A(n125), .B(n46), .Y(ALU_FUN[2]) );
  NOR2X2M U4 ( .A(n125), .B(n49), .Y(ALU_FUN[0]) );
  NOR2X2M U5 ( .A(n126), .B(n131), .Y(Address[2]) );
  NOR3X2M U6 ( .A(state[2]), .B(state[4]), .C(n40), .Y(n20) );
  NOR3X2M U7 ( .A(n40), .B(state[4]), .C(n44), .Y(n108) );
  OAI221X1M U8 ( .A0(RX_D_VLD), .A1(n104), .B0(RdData_Valid), .B1(n96), .C0(
        n105), .Y(n67) );
  NOR3X2M U9 ( .A(state[2]), .B(state[4]), .C(state[1]), .Y(n109) );
  BUFX2M U10 ( .A(FIFO_FULL), .Y(n12) );
  OAI21X2M U11 ( .A0(n64), .A1(n28), .B0(RX_D_VLD), .Y(n58) );
  OAI21X2M U12 ( .A0(n54), .A1(n55), .B0(RX_D_VLD), .Y(n48) );
  INVX2M U13 ( .A(n125), .Y(CLK_EN) );
  NOR2X2M U14 ( .A(n31), .B(EN), .Y(n125) );
  NOR2X2M U15 ( .A(n18), .B(n41), .Y(RdEn) );
  NOR2BX2M U16 ( .AN(n113), .B(RdEn), .Y(n126) );
  INVX2M U17 ( .A(n88), .Y(EN) );
  NOR2X2M U18 ( .A(n41), .B(n35), .Y(n55) );
  INVX2M U19 ( .A(n96), .Y(n38) );
  INVX2M U20 ( .A(n75), .Y(n16) );
  INVX2M U21 ( .A(n78), .Y(n30) );
  INVX2M U22 ( .A(n70), .Y(n28) );
  BUFX2M U23 ( .A(n2), .Y(n5) );
  BUFX2M U24 ( .A(n3), .Y(n6) );
  BUFX2M U25 ( .A(n2), .Y(n4) );
  BUFX2M U26 ( .A(n3), .Y(n7) );
  AOI32X1M U27 ( .A0(n43), .A1(n40), .A2(n19), .B0(n110), .B1(n127), .Y(n88)
         );
  INVX2M U28 ( .A(n124), .Y(n43) );
  NOR3BX2M U29 ( .AN(n36), .B(n55), .C(n92), .Y(n100) );
  OAI21X2M U30 ( .A0(n126), .A1(n133), .B0(n87), .Y(Address[0]) );
  NOR3X2M U31 ( .A(n116), .B(n8), .C(n9), .Y(n107) );
  NOR2BX2M U32 ( .AN(n108), .B(n18), .Y(n116) );
  NOR2X2M U33 ( .A(n126), .B(n132), .Y(Address[1]) );
  NOR2X2M U34 ( .A(n32), .B(n42), .Y(n110) );
  OAI221X1M U35 ( .A0(n71), .A1(n67), .B0(n13), .B1(n42), .C0(n36), .Y(n195)
         );
  NOR4X1M U36 ( .A(n30), .B(n64), .C(n74), .D(n75), .Y(n71) );
  NOR4BX1M U37 ( .AN(n76), .B(n77), .C(n201), .D(n136), .Y(n74) );
  NAND4X2M U38 ( .A(n203), .B(n202), .C(n199), .D(n137), .Y(n77) );
  NOR2X2M U39 ( .A(n125), .B(n45), .Y(ALU_FUN[1]) );
  OAI22X1M U40 ( .A0(n13), .A1(n32), .B0(n97), .B1(n67), .Y(n198) );
  NOR4BX1M U41 ( .AN(n87), .B(n98), .C(n31), .D(n38), .Y(n97) );
  NAND2X2M U42 ( .A(n99), .B(n100), .Y(n98) );
  AOI31X2M U43 ( .A0(n33), .A1(n203), .A2(n102), .B0(n34), .Y(n99) );
  INVX2M U44 ( .A(n67), .Y(n13) );
  NAND2X2M U45 ( .A(n128), .B(n20), .Y(n113) );
  AO21XLM U46 ( .A0(n20), .A1(n19), .B0(n64), .Y(n92) );
  NOR2X2M U47 ( .A(n12), .B(n107), .Y(TX_D_VLD) );
  INVX2M U48 ( .A(n127), .Y(n41) );
  INVX2M U49 ( .A(n128), .Y(n18) );
  INVX2M U50 ( .A(n23), .Y(n31) );
  INVX2M U51 ( .A(n19), .Y(n35) );
  NOR2X2M U52 ( .A(n125), .B(n47), .Y(ALU_FUN[3]) );
  BUFX2M U53 ( .A(n115), .Y(n8) );
  NOR3X2M U54 ( .A(n35), .B(n40), .C(n124), .Y(n115) );
  OAI222X1M U55 ( .A0(n50), .A1(n87), .B0(n62), .B1(n86), .C0(n129), .C1(n113), 
        .Y(WrData[0]) );
  OAI222X1M U56 ( .A0(n53), .A1(n87), .B0(n68), .B1(n86), .C0(n95), .C1(n113), 
        .Y(WrData[5]) );
  OAI222X1M U57 ( .A0(n51), .A1(n87), .B0(n63), .B1(n86), .C0(n89), .C1(n113), 
        .Y(WrData[7]) );
  OAI222X1M U58 ( .A0(n61), .A1(n87), .B0(n84), .B1(n86), .C0(n112), .C1(n113), 
        .Y(WrData[1]) );
  OAI222X1M U59 ( .A0(n60), .A1(n87), .B0(n79), .B1(n86), .C0(n111), .C1(n113), 
        .Y(WrData[2]) );
  OAI222X1M U60 ( .A0(n59), .A1(n87), .B0(n73), .B1(n86), .C0(n106), .C1(n113), 
        .Y(WrData[3]) );
  OAI222X1M U61 ( .A0(n56), .A1(n87), .B0(n72), .B1(n86), .C0(n101), .C1(n113), 
        .Y(WrData[4]) );
  OAI222X1M U62 ( .A0(n52), .A1(n87), .B0(n65), .B1(n86), .C0(n93), .C1(n113), 
        .Y(WrData[6]) );
  NOR2X2M U63 ( .A(n126), .B(n130), .Y(Address[3]) );
  NAND4X2M U64 ( .A(n85), .B(n86), .C(n87), .D(n88), .Y(n75) );
  NOR2X2M U65 ( .A(n134), .B(n23), .Y(n11) );
  NOR2X2M U66 ( .A(n134), .B(n23), .Y(n21) );
  NAND2X2M U67 ( .A(n109), .B(n42), .Y(n57) );
  OAI22X1M U68 ( .A0(n203), .A1(n58), .B0(n26), .B1(n49), .Y(n193) );
  OAI22X1M U69 ( .A0(n200), .A1(n58), .B0(n26), .B1(n47), .Y(n192) );
  OAI22X1M U70 ( .A0(n201), .A1(n58), .B0(n26), .B1(n46), .Y(n191) );
  OAI22X1M U71 ( .A0(n202), .A1(n58), .B0(n26), .B1(n45), .Y(n190) );
  NAND2X2M U72 ( .A(n110), .B(n20), .Y(n86) );
  NAND2X2M U73 ( .A(n108), .B(n19), .Y(n96) );
  NAND2X2M U74 ( .A(n108), .B(n110), .Y(n70) );
  NAND2X2M U75 ( .A(n110), .B(n109), .Y(n78) );
  INVX2M U76 ( .A(n58), .Y(n26) );
  INVX2M U77 ( .A(n85), .Y(n34) );
  NAND3X2M U78 ( .A(n86), .B(n87), .C(n113), .Y(WrEN) );
  INVX2M U79 ( .A(n83), .Y(n33) );
  OAI22X1M U80 ( .A0(n1), .A1(n203), .B0(n39), .B1(n129), .Y(n138) );
  OAI22X1M U81 ( .A0(n1), .A1(n202), .B0(n39), .B1(n112), .Y(n139) );
  OAI22X1M U82 ( .A0(n1), .A1(n201), .B0(n39), .B1(n111), .Y(n140) );
  OAI22X1M U83 ( .A0(n1), .A1(n200), .B0(n39), .B1(n106), .Y(n141) );
  OAI22X1M U84 ( .A0(n1), .A1(n199), .B0(n39), .B1(n101), .Y(n142) );
  OAI22X1M U85 ( .A0(n1), .A1(n137), .B0(n39), .B1(n95), .Y(n143) );
  OAI22X1M U86 ( .A0(n1), .A1(n136), .B0(n39), .B1(n93), .Y(n144) );
  OAI22X1M U87 ( .A0(n1), .A1(n135), .B0(n39), .B1(n89), .Y(n145) );
  OAI22X1M U88 ( .A0(n202), .A1(n15), .B0(n10), .B1(n84), .Y(n170) );
  OAI22X1M U89 ( .A0(n201), .A1(n15), .B0(n10), .B1(n79), .Y(n171) );
  OAI22X1M U90 ( .A0(n200), .A1(n15), .B0(n10), .B1(n73), .Y(n172) );
  OAI22X1M U91 ( .A0(n199), .A1(n15), .B0(n10), .B1(n72), .Y(n173) );
  OAI22X1M U92 ( .A0(n137), .A1(n15), .B0(n10), .B1(n68), .Y(n174) );
  OAI22X1M U93 ( .A0(n136), .A1(n15), .B0(n10), .B1(n65), .Y(n175) );
  OAI22X1M U94 ( .A0(n135), .A1(n15), .B0(n10), .B1(n63), .Y(n176) );
  OAI22X1M U95 ( .A0(n203), .A1(n15), .B0(n10), .B1(n62), .Y(n177) );
  OAI22X1M U96 ( .A0(n202), .A1(n37), .B0(n29), .B1(n61), .Y(n178) );
  OAI22X1M U97 ( .A0(n201), .A1(n37), .B0(n29), .B1(n60), .Y(n179) );
  OAI22X1M U98 ( .A0(n200), .A1(n37), .B0(n29), .B1(n59), .Y(n180) );
  OAI22X1M U99 ( .A0(n199), .A1(n37), .B0(n29), .B1(n56), .Y(n181) );
  OAI22X1M U100 ( .A0(n137), .A1(n37), .B0(n29), .B1(n53), .Y(n182) );
  OAI22X1M U101 ( .A0(n136), .A1(n37), .B0(n29), .B1(n52), .Y(n183) );
  OAI22X1M U102 ( .A0(n135), .A1(n37), .B0(n29), .B1(n51), .Y(n184) );
  OAI22X1M U103 ( .A0(n203), .A1(n37), .B0(n29), .B1(n50), .Y(n185) );
  OAI22X1M U104 ( .A0(n203), .A1(n48), .B0(n14), .B1(n133), .Y(n186) );
  OAI22X1M U105 ( .A0(n202), .A1(n48), .B0(n14), .B1(n132), .Y(n187) );
  OAI22X1M U106 ( .A0(n201), .A1(n48), .B0(n14), .B1(n131), .Y(n188) );
  OAI22X1M U107 ( .A0(n200), .A1(n48), .B0(n14), .B1(n130), .Y(n189) );
  INVX2M U108 ( .A(n1), .Y(n39) );
  INVX2M U109 ( .A(n37), .Y(n29) );
  INVX2M U110 ( .A(n48), .Y(n14) );
  INVX2M U111 ( .A(n10), .Y(n15) );
  BUFX2M U112 ( .A(RST), .Y(n3) );
  BUFX2M U113 ( .A(RST), .Y(n2) );
  AOI22X1M U114 ( .A0(n12), .A1(n17), .B0(n31), .B1(n134), .Y(n105) );
  AND4X2M U115 ( .A(n70), .B(n100), .C(n78), .D(n57), .Y(n104) );
  INVX2M U116 ( .A(n107), .Y(n17) );
  NOR3BX2M U117 ( .AN(n20), .B(state[0]), .C(n42), .Y(n64) );
  NOR3X2M U118 ( .A(state[1]), .B(state[4]), .C(n44), .Y(n127) );
  NOR2X2M U119 ( .A(state[0]), .B(state[3]), .Y(n19) );
  NAND3X2M U120 ( .A(state[3]), .B(n32), .C(n127), .Y(n87) );
  OAI22X1M U121 ( .A0(n13), .A1(n44), .B0(n80), .B1(n67), .Y(n196) );
  NOR4X1M U122 ( .A(n81), .B(n55), .C(RdEn), .D(n38), .Y(n80) );
  OAI31X1M U123 ( .A0(n82), .A1(n199), .A2(n83), .B0(n16), .Y(n81) );
  NAND3X2M U124 ( .A(n201), .B(n136), .C(RX_P_Data[0]), .Y(n82) );
  OAI22X1M U125 ( .A0(n13), .A1(n40), .B0(n90), .B1(n67), .Y(n197) );
  NOR4X1M U126 ( .A(n91), .B(n92), .C(n34), .D(n94), .Y(n90) );
  NOR3X2M U127 ( .A(n18), .B(state[4]), .C(state[1]), .Y(n94) );
  NAND4BX1M U128 ( .AN(n9), .B(n96), .C(n78), .D(n88), .Y(n91) );
  BUFX2M U129 ( .A(n69), .Y(n9) );
  NOR3X2M U130 ( .A(n124), .B(state[1]), .C(n18), .Y(n69) );
  NAND3X2M U131 ( .A(n108), .B(n32), .C(state[3]), .Y(n23) );
  NOR2X2M U132 ( .A(n32), .B(state[3]), .Y(n128) );
  NAND2X2M U133 ( .A(state[4]), .B(n44), .Y(n124) );
  INVX2M U134 ( .A(state[0]), .Y(n32) );
  OAI2BB2X1M U135 ( .B0(n66), .B1(n67), .A0N(n67), .A1N(state[4]), .Y(n194) );
  NOR3X2M U136 ( .A(n28), .B(n31), .C(n9), .Y(n66) );
  INVX2M U137 ( .A(state[1]), .Y(n40) );
  INVX2M U138 ( .A(state[3]), .Y(n42) );
  INVX2M U139 ( .A(state[2]), .Y(n44) );
  NOR4X1M U140 ( .A(n57), .B(n135), .C(n200), .D(state[0]), .Y(n76) );
  NAND4X2M U141 ( .A(RX_P_Data[6]), .B(RX_P_Data[4]), .C(n76), .D(n103), .Y(
        n85) );
  NOR4X1M U142 ( .A(RX_P_Data[5]), .B(RX_P_Data[1]), .C(n203), .D(n201), .Y(
        n103) );
  INVX2M U143 ( .A(RX_P_Data[2]), .Y(n201) );
  INVX2M U144 ( .A(RX_P_Data[0]), .Y(n203) );
  NOR2X2M U145 ( .A(n12), .B(n123), .Y(TX_P_Data[0]) );
  AOI222X1M U146 ( .A0(n8), .A1(alu_res_reg[8]), .B0(n9), .B1(alu_res_reg[0]), 
        .C0(n116), .C1(rd_data_reg[0]), .Y(n123) );
  NOR2X2M U147 ( .A(n12), .B(n122), .Y(TX_P_Data[1]) );
  AOI222X1M U148 ( .A0(n8), .A1(alu_res_reg[9]), .B0(n9), .B1(alu_res_reg[1]), 
        .C0(n116), .C1(rd_data_reg[1]), .Y(n122) );
  NOR2X2M U149 ( .A(n12), .B(n121), .Y(TX_P_Data[2]) );
  AOI222X1M U150 ( .A0(n8), .A1(alu_res_reg[10]), .B0(n9), .B1(alu_res_reg[2]), 
        .C0(n116), .C1(rd_data_reg[2]), .Y(n121) );
  NOR2X2M U151 ( .A(n12), .B(n120), .Y(TX_P_Data[3]) );
  AOI222X1M U152 ( .A0(n8), .A1(alu_res_reg[11]), .B0(n9), .B1(alu_res_reg[3]), 
        .C0(n116), .C1(rd_data_reg[3]), .Y(n120) );
  NOR2X2M U153 ( .A(n12), .B(n119), .Y(TX_P_Data[4]) );
  AOI222X1M U154 ( .A0(n8), .A1(alu_res_reg[12]), .B0(n9), .B1(alu_res_reg[4]), 
        .C0(n116), .C1(rd_data_reg[4]), .Y(n119) );
  NOR2X2M U155 ( .A(n12), .B(n118), .Y(TX_P_Data[5]) );
  AOI222X1M U156 ( .A0(n8), .A1(alu_res_reg[13]), .B0(n9), .B1(alu_res_reg[5]), 
        .C0(n116), .C1(rd_data_reg[5]), .Y(n118) );
  NOR2X2M U157 ( .A(n12), .B(n117), .Y(TX_P_Data[6]) );
  AOI222X1M U158 ( .A0(n8), .A1(alu_res_reg[14]), .B0(n9), .B1(alu_res_reg[6]), 
        .C0(n116), .C1(rd_data_reg[6]), .Y(n117) );
  NOR2X2M U159 ( .A(n12), .B(n114), .Y(TX_P_Data[7]) );
  AOI222X1M U160 ( .A0(n8), .A1(alu_res_reg[15]), .B0(n9), .B1(alu_res_reg[7]), 
        .C0(n116), .C1(rd_data_reg[7]), .Y(n114) );
  NAND3X2M U161 ( .A(state[3]), .B(n32), .C(n109), .Y(n36) );
  INVX2M U162 ( .A(RX_P_Data[3]), .Y(n200) );
  NAND3X2M U163 ( .A(RX_P_Data[5]), .B(RX_P_Data[1]), .C(n76), .Y(n83) );
  INVX2M U164 ( .A(RX_P_Data[7]), .Y(n135) );
  AND2X2M U165 ( .A(RdData_Valid), .B(n38), .Y(n24) );
  AO2B2X2M U166 ( .B0(RdData[1]), .B1(n24), .A0(rd_data_reg[1]), .A1N(n24), 
        .Y(n162) );
  AO2B2X2M U167 ( .B0(RdData[2]), .B1(n24), .A0(rd_data_reg[2]), .A1N(n24), 
        .Y(n163) );
  AO2B2X2M U168 ( .B0(RdData[3]), .B1(n24), .A0(rd_data_reg[3]), .A1N(n24), 
        .Y(n164) );
  AO2B2X2M U169 ( .B0(RdData[4]), .B1(n24), .A0(rd_data_reg[4]), .A1N(n24), 
        .Y(n165) );
  AO2B2X2M U170 ( .B0(RdData[5]), .B1(n24), .A0(rd_data_reg[5]), .A1N(n24), 
        .Y(n166) );
  AO2B2X2M U171 ( .B0(RdData[6]), .B1(n24), .A0(rd_data_reg[6]), .A1N(n24), 
        .Y(n167) );
  AO2B2X2M U172 ( .B0(RdData[7]), .B1(n24), .A0(rd_data_reg[7]), .A1N(n24), 
        .Y(n168) );
  AO2B2X2M U173 ( .B0(RdData[0]), .B1(n24), .A0(rd_data_reg[0]), .A1N(n24), 
        .Y(n169) );
  AO2B2X2M U174 ( .B0(ALU_OUT[1]), .B1(n11), .A0(alu_res_reg[1]), .A1N(n11), 
        .Y(n146) );
  AO2B2X2M U175 ( .B0(ALU_OUT[2]), .B1(n21), .A0(alu_res_reg[2]), .A1N(n21), 
        .Y(n147) );
  AO2B2X2M U176 ( .B0(ALU_OUT[3]), .B1(n11), .A0(alu_res_reg[3]), .A1N(n11), 
        .Y(n148) );
  AO2B2X2M U177 ( .B0(ALU_OUT[4]), .B1(n21), .A0(alu_res_reg[4]), .A1N(n21), 
        .Y(n149) );
  AO2B2X2M U178 ( .B0(ALU_OUT[5]), .B1(n11), .A0(alu_res_reg[5]), .A1N(n11), 
        .Y(n150) );
  AO2B2X2M U179 ( .B0(ALU_OUT[6]), .B1(n21), .A0(alu_res_reg[6]), .A1N(n21), 
        .Y(n151) );
  AO2B2X2M U180 ( .B0(ALU_OUT[7]), .B1(n11), .A0(alu_res_reg[7]), .A1N(n11), 
        .Y(n152) );
  AO2B2X2M U181 ( .B0(ALU_OUT[8]), .B1(n21), .A0(alu_res_reg[8]), .A1N(n21), 
        .Y(n153) );
  AO2B2X2M U182 ( .B0(ALU_OUT[9]), .B1(n11), .A0(alu_res_reg[9]), .A1N(n11), 
        .Y(n154) );
  AO2B2X2M U183 ( .B0(ALU_OUT[10]), .B1(n21), .A0(alu_res_reg[10]), .A1N(n21), 
        .Y(n155) );
  AO2B2X2M U184 ( .B0(ALU_OUT[11]), .B1(n11), .A0(alu_res_reg[11]), .A1N(n11), 
        .Y(n156) );
  AO2B2X2M U185 ( .B0(ALU_OUT[12]), .B1(n21), .A0(alu_res_reg[12]), .A1N(n21), 
        .Y(n157) );
  AO2B2X2M U186 ( .B0(ALU_OUT[13]), .B1(n11), .A0(alu_res_reg[13]), .A1N(n11), 
        .Y(n158) );
  AO2B2X2M U187 ( .B0(ALU_OUT[14]), .B1(n21), .A0(alu_res_reg[14]), .A1N(n21), 
        .Y(n159) );
  AO2B2X2M U188 ( .B0(ALU_OUT[15]), .B1(n11), .A0(alu_res_reg[15]), .A1N(n11), 
        .Y(n160) );
  AO2B2X2M U189 ( .B0(ALU_OUT[0]), .B1(n21), .A0(alu_res_reg[0]), .A1N(n21), 
        .Y(n161) );
  NOR2X2M U190 ( .A(n32), .B(n57), .Y(n54) );
  NAND3X2M U191 ( .A(n19), .B(n20), .C(RX_D_VLD), .Y(n1) );
  NAND2X2M U192 ( .A(n30), .B(RX_D_VLD), .Y(n37) );
  NOR3X2M U193 ( .A(RX_P_Data[2]), .B(RX_P_Data[6]), .C(RX_P_Data[4]), .Y(n102) );
  INVX2M U194 ( .A(RX_P_Data[1]), .Y(n202) );
  INVX2M U195 ( .A(RX_P_Data[6]), .Y(n136) );
  INVX2M U196 ( .A(RX_P_Data[5]), .Y(n137) );
  INVX2M U197 ( .A(RX_P_Data[4]), .Y(n199) );
  BUFX2M U198 ( .A(n27), .Y(n10) );
  NOR2BX2M U199 ( .AN(RX_D_VLD), .B(n36), .Y(n27) );
  INVX2M U200 ( .A(OUT_Valid), .Y(n134) );
  INVX2M U201 ( .A(data_reg[0]), .Y(n129) );
  INVX2M U202 ( .A(data_reg[1]), .Y(n112) );
  INVX2M U203 ( .A(data_reg[2]), .Y(n111) );
  INVX2M U204 ( .A(data_reg[3]), .Y(n106) );
  INVX2M U205 ( .A(data_reg[4]), .Y(n101) );
  INVX2M U206 ( .A(data_reg[5]), .Y(n95) );
  INVX2M U207 ( .A(data_reg[6]), .Y(n93) );
  INVX2M U208 ( .A(data_reg[7]), .Y(n89) );
  INVX2M U209 ( .A(alu_a_reg[0]), .Y(n62) );
  INVX2M U210 ( .A(alu_a_reg[1]), .Y(n84) );
  INVX2M U211 ( .A(alu_a_reg[2]), .Y(n79) );
  INVX2M U212 ( .A(alu_a_reg[3]), .Y(n73) );
  INVX2M U213 ( .A(alu_a_reg[4]), .Y(n72) );
  INVX2M U214 ( .A(alu_a_reg[5]), .Y(n68) );
  INVX2M U215 ( .A(alu_a_reg[6]), .Y(n65) );
  INVX2M U216 ( .A(alu_a_reg[7]), .Y(n63) );
  INVX2M U217 ( .A(alu_b_reg[0]), .Y(n50) );
  INVX2M U218 ( .A(alu_b_reg[1]), .Y(n61) );
  INVX2M U219 ( .A(alu_b_reg[2]), .Y(n60) );
  INVX2M U220 ( .A(alu_b_reg[3]), .Y(n59) );
  INVX2M U221 ( .A(alu_b_reg[4]), .Y(n56) );
  INVX2M U222 ( .A(alu_b_reg[5]), .Y(n53) );
  INVX2M U223 ( .A(alu_b_reg[6]), .Y(n52) );
  INVX2M U224 ( .A(alu_b_reg[7]), .Y(n51) );
endmodule


module DF_SYNC_WIDTH4_0 ( dest_clk, dest_rst_n, async_in, sync_out );
  input [3:0] async_in;
  output [3:0] sync_out;
  input dest_clk, dest_rst_n;

  wire   [3:0] sync_ff1;

  DFFRQX2M sync_out_reg_2_ ( .D(sync_ff1[2]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[2]) );
  DFFRQX2M sync_out_reg_3_ ( .D(sync_ff1[3]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[3]) );
  DFFRQX2M sync_out_reg_1_ ( .D(sync_ff1[1]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[1]) );
  DFFRQX2M sync_out_reg_0_ ( .D(sync_ff1[0]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[0]) );
  DFFRQX2M sync_ff1_reg_3_ ( .D(async_in[3]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[3]) );
  DFFRQX2M sync_ff1_reg_2_ ( .D(async_in[2]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[2]) );
  DFFRQX2M sync_ff1_reg_1_ ( .D(async_in[1]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[1]) );
  DFFRQX2M sync_ff1_reg_0_ ( .D(async_in[0]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[0]) );
endmodule


module DF_SYNC_WIDTH4_1 ( dest_clk, dest_rst_n, async_in, sync_out );
  input [3:0] async_in;
  output [3:0] sync_out;
  input dest_clk, dest_rst_n;

  wire   [3:0] sync_ff1;

  DFFRQX2M sync_out_reg_3_ ( .D(sync_ff1[3]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[3]) );
  DFFRQX2M sync_out_reg_2_ ( .D(sync_ff1[2]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[2]) );
  DFFRQX2M sync_out_reg_1_ ( .D(sync_ff1[1]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[1]) );
  DFFRQX2M sync_out_reg_0_ ( .D(sync_ff1[0]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_out[0]) );
  DFFRQX2M sync_ff1_reg_3_ ( .D(async_in[3]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[3]) );
  DFFRQX2M sync_ff1_reg_2_ ( .D(async_in[2]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[2]) );
  DFFRQX2M sync_ff1_reg_1_ ( .D(async_in[1]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[1]) );
  DFFRQX2M sync_ff1_reg_0_ ( .D(async_in[0]), .CK(dest_clk), .RN(dest_rst_n), 
        .Q(sync_ff1[0]) );
endmodule


module FIFO_WR_ADDR_WIDTH3 ( wclk, wrst_n, winc, wq2_rptr, waddr, wptr, wfull
 );
  input [3:0] wq2_rptr;
  output [2:0] waddr;
  output [3:0] wptr;
  input wclk, wrst_n, winc;
  output wfull;
  wire   wbin_3_, wfull_next, n1, n2, n3, n4, n5, n6, n7, n8;
  wire   [3:0] wbin_next;
  wire   [2:0] wptr_next;

  DFFRQX2M wbin_reg_3_ ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(wbin_3_)
         );
  DFFRQX2M wbin_reg_2_ ( .D(wbin_next[2]), .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  DFFRQX2M wbin_reg_1_ ( .D(wbin_next[1]), .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  DFFRQX2M wfull_reg ( .D(wfull_next), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  DFFRQX2M wbin_reg_0_ ( .D(wbin_next[0]), .CK(wclk), .RN(wrst_n), .Q(waddr[0]) );
  DFFRQX2M wptr_reg_3_ ( .D(wbin_next[3]), .CK(wclk), .RN(wrst_n), .Q(wptr[3])
         );
  DFFRQX2M wptr_reg_2_ ( .D(wptr_next[2]), .CK(wclk), .RN(wrst_n), .Q(wptr[2])
         );
  DFFRQX2M wptr_reg_1_ ( .D(wptr_next[1]), .CK(wclk), .RN(wrst_n), .Q(wptr[1])
         );
  DFFRQX2M wptr_reg_0_ ( .D(wptr_next[0]), .CK(wclk), .RN(wrst_n), .Q(wptr[0])
         );
  CLKXOR2X2M U3 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(wptr_next[0]) );
  CLKXOR2X2M U4 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(wptr_next[1]) );
  CLKXOR2X2M U5 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(wptr_next[2]) );
  XNOR2X2M U6 ( .A(n7), .B(waddr[2]), .Y(wbin_next[2]) );
  NAND2X2M U7 ( .A(waddr[1]), .B(n6), .Y(n7) );
  XNOR2X2M U8 ( .A(n5), .B(wbin_3_), .Y(wbin_next[3]) );
  NAND3X2M U9 ( .A(waddr[1]), .B(n6), .C(waddr[2]), .Y(n5) );
  NOR4X1M U10 ( .A(n1), .B(n2), .C(n3), .D(n4), .Y(wfull_next) );
  XNOR2X2M U11 ( .A(wbin_next[3]), .B(wq2_rptr[3]), .Y(n2) );
  XNOR2X2M U12 ( .A(wptr_next[2]), .B(wq2_rptr[2]), .Y(n1) );
  CLKXOR2X2M U13 ( .A(wq2_rptr[0]), .B(wptr_next[0]), .Y(n3) );
  NOR2BX2M U14 ( .AN(winc), .B(wfull), .Y(n8) );
  AND2X2M U15 ( .A(waddr[0]), .B(n8), .Y(n6) );
  CLKXOR2X2M U16 ( .A(n6), .B(waddr[1]), .Y(wbin_next[1]) );
  CLKXOR2X2M U17 ( .A(wq2_rptr[1]), .B(wptr_next[1]), .Y(n4) );
  CLKXOR2X2M U18 ( .A(n8), .B(waddr[0]), .Y(wbin_next[0]) );
endmodule


module FIFO_RD_ADDR_WIDTH3 ( rclk, rrst_n, rinc, rq2_wptr, raddr, rptr, rempty
 );
  input [3:0] rq2_wptr;
  output [2:0] raddr;
  output [3:0] rptr;
  input rclk, rrst_n, rinc;
  output rempty;
  wire   rbin_3_, N8, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [3:0] rbin_next;
  wire   [2:0] rptr_next;

  DFFRQX2M rbin_reg_3_ ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(rbin_3_)
         );
  DFFSQX2M rempty_reg ( .D(N8), .CK(rclk), .SN(rrst_n), .Q(rempty) );
  DFFRQX2M rbin_reg_1_ ( .D(rbin_next[1]), .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  DFFRQX2M rbin_reg_0_ ( .D(rbin_next[0]), .CK(rclk), .RN(rrst_n), .Q(raddr[0]) );
  DFFRQX2M rbin_reg_2_ ( .D(rbin_next[2]), .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  DFFRQX2M rptr_reg_0_ ( .D(rptr_next[0]), .CK(rclk), .RN(rrst_n), .Q(rptr[0])
         );
  DFFRQX2M rptr_reg_1_ ( .D(rptr_next[1]), .CK(rclk), .RN(rrst_n), .Q(rptr[1])
         );
  DFFRQX2M rptr_reg_3_ ( .D(rbin_next[3]), .CK(rclk), .RN(rrst_n), .Q(rptr[3])
         );
  DFFRQX2M rptr_reg_2_ ( .D(rptr_next[2]), .CK(rclk), .RN(rrst_n), .Q(rptr[2])
         );
  CLKXOR2X2M U3 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(rptr_next[1]) );
  CLKXOR2X2M U4 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(rptr_next[2]) );
  CLKXOR2X2M U5 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(rptr_next[0]) );
  XNOR2X2M U6 ( .A(n10), .B(rbin_3_), .Y(rbin_next[3]) );
  NAND2X2M U7 ( .A(n9), .B(raddr[2]), .Y(n10) );
  XNOR2X2M U8 ( .A(n8), .B(raddr[1]), .Y(rbin_next[1]) );
  NOR2BX2M U9 ( .AN(rinc), .B(rempty), .Y(n7) );
  NOR2BX2M U10 ( .AN(raddr[1]), .B(n8), .Y(n9) );
  NOR4X1M U11 ( .A(n3), .B(n4), .C(n5), .D(n6), .Y(N8) );
  CLKXOR2X2M U12 ( .A(rq2_wptr[3]), .B(rbin_next[3]), .Y(n4) );
  CLKXOR2X2M U13 ( .A(rq2_wptr[0]), .B(rptr_next[0]), .Y(n5) );
  CLKXOR2X2M U14 ( .A(rq2_wptr[2]), .B(rptr_next[2]), .Y(n3) );
  NAND2X2M U15 ( .A(raddr[0]), .B(n7), .Y(n8) );
  CLKXOR2X2M U16 ( .A(n9), .B(raddr[2]), .Y(rbin_next[2]) );
  CLKXOR2X2M U17 ( .A(rq2_wptr[1]), .B(rptr_next[1]), .Y(n6) );
  CLKXOR2X2M U18 ( .A(n7), .B(raddr[0]), .Y(rbin_next[0]) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3 ( wclk, winc_valid, waddr, wdata, 
        rclk, rrst_n, rinc_valid, raddr, rdata );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclk, winc_valid, rclk, rrst_n, rinc_valid;
  wire   n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127;
  wire   [63:0] mem;

  DFFQX2M mem_reg_0__7_ ( .D(n84), .CK(wclk), .Q(mem[63]) );
  DFFQX2M mem_reg_0__6_ ( .D(n83), .CK(wclk), .Q(mem[62]) );
  DFFQX2M mem_reg_0__5_ ( .D(n82), .CK(wclk), .Q(mem[61]) );
  DFFQX2M mem_reg_0__4_ ( .D(n81), .CK(wclk), .Q(mem[60]) );
  DFFQX2M mem_reg_0__3_ ( .D(n80), .CK(wclk), .Q(mem[59]) );
  DFFQX2M mem_reg_0__2_ ( .D(n79), .CK(wclk), .Q(mem[58]) );
  DFFQX2M mem_reg_0__1_ ( .D(n78), .CK(wclk), .Q(mem[57]) );
  DFFQX2M mem_reg_0__0_ ( .D(n77), .CK(wclk), .Q(mem[56]) );
  DFFQX2M mem_reg_1__7_ ( .D(n76), .CK(wclk), .Q(mem[55]) );
  DFFQX2M mem_reg_1__6_ ( .D(n75), .CK(wclk), .Q(mem[54]) );
  DFFQX2M mem_reg_1__5_ ( .D(n74), .CK(wclk), .Q(mem[53]) );
  DFFQX2M mem_reg_1__4_ ( .D(n73), .CK(wclk), .Q(mem[52]) );
  DFFQX2M mem_reg_1__3_ ( .D(n72), .CK(wclk), .Q(mem[51]) );
  DFFQX2M mem_reg_1__2_ ( .D(n71), .CK(wclk), .Q(mem[50]) );
  DFFQX2M mem_reg_1__1_ ( .D(n70), .CK(wclk), .Q(mem[49]) );
  DFFQX2M mem_reg_1__0_ ( .D(n69), .CK(wclk), .Q(mem[48]) );
  DFFQX2M mem_reg_4__7_ ( .D(n52), .CK(wclk), .Q(mem[31]) );
  DFFQX2M mem_reg_4__6_ ( .D(n51), .CK(wclk), .Q(mem[30]) );
  DFFQX2M mem_reg_4__5_ ( .D(n50), .CK(wclk), .Q(mem[29]) );
  DFFQX2M mem_reg_4__4_ ( .D(n49), .CK(wclk), .Q(mem[28]) );
  DFFQX2M mem_reg_4__3_ ( .D(n48), .CK(wclk), .Q(mem[27]) );
  DFFQX2M mem_reg_4__2_ ( .D(n47), .CK(wclk), .Q(mem[26]) );
  DFFQX2M mem_reg_4__1_ ( .D(n46), .CK(wclk), .Q(mem[25]) );
  DFFQX2M mem_reg_4__0_ ( .D(n45), .CK(wclk), .Q(mem[24]) );
  DFFQX2M mem_reg_5__7_ ( .D(n44), .CK(wclk), .Q(mem[23]) );
  DFFQX2M mem_reg_5__6_ ( .D(n43), .CK(wclk), .Q(mem[22]) );
  DFFQX2M mem_reg_5__5_ ( .D(n42), .CK(wclk), .Q(mem[21]) );
  DFFQX2M mem_reg_5__4_ ( .D(n41), .CK(wclk), .Q(mem[20]) );
  DFFQX2M mem_reg_5__3_ ( .D(n40), .CK(wclk), .Q(mem[19]) );
  DFFQX2M mem_reg_5__2_ ( .D(n39), .CK(wclk), .Q(mem[18]) );
  DFFQX2M mem_reg_5__1_ ( .D(n38), .CK(wclk), .Q(mem[17]) );
  DFFQX2M mem_reg_5__0_ ( .D(n37), .CK(wclk), .Q(mem[16]) );
  DFFQX2M mem_reg_6__7_ ( .D(n36), .CK(wclk), .Q(mem[15]) );
  DFFQX2M mem_reg_6__6_ ( .D(n35), .CK(wclk), .Q(mem[14]) );
  DFFQX2M mem_reg_6__5_ ( .D(n34), .CK(wclk), .Q(mem[13]) );
  DFFQX2M mem_reg_6__4_ ( .D(n33), .CK(wclk), .Q(mem[12]) );
  DFFQX2M mem_reg_6__3_ ( .D(n32), .CK(wclk), .Q(mem[11]) );
  DFFQX2M mem_reg_6__2_ ( .D(n31), .CK(wclk), .Q(mem[10]) );
  DFFQX2M mem_reg_6__1_ ( .D(n30), .CK(wclk), .Q(mem[9]) );
  DFFQX2M mem_reg_6__0_ ( .D(n29), .CK(wclk), .Q(mem[8]) );
  DFFQX2M mem_reg_7__7_ ( .D(n28), .CK(wclk), .Q(mem[7]) );
  DFFQX2M mem_reg_7__6_ ( .D(n27), .CK(wclk), .Q(mem[6]) );
  DFFQX2M mem_reg_7__5_ ( .D(n26), .CK(wclk), .Q(mem[5]) );
  DFFQX2M mem_reg_7__4_ ( .D(n25), .CK(wclk), .Q(mem[4]) );
  DFFQX2M mem_reg_7__3_ ( .D(n24), .CK(wclk), .Q(mem[3]) );
  DFFQX2M mem_reg_7__2_ ( .D(n23), .CK(wclk), .Q(mem[2]) );
  DFFQX2M mem_reg_7__1_ ( .D(n22), .CK(wclk), .Q(mem[1]) );
  DFFQX2M mem_reg_7__0_ ( .D(n21), .CK(wclk), .Q(mem[0]) );
  DFFQX2M mem_reg_2__7_ ( .D(n68), .CK(wclk), .Q(mem[47]) );
  DFFQX2M mem_reg_2__6_ ( .D(n67), .CK(wclk), .Q(mem[46]) );
  DFFQX2M mem_reg_2__5_ ( .D(n66), .CK(wclk), .Q(mem[45]) );
  DFFQX2M mem_reg_2__4_ ( .D(n65), .CK(wclk), .Q(mem[44]) );
  DFFQX2M mem_reg_2__3_ ( .D(n64), .CK(wclk), .Q(mem[43]) );
  DFFQX2M mem_reg_2__2_ ( .D(n63), .CK(wclk), .Q(mem[42]) );
  DFFQX2M mem_reg_2__1_ ( .D(n62), .CK(wclk), .Q(mem[41]) );
  DFFQX2M mem_reg_2__0_ ( .D(n61), .CK(wclk), .Q(mem[40]) );
  DFFQX2M mem_reg_3__7_ ( .D(n60), .CK(wclk), .Q(mem[39]) );
  DFFQX2M mem_reg_3__6_ ( .D(n59), .CK(wclk), .Q(mem[38]) );
  DFFQX2M mem_reg_3__5_ ( .D(n58), .CK(wclk), .Q(mem[37]) );
  DFFQX2M mem_reg_3__4_ ( .D(n57), .CK(wclk), .Q(mem[36]) );
  DFFQX2M mem_reg_3__3_ ( .D(n56), .CK(wclk), .Q(mem[35]) );
  DFFQX2M mem_reg_3__2_ ( .D(n55), .CK(wclk), .Q(mem[34]) );
  DFFQX2M mem_reg_3__1_ ( .D(n54), .CK(wclk), .Q(mem[33]) );
  DFFQX2M mem_reg_3__0_ ( .D(n53), .CK(wclk), .Q(mem[32]) );
  BUFX2M U2 ( .A(n16), .Y(n116) );
  BUFX2M U3 ( .A(n18), .Y(n115) );
  BUFX2M U4 ( .A(n19), .Y(n114) );
  BUFX2M U5 ( .A(n13), .Y(n117) );
  NAND3X2M U6 ( .A(n126), .B(n127), .C(n12), .Y(n15) );
  NAND3X2M U7 ( .A(n126), .B(n127), .C(n17), .Y(n20) );
  NOR2X2M U8 ( .A(n111), .B(n112), .Y(n107) );
  NAND3X2M U9 ( .A(n12), .B(n127), .C(waddr[0]), .Y(n14) );
  NAND3X2M U10 ( .A(waddr[0]), .B(n12), .C(waddr[1]), .Y(n11) );
  NOR2BX2M U11 ( .AN(winc_valid), .B(waddr[2]), .Y(n17) );
  OAI2BB2X1M U12 ( .B0(n11), .B1(n125), .A0N(mem[0]), .A1N(n11), .Y(n21) );
  OAI2BB2X1M U13 ( .B0(n11), .B1(n124), .A0N(mem[1]), .A1N(n11), .Y(n22) );
  OAI2BB2X1M U14 ( .B0(n11), .B1(n123), .A0N(mem[2]), .A1N(n11), .Y(n23) );
  OAI2BB2X1M U15 ( .B0(n11), .B1(n122), .A0N(mem[3]), .A1N(n11), .Y(n24) );
  OAI2BB2X1M U16 ( .B0(n11), .B1(n121), .A0N(mem[4]), .A1N(n11), .Y(n25) );
  OAI2BB2X1M U17 ( .B0(n11), .B1(n120), .A0N(mem[5]), .A1N(n11), .Y(n26) );
  OAI2BB2X1M U18 ( .B0(n11), .B1(n119), .A0N(mem[6]), .A1N(n11), .Y(n27) );
  OAI2BB2X1M U19 ( .B0(n11), .B1(n118), .A0N(mem[7]), .A1N(n11), .Y(n28) );
  OAI2BB2X1M U20 ( .B0(n125), .B1(n14), .A0N(mem[16]), .A1N(n14), .Y(n37) );
  OAI2BB2X1M U21 ( .B0(n124), .B1(n14), .A0N(mem[17]), .A1N(n14), .Y(n38) );
  OAI2BB2X1M U22 ( .B0(n123), .B1(n14), .A0N(mem[18]), .A1N(n14), .Y(n39) );
  OAI2BB2X1M U23 ( .B0(n122), .B1(n14), .A0N(mem[19]), .A1N(n14), .Y(n40) );
  OAI2BB2X1M U24 ( .B0(n121), .B1(n14), .A0N(mem[20]), .A1N(n14), .Y(n41) );
  OAI2BB2X1M U25 ( .B0(n120), .B1(n14), .A0N(mem[21]), .A1N(n14), .Y(n42) );
  OAI2BB2X1M U26 ( .B0(n119), .B1(n14), .A0N(mem[22]), .A1N(n14), .Y(n43) );
  OAI2BB2X1M U27 ( .B0(n118), .B1(n14), .A0N(mem[23]), .A1N(n14), .Y(n44) );
  OAI2BB2X1M U28 ( .B0(n125), .B1(n20), .A0N(mem[56]), .A1N(n20), .Y(n77) );
  OAI2BB2X1M U29 ( .B0(n124), .B1(n20), .A0N(mem[57]), .A1N(n20), .Y(n78) );
  OAI2BB2X1M U30 ( .B0(n123), .B1(n20), .A0N(mem[58]), .A1N(n20), .Y(n79) );
  OAI2BB2X1M U31 ( .B0(n122), .B1(n20), .A0N(mem[59]), .A1N(n20), .Y(n80) );
  OAI2BB2X1M U32 ( .B0(n121), .B1(n20), .A0N(mem[60]), .A1N(n20), .Y(n81) );
  OAI2BB2X1M U33 ( .B0(n120), .B1(n20), .A0N(mem[61]), .A1N(n20), .Y(n82) );
  OAI2BB2X1M U34 ( .B0(n119), .B1(n20), .A0N(mem[62]), .A1N(n20), .Y(n83) );
  OAI2BB2X1M U35 ( .B0(n118), .B1(n20), .A0N(mem[63]), .A1N(n20), .Y(n84) );
  OAI2BB2X1M U36 ( .B0(n125), .B1(n15), .A0N(mem[24]), .A1N(n15), .Y(n45) );
  OAI2BB2X1M U37 ( .B0(n124), .B1(n15), .A0N(mem[25]), .A1N(n15), .Y(n46) );
  OAI2BB2X1M U38 ( .B0(n123), .B1(n15), .A0N(mem[26]), .A1N(n15), .Y(n47) );
  OAI2BB2X1M U39 ( .B0(n122), .B1(n15), .A0N(mem[27]), .A1N(n15), .Y(n48) );
  OAI2BB2X1M U40 ( .B0(n121), .B1(n15), .A0N(mem[28]), .A1N(n15), .Y(n49) );
  OAI2BB2X1M U41 ( .B0(n120), .B1(n15), .A0N(mem[29]), .A1N(n15), .Y(n50) );
  OAI2BB2X1M U42 ( .B0(n119), .B1(n15), .A0N(mem[30]), .A1N(n15), .Y(n51) );
  OAI2BB2X1M U43 ( .B0(n118), .B1(n15), .A0N(mem[31]), .A1N(n15), .Y(n52) );
  INVX2M U44 ( .A(wdata[0]), .Y(n125) );
  INVX2M U45 ( .A(wdata[1]), .Y(n124) );
  INVX2M U46 ( .A(wdata[2]), .Y(n123) );
  INVX2M U47 ( .A(wdata[3]), .Y(n122) );
  INVX2M U48 ( .A(wdata[4]), .Y(n121) );
  INVX2M U49 ( .A(wdata[5]), .Y(n120) );
  INVX2M U50 ( .A(wdata[6]), .Y(n119) );
  INVX2M U51 ( .A(wdata[7]), .Y(n118) );
  OAI2BB2X1M U52 ( .B0(n125), .B1(n117), .A0N(mem[8]), .A1N(n117), .Y(n29) );
  OAI2BB2X1M U53 ( .B0(n124), .B1(n117), .A0N(mem[9]), .A1N(n117), .Y(n30) );
  OAI2BB2X1M U54 ( .B0(n123), .B1(n117), .A0N(mem[10]), .A1N(n117), .Y(n31) );
  OAI2BB2X1M U55 ( .B0(n122), .B1(n117), .A0N(mem[11]), .A1N(n117), .Y(n32) );
  OAI2BB2X1M U56 ( .B0(n121), .B1(n117), .A0N(mem[12]), .A1N(n117), .Y(n33) );
  OAI2BB2X1M U57 ( .B0(n120), .B1(n117), .A0N(mem[13]), .A1N(n117), .Y(n34) );
  OAI2BB2X1M U58 ( .B0(n119), .B1(n117), .A0N(mem[14]), .A1N(n117), .Y(n35) );
  OAI2BB2X1M U59 ( .B0(n118), .B1(n117), .A0N(mem[15]), .A1N(n117), .Y(n36) );
  OAI2BB2X1M U60 ( .B0(n125), .B1(n116), .A0N(mem[32]), .A1N(n116), .Y(n53) );
  OAI2BB2X1M U61 ( .B0(n124), .B1(n116), .A0N(mem[33]), .A1N(n116), .Y(n54) );
  OAI2BB2X1M U62 ( .B0(n123), .B1(n116), .A0N(mem[34]), .A1N(n116), .Y(n55) );
  OAI2BB2X1M U63 ( .B0(n122), .B1(n116), .A0N(mem[35]), .A1N(n116), .Y(n56) );
  OAI2BB2X1M U64 ( .B0(n121), .B1(n116), .A0N(mem[36]), .A1N(n116), .Y(n57) );
  OAI2BB2X1M U65 ( .B0(n120), .B1(n116), .A0N(mem[37]), .A1N(n116), .Y(n58) );
  OAI2BB2X1M U66 ( .B0(n119), .B1(n116), .A0N(mem[38]), .A1N(n116), .Y(n59) );
  OAI2BB2X1M U67 ( .B0(n118), .B1(n116), .A0N(mem[39]), .A1N(n116), .Y(n60) );
  OAI2BB2X1M U68 ( .B0(n125), .B1(n115), .A0N(mem[40]), .A1N(n115), .Y(n61) );
  OAI2BB2X1M U69 ( .B0(n124), .B1(n115), .A0N(mem[41]), .A1N(n115), .Y(n62) );
  OAI2BB2X1M U70 ( .B0(n123), .B1(n115), .A0N(mem[42]), .A1N(n115), .Y(n63) );
  OAI2BB2X1M U71 ( .B0(n122), .B1(n115), .A0N(mem[43]), .A1N(n115), .Y(n64) );
  OAI2BB2X1M U72 ( .B0(n121), .B1(n115), .A0N(mem[44]), .A1N(n115), .Y(n65) );
  OAI2BB2X1M U73 ( .B0(n120), .B1(n115), .A0N(mem[45]), .A1N(n115), .Y(n66) );
  OAI2BB2X1M U74 ( .B0(n119), .B1(n115), .A0N(mem[46]), .A1N(n115), .Y(n67) );
  OAI2BB2X1M U75 ( .B0(n118), .B1(n115), .A0N(mem[47]), .A1N(n115), .Y(n68) );
  OAI2BB2X1M U76 ( .B0(n125), .B1(n114), .A0N(mem[48]), .A1N(n114), .Y(n69) );
  OAI2BB2X1M U77 ( .B0(n124), .B1(n114), .A0N(mem[49]), .A1N(n114), .Y(n70) );
  OAI2BB2X1M U78 ( .B0(n123), .B1(n114), .A0N(mem[50]), .A1N(n114), .Y(n71) );
  OAI2BB2X1M U79 ( .B0(n122), .B1(n114), .A0N(mem[51]), .A1N(n114), .Y(n72) );
  OAI2BB2X1M U80 ( .B0(n121), .B1(n114), .A0N(mem[52]), .A1N(n114), .Y(n73) );
  OAI2BB2X1M U81 ( .B0(n120), .B1(n114), .A0N(mem[53]), .A1N(n114), .Y(n74) );
  OAI2BB2X1M U82 ( .B0(n119), .B1(n114), .A0N(mem[54]), .A1N(n114), .Y(n75) );
  OAI2BB2X1M U83 ( .B0(n118), .B1(n114), .A0N(mem[55]), .A1N(n114), .Y(n76) );
  AND2X2M U84 ( .A(winc_valid), .B(waddr[2]), .Y(n12) );
  NAND3X2M U85 ( .A(n12), .B(n126), .C(waddr[1]), .Y(n13) );
  NAND3X2M U86 ( .A(waddr[1]), .B(waddr[0]), .C(n17), .Y(n16) );
  NAND3X2M U87 ( .A(waddr[1]), .B(n126), .C(n17), .Y(n18) );
  NAND3X2M U88 ( .A(waddr[0]), .B(n127), .C(n17), .Y(n19) );
  INVX2M U89 ( .A(waddr[1]), .Y(n127) );
  INVX2M U90 ( .A(waddr[0]), .Y(n126) );
  NOR2X2M U91 ( .A(raddr[1]), .B(raddr[2]), .Y(n104) );
  NOR2X2M U92 ( .A(n112), .B(raddr[2]), .Y(n105) );
  NOR2X2M U93 ( .A(n111), .B(raddr[1]), .Y(n108) );
  INVX2M U94 ( .A(raddr[2]), .Y(n111) );
  INVX2M U95 ( .A(raddr[1]), .Y(n112) );
  INVX2M U96 ( .A(raddr[0]), .Y(n113) );
  AO22X1M U97 ( .A0(mem[32]), .A1(n105), .B0(mem[48]), .B1(n104), .Y(n1) );
  AOI221XLM U98 ( .A0(mem[16]), .A1(n108), .B0(mem[0]), .B1(n107), .C0(n1), 
        .Y(n4) );
  AO22X1M U99 ( .A0(mem[40]), .A1(n105), .B0(mem[56]), .B1(n104), .Y(n2) );
  AOI221XLM U100 ( .A0(mem[24]), .A1(n108), .B0(mem[8]), .B1(n107), .C0(n2), 
        .Y(n3) );
  OAI22X1M U101 ( .A0(n113), .A1(n4), .B0(raddr[0]), .B1(n3), .Y(rdata[0]) );
  AO22X1M U102 ( .A0(mem[33]), .A1(n105), .B0(mem[49]), .B1(n104), .Y(n5) );
  AOI221XLM U103 ( .A0(mem[17]), .A1(n108), .B0(mem[1]), .B1(n107), .C0(n5), 
        .Y(n8) );
  AO22X1M U104 ( .A0(mem[41]), .A1(n105), .B0(mem[57]), .B1(n104), .Y(n6) );
  AOI221XLM U105 ( .A0(mem[25]), .A1(n108), .B0(mem[9]), .B1(n107), .C0(n6), 
        .Y(n7) );
  OAI22X1M U106 ( .A0(n113), .A1(n8), .B0(raddr[0]), .B1(n7), .Y(rdata[1]) );
  AO22X1M U107 ( .A0(mem[34]), .A1(n105), .B0(mem[50]), .B1(n104), .Y(n9) );
  AOI221XLM U108 ( .A0(mem[18]), .A1(n108), .B0(mem[2]), .B1(n107), .C0(n9), 
        .Y(n86) );
  AO22X1M U109 ( .A0(mem[42]), .A1(n105), .B0(mem[58]), .B1(n104), .Y(n10) );
  AOI221XLM U110 ( .A0(mem[26]), .A1(n108), .B0(mem[10]), .B1(n107), .C0(n10), 
        .Y(n85) );
  OAI22X1M U111 ( .A0(n113), .A1(n86), .B0(raddr[0]), .B1(n85), .Y(rdata[2])
         );
  AO22X1M U112 ( .A0(mem[35]), .A1(n105), .B0(mem[51]), .B1(n104), .Y(n87) );
  AOI221XLM U113 ( .A0(mem[19]), .A1(n108), .B0(mem[3]), .B1(n107), .C0(n87), 
        .Y(n90) );
  AO22X1M U114 ( .A0(mem[43]), .A1(n105), .B0(mem[59]), .B1(n104), .Y(n88) );
  AOI221XLM U115 ( .A0(mem[27]), .A1(n108), .B0(mem[11]), .B1(n107), .C0(n88), 
        .Y(n89) );
  OAI22X1M U116 ( .A0(n113), .A1(n90), .B0(raddr[0]), .B1(n89), .Y(rdata[3])
         );
  AO22X1M U117 ( .A0(mem[36]), .A1(n105), .B0(mem[52]), .B1(n104), .Y(n91) );
  AOI221XLM U118 ( .A0(mem[20]), .A1(n108), .B0(mem[4]), .B1(n107), .C0(n91), 
        .Y(n94) );
  AO22X1M U119 ( .A0(mem[44]), .A1(n105), .B0(mem[60]), .B1(n104), .Y(n92) );
  AOI221XLM U120 ( .A0(mem[28]), .A1(n108), .B0(mem[12]), .B1(n107), .C0(n92), 
        .Y(n93) );
  OAI22X1M U121 ( .A0(n113), .A1(n94), .B0(raddr[0]), .B1(n93), .Y(rdata[4])
         );
  AO22X1M U122 ( .A0(mem[37]), .A1(n105), .B0(mem[53]), .B1(n104), .Y(n95) );
  AOI221XLM U123 ( .A0(mem[21]), .A1(n108), .B0(mem[5]), .B1(n107), .C0(n95), 
        .Y(n98) );
  AO22X1M U124 ( .A0(mem[45]), .A1(n105), .B0(mem[61]), .B1(n104), .Y(n96) );
  AOI221XLM U125 ( .A0(mem[29]), .A1(n108), .B0(mem[13]), .B1(n107), .C0(n96), 
        .Y(n97) );
  OAI22X1M U126 ( .A0(n113), .A1(n98), .B0(raddr[0]), .B1(n97), .Y(rdata[5])
         );
  AO22X1M U127 ( .A0(mem[38]), .A1(n105), .B0(mem[54]), .B1(n104), .Y(n99) );
  AOI221XLM U128 ( .A0(mem[22]), .A1(n108), .B0(mem[6]), .B1(n107), .C0(n99), 
        .Y(n102) );
  AO22X1M U129 ( .A0(mem[46]), .A1(n105), .B0(mem[62]), .B1(n104), .Y(n100) );
  AOI221XLM U130 ( .A0(mem[30]), .A1(n108), .B0(mem[14]), .B1(n107), .C0(n100), 
        .Y(n101) );
  OAI22X1M U131 ( .A0(n113), .A1(n102), .B0(raddr[0]), .B1(n101), .Y(rdata[6])
         );
  AO22X1M U132 ( .A0(mem[39]), .A1(n105), .B0(mem[55]), .B1(n104), .Y(n103) );
  AOI221XLM U133 ( .A0(mem[23]), .A1(n108), .B0(mem[7]), .B1(n107), .C0(n103), 
        .Y(n110) );
  AO22X1M U134 ( .A0(mem[47]), .A1(n105), .B0(mem[63]), .B1(n104), .Y(n106) );
  AOI221XLM U135 ( .A0(mem[31]), .A1(n108), .B0(mem[15]), .B1(n107), .C0(n106), 
        .Y(n109) );
  OAI22X1M U136 ( .A0(n110), .A1(n113), .B0(raddr[0]), .B1(n109), .Y(rdata[7])
         );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3 ( W_CLK, W_RST, W_INC, WR_DATA, FULL, 
        R_CLK, R_RST, R_INC, RD_DATA, EMPTY );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC;
  output FULL, EMPTY;
  wire   winc_valid, rinc_valid;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] waddr;
  wire   [2:0] raddr;

  DF_SYNC_WIDTH4_0 sync_r2w ( .dest_clk(W_CLK), .dest_rst_n(W_RST), .async_in(
        rptr), .sync_out(wq2_rptr) );
  DF_SYNC_WIDTH4_1 sync_w2r ( .dest_clk(R_CLK), .dest_rst_n(R_RST), .async_in(
        wptr), .sync_out(rq2_wptr) );
  FIFO_WR_ADDR_WIDTH3 u_fifo_wr ( .wclk(W_CLK), .wrst_n(W_RST), .winc(W_INC), 
        .wq2_rptr(wq2_rptr), .waddr(waddr), .wptr(wptr), .wfull(FULL) );
  FIFO_RD_ADDR_WIDTH3 u_fifo_rd ( .rclk(R_CLK), .rrst_n(R_RST), .rinc(R_INC), 
        .rq2_wptr(rq2_wptr), .raddr(raddr), .rptr(rptr), .rempty(EMPTY) );
  FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3 u_fifo_mem_cntrl ( .wclk(W_CLK), 
        .winc_valid(winc_valid), .waddr(waddr), .wdata(WR_DATA), .rclk(R_CLK), 
        .rrst_n(R_RST), .rinc_valid(rinc_valid), .raddr(raddr), .rdata(RD_DATA) );
  NOR2BX2M U1 ( .AN(R_INC), .B(EMPTY), .Y(rinc_valid) );
  NOR2BX2M U2 ( .AN(W_INC), .B(FULL), .Y(winc_valid) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n1, n2, n3, n4;
  assign OUT[4] = 1'b0;
  assign OUT[5] = 1'b0;
  assign OUT[6] = 1'b0;
  assign OUT[7] = 1'b0;

  NAND4BX1M U3 ( .AN(IN[4]), .B(IN[3]), .C(n2), .D(n1), .Y(n6) );
  NAND4BX1M U4 ( .AN(IN[3]), .B(IN[4]), .C(n2), .D(n1), .Y(n7) );
  NOR3X2M U5 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR4X1M U6 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U7 ( .A(n4), .B(n3), .C(IN[2]), .Y(n5) );
  NOR3X2M U8 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  OAI211X2M U9 ( .A0(n8), .A1(n9), .B0(n4), .C0(n3), .Y(OUT[0]) );
  NAND2X2M U10 ( .A(n7), .B(n6), .Y(n9) );
  NOR4X1M U11 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n2), .Y(n8) );
  INVX2M U12 ( .A(IN[1]), .Y(n3) );
  INVX2M U13 ( .A(IN[2]), .Y(n2) );
  INVX2M U14 ( .A(IN[0]), .Y(n4) );
  INVX2M U15 ( .A(IN[5]), .Y(n1) );
endmodule


module INT_CLK_DIV_0_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module INT_CLK_DIV_0 ( REF_CLK, RST, CLK_EN, DIV_RATIO, O_DIV_CLK );
  input [7:0] DIV_RATIO;
  input REF_CLK, RST, CLK_EN;
  output O_DIV_CLK;
  wire   N7, div_clk_reg, odd_flag, N19, N20, N21, N22, N24, N25, N28, N29,
         N30, N31, N32, N33, N34, N35, N103, N104, N105, N106, N107, N108,
         N109, N110, N119, n27, n28, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24,
         n25, n26, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52;
  wire   [7:0] counter;

  INT_CLK_DIV_0_DW01_inc_0 r84 ( .A(counter), .SUM({N35, N34, N33, N32, N31, 
        N30, N29, N28}) );
  DFFRQX2M div_clk_reg_reg ( .D(n27), .CK(REF_CLK), .RN(RST), .Q(div_clk_reg)
         );
  DFFRQX2M odd_flag_reg ( .D(n28), .CK(REF_CLK), .RN(RST), .Q(odd_flag) );
  DFFRQX2M counter_reg_7_ ( .D(N110), .CK(REF_CLK), .RN(RST), .Q(counter[7])
         );
  DFFRQX2M counter_reg_6_ ( .D(N109), .CK(REF_CLK), .RN(RST), .Q(counter[6])
         );
  DFFRQX2M counter_reg_5_ ( .D(N108), .CK(REF_CLK), .RN(RST), .Q(counter[5])
         );
  DFFRQX2M counter_reg_0_ ( .D(N103), .CK(REF_CLK), .RN(RST), .Q(counter[0])
         );
  DFFRQX2M counter_reg_1_ ( .D(N104), .CK(REF_CLK), .RN(RST), .Q(counter[1])
         );
  DFFRQX2M counter_reg_4_ ( .D(N107), .CK(REF_CLK), .RN(RST), .Q(counter[4])
         );
  DFFRQX2M counter_reg_3_ ( .D(N106), .CK(REF_CLK), .RN(RST), .Q(counter[3])
         );
  DFFRQX2M counter_reg_2_ ( .D(N105), .CK(REF_CLK), .RN(RST), .Q(counter[2])
         );
  CLKXOR2X2M U3 ( .A(DIV_RATIO[6]), .B(n5), .Y(n1) );
  OR2X2M U4 ( .A(n15), .B(n7), .Y(n14) );
  MX2X2M U5 ( .A(1'b0), .B(N119), .S0(CLK_EN), .Y(O_DIV_CLK) );
  MX2X2M U6 ( .A(div_clk_reg), .B(REF_CLK), .S0(N7), .Y(N119) );
  NAND2BX1M U7 ( .AN(DIV_RATIO[2]), .B(n19), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(DIV_RATIO[1]), .A1N(DIV_RATIO[2]), .B0(n2), .Y(N19) );
  OR2X1M U9 ( .A(n2), .B(DIV_RATIO[3]), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(DIV_RATIO[3]), .B0(n3), .Y(N20) );
  OR2X1M U11 ( .A(n3), .B(DIV_RATIO[4]), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(DIV_RATIO[4]), .B0(n4), .Y(N21) );
  OR2X1M U13 ( .A(n4), .B(DIV_RATIO[5]), .Y(n5) );
  OAI2BB1X1M U14 ( .A0N(n4), .A1N(DIV_RATIO[5]), .B0(n5), .Y(N22) );
  NOR3X1M U15 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n5), .Y(N25) );
  OAI21X1M U16 ( .A0(DIV_RATIO[6]), .A1(n5), .B0(DIV_RATIO[7]), .Y(n6) );
  NAND2BX1M U17 ( .AN(N25), .B(n6), .Y(N24) );
  NOR2X1M U18 ( .A(n7), .B(n8), .Y(n28) );
  MXI2X1M U19 ( .A(n9), .B(n10), .S0(odd_flag), .Y(n8) );
  CLKNAND2X2M U20 ( .A(DIV_RATIO[0]), .B(n11), .Y(n10) );
  NOR2BX1M U21 ( .AN(DIV_RATIO[0]), .B(n12), .Y(n9) );
  MXI2X1M U22 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n27) );
  NAND2BX1M U23 ( .AN(n7), .B(n15), .Y(n13) );
  CLKINVX1M U24 ( .A(n16), .Y(N7) );
  NOR2BX1M U25 ( .AN(N35), .B(n14), .Y(N110) );
  NOR2BX1M U26 ( .AN(N34), .B(n14), .Y(N109) );
  NOR2BX1M U27 ( .AN(N33), .B(n14), .Y(N108) );
  NOR2BX1M U28 ( .AN(N32), .B(n14), .Y(N107) );
  NOR2BX1M U29 ( .AN(N31), .B(n14), .Y(N106) );
  NOR2BX1M U30 ( .AN(N30), .B(n14), .Y(N105) );
  NOR2BX1M U31 ( .AN(N29), .B(n14), .Y(N104) );
  NOR2BX1M U32 ( .AN(N28), .B(n14), .Y(N103) );
  CLKNAND2X2M U33 ( .A(CLK_EN), .B(n16), .Y(n7) );
  NAND4X1M U34 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  NOR4X1M U35 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n20) );
  MXI2X1M U36 ( .A(n12), .B(n21), .S0(n22), .Y(n15) );
  AND2X1M U37 ( .A(DIV_RATIO[0]), .B(odd_flag), .Y(n22) );
  CLKINVX1M U38 ( .A(n11), .Y(n21) );
  OAI211X1M U39 ( .A0(DIV_RATIO[7]), .A1(n23), .B0(n24), .C0(n25), .Y(n11) );
  OAI21X1M U40 ( .A0(counter[5]), .A1(n26), .B0(n29), .Y(n24) );
  AOI21X1M U41 ( .A0(DIV_RATIO[7]), .A1(n23), .B0(n30), .Y(n29) );
  AOI221XLM U42 ( .A0(counter[4]), .A1(n31), .B0(counter[5]), .B1(n26), .C0(
        n32), .Y(n30) );
  AOI221XLM U43 ( .A0(DIV_RATIO[4]), .A1(n33), .B0(DIV_RATIO[5]), .B1(n34), 
        .C0(n35), .Y(n32) );
  AOI221XLM U44 ( .A0(counter[2]), .A1(n18), .B0(counter[3]), .B1(n36), .C0(
        n37), .Y(n35) );
  AOI221XLM U45 ( .A0(DIV_RATIO[3]), .A1(n38), .B0(DIV_RATIO[2]), .B1(n39), 
        .C0(n40), .Y(n37) );
  AOI211X1M U46 ( .A0(counter[1]), .A1(n17), .B0(n19), .C0(counter[0]), .Y(n40) );
  CLKINVX1M U47 ( .A(DIV_RATIO[1]), .Y(n19) );
  CLKINVX1M U48 ( .A(DIV_RATIO[2]), .Y(n17) );
  CLKINVX1M U49 ( .A(DIV_RATIO[4]), .Y(n36) );
  CLKINVX1M U50 ( .A(DIV_RATIO[3]), .Y(n18) );
  CLKINVX1M U51 ( .A(DIV_RATIO[5]), .Y(n31) );
  CLKINVX1M U52 ( .A(DIV_RATIO[6]), .Y(n26) );
  AOI2B1X1M U53 ( .A1N(N25), .A0(counter[7]), .B0(n41), .Y(n12) );
  AOI221XLM U54 ( .A0(n23), .A1(N24), .B0(n25), .B1(N25), .C0(n42), .Y(n41) );
  OA22X1M U55 ( .A0(n43), .A1(n44), .B0(N24), .B1(n23), .Y(n42) );
  NOR2X1M U56 ( .A(counter[5]), .B(n1), .Y(n44) );
  AOI221XLM U57 ( .A0(counter[4]), .A1(n45), .B0(counter[5]), .B1(n1), .C0(n46), .Y(n43) );
  AOI221XLM U58 ( .A0(N21), .A1(n33), .B0(N22), .B1(n34), .C0(n47), .Y(n46) );
  AOI222X1M U59 ( .A0(counter[2]), .A1(n48), .B0(n49), .B1(n50), .C0(
        counter[3]), .C1(n51), .Y(n47) );
  CLKINVX1M U60 ( .A(N21), .Y(n51) );
  OAI211X1M U61 ( .A0(N19), .A1(n39), .B0(n52), .C0(n19), .Y(n50) );
  CLKINVX1M U62 ( .A(counter[0]), .Y(n52) );
  AOI22X1M U63 ( .A0(N20), .A1(n38), .B0(N19), .B1(n39), .Y(n49) );
  CLKINVX1M U64 ( .A(counter[1]), .Y(n39) );
  CLKINVX1M U65 ( .A(counter[2]), .Y(n38) );
  CLKINVX1M U66 ( .A(N20), .Y(n48) );
  CLKINVX1M U67 ( .A(counter[4]), .Y(n34) );
  CLKINVX1M U68 ( .A(counter[3]), .Y(n33) );
  CLKINVX1M U69 ( .A(N22), .Y(n45) );
  CLKINVX1M U70 ( .A(counter[7]), .Y(n25) );
  CLKINVX1M U71 ( .A(counter[6]), .Y(n23) );
endmodule


module INT_CLK_DIV_1_DW01_inc_0 ( A, SUM );
  input [7:0] A;
  output [7:0] SUM;

  wire   [7:2] carry;

  ADDHX1M U1_1_6 ( .A(A[6]), .B(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  ADDHX1M U1_1_1 ( .A(A[1]), .B(A[0]), .CO(carry[2]), .S(SUM[1]) );
  ADDHX1M U1_1_4 ( .A(A[4]), .B(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  ADDHX1M U1_1_3 ( .A(A[3]), .B(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  ADDHX1M U1_1_2 ( .A(A[2]), .B(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  ADDHX1M U1_1_5 ( .A(A[5]), .B(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  INVX2M U1 ( .A(A[0]), .Y(SUM[0]) );
  CLKXOR2X2M U2 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
endmodule


module INT_CLK_DIV_1 ( REF_CLK, RST, CLK_EN, DIV_RATIO, O_DIV_CLK );
  input [7:0] DIV_RATIO;
  input REF_CLK, RST, CLK_EN;
  output O_DIV_CLK;
  wire   N7, div_clk_reg, odd_flag, N19, N20, N21, N22, N24, N25, N28, N29,
         N30, N31, N32, N33, N34, N35, N103, N104, N105, N106, N107, N108,
         N109, N110, N119, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42,
         n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54;
  wire   [7:0] counter;

  INT_CLK_DIV_1_DW01_inc_0 r84 ( .A(counter), .SUM({N35, N34, N33, N32, N31, 
        N30, N29, N28}) );
  DFFRQX2M div_clk_reg_reg ( .D(n54), .CK(REF_CLK), .RN(RST), .Q(div_clk_reg)
         );
  DFFRQX2M odd_flag_reg ( .D(n53), .CK(REF_CLK), .RN(RST), .Q(odd_flag) );
  DFFRQX2M counter_reg_7_ ( .D(N110), .CK(REF_CLK), .RN(RST), .Q(counter[7])
         );
  DFFRQX2M counter_reg_6_ ( .D(N109), .CK(REF_CLK), .RN(RST), .Q(counter[6])
         );
  DFFRQX2M counter_reg_5_ ( .D(N108), .CK(REF_CLK), .RN(RST), .Q(counter[5])
         );
  DFFRQX2M counter_reg_0_ ( .D(N103), .CK(REF_CLK), .RN(RST), .Q(counter[0])
         );
  DFFRQX2M counter_reg_1_ ( .D(N104), .CK(REF_CLK), .RN(RST), .Q(counter[1])
         );
  DFFRQX2M counter_reg_4_ ( .D(N107), .CK(REF_CLK), .RN(RST), .Q(counter[4])
         );
  DFFRQX2M counter_reg_3_ ( .D(N106), .CK(REF_CLK), .RN(RST), .Q(counter[3])
         );
  DFFRQX2M counter_reg_2_ ( .D(N105), .CK(REF_CLK), .RN(RST), .Q(counter[2])
         );
  CLKXOR2X2M U3 ( .A(DIV_RATIO[6]), .B(n5), .Y(n1) );
  OR2X2M U4 ( .A(n15), .B(n7), .Y(n14) );
  MX2X2M U5 ( .A(1'b0), .B(N119), .S0(CLK_EN), .Y(O_DIV_CLK) );
  MX2X2M U6 ( .A(div_clk_reg), .B(REF_CLK), .S0(N7), .Y(N119) );
  NAND2BX1M U7 ( .AN(DIV_RATIO[2]), .B(n19), .Y(n2) );
  OAI2BB1X1M U8 ( .A0N(DIV_RATIO[1]), .A1N(DIV_RATIO[2]), .B0(n2), .Y(N19) );
  OR2X1M U9 ( .A(n2), .B(DIV_RATIO[3]), .Y(n3) );
  OAI2BB1X1M U10 ( .A0N(n2), .A1N(DIV_RATIO[3]), .B0(n3), .Y(N20) );
  OR2X1M U11 ( .A(n3), .B(DIV_RATIO[4]), .Y(n4) );
  OAI2BB1X1M U12 ( .A0N(n3), .A1N(DIV_RATIO[4]), .B0(n4), .Y(N21) );
  OR2X1M U13 ( .A(n4), .B(DIV_RATIO[5]), .Y(n5) );
  OAI2BB1X1M U14 ( .A0N(n4), .A1N(DIV_RATIO[5]), .B0(n5), .Y(N22) );
  NOR3X1M U15 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n5), .Y(N25) );
  OAI21X1M U16 ( .A0(DIV_RATIO[6]), .A1(n5), .B0(DIV_RATIO[7]), .Y(n6) );
  NAND2BX1M U17 ( .AN(N25), .B(n6), .Y(N24) );
  NOR2X1M U18 ( .A(n7), .B(n8), .Y(n53) );
  MXI2X1M U19 ( .A(n9), .B(n10), .S0(odd_flag), .Y(n8) );
  CLKNAND2X2M U20 ( .A(DIV_RATIO[0]), .B(n11), .Y(n10) );
  NOR2BX1M U21 ( .AN(DIV_RATIO[0]), .B(n12), .Y(n9) );
  MXI2X1M U22 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n54) );
  NAND2BX1M U23 ( .AN(n7), .B(n15), .Y(n13) );
  CLKINVX1M U24 ( .A(n16), .Y(N7) );
  NOR2BX1M U25 ( .AN(N35), .B(n14), .Y(N110) );
  NOR2BX1M U26 ( .AN(N34), .B(n14), .Y(N109) );
  NOR2BX1M U27 ( .AN(N33), .B(n14), .Y(N108) );
  NOR2BX1M U28 ( .AN(N32), .B(n14), .Y(N107) );
  NOR2BX1M U29 ( .AN(N31), .B(n14), .Y(N106) );
  NOR2BX1M U30 ( .AN(N30), .B(n14), .Y(N105) );
  NOR2BX1M U31 ( .AN(N29), .B(n14), .Y(N104) );
  NOR2BX1M U32 ( .AN(N28), .B(n14), .Y(N103) );
  CLKNAND2X2M U33 ( .A(CLK_EN), .B(n16), .Y(n7) );
  NAND4X1M U34 ( .A(n17), .B(n18), .C(n19), .D(n20), .Y(n16) );
  NOR4X1M U35 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n20) );
  MXI2X1M U36 ( .A(n12), .B(n21), .S0(n22), .Y(n15) );
  AND2X1M U37 ( .A(DIV_RATIO[0]), .B(odd_flag), .Y(n22) );
  CLKINVX1M U38 ( .A(n11), .Y(n21) );
  OAI211X1M U39 ( .A0(DIV_RATIO[7]), .A1(n23), .B0(n24), .C0(n25), .Y(n11) );
  OAI21X1M U40 ( .A0(counter[5]), .A1(n26), .B0(n29), .Y(n24) );
  AOI21X1M U41 ( .A0(DIV_RATIO[7]), .A1(n23), .B0(n30), .Y(n29) );
  AOI221XLM U42 ( .A0(counter[4]), .A1(n31), .B0(counter[5]), .B1(n26), .C0(
        n32), .Y(n30) );
  AOI221XLM U43 ( .A0(DIV_RATIO[4]), .A1(n33), .B0(DIV_RATIO[5]), .B1(n34), 
        .C0(n35), .Y(n32) );
  AOI221XLM U44 ( .A0(counter[2]), .A1(n18), .B0(counter[3]), .B1(n36), .C0(
        n37), .Y(n35) );
  AOI221XLM U45 ( .A0(DIV_RATIO[3]), .A1(n38), .B0(DIV_RATIO[2]), .B1(n39), 
        .C0(n40), .Y(n37) );
  AOI211X1M U46 ( .A0(counter[1]), .A1(n17), .B0(n19), .C0(counter[0]), .Y(n40) );
  CLKINVX1M U47 ( .A(DIV_RATIO[1]), .Y(n19) );
  CLKINVX1M U48 ( .A(DIV_RATIO[2]), .Y(n17) );
  CLKINVX1M U49 ( .A(DIV_RATIO[4]), .Y(n36) );
  CLKINVX1M U50 ( .A(DIV_RATIO[3]), .Y(n18) );
  CLKINVX1M U51 ( .A(DIV_RATIO[5]), .Y(n31) );
  CLKINVX1M U52 ( .A(DIV_RATIO[6]), .Y(n26) );
  AOI2B1X1M U53 ( .A1N(N25), .A0(counter[7]), .B0(n41), .Y(n12) );
  AOI221XLM U54 ( .A0(n23), .A1(N24), .B0(n25), .B1(N25), .C0(n42), .Y(n41) );
  OA22X1M U55 ( .A0(n43), .A1(n44), .B0(N24), .B1(n23), .Y(n42) );
  NOR2X1M U56 ( .A(counter[5]), .B(n1), .Y(n44) );
  AOI221XLM U57 ( .A0(counter[4]), .A1(n45), .B0(counter[5]), .B1(n1), .C0(n46), .Y(n43) );
  AOI221XLM U58 ( .A0(N21), .A1(n33), .B0(N22), .B1(n34), .C0(n47), .Y(n46) );
  AOI222X1M U59 ( .A0(counter[2]), .A1(n48), .B0(n49), .B1(n50), .C0(
        counter[3]), .C1(n51), .Y(n47) );
  CLKINVX1M U60 ( .A(N21), .Y(n51) );
  OAI211X1M U61 ( .A0(N19), .A1(n39), .B0(n52), .C0(n19), .Y(n50) );
  CLKINVX1M U62 ( .A(counter[0]), .Y(n52) );
  AOI22X1M U63 ( .A0(N20), .A1(n38), .B0(N19), .B1(n39), .Y(n49) );
  CLKINVX1M U64 ( .A(counter[1]), .Y(n39) );
  CLKINVX1M U65 ( .A(counter[2]), .Y(n38) );
  CLKINVX1M U66 ( .A(N20), .Y(n48) );
  CLKINVX1M U67 ( .A(counter[4]), .Y(n34) );
  CLKINVX1M U68 ( .A(counter[3]), .Y(n33) );
  CLKINVX1M U69 ( .A(N22), .Y(n45) );
  CLKINVX1M U70 ( .A(counter[7]), .Y(n25) );
  CLKINVX1M U71 ( .A(counter[6]), .Y(n23) );
endmodule


module PULSE_GEN ( clk, rst, lvl_sig, pulse_sig );
  input clk, rst, lvl_sig;
  output pulse_sig;
  wire   pls_flop, rcv_flop;

  DFFRQX2M rcv_flop_reg ( .D(lvl_sig), .CK(clk), .RN(rst), .Q(rcv_flop) );
  DFFRQX2M pls_flop_reg ( .D(rcv_flop), .CK(clk), .RN(rst), .Q(pls_flop) );
  NOR2BX2M U3 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module FSM ( DATA_VALID, PAR_EN, SER_DONE, RST, CLK, MUX_SEL, BUSY, LOAD, 
        SER_EN );
  output [2:0] MUX_SEL;
  input DATA_VALID, PAR_EN, SER_DONE, RST, CLK;
  output BUSY, LOAD, SER_EN;
  wire   n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n1, n2;
  wire   [2:0] current_st;

  DFFRQX2M current_st_reg_2_ ( .D(n10), .CK(CLK), .RN(RST), .Q(current_st[2])
         );
  DFFRQX2M current_st_reg_0_ ( .D(n12), .CK(CLK), .RN(RST), .Q(current_st[0])
         );
  DFFRQX2M current_st_reg_1_ ( .D(n11), .CK(CLK), .RN(RST), .Q(current_st[1])
         );
  NAND2X2M U3 ( .A(n8), .B(n2), .Y(MUX_SEL[0]) );
  NOR2X2M U4 ( .A(SER_DONE), .B(n5), .Y(SER_EN) );
  NAND2X2M U5 ( .A(MUX_SEL[0]), .B(n6), .Y(BUSY) );
  AOI21BX2M U6 ( .A0(n8), .A1(n2), .B0N(n6), .Y(MUX_SEL[2]) );
  NAND2X2M U7 ( .A(current_st[0]), .B(current_st[1]), .Y(n6) );
  INVX2M U8 ( .A(current_st[2]), .Y(n2) );
  CLKXOR2X2M U9 ( .A(current_st[0]), .B(current_st[1]), .Y(n8) );
  NAND2X2M U10 ( .A(n9), .B(current_st[0]), .Y(MUX_SEL[1]) );
  CLKXOR2X2M U11 ( .A(current_st[1]), .B(n2), .Y(n9) );
  NOR3X2M U12 ( .A(n1), .B(current_st[2]), .C(current_st[1]), .Y(LOAD) );
  NAND3X2M U13 ( .A(n1), .B(n2), .C(current_st[1]), .Y(n5) );
  INVX2M U14 ( .A(current_st[0]), .Y(n1) );
  OAI21BX1M U15 ( .A0(current_st[1]), .A1(DATA_VALID), .B0N(SER_EN), .Y(n4) );
  OAI21X2M U16 ( .A0(current_st[2]), .A1(n6), .B0(MUX_SEL[0]), .Y(n11) );
  AOI21X2M U17 ( .A0(n5), .A1(n7), .B0(n4), .Y(n12) );
  OR2X2M U18 ( .A(n8), .B(current_st[2]), .Y(n7) );
  NOR2BX2M U19 ( .AN(n3), .B(n4), .Y(n10) );
  OAI22X1M U20 ( .A0(PAR_EN), .A1(n5), .B0(current_st[2]), .B1(n6), .Y(n3) );
endmodule


module SERIALIZER ( CLK, RST, LOAD, P_DATA, SER_EN, SER_DONE, SER_DATA );
  input [7:0] P_DATA;
  input CLK, RST, LOAD, SER_EN;
  output SER_DONE, SER_DATA;
  wire   n2, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n1, n3, n4, n28, n29;
  wire   [7:1] shift_reg;
  wire   [1:0] counter;

  DFFSQX2M shift_reg_reg_7_ ( .D(n17), .CK(CLK), .SN(RST), .Q(shift_reg[7]) );
  DFFSQX2M shift_reg_reg_6_ ( .D(n18), .CK(CLK), .SN(RST), .Q(shift_reg[6]) );
  DFFSQX2M shift_reg_reg_5_ ( .D(n19), .CK(CLK), .SN(RST), .Q(shift_reg[5]) );
  DFFSQX2M shift_reg_reg_4_ ( .D(n20), .CK(CLK), .SN(RST), .Q(shift_reg[4]) );
  DFFSQX2M shift_reg_reg_3_ ( .D(n21), .CK(CLK), .SN(RST), .Q(shift_reg[3]) );
  DFFSQX2M shift_reg_reg_2_ ( .D(n22), .CK(CLK), .SN(RST), .Q(shift_reg[2]) );
  DFFSQX2M shift_reg_reg_1_ ( .D(n23), .CK(CLK), .SN(RST), .Q(shift_reg[1]) );
  DFFRQX2M counter_reg_1_ ( .D(n25), .CK(CLK), .RN(RST), .Q(counter[1]) );
  DFFRQX2M counter_reg_0_ ( .D(n27), .CK(CLK), .RN(RST), .Q(counter[0]) );
  DFFRX1M counter_reg_2_ ( .D(n26), .CK(CLK), .RN(RST), .QN(n2) );
  DFFSQX2M shift_reg_reg_0_ ( .D(n24), .CK(CLK), .SN(RST), .Q(SER_DATA) );
  NOR2X2M U3 ( .A(n1), .B(n3), .Y(n5) );
  INVX2M U4 ( .A(n3), .Y(n4) );
  BUFX2M U5 ( .A(n7), .Y(n3) );
  NOR3BX2M U6 ( .AN(SER_EN), .B(SER_DONE), .C(n1), .Y(n7) );
  AOI21X2M U7 ( .A0(n28), .A1(n3), .B0(n5), .Y(n15) );
  BUFX2M U8 ( .A(LOAD), .Y(n1) );
  OAI32X1M U9 ( .A0(n4), .A1(counter[1]), .A2(n28), .B0(n15), .B1(n29), .Y(n25) );
  OAI32X1M U10 ( .A0(n4), .A1(n28), .A2(n29), .B0(n16), .B1(n2), .Y(n26) );
  AND2X2M U11 ( .A(n15), .B(n4), .Y(n16) );
  NOR3X2M U12 ( .A(n29), .B(n28), .C(n2), .Y(SER_DONE) );
  OAI2BB2X1M U13 ( .B0(counter[0]), .B1(n4), .A0N(counter[0]), .A1N(n5), .Y(
        n27) );
  OAI2BB1X2M U14 ( .A0N(n5), .A1N(shift_reg[6]), .B0(n8), .Y(n18) );
  AOI22X1M U15 ( .A0(P_DATA[6]), .A1(n1), .B0(n3), .B1(shift_reg[7]), .Y(n8)
         );
  INVX2M U16 ( .A(counter[0]), .Y(n28) );
  OAI2BB1X2M U17 ( .A0N(n5), .A1N(shift_reg[2]), .B0(n12), .Y(n22) );
  AOI22X1M U18 ( .A0(P_DATA[2]), .A1(n1), .B0(shift_reg[3]), .B1(n3), .Y(n12)
         );
  OAI2BB1X2M U19 ( .A0N(n5), .A1N(shift_reg[3]), .B0(n11), .Y(n21) );
  AOI22X1M U20 ( .A0(P_DATA[3]), .A1(n1), .B0(shift_reg[4]), .B1(n3), .Y(n11)
         );
  OAI2BB1X2M U21 ( .A0N(n5), .A1N(shift_reg[7]), .B0(n6), .Y(n17) );
  AOI21X2M U22 ( .A0(P_DATA[7]), .A1(n1), .B0(n3), .Y(n6) );
  OAI2BB1X2M U23 ( .A0N(SER_DATA), .A1N(n5), .B0(n14), .Y(n24) );
  AOI22X1M U24 ( .A0(P_DATA[0]), .A1(n1), .B0(shift_reg[1]), .B1(n3), .Y(n14)
         );
  OAI2BB1X2M U25 ( .A0N(n5), .A1N(shift_reg[4]), .B0(n10), .Y(n20) );
  AOI22X1M U26 ( .A0(P_DATA[4]), .A1(n1), .B0(shift_reg[5]), .B1(n3), .Y(n10)
         );
  OAI2BB1X2M U27 ( .A0N(n5), .A1N(shift_reg[1]), .B0(n13), .Y(n23) );
  AOI22X1M U28 ( .A0(P_DATA[1]), .A1(n1), .B0(shift_reg[2]), .B1(n3), .Y(n13)
         );
  OAI2BB1X2M U29 ( .A0N(n5), .A1N(shift_reg[5]), .B0(n9), .Y(n19) );
  AOI22X1M U30 ( .A0(P_DATA[5]), .A1(n1), .B0(shift_reg[6]), .B1(n3), .Y(n9)
         );
  INVX2M U31 ( .A(counter[1]), .Y(n29) );
endmodule


module Parity_Calc ( CLK, RST, LOAD, P_DATA, PAR_TYP, PAR_BIT );
  input [7:0] P_DATA;
  input CLK, RST, LOAD, PAR_TYP;
  output PAR_BIT;
  wire   n1, n3, n4, n5, n6, n7, n2;

  DFFRQX2M PAR_BIT_reg ( .D(n7), .CK(CLK), .RN(RST), .Q(PAR_BIT) );
  XNOR2X2M U2 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  XOR3XLM U3 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U4 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(PAR_BIT), .A1N(n2), .Y(n7) );
  INVX2M U6 ( .A(LOAD), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX4x1 ( START_BIT, STOP_BIT, SER_DATA, PAR_BIT, RST, MUX_SEL, TX_OUT
 );
  input [2:0] MUX_SEL;
  input START_BIT, STOP_BIT, SER_DATA, PAR_BIT, RST;
  output TX_OUT;
  wire   n2, n3, n4, n1;

  OAI2B11X4M U2 ( .A1N(MUX_SEL[1]), .A0(n2), .B0(RST), .C0(n3), .Y(TX_OUT) );
  INVX2M U3 ( .A(MUX_SEL[0]), .Y(n1) );
  AOI2BB1X2M U4 ( .A0N(n4), .A1N(MUX_SEL[1]), .B0(MUX_SEL[2]), .Y(n3) );
  AOI22X1M U5 ( .A0(SER_DATA), .A1(n1), .B0(PAR_BIT), .B1(MUX_SEL[0]), .Y(n2)
         );
  AOI22X1M U6 ( .A0(START_BIT), .A1(n1), .B0(STOP_BIT), .B1(MUX_SEL[0]), .Y(n4) );
endmodule


module UART_TX_TOP ( CLK, RST, DATA_VALID, PAR_EN, PAR_TYP, P_DATA, TX_OUT, 
        BUSY );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP;
  output TX_OUT, BUSY;
  wire   SER_DONE, LOAD, SER_EN, SER_DATA, PAR_BIT;
  wire   [2:0] MUX_SEL;

  FSM U_FSM ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .SER_DONE(SER_DONE), 
        .RST(RST), .CLK(CLK), .MUX_SEL(MUX_SEL), .BUSY(BUSY), .LOAD(LOAD), 
        .SER_EN(SER_EN) );
  SERIALIZER U_SERIALIZER ( .CLK(CLK), .RST(RST), .LOAD(LOAD), .P_DATA(P_DATA), 
        .SER_EN(SER_EN), .SER_DONE(SER_DONE), .SER_DATA(SER_DATA) );
  Parity_Calc U_PARITY ( .CLK(CLK), .RST(RST), .LOAD(LOAD), .P_DATA(P_DATA), 
        .PAR_TYP(PAR_TYP), .PAR_BIT(PAR_BIT) );
  MUX4x1 U_MUX ( .START_BIT(1'b0), .STOP_BIT(1'b1), .SER_DATA(SER_DATA), 
        .PAR_BIT(PAR_BIT), .RST(RST), .MUX_SEL(MUX_SEL), .TX_OUT(TX_OUT) );
endmodule


module uart_rx_fsm ( CLK, RST, RX_IN, PAR_EN, sample_valid, strt_glitch, 
        par_err, stp_err, bit_cnt, dat_samp_en, deser_en, strt_chk_en, 
        par_chk_en, stp_chk_en, enable, data_valid );
  input [3:0] bit_cnt;
  input CLK, RST, RX_IN, PAR_EN, sample_valid, strt_glitch, par_err, stp_err;
  output dat_samp_en, deser_en, strt_chk_en, par_chk_en, stp_chk_en, enable,
         data_valid;
  wire   parity_error, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18,
         n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n30, n31, n32, n1,
         n2, n3, n4, n6, n7, n29;
  wire   [2:0] Current_st;

  DFFRQX2M parity_error_reg ( .D(n2), .CK(CLK), .RN(RST), .Q(parity_error) );
  DFFRQX2M Current_st_reg_2_ ( .D(n31), .CK(CLK), .RN(RST), .Q(Current_st[2])
         );
  DFFRQX2M Current_st_reg_1_ ( .D(n30), .CK(CLK), .RN(RST), .Q(Current_st[1])
         );
  DFFRQX2M Current_st_reg_0_ ( .D(n32), .CK(CLK), .RN(RST), .Q(Current_st[0])
         );
  OAI22X1M U3 ( .A0(n4), .A1(n15), .B0(n13), .B1(n29), .Y(n31) );
  NOR2X2M U4 ( .A(n7), .B(n4), .Y(n13) );
  NAND2X2M U5 ( .A(n27), .B(n26), .Y(dat_samp_en) );
  NAND2X2M U6 ( .A(n25), .B(n6), .Y(n11) );
  INVX2M U7 ( .A(n28), .Y(n7) );
  NOR2X2M U8 ( .A(n24), .B(n6), .Y(n12) );
  NOR2X2M U9 ( .A(n8), .B(n3), .Y(strt_chk_en) );
  AOI2B1X1M U10 ( .A1N(n16), .A0(n7), .B0(n12), .Y(n15) );
  NAND2BX2M U11 ( .AN(n24), .B(n6), .Y(n26) );
  NOR2X2M U12 ( .A(n26), .B(n3), .Y(stp_chk_en) );
  INVX2M U13 ( .A(n10), .Y(par_chk_en) );
  NOR4BX1M U14 ( .AN(n8), .B(n1), .C(n12), .D(n7), .Y(n27) );
  NOR2X2M U15 ( .A(RX_IN), .B(n11), .Y(n1) );
  OAI221X1M U16 ( .A0(n4), .A1(n17), .B0(n18), .B1(n6), .C0(n14), .Y(n32) );
  AOI21BX2M U17 ( .A0(PAR_EN), .A1(n7), .B0N(n11), .Y(n17) );
  AOI21X2M U18 ( .A0(n7), .A1(n16), .B0(n4), .Y(n18) );
  AOI22X1M U19 ( .A0(Current_st[0]), .A1(n24), .B0(n23), .B1(n6), .Y(n21) );
  OAI21X2M U20 ( .A0(sample_valid), .A1(n26), .B0(n27), .Y(enable) );
  OAI2B11X2M U21 ( .A1N(Current_st[1]), .A0(n13), .B0(n14), .C0(n15), .Y(n30)
         );
  INVX2M U22 ( .A(n19), .Y(n4) );
  OAI31X1M U23 ( .A0(n20), .A1(n7), .A2(n21), .B0(n22), .Y(n19) );
  NAND2X2M U24 ( .A(n26), .B(n8), .Y(n20) );
  OAI21X2M U25 ( .A0(Current_st[0]), .A1(n23), .B0(sample_valid), .Y(n22) );
  NAND2X2M U26 ( .A(RX_IN), .B(n25), .Y(n23) );
  OR3X2M U27 ( .A(strt_glitch), .B(n4), .C(n8), .Y(n14) );
  NOR2X2M U28 ( .A(Current_st[1]), .B(Current_st[2]), .Y(n25) );
  NAND3X2M U29 ( .A(Current_st[0]), .B(n29), .C(Current_st[1]), .Y(n28) );
  INVX2M U30 ( .A(Current_st[0]), .Y(n6) );
  INVX2M U31 ( .A(Current_st[2]), .Y(n29) );
  NOR2X2M U32 ( .A(n3), .B(n28), .Y(deser_en) );
  NAND4BBX1M U33 ( .AN(bit_cnt[2]), .BN(bit_cnt[1]), .C(bit_cnt[3]), .D(
        bit_cnt[0]), .Y(n16) );
  NAND2X2M U34 ( .A(Current_st[0]), .B(n25), .Y(n8) );
  INVX2M U35 ( .A(sample_valid), .Y(n3) );
  NAND2X2M U36 ( .A(Current_st[2]), .B(Current_st[1]), .Y(n24) );
  NAND2X2M U37 ( .A(n12), .B(sample_valid), .Y(n10) );
  INVX2M U38 ( .A(n9), .Y(n2) );
  AOI32X1M U39 ( .A0(parity_error), .A1(n10), .A2(n11), .B0(par_chk_en), .B1(
        par_err), .Y(n9) );
  NOR3BX2M U40 ( .AN(stp_chk_en), .B(stp_err), .C(parity_error), .Y(data_valid) );
endmodule


module edge_bit_counter ( CLK, RST, Prescale, enable, edge_cnt, bit_cnt );
  input [5:0] Prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable;
  wire   N7, N8, N9, N10, N11, N12, N13, N20, N21, N22, N23, N36, N37, N38,
         N39, N40, N41, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n1, n2,
         n3, n4, n5, n6, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29;
  wire   [5:2] add_35_carry;

  DFFRQX2M bit_cnt_reg_3_ ( .D(n16), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  DFFRQX2M bit_cnt_reg_1_ ( .D(n14), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  DFFRQX2M bit_cnt_reg_2_ ( .D(n13), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  DFFRQX2M bit_cnt_reg_0_ ( .D(n15), .CK(CLK), .RN(RST), .Q(bit_cnt[0]) );
  DFFRQX2M edge_cnt_reg_5_ ( .D(N41), .CK(CLK), .RN(RST), .Q(edge_cnt[5]) );
  DFFRQX2M edge_cnt_reg_3_ ( .D(N39), .CK(CLK), .RN(RST), .Q(edge_cnt[3]) );
  DFFRQX2M edge_cnt_reg_2_ ( .D(N38), .CK(CLK), .RN(RST), .Q(edge_cnt[2]) );
  DFFRQX2M edge_cnt_reg_0_ ( .D(N36), .CK(CLK), .RN(RST), .Q(edge_cnt[0]) );
  DFFRQX2M edge_cnt_reg_1_ ( .D(N37), .CK(CLK), .RN(RST), .Q(edge_cnt[1]) );
  DFFRQX2M edge_cnt_reg_4_ ( .D(N40), .CK(CLK), .RN(RST), .Q(edge_cnt[4]) );
  ADDHX1M add_35_U1_1_4 ( .A(edge_cnt[4]), .B(add_35_carry[4]), .CO(
        add_35_carry[5]), .S(N23) );
  ADDHX1M add_35_U1_1_3 ( .A(edge_cnt[3]), .B(add_35_carry[3]), .CO(
        add_35_carry[4]), .S(N22) );
  ADDHX1M add_35_U1_1_2 ( .A(edge_cnt[2]), .B(add_35_carry[2]), .CO(
        add_35_carry[3]), .S(N21) );
  ADDHX1M add_35_U1_1_1 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(
        add_35_carry[2]), .S(N20) );
  INVX2M U3 ( .A(n10), .Y(n26) );
  NOR2X2M U4 ( .A(n27), .B(N13), .Y(n10) );
  NOR2BX2M U5 ( .AN(N20), .B(n26), .Y(N37) );
  NOR2BX2M U6 ( .AN(N21), .B(n26), .Y(N38) );
  NOR2BX2M U7 ( .AN(N22), .B(n26), .Y(N39) );
  NOR2BX2M U8 ( .AN(N23), .B(n26), .Y(N40) );
  OAI32X1M U9 ( .A0(n27), .A1(bit_cnt[0]), .A2(n10), .B0(n28), .B1(n26), .Y(
        n15) );
  INVX2M U10 ( .A(enable), .Y(n27) );
  OAI22X1M U11 ( .A0(n29), .A1(n26), .B0(n9), .B1(n27), .Y(n14) );
  AOI32X1M U12 ( .A0(n26), .A1(n29), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n28), .Y(n9) );
  INVX2M U13 ( .A(bit_cnt[1]), .Y(n29) );
  NOR2X2M U14 ( .A(n1), .B(n26), .Y(N41) );
  XNOR2X2M U15 ( .A(add_35_carry[5]), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U16 ( .A(edge_cnt[0]), .B(n26), .Y(N36) );
  NOR2X2M U17 ( .A(n11), .B(n27), .Y(n16) );
  CLKXOR2X2M U18 ( .A(n12), .B(bit_cnt[3]), .Y(n11) );
  NAND2X2M U19 ( .A(n8), .B(bit_cnt[2]), .Y(n12) );
  NOR2X2M U20 ( .A(n7), .B(n27), .Y(n13) );
  XNOR2X2M U21 ( .A(n8), .B(bit_cnt[2]), .Y(n7) );
  AND3X2M U22 ( .A(N13), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n8) );
  INVX2M U23 ( .A(bit_cnt[0]), .Y(n28) );
  INVX2M U24 ( .A(Prescale[3]), .Y(n6) );
  INVX2M U25 ( .A(Prescale[0]), .Y(N7) );
  NAND2BX1M U26 ( .AN(Prescale[1]), .B(N7), .Y(n2) );
  OAI2BB1X1M U27 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N8) );
  NOR2X1M U28 ( .A(n2), .B(Prescale[2]), .Y(n3) );
  AO21XLM U29 ( .A0(n2), .A1(Prescale[2]), .B0(n3), .Y(N9) );
  CLKNAND2X2M U30 ( .A(n3), .B(n6), .Y(n4) );
  OAI21X1M U31 ( .A0(n3), .A1(n6), .B0(n4), .Y(N10) );
  XNOR2X1M U32 ( .A(Prescale[4]), .B(n4), .Y(N11) );
  NOR2X1M U33 ( .A(Prescale[4]), .B(n4), .Y(n5) );
  CLKXOR2X2M U34 ( .A(Prescale[5]), .B(n5), .Y(N12) );
  NOR2BX1M U35 ( .AN(edge_cnt[0]), .B(N7), .Y(n17) );
  OAI2B2X1M U36 ( .A1N(N8), .A0(n17), .B0(edge_cnt[1]), .B1(n17), .Y(n21) );
  NOR2BX1M U37 ( .AN(N7), .B(edge_cnt[0]), .Y(n18) );
  OAI2B2X1M U38 ( .A1N(edge_cnt[1]), .A0(n18), .B0(N8), .B1(n18), .Y(n20) );
  XNOR2X1M U39 ( .A(N12), .B(edge_cnt[5]), .Y(n19) );
  NAND3X1M U40 ( .A(n21), .B(n20), .C(n19), .Y(n25) );
  CLKXOR2X2M U41 ( .A(N11), .B(edge_cnt[4]), .Y(n24) );
  CLKXOR2X2M U42 ( .A(N9), .B(edge_cnt[2]), .Y(n23) );
  CLKXOR2X2M U43 ( .A(N10), .B(edge_cnt[3]), .Y(n22) );
  NOR4X1M U44 ( .A(n25), .B(n24), .C(n23), .D(n22), .Y(N13) );
endmodule


module data_sampling ( CLK, RST, RX_IN, Prescale, dat_samp_en, edge_cnt, 
        sample_valid, sampled_bit );
  input [5:0] Prescale;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, dat_samp_en;
  output sample_valid, sampled_bit;
  wire   sampled_ones_0_, N7, N8, N9, N10, N11, N12, N16, N17, N18, N19, N20,
         N23, N24, N25, N26, N27, N28, n27, n28, n29, n1, n2, n3, n4, n5, n6,
         n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51,
         n52, n53, n54;
  wire   [4:2] add_34_carry;

  DFFRX1M sampled_ones_reg_1_ ( .D(n28), .CK(CLK), .RN(RST), .Q(n53) );
  DFFRQX2M sampled_ones_reg_0_ ( .D(n29), .CK(CLK), .RN(RST), .Q(
        sampled_ones_0_) );
  DFFSQX2M sampled_bit_reg ( .D(n27), .CK(CLK), .SN(RST), .Q(sampled_bit) );
  DFFRQX2M sample_valid_reg ( .D(n54), .CK(CLK), .RN(RST), .Q(sample_valid) );
  ADDHX1M add_34_U1_1_4 ( .A(Prescale[5]), .B(add_34_carry[4]), .CO(N20), .S(
        N19) );
  ADDHX1M add_34_U1_1_1 ( .A(Prescale[2]), .B(Prescale[1]), .CO(
        add_34_carry[2]), .S(N16) );
  ADDHX1M add_34_U1_1_3 ( .A(Prescale[4]), .B(add_34_carry[3]), .CO(
        add_34_carry[4]), .S(N18) );
  ADDHX1M add_34_U1_1_2 ( .A(Prescale[3]), .B(add_34_carry[2]), .CO(
        add_34_carry[3]), .S(N17) );
  CLKXOR2X2M U3 ( .A(edge_cnt[0]), .B(Prescale[1]), .Y(n43) );
  INVX2M U4 ( .A(Prescale[3]), .Y(n8) );
  INVX2M U5 ( .A(Prescale[1]), .Y(N7) );
  INVX2M U6 ( .A(Prescale[0]), .Y(N23) );
  NAND2BX1M U7 ( .AN(Prescale[2]), .B(N7), .Y(n1) );
  OAI2BB1X1M U8 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n1), .Y(N8) );
  OR2X1M U9 ( .A(n1), .B(Prescale[3]), .Y(n2) );
  OAI2BB1X1M U10 ( .A0N(n1), .A1N(Prescale[3]), .B0(n2), .Y(N9) );
  XNOR2X1M U11 ( .A(Prescale[4]), .B(n2), .Y(N10) );
  NOR3X1M U12 ( .A(Prescale[4]), .B(Prescale[5]), .C(n2), .Y(N12) );
  OAI21X1M U13 ( .A0(Prescale[4]), .A1(n2), .B0(Prescale[5]), .Y(n3) );
  NAND2BX1M U14 ( .AN(N12), .B(n3), .Y(N11) );
  NAND2BX1M U15 ( .AN(Prescale[1]), .B(N23), .Y(n4) );
  OAI2BB1X1M U16 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n4), .Y(N24) );
  NOR2X1M U17 ( .A(n4), .B(Prescale[2]), .Y(n5) );
  AO21XLM U18 ( .A0(n4), .A1(Prescale[2]), .B0(n5), .Y(N25) );
  CLKNAND2X2M U19 ( .A(n5), .B(n8), .Y(n6) );
  OAI21X1M U20 ( .A0(n5), .A1(n8), .B0(n6), .Y(N26) );
  XNOR2X1M U21 ( .A(Prescale[4]), .B(n6), .Y(N27) );
  NOR2X1M U22 ( .A(Prescale[4]), .B(n6), .Y(n7) );
  CLKXOR2X2M U23 ( .A(Prescale[5]), .B(n7), .Y(N28) );
  MXI2X1M U24 ( .A(n9), .B(n10), .S0(sampled_ones_0_), .Y(n29) );
  CLKINVX1M U25 ( .A(n11), .Y(n10) );
  CLKNAND2X2M U26 ( .A(RX_IN), .B(n12), .Y(n9) );
  MXI2X1M U27 ( .A(n13), .B(n14), .S0(n53), .Y(n28) );
  AOI2BB1X1M U28 ( .A0N(sampled_ones_0_), .A1N(n15), .B0(n11), .Y(n14) );
  OAI32X1M U29 ( .A0(n16), .A1(n17), .A2(n18), .B0(RX_IN), .B1(n15), .Y(n11)
         );
  NAND3X1M U30 ( .A(RX_IN), .B(n12), .C(sampled_ones_0_), .Y(n13) );
  CLKINVX1M U31 ( .A(n15), .Y(n12) );
  CLKNAND2X2M U32 ( .A(dat_samp_en), .B(n18), .Y(n15) );
  CLKMX2X2M U33 ( .A(sampled_bit), .B(n53), .S0(n54), .Y(n27) );
  NOR3BX1M U34 ( .AN(n17), .B(n18), .C(n16), .Y(n54) );
  CLKINVX1M U35 ( .A(dat_samp_en), .Y(n16) );
  OAI211X1M U36 ( .A0(n19), .A1(n20), .B0(n21), .C0(n22), .Y(n18) );
  NAND4X1M U37 ( .A(n23), .B(n24), .C(n25), .D(n26), .Y(n22) );
  NOR3X1M U38 ( .A(n30), .B(edge_cnt[5]), .C(n31), .Y(n26) );
  CLKXOR2X2M U39 ( .A(edge_cnt[0]), .B(Prescale[1]), .Y(n31) );
  CLKXOR2X2M U40 ( .A(edge_cnt[4]), .B(Prescale[5]), .Y(n30) );
  XNOR2X1M U41 ( .A(edge_cnt[2]), .B(Prescale[3]), .Y(n25) );
  XNOR2X1M U42 ( .A(edge_cnt[3]), .B(Prescale[4]), .Y(n24) );
  XNOR2X1M U43 ( .A(edge_cnt[1]), .B(Prescale[2]), .Y(n23) );
  NAND4X1M U44 ( .A(n32), .B(n33), .C(n34), .D(n35), .Y(n21) );
  NOR3X1M U45 ( .A(n36), .B(n37), .C(n38), .Y(n35) );
  CLKXOR2X2M U46 ( .A(edge_cnt[4]), .B(N11), .Y(n38) );
  CLKXOR2X2M U47 ( .A(edge_cnt[0]), .B(N7), .Y(n37) );
  CLKXOR2X2M U48 ( .A(edge_cnt[5]), .B(N12), .Y(n36) );
  XNOR2X1M U49 ( .A(edge_cnt[2]), .B(N9), .Y(n34) );
  XNOR2X1M U50 ( .A(edge_cnt[3]), .B(N10), .Y(n33) );
  XNOR2X1M U51 ( .A(edge_cnt[1]), .B(N8), .Y(n32) );
  NAND3X1M U52 ( .A(n39), .B(n40), .C(n41), .Y(n20) );
  CLKXOR2X2M U53 ( .A(n42), .B(N19), .Y(n41) );
  CLKINVX1M U54 ( .A(edge_cnt[4]), .Y(n42) );
  XNOR2X1M U55 ( .A(edge_cnt[5]), .B(N20), .Y(n40) );
  XNOR2X1M U56 ( .A(edge_cnt[3]), .B(N18), .Y(n39) );
  NAND3X1M U57 ( .A(n43), .B(n44), .C(n45), .Y(n19) );
  XNOR2X1M U58 ( .A(edge_cnt[1]), .B(N16), .Y(n45) );
  XNOR2X1M U59 ( .A(edge_cnt[2]), .B(N17), .Y(n44) );
  AND4X1M U60 ( .A(n46), .B(n47), .C(n48), .D(n49), .Y(n17) );
  NOR3X1M U61 ( .A(n50), .B(n51), .C(n52), .Y(n49) );
  CLKXOR2X2M U62 ( .A(edge_cnt[4]), .B(N27), .Y(n52) );
  CLKXOR2X2M U63 ( .A(edge_cnt[1]), .B(N24), .Y(n51) );
  CLKXOR2X2M U64 ( .A(edge_cnt[0]), .B(N23), .Y(n50) );
  XNOR2X1M U65 ( .A(edge_cnt[2]), .B(N25), .Y(n48) );
  XNOR2X1M U66 ( .A(edge_cnt[3]), .B(N26), .Y(n47) );
  XNOR2X1M U67 ( .A(edge_cnt[5]), .B(N28), .Y(n46) );
endmodule


module strt_check ( strt_chk_en, sampled_bit, strt_glitch );
  input strt_chk_en, sampled_bit;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_chk_en), .B(sampled_bit), .Y(strt_glitch) );
endmodule


module deserializer ( CLK, RST, deser_en, sample_valid, sampled_bit, P_DATA );
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sample_valid, sampled_bit;
  wire   n1, n10, n11, n12, n13, n14, n15, n16, n17, n2, n3, n4, n5, n6, n7,
         n8, n9;

  DFFRQX2M P_DATA_reg_0_ ( .D(n10), .CK(CLK), .RN(RST), .Q(P_DATA[0]) );
  DFFRQX2M P_DATA_reg_5_ ( .D(n15), .CK(CLK), .RN(RST), .Q(P_DATA[5]) );
  DFFRQX2M P_DATA_reg_1_ ( .D(n11), .CK(CLK), .RN(RST), .Q(P_DATA[1]) );
  DFFRQX2M P_DATA_reg_4_ ( .D(n14), .CK(CLK), .RN(RST), .Q(P_DATA[4]) );
  DFFRQX2M P_DATA_reg_7_ ( .D(n17), .CK(CLK), .RN(RST), .Q(P_DATA[7]) );
  DFFRQX2M P_DATA_reg_3_ ( .D(n13), .CK(CLK), .RN(RST), .Q(P_DATA[3]) );
  DFFRQX2M P_DATA_reg_6_ ( .D(n16), .CK(CLK), .RN(RST), .Q(P_DATA[6]) );
  DFFRQX2M P_DATA_reg_2_ ( .D(n12), .CK(CLK), .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U2 ( .A0(n9), .A1(n8), .B0(n1), .B1(n7), .Y(n11) );
  OAI22X1M U3 ( .A0(n9), .A1(n7), .B0(n1), .B1(n6), .Y(n12) );
  OAI22X1M U4 ( .A0(n9), .A1(n6), .B0(n1), .B1(n5), .Y(n13) );
  OAI22X1M U5 ( .A0(n9), .A1(n5), .B0(n1), .B1(n4), .Y(n14) );
  OAI22X1M U6 ( .A0(n9), .A1(n4), .B0(n1), .B1(n3), .Y(n15) );
  OAI22X1M U7 ( .A0(n9), .A1(n3), .B0(n1), .B1(n2), .Y(n16) );
  INVX2M U8 ( .A(n1), .Y(n9) );
  NAND2X2M U9 ( .A(sample_valid), .B(deser_en), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n8), .A0N(P_DATA[0]), .A1N(n1), .Y(n10) );
  OAI2BB2X1M U11 ( .B0(n9), .B1(n2), .A0N(sampled_bit), .A1N(n9), .Y(n17) );
  INVX2M U12 ( .A(P_DATA[2]), .Y(n7) );
  INVX2M U13 ( .A(P_DATA[6]), .Y(n3) );
  INVX2M U14 ( .A(P_DATA[7]), .Y(n2) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n6) );
  INVX2M U16 ( .A(P_DATA[1]), .Y(n8) );
  INVX2M U17 ( .A(P_DATA[4]), .Y(n5) );
  INVX2M U18 ( .A(P_DATA[5]), .Y(n4) );
endmodule


module parity_check ( CLK, RST, par_chk_en, strt_chk_en, PAR_TYP, data, 
        sampled_bit, par_err );
  input [7:0] data;
  input CLK, RST, par_chk_en, strt_chk_en, PAR_TYP, sampled_bit;
  output par_err;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;

  DFFRQX2M par_err_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(par_err) );
  OAI31X1M U3 ( .A0(n1), .A1(strt_chk_en), .A2(n2), .B0(n3), .Y(n9) );
  NAND2X2M U4 ( .A(par_err), .B(n2), .Y(n3) );
  NOR2X2M U5 ( .A(par_chk_en), .B(strt_chk_en), .Y(n2) );
  XOR3XLM U6 ( .A(n4), .B(n5), .C(n6), .Y(n1) );
  XOR3XLM U7 ( .A(data[5]), .B(data[4]), .C(n7), .Y(n5) );
  XNOR2X2M U8 ( .A(data[7]), .B(data[6]), .Y(n7) );
  XOR3XLM U9 ( .A(data[1]), .B(data[0]), .C(n8), .Y(n4) );
  XNOR2X2M U10 ( .A(data[3]), .B(data[2]), .Y(n8) );
  XNOR2X2M U11 ( .A(sampled_bit), .B(PAR_TYP), .Y(n6) );
endmodule


module stop_check ( CLK, RST, stp_chk_en, strt_chk_en, sampled_bit, stp_err );
  input CLK, RST, stp_chk_en, strt_chk_en, sampled_bit;
  output stp_err;
  wire   n1, n3, n2;

  DFFRX2M stp_err_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(stp_err), .QN(n1) );
  OAI32X1M U3 ( .A0(n1), .A1(strt_chk_en), .A2(stp_chk_en), .B0(sampled_bit), 
        .B1(n2), .Y(n3) );
  INVX2M U4 ( .A(stp_chk_en), .Y(n2) );
endmodule


module UART_RX_TOP ( CLK, RST, RX_IN, Prescale, PAR_EN, PAR_TYP, P_DATA, 
        data_valid, par_err, stp_err );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP;
  output data_valid, par_err, stp_err;
  wire   sample_valid, strt_glitch, dat_samp_en, deser_en, strt_chk_en,
         par_chk_en, stp_chk_en, enable, sampled_bit, n1, n2;
  wire   [3:0] bit_cnt;
  wire   [5:0] edge_cnt;

  uart_rx_fsm U_UART_RX_FSM ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), .PAR_EN(
        PAR_EN), .sample_valid(sample_valid), .strt_glitch(strt_glitch), 
        .par_err(par_err), .stp_err(stp_err), .bit_cnt(bit_cnt), .dat_samp_en(
        dat_samp_en), .deser_en(deser_en), .strt_chk_en(strt_chk_en), 
        .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .enable(enable), 
        .data_valid(data_valid) );
  edge_bit_counter U_EDGE_BIT_COUNTER ( .CLK(CLK), .RST(n1), .Prescale(
        Prescale), .enable(enable), .edge_cnt(edge_cnt), .bit_cnt(bit_cnt) );
  data_sampling U_DATA_SAMPLING ( .CLK(CLK), .RST(n1), .RX_IN(RX_IN), 
        .Prescale(Prescale), .dat_samp_en(dat_samp_en), .edge_cnt(edge_cnt), 
        .sample_valid(sample_valid), .sampled_bit(sampled_bit) );
  strt_check U_STRT_CHECK ( .strt_chk_en(strt_chk_en), .sampled_bit(
        sampled_bit), .strt_glitch(strt_glitch) );
  deserializer U_DESERIALIZER ( .CLK(CLK), .RST(n1), .deser_en(deser_en), 
        .sample_valid(sample_valid), .sampled_bit(sampled_bit), .P_DATA(P_DATA) );
  parity_check U_PARITY_CHECK ( .CLK(CLK), .RST(n1), .par_chk_en(par_chk_en), 
        .strt_chk_en(strt_chk_en), .PAR_TYP(PAR_TYP), .data(P_DATA), 
        .sampled_bit(sampled_bit), .par_err(par_err) );
  stop_check U_STOP_CHECK ( .CLK(CLK), .RST(n1), .stp_chk_en(stp_chk_en), 
        .strt_chk_en(strt_chk_en), .sampled_bit(sampled_bit), .stp_err(stp_err) );
  INVX2M U1 ( .A(n2), .Y(n1) );
  INVX2M U2 ( .A(RST), .Y(n2) );
endmodule


module UART_TOP_DATA_WIDTH8 ( RX_CLK, TX_CLK, RST_N, RX_IN, TX_OUT, PRESCALE, 
        PAR_EN, PAR_TYP, TX_P_DATA, F_EMPTY, RX_P_DATA, RX_D_VLD, PAR_ERR, 
        STP_ERR, TX_BUSY );
  input [5:0] PRESCALE;
  input [7:0] TX_P_DATA;
  output [7:0] RX_P_DATA;
  input RX_CLK, TX_CLK, RST_N, RX_IN, PAR_EN, PAR_TYP, F_EMPTY;
  output TX_OUT, RX_D_VLD, PAR_ERR, STP_ERR, TX_BUSY;
  wire   n1;

  UART_TX_TOP u_uart_tx ( .CLK(TX_CLK), .RST(RST_N), .DATA_VALID(n1), .PAR_EN(
        PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(TX_P_DATA), .TX_OUT(TX_OUT), 
        .BUSY(TX_BUSY) );
  UART_RX_TOP u_uart_rx ( .CLK(RX_CLK), .RST(RST_N), .RX_IN(RX_IN), .Prescale(
        PRESCALE), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(RX_P_DATA), 
        .data_valid(RX_D_VLD), .par_err(PAR_ERR), .stp_err(STP_ERR) );
  INVX2M U1 ( .A(F_EMPTY), .Y(n1) );
endmodule


module SYS_TOP ( REF_CLK, UART_CLK, RST_N, UART_RX_IN, UART_TX_O, parity_error, 
        framing_error );
  input REF_CLK, UART_CLK, RST_N, UART_RX_IN;
  output UART_TX_O, parity_error, framing_error;
  wire   SYNC_REF_RST, SYNC_UART_RST, UART_RX_V_OUT, UART_RX_V_SYNC, RF_RdEn,
         RF_WrEn, RF_RdData_VLD, CLKG_EN, ALU_CLK, ALU_EN, ALU_OUT_VLD,
         FIFO_FULL, UART_TX_VLD, UART_TX_CLK, UART_TX_Busy_PULSE, FIFO_EMPTY,
         UART_RX_CLK, UART_TX_Busy, n1, n2, n3, n4, SYNOPSYS_UNCONNECTED_1,
         SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3,
         SYNOPSYS_UNCONNECTED_4;
  wire   [7:0] UART_RX_OUT;
  wire   [7:0] UART_RX_SYNC;
  wire   [3:0] RF_Address;
  wire   [7:0] RF_WrData;
  wire   [7:0] RF_RdData;
  wire   [7:0] Operand_A;
  wire   [7:0] Operand_B;
  wire   [7:0] UART_Config;
  wire   [7:0] DIV_RATIO;
  wire   [3:0] ALU_FUN;
  wire   [15:0] ALU_OUT;
  wire   [7:0] UART_TX_IN;
  wire   [7:0] FIFO_RD_DATA;
  wire   [7:0] DIV_RATIO_RX;

  RST_SYNC_0 u_RST_SYNC_REF ( .RST(RST_N), .CLK(REF_CLK), .SYNC_RST(
        SYNC_REF_RST) );
  RST_SYNC_1 u_RST_SYNC_UART ( .RST(RST_N), .CLK(UART_CLK), .SYNC_RST(
        SYNC_UART_RST) );
  Data_sync_BUS_WIDTH8_NUM_STAGES2 u_Data_sync ( .Unsync_bus(UART_RX_OUT), 
        .bus_enable(UART_RX_V_OUT), .CLK(REF_CLK), .RST(n3), .sync_bus(
        UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC) );
  REG_FILE_ADDR_WIDTH4_DATA_WIDTH8 u_REG_FILE ( .RD_EN(RF_RdEn), .WR_EN(
        RF_WrEn), .RST(n3), .CLK(REF_CLK), .ADDRESS(RF_Address), .WR_DATA(
        RF_WrData), .RD_DATA(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(
        Operand_A), .REG1(Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO) );
  CLK_GATE u_CLK_GATE ( .CLK_EN(CLKG_EN), .CLK(REF_CLK), .GATED_CLK(ALU_CLK)
         );
  ALU_OPER_WIDTH8_OUT_WIDTH16 u_ALU ( .A(Operand_A), .B(Operand_B), .EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(n3), .ALU_OUT(ALU_OUT), .OUT_VALID(
        ALU_OUT_VLD) );
  SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4 u_SYS_CTRL ( .CLK(REF_CLK), .RST(n3), 
        .ALU_OUT(ALU_OUT), .OUT_Valid(ALU_OUT_VLD), .RdData(RF_RdData), 
        .RdData_Valid(RF_RdData_VLD), .RX_P_Data(UART_RX_SYNC), .RX_D_VLD(
        UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .ALU_FUN(ALU_FUN), .EN(ALU_EN), 
        .CLK_EN(CLKG_EN), .Address(RF_Address), .WrEN(RF_WrEn), .RdEn(RF_RdEn), 
        .WrData(RF_WrData), .TX_P_Data(UART_TX_IN), .TX_D_VLD(UART_TX_VLD) );
  ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3 u_ASYNC_FIFO ( .W_CLK(REF_CLK), .W_RST(n3), .W_INC(UART_TX_VLD), .WR_DATA(UART_TX_IN), .FULL(FIFO_FULL), .R_CLK(
        UART_TX_CLK), .R_RST(n1), .R_INC(UART_TX_Busy_PULSE), .RD_DATA(
        FIFO_RD_DATA), .EMPTY(FIFO_EMPTY) );
  CLKDIV_MUX_WIDTH8 u_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED_1, SYNOPSYS_UNCONNECTED_2, SYNOPSYS_UNCONNECTED_3, 
        SYNOPSYS_UNCONNECTED_4, DIV_RATIO_RX[3:0]}) );
  INT_CLK_DIV_0 u_TX_CLK_DIV ( .REF_CLK(UART_CLK), .RST(n1), .CLK_EN(1'b1), 
        .DIV_RATIO(DIV_RATIO), .O_DIV_CLK(UART_TX_CLK) );
  INT_CLK_DIV_1 u_RX_CLK_DIV ( .REF_CLK(UART_CLK), .RST(n1), .CLK_EN(1'b1), 
        .DIV_RATIO({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), .O_DIV_CLK(
        UART_RX_CLK) );
  PULSE_GEN u_PULSE_GEN ( .clk(UART_TX_CLK), .rst(n1), .lvl_sig(UART_TX_Busy), 
        .pulse_sig(UART_TX_Busy_PULSE) );
  UART_TOP_DATA_WIDTH8 u_UART_TOP ( .RX_CLK(UART_RX_CLK), .TX_CLK(UART_TX_CLK), 
        .RST_N(n1), .RX_IN(UART_RX_IN), .TX_OUT(UART_TX_O), .PRESCALE(
        UART_Config[7:2]), .PAR_EN(UART_Config[0]), .PAR_TYP(UART_Config[1]), 
        .TX_P_DATA(FIFO_RD_DATA), .F_EMPTY(FIFO_EMPTY), .RX_P_DATA(UART_RX_OUT), .RX_D_VLD(UART_RX_V_OUT), .PAR_ERR(parity_error), .STP_ERR(framing_error), 
        .TX_BUSY(UART_TX_Busy) );
  INVX4M U1 ( .A(n4), .Y(n3) );
  INVX2M U2 ( .A(SYNC_REF_RST), .Y(n4) );
  INVX4M U3 ( .A(n2), .Y(n1) );
  INVX2M U4 ( .A(SYNC_UART_RST), .Y(n2) );
endmodule

