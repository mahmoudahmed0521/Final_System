/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : O-2018.06-SP1
// Date      : Fri Oct  9 07:01:12 2026
/////////////////////////////////////////////////////////////


module RST_SYNC_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;

  wire   [2:0] sync_reg;

  SDFFRQX2M SYNC_RST_reg ( .D(sync_reg[0]), .SI(1'b0), .SE(1'b0), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[2]  ( .D(RST), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(
        RST), .Q(sync_reg[2]) );
  SDFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[2]), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(RST), .Q(sync_reg[1]) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(sync_reg[1]), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(RST), .Q(sync_reg[0]) );
endmodule


module RST_SYNC_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;

  wire   [2:0] sync_reg;

  SDFFRQX2M SYNC_RST_reg ( .D(sync_reg[0]), .SI(1'b0), .SE(1'b0), .CK(CLK), 
        .RN(RST), .Q(SYNC_RST) );
  SDFFRQX2M \sync_reg_reg[2]  ( .D(RST), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(
        RST), .Q(sync_reg[2]) );
  SDFFRQX2M \sync_reg_reg[1]  ( .D(sync_reg[2]), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(RST), .Q(sync_reg[1]) );
  SDFFRQX2M \sync_reg_reg[0]  ( .D(sync_reg[1]), .SI(1'b0), .SE(1'b0), .CK(CLK), .RN(RST), .Q(sync_reg[0]) );
endmodule


module Data_sync_BUS_WIDTH8_NUM_STAGES2_test_1 ( Unsync_bus, bus_enable, CLK, 
        RST, sync_bus, enable_pulse, test_si, test_so, test_se );
  input [7:0] Unsync_bus;
  output [7:0] sync_bus;
  input bus_enable, CLK, RST, test_si, test_se;
  output enable_pulse, test_so;
  wire   pulse_gen_ff, n1, n3, n5, n7, n9, n11, n13, n15, n17, n34;
  wire   [1:0] sync_reg;
  assign test_so = sync_reg[1];

  SDFFRQX1M \sync_reg_reg[0]  ( .D(sync_reg[1]), .SI(sync_bus[7]), .SE(test_se), .CK(CLK), .RN(RST), .Q(sync_reg[0]) );
  SDFFRQX1M pulse_gen_ff_reg ( .D(sync_reg[0]), .SI(enable_pulse), .SE(test_se), .CK(CLK), .RN(RST), .Q(pulse_gen_ff) );
  SDFFRQX1M enable_pulse_reg ( .D(n34), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(enable_pulse) );
  SDFFRQX1M \sync_bus_reg[7]  ( .D(n17), .SI(sync_bus[6]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[7]) );
  SDFFRQX1M \sync_bus_reg[6]  ( .D(n15), .SI(sync_bus[5]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[6]) );
  SDFFRQX1M \sync_bus_reg[5]  ( .D(n13), .SI(sync_bus[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[5]) );
  SDFFRQX1M \sync_bus_reg[4]  ( .D(n11), .SI(sync_bus[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[4]) );
  SDFFRQX1M \sync_bus_reg[3]  ( .D(n9), .SI(sync_bus[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[3]) );
  SDFFRQX1M \sync_bus_reg[2]  ( .D(n7), .SI(sync_bus[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[2]) );
  SDFFRQX1M \sync_bus_reg[1]  ( .D(n5), .SI(sync_bus[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[1]) );
  SDFFRQX1M \sync_bus_reg[0]  ( .D(n3), .SI(pulse_gen_ff), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(sync_bus[0]) );
  SDFFRQX1M \sync_reg_reg[1]  ( .D(bus_enable), .SI(sync_reg[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(sync_reg[1]) );
  INVX2M U27 ( .A(n1), .Y(n34) );
  NAND2BX2M U28 ( .AN(pulse_gen_ff), .B(sync_reg[0]), .Y(n1) );
  AO22X1M U29 ( .A0(Unsync_bus[0]), .A1(n34), .B0(sync_bus[0]), .B1(n1), .Y(n3) );
  AO22X1M U30 ( .A0(Unsync_bus[1]), .A1(n34), .B0(sync_bus[1]), .B1(n1), .Y(n5) );
  AO22X1M U31 ( .A0(Unsync_bus[2]), .A1(n34), .B0(sync_bus[2]), .B1(n1), .Y(n7) );
  AO22X1M U32 ( .A0(Unsync_bus[3]), .A1(n34), .B0(sync_bus[3]), .B1(n1), .Y(n9) );
  AO22X1M U33 ( .A0(Unsync_bus[4]), .A1(n34), .B0(sync_bus[4]), .B1(n1), .Y(
        n11) );
  AO22X1M U34 ( .A0(Unsync_bus[5]), .A1(n34), .B0(sync_bus[5]), .B1(n1), .Y(
        n13) );
  AO22X1M U35 ( .A0(Unsync_bus[6]), .A1(n34), .B0(sync_bus[6]), .B1(n1), .Y(
        n15) );
  AO22X1M U36 ( .A0(Unsync_bus[7]), .A1(n34), .B0(sync_bus[7]), .B1(n1), .Y(
        n17) );
endmodule


module REG_FILE_ADDR_WIDTH4_DATA_WIDTH8_test_1 ( RD_EN, WR_EN, RST, CLK, 
        ADDRESS, WR_DATA, RD_DATA, RdData_VLD, REG0, REG1, REG2, REG3, 
        test_si2, test_si1, test_so1, test_se );
  input [3:0] ADDRESS;
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  output [7:0] REG3;
  input RD_EN, WR_EN, RST, CLK, test_si2, test_si1, test_se;
  output RdData_VLD, test_so1;
  wire   N10, N11, N12, N13, \RF[15][7] , \RF[15][6] , \RF[15][5] ,
         \RF[15][4] , \RF[15][3] , \RF[15][2] , \RF[15][1] , \RF[15][0] ,
         \RF[14][7] , \RF[14][6] , \RF[14][5] , \RF[14][4] , \RF[14][3] ,
         \RF[14][2] , \RF[14][1] , \RF[14][0] , \RF[13][7] , \RF[13][6] ,
         \RF[13][5] , \RF[13][4] , \RF[13][3] , \RF[13][2] , \RF[13][1] ,
         \RF[13][0] , \RF[12][7] , \RF[12][6] , \RF[12][5] , \RF[12][4] ,
         \RF[12][3] , \RF[12][2] , \RF[12][1] , \RF[12][0] , \RF[11][7] ,
         \RF[11][6] , \RF[11][5] , \RF[11][4] , \RF[11][3] , \RF[11][2] ,
         \RF[11][1] , \RF[11][0] , \RF[10][7] , \RF[10][6] , \RF[10][5] ,
         \RF[10][4] , \RF[10][3] , \RF[10][2] , \RF[10][1] , \RF[10][0] ,
         \RF[9][7] , \RF[9][6] , \RF[9][5] , \RF[9][4] , \RF[9][3] ,
         \RF[9][2] , \RF[9][1] , \RF[9][0] , \RF[8][7] , \RF[8][6] ,
         \RF[8][5] , \RF[8][4] , \RF[8][3] , \RF[8][2] , \RF[8][1] ,
         \RF[8][0] , \RF[7][7] , \RF[7][6] , \RF[7][5] , \RF[7][4] ,
         \RF[7][3] , \RF[7][2] , \RF[7][1] , \RF[7][0] , \RF[6][7] ,
         \RF[6][6] , \RF[6][5] , \RF[6][4] , \RF[6][3] , \RF[6][2] ,
         \RF[6][1] , \RF[6][0] , \RF[5][7] , \RF[5][6] , \RF[5][5] ,
         \RF[5][4] , \RF[5][3] , \RF[5][2] , \RF[5][1] , \RF[5][0] ,
         \RF[4][7] , \RF[4][6] , \RF[4][5] , \RF[4][4] , \RF[4][3] ,
         \RF[4][2] , \RF[4][1] , \RF[4][0] , N19, N20, N21, N22, N23, N24, N25,
         N26, n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264, n265, n266, n267, n268, n269, n270,
         n271, n272, n273, n274, n275, n276, n277, n278, n279, n280, n281,
         n282, n283, n284, n285, n286, n287, n288, n289, n290, n291, n292,
         n293, n294, n295, n296, n297, n298, n299, n300, n301, n302, n303,
         n304, n305, n306, n307, n308, n309, n310, n311, n312, n313, n314,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n469,
         n470, n471, n472, n473, n474, n475, n476, n477, n478, n479, n480,
         n481, n482, n483, n484, n485, n486, n487, n488, n489, n490, n491,
         n492, n493, n494, n495, n496, n497, n498, n499, n500, n501, n502,
         n503, n504, n505, n506, n507, n508, n509, n510, n511, n512, n513,
         n514, n515, n516, n517, n518, n519, n520, n521, n522, n523, n524,
         n525, n526, n527, n528, n529, n530, n531, n532, n533, n534, n535,
         n536, n537, n538, n539, n540, n541, n542, n543, n544, n545, n546,
         n547, n548, n549, n550, n551, n552, n553, n554, n555, n556, n557,
         n558, n559, n560, n564, n565, n566, n567, n568, n569, n570, n1;
  assign N10 = ADDRESS[0];
  assign N11 = ADDRESS[1];
  assign N12 = ADDRESS[2];
  assign N13 = ADDRESS[3];

  SDFFSQX1M \RF_reg[2][0]  ( .D(n195), .SI(REG1[7]), .SE(test_se), .CK(CLK), 
        .SN(RST), .Q(REG2[0]) );
  SDFFSQX1M \RF_reg[3][5]  ( .D(n208), .SI(REG3[4]), .SE(n569), .CK(CLK), .SN(
        RST), .Q(REG3[5]) );
  SDFFSQX1M \RF_reg[2][7]  ( .D(n202), .SI(REG2[6]), .SE(n568), .CK(CLK), .SN(
        RST), .Q(REG2[7]) );
  SDFFRQX1M RdData_VLD_reg ( .D(n178), .SI(\RF[15][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(RdData_VLD) );
  SDFFRQX1M \RF_reg[1][7]  ( .D(n194), .SI(REG1[6]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG1[7]) );
  SDFFRQX1M \RF_reg[1][6]  ( .D(n193), .SI(REG1[5]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG1[6]) );
  SDFFRQX1M \RF_reg[1][5]  ( .D(n192), .SI(REG1[4]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG1[5]) );
  SDFFRQX1M \RF_reg[1][4]  ( .D(n191), .SI(REG1[3]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG1[4]) );
  SDFFRQX1M \RF_reg[1][3]  ( .D(n190), .SI(REG1[2]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG1[3]) );
  SDFFRQX1M \RF_reg[1][2]  ( .D(n189), .SI(REG1[1]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG1[2]) );
  SDFFRQX1M \RF_reg[1][1]  ( .D(n188), .SI(REG1[0]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG1[1]) );
  SDFFRQX1M \RF_reg[1][0]  ( .D(n187), .SI(REG0[7]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG1[0]) );
  SDFFRQX1M \RF_reg[7][7]  ( .D(n242), .SI(\RF[7][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[7][7] ) );
  SDFFRQX1M \RF_reg[7][6]  ( .D(n241), .SI(\RF[7][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[7][6] ) );
  SDFFRQX1M \RF_reg[7][5]  ( .D(n240), .SI(\RF[7][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[7][5] ) );
  SDFFRQX1M \RF_reg[7][4]  ( .D(n239), .SI(\RF[7][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[7][4] ) );
  SDFFRQX1M \RF_reg[7][3]  ( .D(n238), .SI(test_si2), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[7][3] ) );
  SDFFRQX1M \RF_reg[7][1]  ( .D(n236), .SI(\RF[7][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[7][1] ) );
  SDFFRQX1M \RF_reg[7][0]  ( .D(n235), .SI(\RF[6][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[7][0] ) );
  SDFFRQX1M \RF_reg[5][7]  ( .D(n226), .SI(\RF[5][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[5][7] ) );
  SDFFRQX1M \RF_reg[5][6]  ( .D(n225), .SI(\RF[5][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[5][6] ) );
  SDFFRQX1M \RF_reg[5][5]  ( .D(n224), .SI(\RF[5][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[5][5] ) );
  SDFFRQX1M \RF_reg[5][4]  ( .D(n223), .SI(\RF[5][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[5][4] ) );
  SDFFRQX1M \RF_reg[5][3]  ( .D(n222), .SI(\RF[5][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[5][3] ) );
  SDFFRQX1M \RF_reg[5][2]  ( .D(n221), .SI(\RF[5][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[5][2] ) );
  SDFFRQX1M \RF_reg[5][1]  ( .D(n220), .SI(\RF[5][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[5][1] ) );
  SDFFRQX1M \RF_reg[5][0]  ( .D(n219), .SI(\RF[4][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[5][0] ) );
  SDFFRQX1M \RF_reg[14][7]  ( .D(n298), .SI(\RF[14][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[14][7] ) );
  SDFFRQX1M \RF_reg[14][6]  ( .D(n297), .SI(\RF[14][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[14][6] ) );
  SDFFRQX1M \RF_reg[14][5]  ( .D(n296), .SI(\RF[14][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[14][5] ) );
  SDFFRQX1M \RF_reg[14][4]  ( .D(n295), .SI(\RF[14][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[14][4] ) );
  SDFFRQX1M \RF_reg[14][3]  ( .D(n294), .SI(\RF[14][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[14][3] ) );
  SDFFRQX1M \RF_reg[14][2]  ( .D(n293), .SI(\RF[14][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[14][2] ) );
  SDFFRQX1M \RF_reg[14][1]  ( .D(n292), .SI(\RF[14][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[14][1] ) );
  SDFFRQX1M \RF_reg[14][0]  ( .D(n291), .SI(\RF[13][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[14][0] ) );
  SDFFRQX1M \RF_reg[12][7]  ( .D(n282), .SI(\RF[12][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[12][7] ) );
  SDFFRQX1M \RF_reg[12][6]  ( .D(n281), .SI(\RF[12][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[12][6] ) );
  SDFFRQX1M \RF_reg[12][5]  ( .D(n280), .SI(\RF[12][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[12][5] ) );
  SDFFRQX1M \RF_reg[12][4]  ( .D(n279), .SI(\RF[12][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[12][4] ) );
  SDFFRQX1M \RF_reg[12][3]  ( .D(n278), .SI(\RF[12][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[12][3] ) );
  SDFFRQX1M \RF_reg[12][2]  ( .D(n277), .SI(\RF[12][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[12][2] ) );
  SDFFRQX1M \RF_reg[12][1]  ( .D(n276), .SI(\RF[12][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[12][1] ) );
  SDFFRQX1M \RF_reg[12][0]  ( .D(n275), .SI(\RF[11][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[12][0] ) );
  SDFFRQX1M \RF_reg[6][7]  ( .D(n234), .SI(\RF[6][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[6][7] ) );
  SDFFRQX1M \RF_reg[6][6]  ( .D(n233), .SI(\RF[6][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[6][6] ) );
  SDFFRQX1M \RF_reg[6][5]  ( .D(n232), .SI(\RF[6][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[6][5] ) );
  SDFFRQX1M \RF_reg[6][4]  ( .D(n231), .SI(\RF[6][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[6][4] ) );
  SDFFRQX1M \RF_reg[6][3]  ( .D(n230), .SI(\RF[6][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[6][3] ) );
  SDFFRQX1M \RF_reg[6][2]  ( .D(n229), .SI(\RF[6][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[6][2] ) );
  SDFFRQX1M \RF_reg[6][1]  ( .D(n228), .SI(\RF[6][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[6][1] ) );
  SDFFRQX1M \RF_reg[6][0]  ( .D(n227), .SI(\RF[5][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[6][0] ) );
  SDFFRQX1M \RF_reg[4][7]  ( .D(n218), .SI(\RF[4][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[4][7] ) );
  SDFFRQX1M \RF_reg[4][6]  ( .D(n217), .SI(\RF[4][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[4][6] ) );
  SDFFRQX1M \RF_reg[4][5]  ( .D(n216), .SI(\RF[4][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[4][5] ) );
  SDFFRQX1M \RF_reg[4][4]  ( .D(n215), .SI(\RF[4][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[4][4] ) );
  SDFFRQX1M \RF_reg[4][3]  ( .D(n214), .SI(\RF[4][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[4][3] ) );
  SDFFRQX1M \RF_reg[4][2]  ( .D(n213), .SI(\RF[4][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[4][2] ) );
  SDFFRQX1M \RF_reg[4][1]  ( .D(n212), .SI(\RF[4][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[4][1] ) );
  SDFFRQX1M \RF_reg[4][0]  ( .D(n211), .SI(REG3[7]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(\RF[4][0] ) );
  SDFFRQX1M \RF_reg[15][7]  ( .D(n306), .SI(\RF[15][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[15][7] ) );
  SDFFRQX1M \RF_reg[15][6]  ( .D(n305), .SI(\RF[15][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[15][6] ) );
  SDFFRQX1M \RF_reg[15][5]  ( .D(n304), .SI(\RF[15][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[15][5] ) );
  SDFFRQX1M \RF_reg[15][4]  ( .D(n303), .SI(\RF[15][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[15][4] ) );
  SDFFRQX1M \RF_reg[15][3]  ( .D(n302), .SI(\RF[15][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[15][3] ) );
  SDFFRQX1M \RF_reg[15][2]  ( .D(n301), .SI(\RF[15][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[15][2] ) );
  SDFFRQX1M \RF_reg[15][1]  ( .D(n300), .SI(\RF[15][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[15][1] ) );
  SDFFRQX1M \RF_reg[15][0]  ( .D(n299), .SI(\RF[14][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[15][0] ) );
  SDFFRQX1M \RF_reg[13][7]  ( .D(n290), .SI(\RF[13][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[13][7] ) );
  SDFFRQX1M \RF_reg[13][6]  ( .D(n289), .SI(\RF[13][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[13][6] ) );
  SDFFRQX1M \RF_reg[13][5]  ( .D(n288), .SI(\RF[13][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[13][5] ) );
  SDFFRQX1M \RF_reg[13][4]  ( .D(n287), .SI(\RF[13][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[13][4] ) );
  SDFFRQX1M \RF_reg[13][3]  ( .D(n286), .SI(\RF[13][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[13][3] ) );
  SDFFRQX1M \RF_reg[13][2]  ( .D(n285), .SI(\RF[13][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[13][2] ) );
  SDFFRQX1M \RF_reg[13][1]  ( .D(n284), .SI(\RF[13][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[13][1] ) );
  SDFFRQX1M \RF_reg[13][0]  ( .D(n283), .SI(\RF[12][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[13][0] ) );
  SDFFRQX1M \RF_reg[8][7]  ( .D(n250), .SI(\RF[8][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[8][7] ) );
  SDFFRQX1M \RF_reg[8][6]  ( .D(n249), .SI(\RF[8][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[8][6] ) );
  SDFFRQX1M \RF_reg[8][5]  ( .D(n248), .SI(\RF[8][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[8][5] ) );
  SDFFRQX1M \RF_reg[8][4]  ( .D(n247), .SI(\RF[8][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[8][4] ) );
  SDFFRQX1M \RF_reg[8][3]  ( .D(n246), .SI(\RF[8][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[8][3] ) );
  SDFFRQX1M \RF_reg[8][2]  ( .D(n245), .SI(\RF[8][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[8][2] ) );
  SDFFRQX1M \RF_reg[8][1]  ( .D(n244), .SI(\RF[8][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[8][1] ) );
  SDFFRQX1M \RF_reg[8][0]  ( .D(n243), .SI(\RF[7][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[8][0] ) );
  SDFFRQX1M \RF_reg[9][7]  ( .D(n258), .SI(\RF[9][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[9][7] ) );
  SDFFRQX1M \RF_reg[9][6]  ( .D(n257), .SI(\RF[9][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[9][6] ) );
  SDFFRQX1M \RF_reg[9][5]  ( .D(n256), .SI(\RF[9][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[9][5] ) );
  SDFFRQX1M \RF_reg[9][4]  ( .D(n255), .SI(\RF[9][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[9][4] ) );
  SDFFRQX1M \RF_reg[9][3]  ( .D(n254), .SI(\RF[9][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[9][3] ) );
  SDFFRQX1M \RF_reg[9][2]  ( .D(n253), .SI(\RF[9][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[9][2] ) );
  SDFFRQX1M \RF_reg[9][1]  ( .D(n252), .SI(\RF[9][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[9][1] ) );
  SDFFRQX1M \RF_reg[9][0]  ( .D(n251), .SI(\RF[8][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[9][0] ) );
  SDFFRQX1M \RF_reg[11][7]  ( .D(n274), .SI(\RF[11][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[11][7] ) );
  SDFFRQX1M \RF_reg[11][6]  ( .D(n273), .SI(\RF[11][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[11][6] ) );
  SDFFRQX1M \RF_reg[11][5]  ( .D(n272), .SI(\RF[11][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[11][5] ) );
  SDFFRQX1M \RF_reg[11][4]  ( .D(n271), .SI(\RF[11][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[11][4] ) );
  SDFFRQX1M \RF_reg[11][3]  ( .D(n270), .SI(\RF[11][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[11][3] ) );
  SDFFRQX1M \RF_reg[11][2]  ( .D(n269), .SI(\RF[11][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[11][2] ) );
  SDFFRQX1M \RF_reg[11][1]  ( .D(n268), .SI(\RF[11][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[11][1] ) );
  SDFFRQX1M \RF_reg[11][0]  ( .D(n267), .SI(\RF[10][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[11][0] ) );
  SDFFRQX1M \RF_reg[10][7]  ( .D(n266), .SI(\RF[10][6] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[10][7] ) );
  SDFFRQX1M \RF_reg[10][6]  ( .D(n265), .SI(\RF[10][5] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[10][6] ) );
  SDFFRQX1M \RF_reg[10][5]  ( .D(n264), .SI(\RF[10][4] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[10][5] ) );
  SDFFRQX1M \RF_reg[10][4]  ( .D(n263), .SI(\RF[10][3] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[10][4] ) );
  SDFFRQX1M \RF_reg[10][3]  ( .D(n262), .SI(\RF[10][2] ), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(\RF[10][3] ) );
  SDFFRQX1M \RF_reg[10][2]  ( .D(n261), .SI(\RF[10][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[10][2] ) );
  SDFFRQX1M \RF_reg[10][1]  ( .D(n260), .SI(\RF[10][0] ), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(\RF[10][1] ) );
  SDFFRQX1M \RF_reg[10][0]  ( .D(n259), .SI(\RF[9][7] ), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(\RF[10][0] ) );
  SDFFRQX1M \RF_reg[0][7]  ( .D(n186), .SI(REG0[6]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG0[7]) );
  SDFFRQX1M \RF_reg[0][6]  ( .D(n185), .SI(REG0[5]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG0[6]) );
  SDFFRQX1M \RF_reg[0][5]  ( .D(n184), .SI(REG0[4]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG0[5]) );
  SDFFRQX1M \RF_reg[0][4]  ( .D(n183), .SI(REG0[3]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG0[4]) );
  SDFFRQX1M \RF_reg[0][3]  ( .D(n182), .SI(REG0[2]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG0[3]) );
  SDFFRQX1M \RF_reg[0][2]  ( .D(n181), .SI(REG0[1]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG0[2]) );
  SDFFRQX1M \RF_reg[0][1]  ( .D(n180), .SI(REG0[0]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG0[1]) );
  SDFFRQX1M \RF_reg[0][0]  ( .D(n179), .SI(RD_DATA[7]), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(REG0[0]) );
  SDFFRQX1M \RF_reg[3][7]  ( .D(n210), .SI(REG3[6]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG3[7]) );
  SDFFRQX1M \RF_reg[3][6]  ( .D(n209), .SI(REG3[5]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG3[6]) );
  SDFFRQX1M \RF_reg[3][4]  ( .D(n207), .SI(REG3[3]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG3[4]) );
  SDFFRQX1M \RF_reg[3][3]  ( .D(n206), .SI(REG3[2]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG3[3]) );
  SDFFRQX1M \RF_reg[3][2]  ( .D(n205), .SI(REG3[1]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG3[2]) );
  SDFFRQX1M \RF_reg[3][1]  ( .D(n204), .SI(REG3[0]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG3[1]) );
  SDFFRQX1M \RF_reg[3][0]  ( .D(n203), .SI(REG2[7]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG3[0]) );
  SDFFRQX1M \RF_reg[2][6]  ( .D(n201), .SI(REG2[5]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG2[6]) );
  SDFFRQX1M \RF_reg[2][4]  ( .D(n199), .SI(REG2[3]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG2[4]) );
  SDFFRQX1M \RF_reg[2][3]  ( .D(n198), .SI(REG2[2]), .SE(n569), .CK(CLK), .RN(
        RST), .Q(REG2[3]) );
  SDFFRQX1M \RF_reg[2][2]  ( .D(n197), .SI(REG2[1]), .SE(n568), .CK(CLK), .RN(
        RST), .Q(REG2[2]) );
  SDFFRQX1M \RF_reg[2][1]  ( .D(n196), .SI(REG2[0]), .SE(n567), .CK(CLK), .RN(
        RST), .Q(REG2[1]) );
  SDFFRQX1M \RF_reg[2][5]  ( .D(n200), .SI(REG2[4]), .SE(n566), .CK(CLK), .RN(
        RST), .Q(REG2[5]) );
  SDFFRQX1M \RD_DATA_reg[7]  ( .D(n314), .SI(RD_DATA[6]), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[7]) );
  SDFFRQX1M \RD_DATA_reg[6]  ( .D(n313), .SI(RD_DATA[5]), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[6]) );
  SDFFRQX1M \RD_DATA_reg[2]  ( .D(n309), .SI(RD_DATA[1]), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[2]) );
  SDFFRQX1M \RD_DATA_reg[1]  ( .D(n308), .SI(RD_DATA[0]), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[1]) );
  SDFFRQX1M \RD_DATA_reg[0]  ( .D(n307), .SI(test_si1), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[0]) );
  SDFFRQX1M \RD_DATA_reg[5]  ( .D(n312), .SI(RD_DATA[4]), .SE(n568), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[5]) );
  SDFFRQX1M \RD_DATA_reg[4]  ( .D(n311), .SI(RD_DATA[3]), .SE(n567), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[4]) );
  SDFFRQX1M \RD_DATA_reg[3]  ( .D(n310), .SI(RD_DATA[2]), .SE(n566), .CK(CLK), 
        .RN(RST), .Q(RD_DATA[3]) );
  NOR2X2M U274 ( .A(n560), .B(N12), .Y(n157) );
  NOR2X2M U275 ( .A(N11), .B(N12), .Y(n152) );
  INVX2M U276 ( .A(n544), .Y(n545) );
  BUFX2M U277 ( .A(n437), .Y(n544) );
  INVX2M U278 ( .A(n548), .Y(n549) );
  OR2X2M U279 ( .A(n560), .B(n543), .Y(n437) );
  BUFX2M U280 ( .A(n438), .Y(n548) );
  INVX2M U281 ( .A(n439), .Y(n546) );
  INVX2M U282 ( .A(n440), .Y(n547) );
  NAND2X2M U283 ( .A(n155), .B(n152), .Y(n154) );
  NAND2X2M U284 ( .A(n157), .B(n153), .Y(n156) );
  NAND2X2M U285 ( .A(n157), .B(n155), .Y(n158) );
  NAND2X2M U286 ( .A(n160), .B(n153), .Y(n159) );
  NAND2X2M U287 ( .A(n160), .B(n155), .Y(n161) );
  NAND2X2M U288 ( .A(n163), .B(n153), .Y(n162) );
  NAND2X2M U289 ( .A(n163), .B(n155), .Y(n165) );
  NAND2X2M U290 ( .A(n167), .B(n152), .Y(n166) );
  NAND2X2M U291 ( .A(n169), .B(n152), .Y(n168) );
  NAND2X2M U292 ( .A(n167), .B(n157), .Y(n170) );
  NAND2X2M U293 ( .A(n169), .B(n157), .Y(n171) );
  NAND2X2M U294 ( .A(n167), .B(n160), .Y(n172) );
  NAND2X2M U295 ( .A(n169), .B(n160), .Y(n173) );
  NAND2X2M U296 ( .A(n167), .B(n163), .Y(n174) );
  NAND2X2M U297 ( .A(n169), .B(n163), .Y(n176) );
  NAND2X2M U298 ( .A(n152), .B(n153), .Y(n151) );
  AND2X2M U299 ( .A(n164), .B(n543), .Y(n153) );
  AND2X2M U300 ( .A(n175), .B(n543), .Y(n167) );
  INVX2M U301 ( .A(n177), .Y(n558) );
  OR2X2M U302 ( .A(N10), .B(N11), .Y(n438) );
  OR2X2M U303 ( .A(n560), .B(N10), .Y(n439) );
  OR2X2M U304 ( .A(n543), .B(N11), .Y(n440) );
  INVX2M U305 ( .A(N10), .Y(n543) );
  INVX2M U306 ( .A(N12), .Y(n542) );
  INVX2M U307 ( .A(N13), .Y(n541) );
  NAND2X2M U308 ( .A(RD_EN), .B(n559), .Y(n177) );
  NOR2X2M U309 ( .A(n559), .B(RD_EN), .Y(n150) );
  AND2X2M U310 ( .A(n164), .B(N10), .Y(n155) );
  AND2X2M U311 ( .A(n175), .B(N10), .Y(n169) );
  AND2X2M U312 ( .A(N12), .B(n560), .Y(n160) );
  AND2X2M U313 ( .A(N12), .B(N11), .Y(n163) );
  NOR2BX2M U314 ( .AN(n150), .B(N13), .Y(n164) );
  INVX2M U315 ( .A(N11), .Y(n560) );
  AND2X2M U316 ( .A(N13), .B(n150), .Y(n175) );
  INVX2M U317 ( .A(WR_DATA[0]), .Y(n550) );
  INVX2M U318 ( .A(WR_DATA[1]), .Y(n551) );
  INVX2M U319 ( .A(WR_DATA[2]), .Y(n552) );
  INVX2M U320 ( .A(WR_DATA[3]), .Y(n553) );
  INVX2M U321 ( .A(WR_DATA[4]), .Y(n554) );
  INVX2M U322 ( .A(WR_DATA[5]), .Y(n555) );
  INVX2M U323 ( .A(WR_DATA[6]), .Y(n556) );
  INVX2M U324 ( .A(WR_DATA[7]), .Y(n557) );
  INVX2M U325 ( .A(WR_EN), .Y(n559) );
  AO22X1M U326 ( .A0(N26), .A1(n558), .B0(RD_DATA[0]), .B1(n177), .Y(n307) );
  AO22X1M U327 ( .A0(N25), .A1(n558), .B0(RD_DATA[1]), .B1(n177), .Y(n308) );
  AO22X1M U328 ( .A0(N24), .A1(n558), .B0(RD_DATA[2]), .B1(n177), .Y(n309) );
  AO22X1M U329 ( .A0(N23), .A1(n558), .B0(RD_DATA[3]), .B1(n177), .Y(n310) );
  AO22X1M U330 ( .A0(N22), .A1(n558), .B0(RD_DATA[4]), .B1(n177), .Y(n311) );
  AO22X1M U331 ( .A0(N21), .A1(n558), .B0(RD_DATA[5]), .B1(n177), .Y(n312) );
  AO22X1M U332 ( .A0(N20), .A1(n558), .B0(RD_DATA[6]), .B1(n177), .Y(n313) );
  AO22X1M U333 ( .A0(N19), .A1(n558), .B0(RD_DATA[7]), .B1(n177), .Y(n314) );
  OAI2BB2X1M U334 ( .B0(n151), .B1(n550), .A0N(REG0[0]), .A1N(n151), .Y(n179)
         );
  OAI2BB2X1M U335 ( .B0(n151), .B1(n551), .A0N(REG0[1]), .A1N(n151), .Y(n180)
         );
  OAI2BB2X1M U336 ( .B0(n151), .B1(n552), .A0N(REG0[2]), .A1N(n151), .Y(n181)
         );
  OAI2BB2X1M U337 ( .B0(n151), .B1(n553), .A0N(REG0[3]), .A1N(n151), .Y(n182)
         );
  OAI2BB2X1M U338 ( .B0(n151), .B1(n554), .A0N(REG0[4]), .A1N(n151), .Y(n183)
         );
  OAI2BB2X1M U339 ( .B0(n151), .B1(n555), .A0N(REG0[5]), .A1N(n151), .Y(n184)
         );
  OAI2BB2X1M U340 ( .B0(n151), .B1(n556), .A0N(REG0[6]), .A1N(n151), .Y(n185)
         );
  OAI2BB2X1M U341 ( .B0(n151), .B1(n557), .A0N(REG0[7]), .A1N(n151), .Y(n186)
         );
  OAI2BB2X1M U342 ( .B0(n551), .B1(n156), .A0N(REG2[1]), .A1N(n156), .Y(n196)
         );
  OAI2BB2X1M U343 ( .B0(n552), .B1(n156), .A0N(REG2[2]), .A1N(n156), .Y(n197)
         );
  OAI2BB2X1M U344 ( .B0(n553), .B1(n156), .A0N(REG2[3]), .A1N(n156), .Y(n198)
         );
  OAI2BB2X1M U345 ( .B0(n554), .B1(n156), .A0N(REG2[4]), .A1N(n156), .Y(n199)
         );
  OAI2BB2X1M U346 ( .B0(n555), .B1(n156), .A0N(REG2[5]), .A1N(n156), .Y(n200)
         );
  OAI2BB2X1M U347 ( .B0(n556), .B1(n156), .A0N(REG2[6]), .A1N(n156), .Y(n201)
         );
  OAI2BB2X1M U348 ( .B0(n550), .B1(n158), .A0N(REG3[0]), .A1N(n158), .Y(n203)
         );
  OAI2BB2X1M U349 ( .B0(n551), .B1(n158), .A0N(REG3[1]), .A1N(n158), .Y(n204)
         );
  OAI2BB2X1M U350 ( .B0(n552), .B1(n158), .A0N(REG3[2]), .A1N(n158), .Y(n205)
         );
  OAI2BB2X1M U351 ( .B0(n553), .B1(n158), .A0N(REG3[3]), .A1N(n158), .Y(n206)
         );
  OAI2BB2X1M U352 ( .B0(n554), .B1(n158), .A0N(REG3[4]), .A1N(n158), .Y(n207)
         );
  OAI2BB2X1M U353 ( .B0(n556), .B1(n158), .A0N(REG3[6]), .A1N(n158), .Y(n209)
         );
  OAI2BB2X1M U354 ( .B0(n557), .B1(n158), .A0N(REG3[7]), .A1N(n158), .Y(n210)
         );
  OAI2BB2X1M U355 ( .B0(n550), .B1(n154), .A0N(REG1[0]), .A1N(n154), .Y(n187)
         );
  OAI2BB2X1M U356 ( .B0(n551), .B1(n154), .A0N(REG1[1]), .A1N(n154), .Y(n188)
         );
  OAI2BB2X1M U357 ( .B0(n552), .B1(n154), .A0N(REG1[2]), .A1N(n154), .Y(n189)
         );
  OAI2BB2X1M U358 ( .B0(n553), .B1(n154), .A0N(REG1[3]), .A1N(n154), .Y(n190)
         );
  OAI2BB2X1M U359 ( .B0(n554), .B1(n154), .A0N(REG1[4]), .A1N(n154), .Y(n191)
         );
  OAI2BB2X1M U360 ( .B0(n555), .B1(n154), .A0N(REG1[5]), .A1N(n154), .Y(n192)
         );
  OAI2BB2X1M U361 ( .B0(n556), .B1(n154), .A0N(REG1[6]), .A1N(n154), .Y(n193)
         );
  OAI2BB2X1M U362 ( .B0(n557), .B1(n154), .A0N(REG1[7]), .A1N(n154), .Y(n194)
         );
  OAI2BB2X1M U363 ( .B0(n550), .B1(n166), .A0N(\RF[8][0] ), .A1N(n166), .Y(
        n243) );
  OAI2BB2X1M U364 ( .B0(n551), .B1(n166), .A0N(\RF[8][1] ), .A1N(n166), .Y(
        n244) );
  OAI2BB2X1M U365 ( .B0(n552), .B1(n166), .A0N(\RF[8][2] ), .A1N(n166), .Y(
        n245) );
  OAI2BB2X1M U366 ( .B0(n553), .B1(n166), .A0N(\RF[8][3] ), .A1N(n166), .Y(
        n246) );
  OAI2BB2X1M U367 ( .B0(n554), .B1(n166), .A0N(\RF[8][4] ), .A1N(n166), .Y(
        n247) );
  OAI2BB2X1M U368 ( .B0(n555), .B1(n166), .A0N(\RF[8][5] ), .A1N(n166), .Y(
        n248) );
  OAI2BB2X1M U369 ( .B0(n556), .B1(n166), .A0N(\RF[8][6] ), .A1N(n166), .Y(
        n249) );
  OAI2BB2X1M U370 ( .B0(n557), .B1(n166), .A0N(\RF[8][7] ), .A1N(n166), .Y(
        n250) );
  OAI2BB2X1M U371 ( .B0(n550), .B1(n168), .A0N(\RF[9][0] ), .A1N(n168), .Y(
        n251) );
  OAI2BB2X1M U372 ( .B0(n551), .B1(n168), .A0N(\RF[9][1] ), .A1N(n168), .Y(
        n252) );
  OAI2BB2X1M U373 ( .B0(n552), .B1(n168), .A0N(\RF[9][2] ), .A1N(n168), .Y(
        n253) );
  OAI2BB2X1M U374 ( .B0(n553), .B1(n168), .A0N(\RF[9][3] ), .A1N(n168), .Y(
        n254) );
  OAI2BB2X1M U375 ( .B0(n554), .B1(n168), .A0N(\RF[9][4] ), .A1N(n168), .Y(
        n255) );
  OAI2BB2X1M U376 ( .B0(n555), .B1(n168), .A0N(\RF[9][5] ), .A1N(n168), .Y(
        n256) );
  OAI2BB2X1M U377 ( .B0(n556), .B1(n168), .A0N(\RF[9][6] ), .A1N(n168), .Y(
        n257) );
  OAI2BB2X1M U378 ( .B0(n557), .B1(n168), .A0N(\RF[9][7] ), .A1N(n168), .Y(
        n258) );
  OAI2BB2X1M U379 ( .B0(n550), .B1(n170), .A0N(\RF[10][0] ), .A1N(n170), .Y(
        n259) );
  OAI2BB2X1M U380 ( .B0(n551), .B1(n170), .A0N(\RF[10][1] ), .A1N(n170), .Y(
        n260) );
  OAI2BB2X1M U381 ( .B0(n552), .B1(n170), .A0N(\RF[10][2] ), .A1N(n170), .Y(
        n261) );
  OAI2BB2X1M U382 ( .B0(n553), .B1(n170), .A0N(\RF[10][3] ), .A1N(n170), .Y(
        n262) );
  OAI2BB2X1M U383 ( .B0(n554), .B1(n170), .A0N(\RF[10][4] ), .A1N(n170), .Y(
        n263) );
  OAI2BB2X1M U384 ( .B0(n555), .B1(n170), .A0N(\RF[10][5] ), .A1N(n170), .Y(
        n264) );
  OAI2BB2X1M U385 ( .B0(n556), .B1(n170), .A0N(\RF[10][6] ), .A1N(n170), .Y(
        n265) );
  OAI2BB2X1M U386 ( .B0(n557), .B1(n170), .A0N(\RF[10][7] ), .A1N(n170), .Y(
        n266) );
  OAI2BB2X1M U387 ( .B0(n550), .B1(n171), .A0N(\RF[11][0] ), .A1N(n171), .Y(
        n267) );
  OAI2BB2X1M U388 ( .B0(n551), .B1(n171), .A0N(\RF[11][1] ), .A1N(n171), .Y(
        n268) );
  OAI2BB2X1M U389 ( .B0(n552), .B1(n171), .A0N(\RF[11][2] ), .A1N(n171), .Y(
        n269) );
  OAI2BB2X1M U390 ( .B0(n553), .B1(n171), .A0N(\RF[11][3] ), .A1N(n171), .Y(
        n270) );
  OAI2BB2X1M U391 ( .B0(n554), .B1(n171), .A0N(\RF[11][4] ), .A1N(n171), .Y(
        n271) );
  OAI2BB2X1M U392 ( .B0(n555), .B1(n171), .A0N(\RF[11][5] ), .A1N(n171), .Y(
        n272) );
  OAI2BB2X1M U393 ( .B0(n556), .B1(n171), .A0N(\RF[11][6] ), .A1N(n171), .Y(
        n273) );
  OAI2BB2X1M U394 ( .B0(n557), .B1(n171), .A0N(\RF[11][7] ), .A1N(n171), .Y(
        n274) );
  OAI2BB2X1M U395 ( .B0(n550), .B1(n156), .A0N(REG2[0]), .A1N(n156), .Y(n195)
         );
  OAI2BB2X1M U396 ( .B0(n557), .B1(n156), .A0N(REG2[7]), .A1N(n156), .Y(n202)
         );
  OAI2BB2X1M U397 ( .B0(n555), .B1(n158), .A0N(REG3[5]), .A1N(n158), .Y(n208)
         );
  OAI2BB2X1M U398 ( .B0(n550), .B1(n159), .A0N(\RF[4][0] ), .A1N(n159), .Y(
        n211) );
  OAI2BB2X1M U399 ( .B0(n551), .B1(n159), .A0N(\RF[4][1] ), .A1N(n159), .Y(
        n212) );
  OAI2BB2X1M U400 ( .B0(n552), .B1(n159), .A0N(\RF[4][2] ), .A1N(n159), .Y(
        n213) );
  OAI2BB2X1M U401 ( .B0(n553), .B1(n159), .A0N(\RF[4][3] ), .A1N(n159), .Y(
        n214) );
  OAI2BB2X1M U402 ( .B0(n554), .B1(n159), .A0N(\RF[4][4] ), .A1N(n159), .Y(
        n215) );
  OAI2BB2X1M U403 ( .B0(n555), .B1(n159), .A0N(\RF[4][5] ), .A1N(n159), .Y(
        n216) );
  OAI2BB2X1M U404 ( .B0(n556), .B1(n159), .A0N(\RF[4][6] ), .A1N(n159), .Y(
        n217) );
  OAI2BB2X1M U405 ( .B0(n557), .B1(n159), .A0N(\RF[4][7] ), .A1N(n159), .Y(
        n218) );
  OAI2BB2X1M U406 ( .B0(n550), .B1(n161), .A0N(\RF[5][0] ), .A1N(n161), .Y(
        n219) );
  OAI2BB2X1M U407 ( .B0(n551), .B1(n161), .A0N(\RF[5][1] ), .A1N(n161), .Y(
        n220) );
  OAI2BB2X1M U408 ( .B0(n552), .B1(n161), .A0N(\RF[5][2] ), .A1N(n161), .Y(
        n221) );
  OAI2BB2X1M U409 ( .B0(n553), .B1(n161), .A0N(\RF[5][3] ), .A1N(n161), .Y(
        n222) );
  OAI2BB2X1M U410 ( .B0(n554), .B1(n161), .A0N(\RF[5][4] ), .A1N(n161), .Y(
        n223) );
  OAI2BB2X1M U411 ( .B0(n555), .B1(n161), .A0N(\RF[5][5] ), .A1N(n161), .Y(
        n224) );
  OAI2BB2X1M U412 ( .B0(n556), .B1(n161), .A0N(\RF[5][6] ), .A1N(n161), .Y(
        n225) );
  OAI2BB2X1M U413 ( .B0(n557), .B1(n161), .A0N(\RF[5][7] ), .A1N(n161), .Y(
        n226) );
  OAI2BB2X1M U414 ( .B0(n550), .B1(n162), .A0N(\RF[6][0] ), .A1N(n162), .Y(
        n227) );
  OAI2BB2X1M U415 ( .B0(n551), .B1(n162), .A0N(\RF[6][1] ), .A1N(n162), .Y(
        n228) );
  OAI2BB2X1M U416 ( .B0(n552), .B1(n162), .A0N(\RF[6][2] ), .A1N(n162), .Y(
        n229) );
  OAI2BB2X1M U417 ( .B0(n553), .B1(n162), .A0N(\RF[6][3] ), .A1N(n162), .Y(
        n230) );
  OAI2BB2X1M U418 ( .B0(n554), .B1(n162), .A0N(\RF[6][4] ), .A1N(n162), .Y(
        n231) );
  OAI2BB2X1M U419 ( .B0(n555), .B1(n162), .A0N(\RF[6][5] ), .A1N(n162), .Y(
        n232) );
  OAI2BB2X1M U420 ( .B0(n556), .B1(n162), .A0N(\RF[6][6] ), .A1N(n162), .Y(
        n233) );
  OAI2BB2X1M U421 ( .B0(n557), .B1(n162), .A0N(\RF[6][7] ), .A1N(n162), .Y(
        n234) );
  OAI2BB2X1M U422 ( .B0(n550), .B1(n165), .A0N(\RF[7][0] ), .A1N(n165), .Y(
        n235) );
  OAI2BB2X1M U423 ( .B0(n551), .B1(n165), .A0N(\RF[7][1] ), .A1N(n165), .Y(
        n236) );
  OAI2BB2X1M U424 ( .B0(n552), .B1(n165), .A0N(n570), .A1N(n165), .Y(n237) );
  OAI2BB2X1M U425 ( .B0(n553), .B1(n165), .A0N(\RF[7][3] ), .A1N(n165), .Y(
        n238) );
  OAI2BB2X1M U426 ( .B0(n554), .B1(n165), .A0N(\RF[7][4] ), .A1N(n165), .Y(
        n239) );
  OAI2BB2X1M U427 ( .B0(n555), .B1(n165), .A0N(\RF[7][5] ), .A1N(n165), .Y(
        n240) );
  OAI2BB2X1M U428 ( .B0(n556), .B1(n165), .A0N(\RF[7][6] ), .A1N(n165), .Y(
        n241) );
  OAI2BB2X1M U429 ( .B0(n557), .B1(n165), .A0N(\RF[7][7] ), .A1N(n165), .Y(
        n242) );
  OAI2BB2X1M U430 ( .B0(n550), .B1(n172), .A0N(\RF[12][0] ), .A1N(n172), .Y(
        n275) );
  OAI2BB2X1M U431 ( .B0(n551), .B1(n172), .A0N(\RF[12][1] ), .A1N(n172), .Y(
        n276) );
  OAI2BB2X1M U432 ( .B0(n552), .B1(n172), .A0N(\RF[12][2] ), .A1N(n172), .Y(
        n277) );
  OAI2BB2X1M U433 ( .B0(n553), .B1(n172), .A0N(\RF[12][3] ), .A1N(n172), .Y(
        n278) );
  OAI2BB2X1M U434 ( .B0(n554), .B1(n172), .A0N(\RF[12][4] ), .A1N(n172), .Y(
        n279) );
  OAI2BB2X1M U435 ( .B0(n555), .B1(n172), .A0N(\RF[12][5] ), .A1N(n172), .Y(
        n280) );
  OAI2BB2X1M U436 ( .B0(n556), .B1(n172), .A0N(\RF[12][6] ), .A1N(n172), .Y(
        n281) );
  OAI2BB2X1M U437 ( .B0(n557), .B1(n172), .A0N(\RF[12][7] ), .A1N(n172), .Y(
        n282) );
  OAI2BB2X1M U438 ( .B0(n550), .B1(n173), .A0N(\RF[13][0] ), .A1N(n173), .Y(
        n283) );
  OAI2BB2X1M U439 ( .B0(n551), .B1(n173), .A0N(\RF[13][1] ), .A1N(n173), .Y(
        n284) );
  OAI2BB2X1M U440 ( .B0(n552), .B1(n173), .A0N(\RF[13][2] ), .A1N(n173), .Y(
        n285) );
  OAI2BB2X1M U441 ( .B0(n553), .B1(n173), .A0N(\RF[13][3] ), .A1N(n173), .Y(
        n286) );
  OAI2BB2X1M U442 ( .B0(n554), .B1(n173), .A0N(\RF[13][4] ), .A1N(n173), .Y(
        n287) );
  OAI2BB2X1M U443 ( .B0(n555), .B1(n173), .A0N(\RF[13][5] ), .A1N(n173), .Y(
        n288) );
  OAI2BB2X1M U444 ( .B0(n556), .B1(n173), .A0N(\RF[13][6] ), .A1N(n173), .Y(
        n289) );
  OAI2BB2X1M U445 ( .B0(n557), .B1(n173), .A0N(\RF[13][7] ), .A1N(n173), .Y(
        n290) );
  OAI2BB2X1M U446 ( .B0(n550), .B1(n174), .A0N(\RF[14][0] ), .A1N(n174), .Y(
        n291) );
  OAI2BB2X1M U447 ( .B0(n551), .B1(n174), .A0N(\RF[14][1] ), .A1N(n174), .Y(
        n292) );
  OAI2BB2X1M U448 ( .B0(n552), .B1(n174), .A0N(\RF[14][2] ), .A1N(n174), .Y(
        n293) );
  OAI2BB2X1M U449 ( .B0(n553), .B1(n174), .A0N(\RF[14][3] ), .A1N(n174), .Y(
        n294) );
  OAI2BB2X1M U450 ( .B0(n554), .B1(n174), .A0N(\RF[14][4] ), .A1N(n174), .Y(
        n295) );
  OAI2BB2X1M U451 ( .B0(n555), .B1(n174), .A0N(\RF[14][5] ), .A1N(n174), .Y(
        n296) );
  OAI2BB2X1M U452 ( .B0(n556), .B1(n174), .A0N(\RF[14][6] ), .A1N(n174), .Y(
        n297) );
  OAI2BB2X1M U453 ( .B0(n557), .B1(n174), .A0N(\RF[14][7] ), .A1N(n174), .Y(
        n298) );
  OAI2BB2X1M U454 ( .B0(n550), .B1(n176), .A0N(\RF[15][0] ), .A1N(n176), .Y(
        n299) );
  OAI2BB2X1M U455 ( .B0(n551), .B1(n176), .A0N(\RF[15][1] ), .A1N(n176), .Y(
        n300) );
  OAI2BB2X1M U456 ( .B0(n552), .B1(n176), .A0N(\RF[15][2] ), .A1N(n176), .Y(
        n301) );
  OAI2BB2X1M U457 ( .B0(n553), .B1(n176), .A0N(\RF[15][3] ), .A1N(n176), .Y(
        n302) );
  OAI2BB2X1M U458 ( .B0(n554), .B1(n176), .A0N(\RF[15][4] ), .A1N(n176), .Y(
        n303) );
  OAI2BB2X1M U459 ( .B0(n555), .B1(n176), .A0N(\RF[15][5] ), .A1N(n176), .Y(
        n304) );
  OAI2BB2X1M U460 ( .B0(n556), .B1(n176), .A0N(\RF[15][6] ), .A1N(n176), .Y(
        n305) );
  OAI2BB2X1M U461 ( .B0(n557), .B1(n176), .A0N(\RF[15][7] ), .A1N(n176), .Y(
        n306) );
  AO21XLM U462 ( .A0(RdData_VLD), .A1(n150), .B0(n558), .Y(n178) );
  AOI22X1M U463 ( .A0(\RF[10][0] ), .A1(n546), .B0(\RF[11][0] ), .B1(n545), 
        .Y(n442) );
  AOI22X1M U464 ( .A0(\RF[8][0] ), .A1(n549), .B0(\RF[9][0] ), .B1(n547), .Y(
        n441) );
  CLKNAND2X2M U465 ( .A(N13), .B(n542), .Y(n525) );
  AOI21X1M U466 ( .A0(n442), .A1(n441), .B0(n525), .Y(n452) );
  AOI22X1M U467 ( .A0(\RF[14][0] ), .A1(n546), .B0(\RF[15][0] ), .B1(n545), 
        .Y(n444) );
  AOI22X1M U468 ( .A0(\RF[12][0] ), .A1(n549), .B0(\RF[13][0] ), .B1(n547), 
        .Y(n443) );
  CLKNAND2X2M U469 ( .A(N13), .B(N12), .Y(n528) );
  AOI21X1M U470 ( .A0(n444), .A1(n443), .B0(n528), .Y(n451) );
  AOI22X1M U471 ( .A0(REG2[0]), .A1(n546), .B0(REG3[0]), .B1(n545), .Y(n446)
         );
  AOI22X1M U472 ( .A0(REG0[0]), .A1(n549), .B0(REG1[0]), .B1(n547), .Y(n445)
         );
  CLKNAND2X2M U473 ( .A(n542), .B(n541), .Y(n531) );
  AOI21X1M U474 ( .A0(n446), .A1(n445), .B0(n531), .Y(n450) );
  AOI22X1M U475 ( .A0(\RF[6][0] ), .A1(n546), .B0(\RF[7][0] ), .B1(n545), .Y(
        n448) );
  AOI22X1M U476 ( .A0(\RF[4][0] ), .A1(n549), .B0(\RF[5][0] ), .B1(n547), .Y(
        n447) );
  CLKNAND2X2M U477 ( .A(N12), .B(n541), .Y(n534) );
  AOI21X1M U478 ( .A0(n448), .A1(n447), .B0(n534), .Y(n449) );
  OR4X1M U479 ( .A(n452), .B(n451), .C(n450), .D(n449), .Y(N26) );
  AOI22X1M U480 ( .A0(\RF[10][1] ), .A1(n546), .B0(\RF[11][1] ), .B1(n545), 
        .Y(n454) );
  AOI22X1M U481 ( .A0(\RF[8][1] ), .A1(n549), .B0(\RF[9][1] ), .B1(n547), .Y(
        n453) );
  AOI21X1M U482 ( .A0(n454), .A1(n453), .B0(n525), .Y(n464) );
  AOI22X1M U483 ( .A0(\RF[14][1] ), .A1(n546), .B0(\RF[15][1] ), .B1(n545), 
        .Y(n456) );
  AOI22X1M U484 ( .A0(\RF[12][1] ), .A1(n549), .B0(\RF[13][1] ), .B1(n547), 
        .Y(n455) );
  AOI21X1M U485 ( .A0(n456), .A1(n455), .B0(n528), .Y(n463) );
  AOI22X1M U486 ( .A0(REG2[1]), .A1(n546), .B0(REG3[1]), .B1(n545), .Y(n458)
         );
  AOI22X1M U487 ( .A0(REG0[1]), .A1(n549), .B0(REG1[1]), .B1(n547), .Y(n457)
         );
  AOI21X1M U488 ( .A0(n458), .A1(n457), .B0(n531), .Y(n462) );
  AOI22X1M U489 ( .A0(\RF[6][1] ), .A1(n546), .B0(\RF[7][1] ), .B1(n545), .Y(
        n460) );
  AOI22X1M U490 ( .A0(\RF[4][1] ), .A1(n549), .B0(\RF[5][1] ), .B1(n547), .Y(
        n459) );
  AOI21X1M U491 ( .A0(n460), .A1(n459), .B0(n534), .Y(n461) );
  OR4X1M U492 ( .A(n464), .B(n463), .C(n462), .D(n461), .Y(N25) );
  AOI22X1M U493 ( .A0(\RF[10][2] ), .A1(n546), .B0(\RF[11][2] ), .B1(n545), 
        .Y(n466) );
  AOI22X1M U494 ( .A0(\RF[8][2] ), .A1(n549), .B0(\RF[9][2] ), .B1(n547), .Y(
        n465) );
  AOI21X1M U495 ( .A0(n466), .A1(n465), .B0(n525), .Y(n476) );
  AOI22X1M U496 ( .A0(\RF[14][2] ), .A1(n546), .B0(\RF[15][2] ), .B1(n545), 
        .Y(n468) );
  AOI22X1M U497 ( .A0(\RF[12][2] ), .A1(n549), .B0(\RF[13][2] ), .B1(n547), 
        .Y(n467) );
  AOI21X1M U498 ( .A0(n468), .A1(n467), .B0(n528), .Y(n475) );
  AOI22X1M U499 ( .A0(REG2[2]), .A1(n546), .B0(REG3[2]), .B1(n545), .Y(n470)
         );
  AOI22X1M U500 ( .A0(REG0[2]), .A1(n549), .B0(REG1[2]), .B1(n547), .Y(n469)
         );
  AOI21X1M U501 ( .A0(n470), .A1(n469), .B0(n531), .Y(n474) );
  AOI22X1M U502 ( .A0(\RF[6][2] ), .A1(n546), .B0(n570), .B1(n545), .Y(n472)
         );
  AOI22X1M U503 ( .A0(\RF[4][2] ), .A1(n549), .B0(\RF[5][2] ), .B1(n547), .Y(
        n471) );
  AOI21X1M U504 ( .A0(n472), .A1(n471), .B0(n534), .Y(n473) );
  OR4X1M U505 ( .A(n476), .B(n475), .C(n474), .D(n473), .Y(N24) );
  AOI22X1M U506 ( .A0(\RF[10][3] ), .A1(n546), .B0(\RF[11][3] ), .B1(n545), 
        .Y(n478) );
  AOI22X1M U507 ( .A0(\RF[8][3] ), .A1(n549), .B0(\RF[9][3] ), .B1(n547), .Y(
        n477) );
  AOI21X1M U508 ( .A0(n478), .A1(n477), .B0(n525), .Y(n488) );
  AOI22X1M U509 ( .A0(\RF[14][3] ), .A1(n546), .B0(\RF[15][3] ), .B1(n545), 
        .Y(n480) );
  AOI22X1M U510 ( .A0(\RF[12][3] ), .A1(n549), .B0(\RF[13][3] ), .B1(n547), 
        .Y(n479) );
  AOI21X1M U511 ( .A0(n480), .A1(n479), .B0(n528), .Y(n487) );
  AOI22X1M U512 ( .A0(REG2[3]), .A1(n546), .B0(REG3[3]), .B1(n545), .Y(n482)
         );
  AOI22X1M U513 ( .A0(REG0[3]), .A1(n549), .B0(REG1[3]), .B1(n547), .Y(n481)
         );
  AOI21X1M U514 ( .A0(n482), .A1(n481), .B0(n531), .Y(n486) );
  AOI22X1M U515 ( .A0(\RF[6][3] ), .A1(n546), .B0(\RF[7][3] ), .B1(n545), .Y(
        n484) );
  AOI22X1M U516 ( .A0(\RF[4][3] ), .A1(n549), .B0(\RF[5][3] ), .B1(n547), .Y(
        n483) );
  AOI21X1M U517 ( .A0(n484), .A1(n483), .B0(n534), .Y(n485) );
  OR4X1M U518 ( .A(n488), .B(n487), .C(n486), .D(n485), .Y(N23) );
  AOI22X1M U519 ( .A0(\RF[10][4] ), .A1(n546), .B0(\RF[11][4] ), .B1(n545), 
        .Y(n490) );
  AOI22X1M U520 ( .A0(\RF[8][4] ), .A1(n549), .B0(\RF[9][4] ), .B1(n547), .Y(
        n489) );
  AOI21X1M U521 ( .A0(n490), .A1(n489), .B0(n525), .Y(n500) );
  AOI22X1M U522 ( .A0(\RF[14][4] ), .A1(n546), .B0(\RF[15][4] ), .B1(n545), 
        .Y(n492) );
  AOI22X1M U523 ( .A0(\RF[12][4] ), .A1(n549), .B0(\RF[13][4] ), .B1(n547), 
        .Y(n491) );
  AOI21X1M U524 ( .A0(n492), .A1(n491), .B0(n528), .Y(n499) );
  AOI22X1M U525 ( .A0(REG2[4]), .A1(n546), .B0(REG3[4]), .B1(n545), .Y(n494)
         );
  AOI22X1M U526 ( .A0(REG0[4]), .A1(n549), .B0(REG1[4]), .B1(n547), .Y(n493)
         );
  AOI21X1M U527 ( .A0(n494), .A1(n493), .B0(n531), .Y(n498) );
  AOI22X1M U528 ( .A0(\RF[6][4] ), .A1(n546), .B0(\RF[7][4] ), .B1(n545), .Y(
        n496) );
  AOI22X1M U529 ( .A0(\RF[4][4] ), .A1(n549), .B0(\RF[5][4] ), .B1(n547), .Y(
        n495) );
  AOI21X1M U530 ( .A0(n496), .A1(n495), .B0(n534), .Y(n497) );
  OR4X1M U531 ( .A(n500), .B(n499), .C(n498), .D(n497), .Y(N22) );
  AOI22X1M U532 ( .A0(\RF[10][5] ), .A1(n546), .B0(\RF[11][5] ), .B1(n545), 
        .Y(n502) );
  AOI22X1M U533 ( .A0(\RF[8][5] ), .A1(n549), .B0(\RF[9][5] ), .B1(n547), .Y(
        n501) );
  AOI21X1M U534 ( .A0(n502), .A1(n501), .B0(n525), .Y(n512) );
  AOI22X1M U535 ( .A0(\RF[14][5] ), .A1(n546), .B0(\RF[15][5] ), .B1(n545), 
        .Y(n504) );
  AOI22X1M U536 ( .A0(\RF[12][5] ), .A1(n549), .B0(\RF[13][5] ), .B1(n547), 
        .Y(n503) );
  AOI21X1M U537 ( .A0(n504), .A1(n503), .B0(n528), .Y(n511) );
  AOI22X1M U538 ( .A0(REG2[5]), .A1(n546), .B0(REG3[5]), .B1(n545), .Y(n506)
         );
  AOI22X1M U539 ( .A0(REG0[5]), .A1(n549), .B0(REG1[5]), .B1(n547), .Y(n505)
         );
  AOI21X1M U540 ( .A0(n506), .A1(n505), .B0(n531), .Y(n510) );
  AOI22X1M U541 ( .A0(\RF[6][5] ), .A1(n546), .B0(\RF[7][5] ), .B1(n545), .Y(
        n508) );
  AOI22X1M U542 ( .A0(\RF[4][5] ), .A1(n549), .B0(\RF[5][5] ), .B1(n547), .Y(
        n507) );
  AOI21X1M U543 ( .A0(n508), .A1(n507), .B0(n534), .Y(n509) );
  OR4X1M U544 ( .A(n512), .B(n511), .C(n510), .D(n509), .Y(N21) );
  AOI22X1M U545 ( .A0(\RF[10][6] ), .A1(n546), .B0(\RF[11][6] ), .B1(n545), 
        .Y(n514) );
  AOI22X1M U546 ( .A0(\RF[8][6] ), .A1(n549), .B0(\RF[9][6] ), .B1(n547), .Y(
        n513) );
  AOI21X1M U547 ( .A0(n514), .A1(n513), .B0(n525), .Y(n524) );
  AOI22X1M U548 ( .A0(\RF[14][6] ), .A1(n546), .B0(\RF[15][6] ), .B1(n545), 
        .Y(n516) );
  AOI22X1M U549 ( .A0(\RF[12][6] ), .A1(n549), .B0(\RF[13][6] ), .B1(n547), 
        .Y(n515) );
  AOI21X1M U550 ( .A0(n516), .A1(n515), .B0(n528), .Y(n523) );
  AOI22X1M U551 ( .A0(REG2[6]), .A1(n546), .B0(REG3[6]), .B1(n545), .Y(n518)
         );
  AOI22X1M U552 ( .A0(REG0[6]), .A1(n549), .B0(REG1[6]), .B1(n547), .Y(n517)
         );
  AOI21X1M U553 ( .A0(n518), .A1(n517), .B0(n531), .Y(n522) );
  AOI22X1M U554 ( .A0(\RF[6][6] ), .A1(n546), .B0(\RF[7][6] ), .B1(n545), .Y(
        n520) );
  AOI22X1M U555 ( .A0(\RF[4][6] ), .A1(n549), .B0(\RF[5][6] ), .B1(n547), .Y(
        n519) );
  AOI21X1M U556 ( .A0(n520), .A1(n519), .B0(n534), .Y(n521) );
  OR4X1M U557 ( .A(n524), .B(n523), .C(n522), .D(n521), .Y(N20) );
  AOI22X1M U558 ( .A0(\RF[10][7] ), .A1(n546), .B0(\RF[11][7] ), .B1(n545), 
        .Y(n527) );
  AOI22X1M U559 ( .A0(\RF[8][7] ), .A1(n549), .B0(\RF[9][7] ), .B1(n547), .Y(
        n526) );
  AOI21X1M U560 ( .A0(n527), .A1(n526), .B0(n525), .Y(n540) );
  AOI22X1M U561 ( .A0(\RF[14][7] ), .A1(n546), .B0(\RF[15][7] ), .B1(n545), 
        .Y(n530) );
  AOI22X1M U562 ( .A0(\RF[12][7] ), .A1(n549), .B0(\RF[13][7] ), .B1(n547), 
        .Y(n529) );
  AOI21X1M U563 ( .A0(n530), .A1(n529), .B0(n528), .Y(n539) );
  AOI22X1M U564 ( .A0(REG2[7]), .A1(n546), .B0(REG3[7]), .B1(n545), .Y(n533)
         );
  AOI22X1M U565 ( .A0(REG0[7]), .A1(n549), .B0(REG1[7]), .B1(n547), .Y(n532)
         );
  AOI21X1M U566 ( .A0(n533), .A1(n532), .B0(n531), .Y(n538) );
  AOI22X1M U567 ( .A0(\RF[6][7] ), .A1(n546), .B0(\RF[7][7] ), .B1(n545), .Y(
        n536) );
  AOI22X1M U568 ( .A0(\RF[4][7] ), .A1(n549), .B0(\RF[5][7] ), .B1(n547), .Y(
        n535) );
  AOI21X1M U569 ( .A0(n536), .A1(n535), .B0(n534), .Y(n537) );
  OR4X1M U570 ( .A(n540), .B(n539), .C(n538), .D(n537), .Y(N19) );
  INVXLM U571 ( .A(test_so1), .Y(n564) );
  INVXLM U572 ( .A(n564), .Y(n565) );
  DLY1X1M U573 ( .A(test_se), .Y(n566) );
  DLY1X1M U574 ( .A(test_se), .Y(n567) );
  DLY1X1M U575 ( .A(test_se), .Y(n568) );
  DLY1X1M U576 ( .A(test_se), .Y(n569) );
  DLY1X1M U577 ( .A(n565), .Y(n570) );
  SDFFRHQX1M \RF_reg[7][2]  ( .D(n237), .SI(\RF[7][1] ), .SE(n569), .CK(CLK), 
        .RN(RST), .Q(\RF[7][2] ) );
  INVXLM U3 ( .A(\RF[7][2] ), .Y(n1) );
  INVX2M U4 ( .A(n1), .Y(test_so1) );
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
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21;

  ADDFX2M \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n13), 
        .CI(\u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n15), 
        .CI(\u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n16), 
        .CI(\u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n17), 
        .CI(\u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n14), 
        .CI(\u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n13), 
        .CI(\u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n12), 
        .CI(\u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n11), 
        .CI(\u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n17), 
        .CI(\u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n17), 
        .CI(\u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n17), 
        .CI(\u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n17), 
        .CI(\u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n17), 
        .CI(\u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n17), 
        .CI(\u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n16), 
        .CI(\u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n15), 
        .CI(\u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n14), 
        .CI(\u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n13), 
        .CI(\u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n14), 
        .CI(\u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n15), 
        .CI(\u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n14), 
        .CI(\u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n16), 
        .CI(\u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n15), 
        .CI(\u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n16), 
        .CI(\u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n15), 
        .CI(\u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n16), 
        .CI(\u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n16), 
        .CI(\u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  ADDFX2M \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n12), 
        .CI(\u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  INVX2M U1 ( .A(b[0]), .Y(n18) );
  XNOR2X2M U2 ( .A(n18), .B(a[7]), .Y(\u_div/SumTmp[7][0] ) );
  XNOR2X2M U3 ( .A(n18), .B(a[6]), .Y(\u_div/SumTmp[6][0] ) );
  XNOR2X2M U4 ( .A(n18), .B(a[5]), .Y(\u_div/SumTmp[5][0] ) );
  XNOR2X2M U5 ( .A(n18), .B(a[4]), .Y(\u_div/SumTmp[4][0] ) );
  XNOR2X2M U6 ( .A(n18), .B(a[3]), .Y(\u_div/SumTmp[3][0] ) );
  XNOR2X2M U7 ( .A(n18), .B(a[2]), .Y(\u_div/SumTmp[2][0] ) );
  OR2X2M U8 ( .A(n18), .B(a[7]), .Y(\u_div/CryTmp[7][1] ) );
  XNOR2X2M U9 ( .A(n18), .B(a[1]), .Y(\u_div/SumTmp[1][0] ) );
  NAND2X2M U10 ( .A(n2), .B(n3), .Y(\u_div/CryTmp[5][1] ) );
  INVX2M U11 ( .A(a[5]), .Y(n3) );
  INVX2M U12 ( .A(n18), .Y(n2) );
  NAND2X2M U13 ( .A(n4), .B(n5), .Y(\u_div/CryTmp[4][1] ) );
  INVX2M U14 ( .A(a[4]), .Y(n5) );
  INVX2M U15 ( .A(n18), .Y(n4) );
  NAND2X2M U16 ( .A(n6), .B(n7), .Y(\u_div/CryTmp[3][1] ) );
  INVX2M U17 ( .A(a[3]), .Y(n7) );
  INVX2M U18 ( .A(n18), .Y(n6) );
  NAND2X2M U19 ( .A(n2), .B(n8), .Y(\u_div/CryTmp[2][1] ) );
  INVX2M U20 ( .A(a[2]), .Y(n8) );
  NAND2X2M U21 ( .A(n6), .B(n9), .Y(\u_div/CryTmp[1][1] ) );
  INVX2M U22 ( .A(a[1]), .Y(n9) );
  NAND2X2M U23 ( .A(n4), .B(n10), .Y(\u_div/CryTmp[0][1] ) );
  INVX2M U24 ( .A(a[0]), .Y(n10) );
  NAND2X2M U25 ( .A(n2), .B(n1), .Y(\u_div/CryTmp[6][1] ) );
  INVX2M U26 ( .A(a[6]), .Y(n1) );
  INVX2M U27 ( .A(b[6]), .Y(n12) );
  INVX2M U28 ( .A(b[1]), .Y(n17) );
  INVX2M U29 ( .A(b[2]), .Y(n16) );
  INVX2M U30 ( .A(b[3]), .Y(n15) );
  INVX2M U31 ( .A(b[4]), .Y(n14) );
  INVX2M U32 ( .A(b[5]), .Y(n13) );
  INVX2M U33 ( .A(b[7]), .Y(n11) );
  CLKMX2X2M U34 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][7] ) );
  CLKMX2X2M U35 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][6] ) );
  CLKMX2X2M U36 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][5] ) );
  CLKMX2X2M U37 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][4] ) );
  CLKMX2X2M U38 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][3] ) );
  CLKMX2X2M U39 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S0(
        quotient[6]), .Y(\u_div/PartRem[6][2] ) );
  CLKMX2X2M U40 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S0(quotient[7]), .Y(
        \u_div/PartRem[7][1] ) );
  CLKMX2X2M U41 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][6] ) );
  CLKMX2X2M U42 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][5] ) );
  CLKMX2X2M U43 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][4] ) );
  CLKMX2X2M U44 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][3] ) );
  CLKMX2X2M U45 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S0(
        quotient[5]), .Y(\u_div/PartRem[5][2] ) );
  CLKMX2X2M U46 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S0(quotient[6]), .Y(
        \u_div/PartRem[6][1] ) );
  CLKMX2X2M U47 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][5] ) );
  CLKMX2X2M U48 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][4] ) );
  CLKMX2X2M U49 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][3] ) );
  CLKMX2X2M U50 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S0(
        quotient[4]), .Y(\u_div/PartRem[4][2] ) );
  CLKMX2X2M U51 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S0(quotient[5]), .Y(
        \u_div/PartRem[5][1] ) );
  CLKMX2X2M U52 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][4] ) );
  CLKMX2X2M U53 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][3] ) );
  CLKMX2X2M U54 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S0(
        quotient[3]), .Y(\u_div/PartRem[3][2] ) );
  CLKMX2X2M U55 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S0(quotient[4]), .Y(
        \u_div/PartRem[4][1] ) );
  CLKMX2X2M U56 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][3] ) );
  CLKMX2X2M U57 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S0(
        quotient[2]), .Y(\u_div/PartRem[2][2] ) );
  CLKMX2X2M U58 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S0(quotient[3]), .Y(
        \u_div/PartRem[3][1] ) );
  CLKMX2X2M U59 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S0(
        quotient[1]), .Y(\u_div/PartRem[1][2] ) );
  CLKMX2X2M U60 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S0(quotient[2]), .Y(
        \u_div/PartRem[2][1] ) );
  CLKMX2X2M U61 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S0(quotient[1]), .Y(
        \u_div/PartRem[1][1] ) );
  AND4X1M U62 ( .A(\u_div/CryTmp[7][1] ), .B(n19), .C(n17), .D(n16), .Y(
        quotient[7]) );
  AND3X1M U63 ( .A(n19), .B(n16), .C(\u_div/CryTmp[6][2] ), .Y(quotient[6]) );
  AND2X1M U64 ( .A(\u_div/CryTmp[5][3] ), .B(n19), .Y(quotient[5]) );
  AND2X1M U65 ( .A(n20), .B(n15), .Y(n19) );
  AND2X1M U66 ( .A(\u_div/CryTmp[4][4] ), .B(n20), .Y(quotient[4]) );
  AND3X1M U67 ( .A(n21), .B(n14), .C(n13), .Y(n20) );
  AND3X1M U68 ( .A(n21), .B(n13), .C(\u_div/CryTmp[3][5] ), .Y(quotient[3]) );
  AND2X1M U69 ( .A(\u_div/CryTmp[2][6] ), .B(n21), .Y(quotient[2]) );
  NOR2X1M U70 ( .A(b[6]), .B(b[7]), .Y(n21) );
  AND2X1M U71 ( .A(\u_div/CryTmp[1][7] ), .B(n11), .Y(quotient[1]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n2, n3, n4, n5, n6, n7, n8, n9;
  wire   [9:0] carry;

  ADDFX2M U2_7 ( .A(A[7]), .B(n2), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7])
         );
  ADDFX2M U2_1 ( .A(A[1]), .B(n8), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1])
         );
  ADDFX2M U2_5 ( .A(A[5]), .B(n4), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5])
         );
  ADDFX2M U2_4 ( .A(A[4]), .B(n5), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4])
         );
  ADDFX2M U2_3 ( .A(A[3]), .B(n6), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3])
         );
  ADDFX2M U2_2 ( .A(A[2]), .B(n7), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2])
         );
  ADDFX2M U2_6 ( .A(A[6]), .B(n3), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6])
         );
  XNOR2X2M U1 ( .A(n9), .B(A[0]), .Y(DIFF[0]) );
  INVX2M U2 ( .A(B[6]), .Y(n3) );
  INVX2M U3 ( .A(B[0]), .Y(n9) );
  INVX2M U4 ( .A(B[2]), .Y(n7) );
  INVX2M U5 ( .A(B[3]), .Y(n6) );
  INVX2M U6 ( .A(B[4]), .Y(n5) );
  INVX2M U7 ( .A(B[5]), .Y(n4) );
  NAND2X2M U8 ( .A(B[0]), .B(n1), .Y(carry[1]) );
  INVX2M U9 ( .A(B[1]), .Y(n8) );
  INVX2M U10 ( .A(A[0]), .Y(n1) );
  INVX2M U11 ( .A(B[7]), .Y(n2) );
  CLKINVX1M U12 ( .A(carry[8]), .Y(DIFF[8]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

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
  wire   n1, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26, n27;

  AOI21BX2M U2 ( .A0(n18), .A1(A[12]), .B0N(n19), .Y(n1) );
  NAND2X2M U3 ( .A(A[7]), .B(B[7]), .Y(n15) );
  XNOR2X2M U4 ( .A(A[7]), .B(n8), .Y(SUM[7]) );
  INVX2M U5 ( .A(B[7]), .Y(n8) );
  XNOR2X2M U6 ( .A(B[13]), .B(n1), .Y(SUM[13]) );
  INVX2M U7 ( .A(A[6]), .Y(n9) );
  INVX2M U8 ( .A(n9), .Y(SUM[6]) );
  BUFX2M U9 ( .A(A[0]), .Y(SUM[0]) );
  BUFX2M U10 ( .A(A[1]), .Y(SUM[1]) );
  BUFX2M U11 ( .A(A[2]), .Y(SUM[2]) );
  BUFX2M U12 ( .A(A[3]), .Y(SUM[3]) );
  BUFX2M U13 ( .A(A[4]), .Y(SUM[4]) );
  BUFX2M U14 ( .A(A[5]), .Y(SUM[5]) );
  XNOR2X1M U15 ( .A(n10), .B(n11), .Y(SUM[9]) );
  NOR2X1M U16 ( .A(n12), .B(n13), .Y(n11) );
  CLKXOR2X2M U17 ( .A(n14), .B(n15), .Y(SUM[8]) );
  NAND2BX1M U18 ( .AN(n16), .B(n17), .Y(n14) );
  OAI21X1M U19 ( .A0(A[12]), .A1(n18), .B0(B[12]), .Y(n19) );
  XOR3XLM U20 ( .A(B[12]), .B(A[12]), .C(n18), .Y(SUM[12]) );
  OAI21BX1M U21 ( .A0(n20), .A1(n21), .B0N(n22), .Y(n18) );
  XNOR2X1M U22 ( .A(n21), .B(n23), .Y(SUM[11]) );
  NOR2X1M U23 ( .A(n22), .B(n20), .Y(n23) );
  NOR2X1M U24 ( .A(B[11]), .B(A[11]), .Y(n20) );
  AND2X1M U25 ( .A(B[11]), .B(A[11]), .Y(n22) );
  OA21X1M U26 ( .A0(n24), .A1(n25), .B0(n26), .Y(n21) );
  CLKXOR2X2M U27 ( .A(n27), .B(n25), .Y(SUM[10]) );
  AOI2BB1X1M U28 ( .A0N(n10), .A1N(n13), .B0(n12), .Y(n25) );
  AND2X1M U29 ( .A(B[9]), .B(A[9]), .Y(n12) );
  NOR2X1M U30 ( .A(B[9]), .B(A[9]), .Y(n13) );
  OA21X1M U31 ( .A0(n15), .A1(n16), .B0(n17), .Y(n10) );
  CLKNAND2X2M U32 ( .A(B[8]), .B(A[8]), .Y(n17) );
  NOR2X1M U33 ( .A(B[8]), .B(A[8]), .Y(n16) );
  NAND2BX1M U34 ( .AN(n24), .B(n26), .Y(n27) );
  CLKNAND2X2M U35 ( .A(B[10]), .B(A[10]), .Y(n26) );
  NOR2X1M U36 ( .A(B[10]), .B(A[10]), .Y(n24) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \SUMB[1][6] , \SUMB[1][5] , \SUMB[1][4] ,
         \SUMB[1][3] , \SUMB[1][2] , \SUMB[1][1] , \A1[12] , \A1[11] ,
         \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \A1[4] , \A1[3] ,
         \A1[2] , \A1[1] , \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39;

  ADDFX2M S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  ADDFX2M S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  ADDFX2M S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  ADDFX2M S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  ADDFX2M S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  ADDFX2M S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  ADDFX2M S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  ADDFX2M S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  ADDFX2M S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  ADDFX2M S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  ADDFX2M S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  ADDFX2M S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  ADDFX2M S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  ADDFX2M S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  ADDFX2M S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  ADDFX2M S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  ADDFX2M S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  ADDFX2M S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  ADDFX2M S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  ADDFX2M S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  ADDFX2M S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  ADDFX2M S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  ADDFX2M S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  ADDFX2M S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  ADDFX2M S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  ADDFX2M S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  ADDFX2M S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  ADDFX2M S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  ADDFX2M S3_2_6 ( .A(\ab[2][6] ), .B(n8), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), .S(\SUMB[2][6] ) );
  ADDFX2M S1_2_0 ( .A(\ab[2][0] ), .B(n9), .CI(\SUMB[1][1] ), .CO(
        \CARRYB[2][0] ), .S(\A1[0] ) );
  ADDFX2M S2_2_1 ( .A(\ab[2][1] ), .B(n7), .CI(\SUMB[1][2] ), .CO(
        \CARRYB[2][1] ), .S(\SUMB[2][1] ) );
  ADDFX2M S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(\SUMB[1][3] ), .CO(
        \CARRYB[2][2] ), .S(\SUMB[2][2] ) );
  ADDFX2M S2_2_3 ( .A(\ab[2][3] ), .B(n5), .CI(\SUMB[1][4] ), .CO(
        \CARRYB[2][3] ), .S(\SUMB[2][3] ) );
  ADDFX2M S2_2_4 ( .A(\ab[2][4] ), .B(n4), .CI(\SUMB[1][5] ), .CO(
        \CARRYB[2][4] ), .S(\SUMB[2][4] ) );
  ADDFX2M S2_2_5 ( .A(\ab[2][5] ), .B(n3), .CI(\SUMB[1][6] ), .CO(
        \CARRYB[2][5] ), .S(\SUMB[2][5] ) );
  ADDFX2M S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  ADDFX2M S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  ADDFX2M S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  ADDFX2M S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  ADDFX2M S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  ADDFX2M S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  ADDFX2M S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  AND2X2M U2 ( .A(\ab[0][6] ), .B(\ab[1][5] ), .Y(n3) );
  AND2X2M U3 ( .A(\ab[0][5] ), .B(\ab[1][4] ), .Y(n4) );
  AND2X2M U4 ( .A(\ab[0][4] ), .B(\ab[1][3] ), .Y(n5) );
  AND2X2M U5 ( .A(\ab[0][3] ), .B(\ab[1][2] ), .Y(n6) );
  AND2X2M U6 ( .A(\ab[0][2] ), .B(\ab[1][1] ), .Y(n7) );
  AND2X2M U7 ( .A(\ab[0][7] ), .B(\ab[1][6] ), .Y(n8) );
  AND2X2M U8 ( .A(\ab[0][1] ), .B(\ab[1][0] ), .Y(n9) );
  AND2X2M U9 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(n10) );
  INVX2M U10 ( .A(\ab[0][6] ), .Y(n22) );
  CLKXOR2X2M U11 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(\A1[7] ) );
  CLKXOR2X2M U12 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Y(PRODUCT[1]) );
  CLKXOR2X2M U13 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Y(\A1[12] ) );
  CLKXOR2X2M U14 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(\A1[8] ) );
  CLKXOR2X2M U15 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(\A1[10] ) );
  CLKXOR2X2M U16 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(\A1[9] ) );
  CLKXOR2X2M U17 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(\A1[11] ) );
  INVX2M U18 ( .A(\ab[0][7] ), .Y(n23) );
  INVX2M U19 ( .A(\ab[0][5] ), .Y(n21) );
  INVX2M U20 ( .A(\ab[0][4] ), .Y(n20) );
  INVX2M U21 ( .A(\ab[0][3] ), .Y(n19) );
  INVX2M U22 ( .A(\ab[0][2] ), .Y(n18) );
  XNOR2X2M U23 ( .A(\CARRYB[7][0] ), .B(n17), .Y(\A1[6] ) );
  INVX2M U24 ( .A(\SUMB[7][1] ), .Y(n17) );
  AND2X2M U25 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Y(n11) );
  AND2X2M U26 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Y(n12) );
  AND2X2M U27 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Y(n13) );
  AND2X2M U28 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Y(n14) );
  AND2X2M U29 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Y(n15) );
  AND2X2M U30 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Y(n16) );
  XNOR2X2M U31 ( .A(\ab[1][6] ), .B(n23), .Y(\SUMB[1][6] ) );
  XNOR2X2M U32 ( .A(\ab[1][5] ), .B(n22), .Y(\SUMB[1][5] ) );
  XNOR2X2M U33 ( .A(\ab[1][4] ), .B(n21), .Y(\SUMB[1][4] ) );
  XNOR2X2M U34 ( .A(\ab[1][3] ), .B(n20), .Y(\SUMB[1][3] ) );
  XNOR2X2M U35 ( .A(\ab[1][2] ), .B(n19), .Y(\SUMB[1][2] ) );
  XNOR2X2M U36 ( .A(\ab[1][1] ), .B(n18), .Y(\SUMB[1][1] ) );
  INVX2M U37 ( .A(A[7]), .Y(n32) );
  INVX2M U38 ( .A(A[6]), .Y(n33) );
  INVX2M U39 ( .A(A[1]), .Y(n38) );
  INVX2M U40 ( .A(A[0]), .Y(n39) );
  INVX2M U41 ( .A(A[3]), .Y(n36) );
  INVX2M U42 ( .A(A[2]), .Y(n37) );
  INVX2M U43 ( .A(A[5]), .Y(n34) );
  INVX2M U44 ( .A(A[4]), .Y(n35) );
  INVX2M U45 ( .A(B[6]), .Y(n25) );
  INVX2M U46 ( .A(B[0]), .Y(n31) );
  INVX2M U47 ( .A(B[2]), .Y(n29) );
  INVX2M U48 ( .A(B[3]), .Y(n28) );
  INVX2M U49 ( .A(B[7]), .Y(n24) );
  INVX2M U50 ( .A(B[4]), .Y(n27) );
  INVX2M U51 ( .A(B[5]), .Y(n26) );
  INVX2M U52 ( .A(B[1]), .Y(n30) );
  NOR2X1M U54 ( .A(n32), .B(n24), .Y(\ab[7][7] ) );
  NOR2X1M U55 ( .A(n32), .B(n25), .Y(\ab[7][6] ) );
  NOR2X1M U56 ( .A(n32), .B(n26), .Y(\ab[7][5] ) );
  NOR2X1M U57 ( .A(n32), .B(n27), .Y(\ab[7][4] ) );
  NOR2X1M U58 ( .A(n32), .B(n28), .Y(\ab[7][3] ) );
  NOR2X1M U59 ( .A(n32), .B(n29), .Y(\ab[7][2] ) );
  NOR2X1M U60 ( .A(n32), .B(n30), .Y(\ab[7][1] ) );
  NOR2X1M U61 ( .A(n32), .B(n31), .Y(\ab[7][0] ) );
  NOR2X1M U62 ( .A(n24), .B(n33), .Y(\ab[6][7] ) );
  NOR2X1M U63 ( .A(n25), .B(n33), .Y(\ab[6][6] ) );
  NOR2X1M U64 ( .A(n26), .B(n33), .Y(\ab[6][5] ) );
  NOR2X1M U65 ( .A(n27), .B(n33), .Y(\ab[6][4] ) );
  NOR2X1M U66 ( .A(n28), .B(n33), .Y(\ab[6][3] ) );
  NOR2X1M U67 ( .A(n29), .B(n33), .Y(\ab[6][2] ) );
  NOR2X1M U68 ( .A(n30), .B(n33), .Y(\ab[6][1] ) );
  NOR2X1M U69 ( .A(n31), .B(n33), .Y(\ab[6][0] ) );
  NOR2X1M U70 ( .A(n24), .B(n34), .Y(\ab[5][7] ) );
  NOR2X1M U71 ( .A(n25), .B(n34), .Y(\ab[5][6] ) );
  NOR2X1M U72 ( .A(n26), .B(n34), .Y(\ab[5][5] ) );
  NOR2X1M U73 ( .A(n27), .B(n34), .Y(\ab[5][4] ) );
  NOR2X1M U74 ( .A(n28), .B(n34), .Y(\ab[5][3] ) );
  NOR2X1M U75 ( .A(n29), .B(n34), .Y(\ab[5][2] ) );
  NOR2X1M U76 ( .A(n30), .B(n34), .Y(\ab[5][1] ) );
  NOR2X1M U77 ( .A(n31), .B(n34), .Y(\ab[5][0] ) );
  NOR2X1M U78 ( .A(n24), .B(n35), .Y(\ab[4][7] ) );
  NOR2X1M U79 ( .A(n25), .B(n35), .Y(\ab[4][6] ) );
  NOR2X1M U80 ( .A(n26), .B(n35), .Y(\ab[4][5] ) );
  NOR2X1M U81 ( .A(n27), .B(n35), .Y(\ab[4][4] ) );
  NOR2X1M U82 ( .A(n28), .B(n35), .Y(\ab[4][3] ) );
  NOR2X1M U83 ( .A(n29), .B(n35), .Y(\ab[4][2] ) );
  NOR2X1M U84 ( .A(n30), .B(n35), .Y(\ab[4][1] ) );
  NOR2X1M U85 ( .A(n31), .B(n35), .Y(\ab[4][0] ) );
  NOR2X1M U86 ( .A(n24), .B(n36), .Y(\ab[3][7] ) );
  NOR2X1M U87 ( .A(n25), .B(n36), .Y(\ab[3][6] ) );
  NOR2X1M U88 ( .A(n26), .B(n36), .Y(\ab[3][5] ) );
  NOR2X1M U89 ( .A(n27), .B(n36), .Y(\ab[3][4] ) );
  NOR2X1M U90 ( .A(n28), .B(n36), .Y(\ab[3][3] ) );
  NOR2X1M U91 ( .A(n29), .B(n36), .Y(\ab[3][2] ) );
  NOR2X1M U92 ( .A(n30), .B(n36), .Y(\ab[3][1] ) );
  NOR2X1M U93 ( .A(n31), .B(n36), .Y(\ab[3][0] ) );
  NOR2X1M U94 ( .A(n24), .B(n37), .Y(\ab[2][7] ) );
  NOR2X1M U95 ( .A(n25), .B(n37), .Y(\ab[2][6] ) );
  NOR2X1M U96 ( .A(n26), .B(n37), .Y(\ab[2][5] ) );
  NOR2X1M U97 ( .A(n27), .B(n37), .Y(\ab[2][4] ) );
  NOR2X1M U98 ( .A(n28), .B(n37), .Y(\ab[2][3] ) );
  NOR2X1M U99 ( .A(n29), .B(n37), .Y(\ab[2][2] ) );
  NOR2X1M U100 ( .A(n30), .B(n37), .Y(\ab[2][1] ) );
  NOR2X1M U101 ( .A(n31), .B(n37), .Y(\ab[2][0] ) );
  NOR2X1M U102 ( .A(n24), .B(n38), .Y(\ab[1][7] ) );
  NOR2X1M U103 ( .A(n25), .B(n38), .Y(\ab[1][6] ) );
  NOR2X1M U104 ( .A(n26), .B(n38), .Y(\ab[1][5] ) );
  NOR2X1M U105 ( .A(n27), .B(n38), .Y(\ab[1][4] ) );
  NOR2X1M U106 ( .A(n28), .B(n38), .Y(\ab[1][3] ) );
  NOR2X1M U107 ( .A(n29), .B(n38), .Y(\ab[1][2] ) );
  NOR2X1M U108 ( .A(n30), .B(n38), .Y(\ab[1][1] ) );
  NOR2X1M U109 ( .A(n31), .B(n38), .Y(\ab[1][0] ) );
  NOR2X1M U110 ( .A(n24), .B(n39), .Y(\ab[0][7] ) );
  NOR2X1M U111 ( .A(n25), .B(n39), .Y(\ab[0][6] ) );
  NOR2X1M U112 ( .A(n26), .B(n39), .Y(\ab[0][5] ) );
  NOR2X1M U113 ( .A(n27), .B(n39), .Y(\ab[0][4] ) );
  NOR2X1M U114 ( .A(n28), .B(n39), .Y(\ab[0][3] ) );
  NOR2X1M U115 ( .A(n29), .B(n39), .Y(\ab[0][2] ) );
  NOR2X1M U116 ( .A(n30), .B(n39), .Y(\ab[0][1] ) );
  NOR2X1M U117 ( .A(n31), .B(n39), .Y(PRODUCT[0]) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_1 FS_1 ( .A({1'b0, \A1[12] , \A1[11] , 
        \A1[10] , \A1[9] , \A1[8] , \A1[7] , \A1[6] , \SUMB[7][0] , \A1[4] , 
        \A1[3] , \A1[2] , \A1[1] , \A1[0] }), .B({n10, n14, n16, n13, n15, n12, 
        n11, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0}), .CI(1'b0), .SUM(
        PRODUCT[15:2]) );
endmodule


module ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 ( A, B, EN, ALU_FUN, CLK, RST, 
        ALU_OUT, OUT_VALID, test_si, test_se );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input EN, CLK, RST, test_si, test_se;
  output OUT_VALID;
  wire   N91, N92, N93, N94, N95, N96, N97, N98, N99, N100, N101, N102, N103,
         N104, N105, N106, N107, N108, N109, N110, N111, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, N128, N129, N130, N131, N132, N157, N158, N159, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104,
         n105, n106, n107, n108, n109, n110, n111, n112, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n3, n4, n5, n6,
         n7, n8, n9, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37,
         n38, n39, n40, n41, n42, n43, n44, n45, n46, n47, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157;
  wire   [15:0] ALU_OUT_Comb;

  SDFFRHQX1M \ALU_OUT_reg[0]  ( .D(ALU_OUT_Comb[0]), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[0]) );
  BUFX2M U7 ( .A(A[6]), .Y(n28) );
  OAI2BB1X2M U23 ( .A0N(n145), .A1N(n122), .B0(n118), .Y(n64) );
  OAI2BB1X2M U24 ( .A0N(n117), .A1N(n116), .B0(n118), .Y(n65) );
  NOR2BX2M U25 ( .AN(n123), .B(n142), .Y(n54) );
  AND2X2M U26 ( .A(n116), .B(n122), .Y(n59) );
  NOR2BX2M U27 ( .AN(n52), .B(n146), .Y(n48) );
  AND2X2M U28 ( .A(n123), .B(n122), .Y(n67) );
  INVX2M U29 ( .A(EN), .Y(n146) );
  BUFX2M U30 ( .A(n58), .Y(n30) );
  NOR2X2M U31 ( .A(n124), .B(n142), .Y(n58) );
  INVX2M U32 ( .A(n117), .Y(n142) );
  INVX2M U33 ( .A(n108), .Y(n143) );
  OAI2BB1X2M U34 ( .A0N(N118), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[9]) );
  OAI2BB1X2M U35 ( .A0N(N119), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[10]) );
  OAI2BB1X2M U36 ( .A0N(N120), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[11]) );
  OAI2BB1X2M U37 ( .A0N(N121), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[12]) );
  OAI2BB1X2M U38 ( .A0N(N122), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[13]) );
  OAI2BB1X2M U39 ( .A0N(N123), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[14]) );
  OAI2BB1X2M U40 ( .A0N(N124), .A1N(n48), .B0(n49), .Y(ALU_OUT_Comb[15]) );
  INVX2M U41 ( .A(n124), .Y(n145) );
  NOR3BX2M U42 ( .AN(n122), .B(n144), .C(ALU_FUN[2]), .Y(n66) );
  NOR3X2M U43 ( .A(n142), .B(ALU_FUN[2]), .C(n144), .Y(n52) );
  NOR2X2M U44 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n123) );
  AND3X2M U45 ( .A(n123), .B(n141), .C(n3), .Y(n63) );
  NAND3X2M U46 ( .A(n145), .B(n141), .C(n3), .Y(n53) );
  NAND2X2M U47 ( .A(ALU_FUN[2]), .B(ALU_FUN[1]), .Y(n124) );
  INVX2M U48 ( .A(ALU_FUN[0]), .Y(n141) );
  NOR2X2M U49 ( .A(n141), .B(n3), .Y(n122) );
  NOR2X2M U50 ( .A(n3), .B(ALU_FUN[0]), .Y(n117) );
  NAND3X2M U51 ( .A(n3), .B(ALU_FUN[0]), .C(n116), .Y(n108) );
  INVX2M U52 ( .A(ALU_FUN[1]), .Y(n144) );
  NAND2X2M U53 ( .A(EN), .B(n140), .Y(n49) );
  NAND3X2M U54 ( .A(n123), .B(ALU_FUN[0]), .C(n3), .Y(n118) );
  AND2X2M U55 ( .A(ALU_FUN[2]), .B(n144), .Y(n116) );
  AND4X2M U56 ( .A(N159), .B(n116), .C(n3), .D(n141), .Y(n107) );
  INVX2M U57 ( .A(n4), .Y(n139) );
  OAI222X1M U58 ( .A0(n72), .A1(n139), .B0(n4), .B1(n73), .C0(n53), .C1(n152), 
        .Y(n71) );
  AOI221XLM U59 ( .A0(n28), .A1(n63), .B0(n64), .B1(n151), .C0(n30), .Y(n73)
         );
  AOI221XLM U60 ( .A0(n63), .A1(n151), .B0(n28), .B1(n65), .C0(n59), .Y(n72)
         );
  AOI31X2M U61 ( .A0(n92), .A1(n93), .A2(n94), .B0(n146), .Y(ALU_OUT_Comb[2])
         );
  AOI22X1M U62 ( .A0(N102), .A1(n67), .B0(N93), .B1(n54), .Y(n92) );
  AOI221XLM U63 ( .A0(n8), .A1(n143), .B0(n30), .B1(n155), .C0(n95), .Y(n94)
         );
  AOI222X1M U64 ( .A0(N111), .A1(n52), .B0(n7), .B1(n59), .C0(N127), .C1(n66), 
        .Y(n93) );
  AOI31X2M U65 ( .A0(n86), .A1(n87), .A2(n88), .B0(n146), .Y(ALU_OUT_Comb[3])
         );
  AOI22X1M U66 ( .A0(N103), .A1(n67), .B0(N94), .B1(n54), .Y(n86) );
  AOI221XLM U67 ( .A0(n9), .A1(n143), .B0(n30), .B1(n154), .C0(n89), .Y(n88)
         );
  AOI222X1M U68 ( .A0(N112), .A1(n52), .B0(n8), .B1(n59), .C0(N128), .C1(n66), 
        .Y(n87) );
  AOI31X2M U69 ( .A0(n80), .A1(n81), .A2(n82), .B0(n146), .Y(ALU_OUT_Comb[4])
         );
  AOI22X1M U70 ( .A0(N104), .A1(n67), .B0(N95), .B1(n54), .Y(n80) );
  AOI221XLM U71 ( .A0(n143), .A1(n27), .B0(n30), .B1(n153), .C0(n83), .Y(n82)
         );
  AOI222X1M U72 ( .A0(N113), .A1(n52), .B0(n9), .B1(n59), .C0(N129), .C1(n66), 
        .Y(n81) );
  AOI31X2M U73 ( .A0(n74), .A1(n75), .A2(n76), .B0(n146), .Y(ALU_OUT_Comb[5])
         );
  AOI22X1M U74 ( .A0(N105), .A1(n67), .B0(N96), .B1(n54), .Y(n74) );
  AOI221XLM U75 ( .A0(n143), .A1(n28), .B0(n30), .B1(n152), .C0(n77), .Y(n76)
         );
  AOI222X1M U76 ( .A0(N114), .A1(n52), .B0(n27), .B1(n59), .C0(N130), .C1(n66), 
        .Y(n75) );
  AOI31X2M U77 ( .A0(n68), .A1(n69), .A2(n70), .B0(n146), .Y(ALU_OUT_Comb[6])
         );
  AOI22X1M U78 ( .A0(N106), .A1(n67), .B0(N97), .B1(n54), .Y(n68) );
  AOI221XLM U79 ( .A0(n143), .A1(n29), .B0(n30), .B1(n151), .C0(n71), .Y(n70)
         );
  AOI222X1M U80 ( .A0(N115), .A1(n52), .B0(n59), .B1(n28), .C0(N131), .C1(n66), 
        .Y(n69) );
  AOI31X2M U81 ( .A0(n55), .A1(n56), .A2(n57), .B0(n146), .Y(ALU_OUT_Comb[7])
         );
  AOI22X1M U82 ( .A0(N132), .A1(n66), .B0(N116), .B1(n52), .Y(n56) );
  AOI22X1M U83 ( .A0(N107), .A1(n67), .B0(N98), .B1(n54), .Y(n55) );
  AOI221XLM U84 ( .A0(n30), .A1(n150), .B0(n59), .B1(n29), .C0(n60), .Y(n57)
         );
  AOI31X2M U85 ( .A0(n110), .A1(n111), .A2(n112), .B0(n146), .Y(
        ALU_OUT_Comb[0]) );
  AOI22X1M U86 ( .A0(N100), .A1(n67), .B0(N91), .B1(n54), .Y(n110) );
  AOI211X2M U87 ( .A0(n30), .A1(n157), .B0(n113), .C0(n114), .Y(n112) );
  AOI222X1M U88 ( .A0(N109), .A1(n52), .B0(n5), .B1(n59), .C0(N125), .C1(n66), 
        .Y(n111) );
  AOI31X2M U89 ( .A0(n98), .A1(n99), .A2(n100), .B0(n146), .Y(ALU_OUT_Comb[1])
         );
  AOI211X2M U90 ( .A0(n7), .A1(n143), .B0(n101), .C0(n102), .Y(n100) );
  AOI222X1M U91 ( .A0(N126), .A1(n66), .B0(n30), .B1(n156), .C0(n6), .C1(n59), 
        .Y(n99) );
  AOI222X1M U92 ( .A0(N92), .A1(n54), .B0(N110), .B1(n52), .C0(N101), .C1(n67), 
        .Y(n98) );
  INVX2M U93 ( .A(n109), .Y(n140) );
  AOI211X2M U94 ( .A0(N108), .A1(n67), .B0(n30), .C0(n64), .Y(n109) );
  AOI21X2M U95 ( .A0(n50), .A1(n51), .B0(n146), .Y(ALU_OUT_Comb[8]) );
  AOI21X2M U96 ( .A0(N99), .A1(n54), .B0(n140), .Y(n50) );
  AOI2BB2XLM U97 ( .B0(N117), .B1(n52), .A0N(n150), .A1N(n53), .Y(n51) );
  BUFX2M U98 ( .A(ALU_FUN[3]), .Y(n3) );
  INVX2M U99 ( .A(n6), .Y(n156) );
  INVX2M U100 ( .A(n5), .Y(n157) );
  INVX2M U101 ( .A(n28), .Y(n151) );
  INVX2M U102 ( .A(n29), .Y(n150) );
  INVX2M U103 ( .A(n8), .Y(n154) );
  INVX2M U104 ( .A(n7), .Y(n155) );
  INVX2M U105 ( .A(n27), .Y(n152) );
  INVX2M U106 ( .A(n9), .Y(n153) );
  OAI222X1M U107 ( .A0(n96), .A1(n136), .B0(B[2]), .B1(n97), .C0(n53), .C1(
        n156), .Y(n95) );
  AOI221XLM U108 ( .A0(n7), .A1(n63), .B0(n64), .B1(n155), .C0(n30), .Y(n97)
         );
  AOI221XLM U109 ( .A0(n63), .A1(n155), .B0(n7), .B1(n65), .C0(n59), .Y(n96)
         );
  OAI222X1M U110 ( .A0(n90), .A1(n138), .B0(B[3]), .B1(n91), .C0(n53), .C1(
        n155), .Y(n89) );
  AOI221XLM U111 ( .A0(n8), .A1(n63), .B0(n64), .B1(n154), .C0(n30), .Y(n91)
         );
  AOI221XLM U112 ( .A0(n63), .A1(n154), .B0(n8), .B1(n65), .C0(n59), .Y(n90)
         );
  OAI222X1M U113 ( .A0(n84), .A1(n149), .B0(B[4]), .B1(n85), .C0(n53), .C1(
        n154), .Y(n83) );
  INVX2M U114 ( .A(B[4]), .Y(n149) );
  AOI221XLM U115 ( .A0(n9), .A1(n63), .B0(n64), .B1(n153), .C0(n30), .Y(n85)
         );
  AOI221XLM U116 ( .A0(n63), .A1(n153), .B0(n9), .B1(n65), .C0(n59), .Y(n84)
         );
  OAI222X1M U117 ( .A0(n78), .A1(n148), .B0(B[5]), .B1(n79), .C0(n53), .C1(
        n153), .Y(n77) );
  INVX2M U118 ( .A(B[5]), .Y(n148) );
  AOI221XLM U119 ( .A0(n27), .A1(n63), .B0(n64), .B1(n152), .C0(n30), .Y(n79)
         );
  AOI221XLM U120 ( .A0(n63), .A1(n152), .B0(n27), .B1(n65), .C0(n59), .Y(n78)
         );
  OAI222X1M U121 ( .A0(n61), .A1(n147), .B0(B[7]), .B1(n62), .C0(n53), .C1(
        n151), .Y(n60) );
  INVX2M U122 ( .A(B[7]), .Y(n147) );
  AOI221XLM U123 ( .A0(n63), .A1(n29), .B0(n64), .B1(n150), .C0(n30), .Y(n62)
         );
  AOI221XLM U124 ( .A0(n63), .A1(n150), .B0(n29), .B1(n65), .C0(n59), .Y(n61)
         );
  INVX2M U125 ( .A(n31), .Y(n135) );
  OAI2B2X1M U126 ( .A1N(B[0]), .A0(n115), .B0(n108), .B1(n156), .Y(n114) );
  AOI221XLM U127 ( .A0(n63), .A1(n157), .B0(n5), .B1(n65), .C0(n59), .Y(n115)
         );
  OAI2B2X1M U128 ( .A1N(B[1]), .A0(n103), .B0(n53), .B1(n157), .Y(n102) );
  AOI221XLM U129 ( .A0(n63), .A1(n156), .B0(n6), .B1(n65), .C0(n59), .Y(n103)
         );
  INVX2M U130 ( .A(n42), .Y(n137) );
  OAI21X2M U131 ( .A0(B[0]), .A1(n119), .B0(n120), .Y(n113) );
  AOI31X2M U132 ( .A0(N157), .A1(n3), .A2(n121), .B0(n107), .Y(n120) );
  AOI221XLM U133 ( .A0(n5), .A1(n63), .B0(n64), .B1(n157), .C0(n30), .Y(n119)
         );
  NOR3X2M U134 ( .A(n144), .B(ALU_FUN[2]), .C(ALU_FUN[0]), .Y(n121) );
  OAI21X2M U135 ( .A0(B[1]), .A1(n104), .B0(n105), .Y(n101) );
  AOI31X2M U136 ( .A0(N158), .A1(n3), .A2(n106), .B0(n107), .Y(n105) );
  AOI221XLM U137 ( .A0(n6), .A1(n63), .B0(n64), .B1(n156), .C0(n30), .Y(n104)
         );
  NOR3X2M U138 ( .A(n141), .B(ALU_FUN[2]), .C(n144), .Y(n106) );
  BUFX2M U139 ( .A(A[7]), .Y(n29) );
  BUFX2M U140 ( .A(A[1]), .Y(n6) );
  BUFX2M U141 ( .A(A[0]), .Y(n5) );
  BUFX2M U142 ( .A(A[3]), .Y(n8) );
  BUFX2M U143 ( .A(A[2]), .Y(n7) );
  BUFX2M U144 ( .A(A[5]), .Y(n27) );
  BUFX2M U145 ( .A(A[4]), .Y(n9) );
  BUFX2M U146 ( .A(B[6]), .Y(n4) );
  INVX2M U147 ( .A(B[0]), .Y(n134) );
  INVX2M U148 ( .A(B[2]), .Y(n136) );
  INVX2M U149 ( .A(B[3]), .Y(n138) );
  NOR2X1M U150 ( .A(n150), .B(B[7]), .Y(n130) );
  NAND2BX1M U151 ( .AN(B[4]), .B(n9), .Y(n46) );
  NAND2BX1M U152 ( .AN(n9), .B(B[4]), .Y(n35) );
  CLKNAND2X2M U153 ( .A(n46), .B(n35), .Y(n125) );
  NOR2X1M U154 ( .A(n138), .B(n8), .Y(n43) );
  NOR2X1M U155 ( .A(n136), .B(n7), .Y(n34) );
  NOR2X1M U156 ( .A(n134), .B(n5), .Y(n31) );
  CLKNAND2X2M U157 ( .A(n7), .B(n136), .Y(n45) );
  NAND2BX1M U158 ( .AN(n34), .B(n45), .Y(n40) );
  AOI21X1M U159 ( .A0(n31), .A1(n156), .B0(B[1]), .Y(n32) );
  AOI211X1M U160 ( .A0(n6), .A1(n135), .B0(n40), .C0(n32), .Y(n33) );
  CLKNAND2X2M U161 ( .A(n8), .B(n138), .Y(n44) );
  OAI31X1M U162 ( .A0(n43), .A1(n34), .A2(n33), .B0(n44), .Y(n36) );
  NAND2BX1M U163 ( .AN(n27), .B(B[5]), .Y(n128) );
  OAI211X1M U164 ( .A0(n125), .A1(n36), .B0(n35), .C0(n128), .Y(n37) );
  NAND2BX1M U165 ( .AN(B[5]), .B(n27), .Y(n47) );
  XNOR2X1M U166 ( .A(n28), .B(n4), .Y(n127) );
  AOI32X1M U167 ( .A0(n37), .A1(n47), .A2(n127), .B0(n4), .B1(n151), .Y(n38)
         );
  CLKNAND2X2M U168 ( .A(B[7]), .B(n150), .Y(n131) );
  OAI21X1M U169 ( .A0(n130), .A1(n38), .B0(n131), .Y(N159) );
  CLKNAND2X2M U170 ( .A(n5), .B(n134), .Y(n41) );
  OA21X1M U171 ( .A0(n41), .A1(n156), .B0(B[1]), .Y(n39) );
  AOI211X1M U172 ( .A0(n41), .A1(n156), .B0(n40), .C0(n39), .Y(n42) );
  AOI31X1M U173 ( .A0(n137), .A1(n45), .A2(n44), .B0(n43), .Y(n126) );
  OAI2B11X1M U174 ( .A1N(n126), .A0(n125), .B0(n47), .C0(n46), .Y(n129) );
  AOI32X1M U175 ( .A0(n129), .A1(n128), .A2(n127), .B0(n28), .B1(n139), .Y(
        n132) );
  AOI2B1X1M U176 ( .A1N(n132), .A0(n131), .B0(n130), .Y(n133) );
  CLKINVX1M U177 ( .A(n133), .Y(N158) );
  NOR2X1M U178 ( .A(N159), .B(N158), .Y(N157) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW_div_uns_0 div_52 ( .a({n29, n28, n27, n9, n8, 
        n7, n6, n5}), .b({B[7], n4, B[5:0]}), .quotient({N132, N131, N130, 
        N129, N128, N127, N126, N125}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_sub_0 sub_46 ( .A({1'b0, n29, n28, n27, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .DIFF({N108, 
        N107, N106, N105, N104, N103, N102, N101, N100}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW01_add_0 add_43 ( .A({1'b0, n29, n28, n27, n9, 
        n8, n7, n6, n5}), .B({1'b0, B[7], n4, B[5:0]}), .CI(1'b0), .SUM({N99, 
        N98, N97, N96, N95, N94, N93, N92, N91}) );
  ALU_OPER_WIDTH8_OUT_WIDTH16_DW02_mult_0 mult_49 ( .A({n29, n28, n27, n9, n8, 
        n7, n6, n5}), .B({B[7], n4, B[5:0]}), .TC(1'b0), .PRODUCT({N124, N123, 
        N122, N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, N111, 
        N110, N109}) );
  SDFFRQX1M OUT_VALID_reg ( .D(EN), .SI(ALU_OUT[15]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(OUT_VALID) );
  SDFFRQX1M \ALU_OUT_reg[15]  ( .D(ALU_OUT_Comb[15]), .SI(ALU_OUT[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[15]) );
  SDFFRQX1M \ALU_OUT_reg[14]  ( .D(ALU_OUT_Comb[14]), .SI(ALU_OUT[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[14]) );
  SDFFRQX1M \ALU_OUT_reg[13]  ( .D(ALU_OUT_Comb[13]), .SI(ALU_OUT[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[13]) );
  SDFFRQX1M \ALU_OUT_reg[12]  ( .D(ALU_OUT_Comb[12]), .SI(ALU_OUT[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[12]) );
  SDFFRQX1M \ALU_OUT_reg[11]  ( .D(ALU_OUT_Comb[11]), .SI(ALU_OUT[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[11]) );
  SDFFRQX1M \ALU_OUT_reg[10]  ( .D(ALU_OUT_Comb[10]), .SI(ALU_OUT[9]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[10]) );
  SDFFRQX1M \ALU_OUT_reg[9]  ( .D(ALU_OUT_Comb[9]), .SI(ALU_OUT[8]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[9]) );
  SDFFRQX1M \ALU_OUT_reg[8]  ( .D(ALU_OUT_Comb[8]), .SI(ALU_OUT[7]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[8]) );
  SDFFRQX1M \ALU_OUT_reg[7]  ( .D(ALU_OUT_Comb[7]), .SI(ALU_OUT[6]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[7]) );
  SDFFRQX1M \ALU_OUT_reg[6]  ( .D(ALU_OUT_Comb[6]), .SI(ALU_OUT[5]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[6]) );
  SDFFRQX1M \ALU_OUT_reg[5]  ( .D(ALU_OUT_Comb[5]), .SI(ALU_OUT[4]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[5]) );
  SDFFRQX1M \ALU_OUT_reg[4]  ( .D(ALU_OUT_Comb[4]), .SI(ALU_OUT[3]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[4]) );
  SDFFRQX1M \ALU_OUT_reg[3]  ( .D(ALU_OUT_Comb[3]), .SI(ALU_OUT[2]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[3]) );
  SDFFRQX1M \ALU_OUT_reg[2]  ( .D(ALU_OUT_Comb[2]), .SI(ALU_OUT[1]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[2]) );
  SDFFRQX1M \ALU_OUT_reg[1]  ( .D(ALU_OUT_Comb[1]), .SI(ALU_OUT[0]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(ALU_OUT[1]) );
endmodule


module SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_test_1 ( CLK, RST, ALU_OUT, OUT_Valid, 
        RdData, RdData_Valid, RX_P_Data, RX_D_VLD, FIFO_FULL, ALU_FUN, EN, 
        CLK_EN, Address, WrEN, RdEn, WrData, TX_P_Data, TX_D_VLD, clk_div_en, 
        test_si2, test_si1, test_so2, test_so1, test_se );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  input [7:0] RX_P_Data;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_Data;
  input CLK, RST, OUT_Valid, RdData_Valid, RX_D_VLD, FIFO_FULL, test_si2,
         test_si1, test_se;
  output EN, CLK_EN, WrEN, RdEn, TX_D_VLD, clk_div_en, test_so2, test_so1;
  wire   n1, n19, n20, n21, n23, n24, n27, n36, n37, n48, n54, n55, n57, n58,
         n64, n66, n67, n69, n70, n71, n74, n75, n76, n77, n78, n80, n81, n82,
         n83, n85, n86, n87, n88, n90, n91, n92, n94, n96, n97, n98, n99, n100,
         n102, n103, n104, n105, n107, n108, n109, n110, n113, n114, n115,
         n116, n117, n118, n119, n120, n121, n122, n123, n124, n125, n126,
         n127, n128, n143, n145, n147, n149, n151, n153, n155, n157, n159,
         n161, n163, n165, n167, n169, n171, n173, n175, n177, n179, n181,
         n183, n185, n187, n189, n191, n193, n195, n197, n199, n201, n203,
         n205, n207, n209, n211, n213, n215, n217, n219, n221, n223, n225,
         n227, n229, n231, n233, n235, n237, n247, n248, n249, n250, n251,
         n252, n253, n254, n255, n256, n257, n258, n259, n130, n131, n132,
         n133, n134, n135, n136, n137, n260, n261, n262, n263, n264, n265,
         n266, n267, n268, n269, n270, n271, n272, n273, n274, n275, n276,
         n277, n278, n279, n280, n281, n282, n283, n284, n285, n286, n287,
         n288, n289, n290, n291, n292, n293, n294, n295, n296, n297, n298,
         n299, n300, n301, n302, n303, n304, n305, n306, n307, n308, n309,
         n310, n311, n312, n313, n314, n315, n316, n317, n318, n319, n321,
         n322, n323, n324, n325, n326, n327, n328, n331, n332, n333, n334, n4;
  wire   [4:0] state;
  wire   [7:0] data_reg;
  wire   [7:0] alu_a_reg;
  wire   [7:0] alu_b_reg;
  wire   [15:0] alu_res_reg;
  wire   [7:0] rd_data_reg;
  assign test_so2 = state[4];

  SDFFRX1M \addr_reg_reg[3]  ( .D(n250), .SI(n326), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n325), .QN(n307) );
  SDFFRX1M \addr_reg_reg[2]  ( .D(n249), .SI(n327), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n326), .QN(n308) );
  SDFFRX1M \addr_reg_reg[1]  ( .D(n248), .SI(n328), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n327), .QN(n309) );
  SDFFRX1M \addr_reg_reg[0]  ( .D(n247), .SI(test_si1), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n328), .QN(n310) );
  SDFFRX1M \alu_fun_reg_reg[3]  ( .D(n253), .SI(n322), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n321), .QN(n281) );
  SDFFRX1M \alu_fun_reg_reg[2]  ( .D(n252), .SI(n323), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n322), .QN(n280) );
  SDFFRX1M \alu_fun_reg_reg[1]  ( .D(n251), .SI(n324), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(n323), .QN(n279) );
  SDFFRX1M \alu_fun_reg_reg[0]  ( .D(n254), .SI(alu_b_reg[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(n324), .QN(n282) );
  SDFFRQX1M \alu_b_reg_reg[7]  ( .D(n235), .SI(alu_b_reg[6]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[7]) );
  SDFFRQX1M \alu_b_reg_reg[6]  ( .D(n233), .SI(alu_b_reg[5]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[6]) );
  SDFFRQX1M \alu_b_reg_reg[5]  ( .D(n231), .SI(test_si2), .SE(n333), .CK(CLK), 
        .RN(RST), .Q(alu_b_reg[5]) );
  SDFFRQX1M \alu_b_reg_reg[3]  ( .D(n227), .SI(alu_b_reg[2]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[3]) );
  SDFFRQX1M \alu_b_reg_reg[2]  ( .D(n225), .SI(alu_b_reg[1]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[2]) );
  SDFFRQX1M \alu_b_reg_reg[1]  ( .D(n223), .SI(alu_b_reg[0]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[1]) );
  SDFFRQX1M \alu_b_reg_reg[0]  ( .D(n237), .SI(alu_a_reg[7]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[0]) );
  SDFFRQX1M \data_reg_reg[7]  ( .D(n157), .SI(data_reg[6]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[7]) );
  SDFFRQX1M \data_reg_reg[6]  ( .D(n155), .SI(data_reg[5]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[6]) );
  SDFFRQX1M \data_reg_reg[5]  ( .D(n153), .SI(data_reg[4]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[5]) );
  SDFFRQX1M \data_reg_reg[4]  ( .D(n151), .SI(data_reg[3]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[4]) );
  SDFFRQX1M \data_reg_reg[3]  ( .D(n149), .SI(data_reg[2]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[3]) );
  SDFFRQX1M \data_reg_reg[2]  ( .D(n147), .SI(data_reg[1]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[2]) );
  SDFFRQX1M \data_reg_reg[1]  ( .D(n145), .SI(data_reg[0]), .SE(n333), .CK(CLK), .RN(RST), .Q(data_reg[1]) );
  SDFFRQX1M \data_reg_reg[0]  ( .D(n143), .SI(alu_res_reg[15]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(data_reg[0]) );
  SDFFRQX1M \alu_a_reg_reg[7]  ( .D(n219), .SI(alu_a_reg[6]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[7]) );
  SDFFRQX1M \alu_a_reg_reg[6]  ( .D(n217), .SI(alu_a_reg[5]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[6]) );
  SDFFRQX1M \alu_a_reg_reg[5]  ( .D(n215), .SI(alu_a_reg[4]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[5]) );
  SDFFRQX1M \alu_a_reg_reg[4]  ( .D(n213), .SI(alu_a_reg[3]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[4]) );
  SDFFRQX1M \alu_a_reg_reg[3]  ( .D(n211), .SI(alu_a_reg[2]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[3]) );
  SDFFRQX1M \alu_a_reg_reg[2]  ( .D(n209), .SI(alu_a_reg[1]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[2]) );
  SDFFRQX1M \alu_a_reg_reg[1]  ( .D(n207), .SI(alu_a_reg[0]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_a_reg[1]) );
  SDFFRQX1M \alu_a_reg_reg[0]  ( .D(n221), .SI(n325), .SE(n333), .CK(CLK), 
        .RN(RST), .Q(alu_a_reg[0]) );
  SDFFRQX1M \rd_data_reg_reg[7]  ( .D(n203), .SI(rd_data_reg[6]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[7]) );
  SDFFRQX1M \rd_data_reg_reg[6]  ( .D(n201), .SI(rd_data_reg[5]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[6]) );
  SDFFRQX1M \rd_data_reg_reg[5]  ( .D(n199), .SI(rd_data_reg[4]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[5]) );
  SDFFRQX1M \rd_data_reg_reg[4]  ( .D(n197), .SI(rd_data_reg[3]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[4]) );
  SDFFRQX1M \rd_data_reg_reg[3]  ( .D(n195), .SI(rd_data_reg[2]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[3]) );
  SDFFRQX1M \rd_data_reg_reg[2]  ( .D(n193), .SI(rd_data_reg[1]), .SE(n333), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[2]) );
  SDFFRQX1M \rd_data_reg_reg[1]  ( .D(n191), .SI(rd_data_reg[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[1]) );
  SDFFRQX1M \rd_data_reg_reg[0]  ( .D(n205), .SI(data_reg[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(rd_data_reg[0]) );
  SDFFRQX1M \alu_res_reg_reg[15]  ( .D(n187), .SI(alu_res_reg[14]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[15]) );
  SDFFRQX1M \alu_res_reg_reg[14]  ( .D(n185), .SI(alu_res_reg[13]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[14]) );
  SDFFRQX1M \alu_res_reg_reg[13]  ( .D(n183), .SI(alu_res_reg[12]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[13]) );
  SDFFRQX1M \alu_res_reg_reg[12]  ( .D(n181), .SI(alu_res_reg[11]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[12]) );
  SDFFRQX1M \alu_res_reg_reg[11]  ( .D(n179), .SI(alu_res_reg[10]), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[11]) );
  SDFFRQX1M \alu_res_reg_reg[10]  ( .D(n177), .SI(alu_res_reg[9]), .SE(test_se), .CK(CLK), .RN(RST), .Q(alu_res_reg[10]) );
  SDFFRQX1M \alu_res_reg_reg[9]  ( .D(n175), .SI(alu_res_reg[8]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[9]) );
  SDFFRQX1M \alu_res_reg_reg[8]  ( .D(n173), .SI(alu_res_reg[7]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[8]) );
  SDFFRQX1M \alu_res_reg_reg[7]  ( .D(n171), .SI(alu_res_reg[6]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[7]) );
  SDFFRQX1M \alu_res_reg_reg[6]  ( .D(n169), .SI(alu_res_reg[5]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[6]) );
  SDFFRQX1M \alu_res_reg_reg[5]  ( .D(n167), .SI(alu_res_reg[4]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[5]) );
  SDFFRQX1M \alu_res_reg_reg[4]  ( .D(n165), .SI(alu_res_reg[3]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[4]) );
  SDFFRQX1M \alu_res_reg_reg[3]  ( .D(n163), .SI(alu_res_reg[2]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[3]) );
  SDFFRQX1M \alu_res_reg_reg[2]  ( .D(n161), .SI(alu_res_reg[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[2]) );
  SDFFRQX1M \alu_res_reg_reg[1]  ( .D(n159), .SI(alu_res_reg[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(alu_res_reg[1]) );
  SDFFRQX1M \alu_res_reg_reg[0]  ( .D(n189), .SI(n321), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(alu_res_reg[0]) );
  SDFFRQX1M \state_reg[4]  ( .D(n255), .SI(state[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[4]) );
  SDFFRQX1M \state_reg[2]  ( .D(n257), .SI(state[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[2]) );
  SDFFRQX1M \state_reg[1]  ( .D(n258), .SI(state[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[1]) );
  SDFFRQX1M \state_reg[0]  ( .D(n259), .SI(rd_data_reg[7]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(state[0]) );
  SDFFRQX1M \state_reg[3]  ( .D(n256), .SI(state[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(state[3]) );
  NOR2X2M U66 ( .A(n126), .B(n308), .Y(Address[2]) );
  NOR2X2M U67 ( .A(n125), .B(n280), .Y(ALU_FUN[2]) );
  NOR2X2M U68 ( .A(n125), .B(n282), .Y(ALU_FUN[0]) );
  NOR3X2M U69 ( .A(state[2]), .B(state[4]), .C(n274), .Y(n20) );
  NOR3X2M U70 ( .A(n274), .B(state[4]), .C(n278), .Y(n108) );
  OAI221X1M U71 ( .A0(RX_D_VLD), .A1(n104), .B0(RdData_Valid), .B1(n96), .C0(
        n105), .Y(n67) );
  NOR3X2M U72 ( .A(state[2]), .B(state[4]), .C(state[1]), .Y(n109) );
  OAI21X2M U73 ( .A0(n64), .A1(n264), .B0(RX_D_VLD), .Y(n58) );
  OAI21X2M U74 ( .A0(n54), .A1(n55), .B0(RX_D_VLD), .Y(n48) );
  BUFX2M U75 ( .A(FIFO_FULL), .Y(n134) );
  NOR2X2M U76 ( .A(n262), .B(n275), .Y(RdEn) );
  NOR2BX2M U77 ( .AN(n113), .B(RdEn), .Y(n126) );
  NOR2X2M U78 ( .A(n275), .B(n271), .Y(n55) );
  INVX2M U79 ( .A(n96), .Y(n272) );
  INVX2M U80 ( .A(n70), .Y(n264) );
  INVX2M U81 ( .A(n75), .Y(n260) );
  INVX2M U82 ( .A(n78), .Y(n266) );
  NOR2X2M U83 ( .A(n267), .B(EN), .Y(n125) );
  INVX2M U84 ( .A(n88), .Y(EN) );
  NOR3BX2M U85 ( .AN(n36), .B(n55), .C(n92), .Y(n100) );
  OAI21X2M U86 ( .A0(n126), .A1(n310), .B0(n87), .Y(Address[0]) );
  NOR3X2M U87 ( .A(n116), .B(n130), .C(n131), .Y(n107) );
  NOR2BX2M U88 ( .AN(n108), .B(n262), .Y(n116) );
  NOR2X2M U89 ( .A(n126), .B(n309), .Y(Address[1]) );
  OAI221X1M U90 ( .A0(n71), .A1(n67), .B0(n135), .B1(n276), .C0(n36), .Y(n256)
         );
  NOR4X1M U91 ( .A(n266), .B(n64), .C(n74), .D(n75), .Y(n71) );
  NOR4BX1M U92 ( .AN(n76), .B(n77), .C(n317), .D(n313), .Y(n74) );
  NAND4X2M U93 ( .A(n319), .B(n318), .C(n315), .D(n314), .Y(n77) );
  OAI22X1M U94 ( .A0(n135), .A1(n268), .B0(n97), .B1(n67), .Y(n259) );
  NOR4BX1M U95 ( .AN(n87), .B(n98), .C(n267), .D(n272), .Y(n97) );
  NAND2X2M U96 ( .A(n99), .B(n100), .Y(n98) );
  AOI31X2M U97 ( .A0(n269), .A1(n319), .A2(n102), .B0(n270), .Y(n99) );
  NOR2X2M U98 ( .A(n126), .B(n307), .Y(Address[3]) );
  INVX2M U99 ( .A(n67), .Y(n135) );
  NAND2X2M U100 ( .A(n128), .B(n20), .Y(n113) );
  AO21XLM U101 ( .A0(n20), .A1(n19), .B0(n64), .Y(n92) );
  NOR2X2M U102 ( .A(n134), .B(n107), .Y(TX_D_VLD) );
  INVX2M U103 ( .A(n127), .Y(n275) );
  INVX2M U104 ( .A(n128), .Y(n262) );
  INVX2M U105 ( .A(n19), .Y(n271) );
  BUFX2M U106 ( .A(n115), .Y(n130) );
  NOR3X2M U107 ( .A(n271), .B(n274), .C(n124), .Y(n115) );
  AOI32X1M U108 ( .A0(n277), .A1(n274), .A2(n19), .B0(n110), .B1(n127), .Y(n88) );
  INVX2M U109 ( .A(n124), .Y(n277) );
  NOR2X2M U110 ( .A(n268), .B(n276), .Y(n110) );
  OAI222X1M U111 ( .A0(n283), .A1(n87), .B0(n291), .B1(n86), .C0(n306), .C1(
        n113), .Y(WrData[0]) );
  OAI222X1M U112 ( .A0(n290), .A1(n87), .B0(n298), .B1(n86), .C0(n305), .C1(
        n113), .Y(WrData[1]) );
  OAI222X1M U113 ( .A0(n289), .A1(n87), .B0(n297), .B1(n86), .C0(n304), .C1(
        n113), .Y(WrData[2]) );
  OAI222X1M U114 ( .A0(n288), .A1(n87), .B0(n296), .B1(n86), .C0(n303), .C1(
        n113), .Y(WrData[3]) );
  OAI222X1M U115 ( .A0(n287), .A1(n87), .B0(n295), .B1(n86), .C0(n302), .C1(
        n113), .Y(WrData[4]) );
  OAI222X1M U116 ( .A0(n286), .A1(n87), .B0(n294), .B1(n86), .C0(n301), .C1(
        n113), .Y(WrData[5]) );
  OAI222X1M U117 ( .A0(n285), .A1(n87), .B0(n293), .B1(n86), .C0(n300), .C1(
        n113), .Y(WrData[6]) );
  OAI222X1M U118 ( .A0(n284), .A1(n87), .B0(n292), .B1(n86), .C0(n299), .C1(
        n113), .Y(WrData[7]) );
  NAND4X2M U119 ( .A(n85), .B(n86), .C(n87), .D(n88), .Y(n75) );
  OAI22X1M U120 ( .A0(n1), .A1(n319), .B0(n273), .B1(n306), .Y(n143) );
  OAI22X1M U121 ( .A0(n1), .A1(n318), .B0(n273), .B1(n305), .Y(n145) );
  OAI22X1M U122 ( .A0(n1), .A1(n317), .B0(n273), .B1(n304), .Y(n147) );
  OAI22X1M U123 ( .A0(n1), .A1(n316), .B0(n273), .B1(n303), .Y(n149) );
  OAI22X1M U124 ( .A0(n1), .A1(n315), .B0(n273), .B1(n302), .Y(n151) );
  OAI22X1M U125 ( .A0(n1), .A1(n314), .B0(n273), .B1(n301), .Y(n153) );
  OAI22X1M U126 ( .A0(n1), .A1(n313), .B0(n273), .B1(n300), .Y(n155) );
  OAI22X1M U127 ( .A0(n1), .A1(n312), .B0(n273), .B1(n299), .Y(n157) );
  NOR2X2M U128 ( .A(n311), .B(n23), .Y(n133) );
  NOR2X2M U129 ( .A(n311), .B(n23), .Y(n21) );
  NAND2X2M U130 ( .A(n109), .B(n276), .Y(n57) );
  OAI22X1M U131 ( .A0(n319), .A1(n48), .B0(n136), .B1(n310), .Y(n247) );
  OAI22X1M U132 ( .A0(n318), .A1(n48), .B0(n136), .B1(n309), .Y(n248) );
  OAI22X1M U133 ( .A0(n317), .A1(n48), .B0(n136), .B1(n308), .Y(n249) );
  OAI22X1M U134 ( .A0(n316), .A1(n48), .B0(n136), .B1(n307), .Y(n250) );
  OAI22X1M U135 ( .A0(n319), .A1(n58), .B0(n263), .B1(n282), .Y(n254) );
  OAI22X1M U136 ( .A0(n316), .A1(n58), .B0(n263), .B1(n281), .Y(n253) );
  OAI22X1M U137 ( .A0(n317), .A1(n58), .B0(n263), .B1(n280), .Y(n252) );
  OAI22X1M U138 ( .A0(n318), .A1(n58), .B0(n263), .B1(n279), .Y(n251) );
  NAND2X2M U139 ( .A(n110), .B(n20), .Y(n86) );
  NAND2X2M U140 ( .A(n108), .B(n19), .Y(n96) );
  INVX2M U141 ( .A(n1), .Y(n273) );
  NAND2X2M U142 ( .A(n108), .B(n110), .Y(n70) );
  NAND2X2M U143 ( .A(n110), .B(n109), .Y(n78) );
  INVX2M U144 ( .A(n48), .Y(n136) );
  INVX2M U145 ( .A(n58), .Y(n263) );
  INVX2M U146 ( .A(n23), .Y(n267) );
  INVX2M U147 ( .A(n85), .Y(n270) );
  NAND3X2M U148 ( .A(n86), .B(n87), .C(n113), .Y(WrEN) );
  INVX2M U149 ( .A(n83), .Y(n269) );
  OAI22X1M U150 ( .A0(n318), .A1(n137), .B0(n132), .B1(n298), .Y(n207) );
  OAI22X1M U151 ( .A0(n317), .A1(n137), .B0(n132), .B1(n297), .Y(n209) );
  OAI22X1M U152 ( .A0(n316), .A1(n137), .B0(n132), .B1(n296), .Y(n211) );
  OAI22X1M U153 ( .A0(n315), .A1(n137), .B0(n132), .B1(n295), .Y(n213) );
  OAI22X1M U154 ( .A0(n314), .A1(n137), .B0(n132), .B1(n294), .Y(n215) );
  OAI22X1M U155 ( .A0(n313), .A1(n137), .B0(n132), .B1(n293), .Y(n217) );
  OAI22X1M U156 ( .A0(n312), .A1(n137), .B0(n132), .B1(n292), .Y(n219) );
  OAI22X1M U157 ( .A0(n319), .A1(n137), .B0(n132), .B1(n291), .Y(n221) );
  OAI22X1M U158 ( .A0(n318), .A1(n37), .B0(n265), .B1(n290), .Y(n223) );
  OAI22X1M U159 ( .A0(n317), .A1(n37), .B0(n265), .B1(n289), .Y(n225) );
  OAI22X1M U160 ( .A0(n316), .A1(n37), .B0(n265), .B1(n288), .Y(n227) );
  OAI22X1M U161 ( .A0(n315), .A1(n37), .B0(n265), .B1(n287), .Y(n229) );
  OAI22X1M U162 ( .A0(n314), .A1(n37), .B0(n265), .B1(n286), .Y(n231) );
  OAI22X1M U163 ( .A0(n313), .A1(n37), .B0(n265), .B1(n285), .Y(n233) );
  OAI22X1M U164 ( .A0(n312), .A1(n37), .B0(n265), .B1(n284), .Y(n235) );
  OAI22X1M U165 ( .A0(n319), .A1(n37), .B0(n265), .B1(n283), .Y(n237) );
  INVX2M U166 ( .A(n37), .Y(n265) );
  INVX2M U167 ( .A(n132), .Y(n137) );
  NOR2X2M U168 ( .A(n125), .B(n279), .Y(ALU_FUN[1]) );
  NOR2X2M U169 ( .A(n125), .B(n281), .Y(ALU_FUN[3]) );
  AOI22X1M U170 ( .A0(n134), .A1(n261), .B0(n267), .B1(n311), .Y(n105) );
  AND4X2M U171 ( .A(n70), .B(n100), .C(n78), .D(n57), .Y(n104) );
  INVX2M U172 ( .A(n107), .Y(n261) );
  NOR3BX2M U173 ( .AN(n20), .B(state[0]), .C(n276), .Y(n64) );
  NOR3X2M U174 ( .A(state[1]), .B(state[4]), .C(n278), .Y(n127) );
  NOR2X2M U175 ( .A(state[0]), .B(state[3]), .Y(n19) );
  NAND3X2M U176 ( .A(state[3]), .B(n268), .C(n127), .Y(n87) );
  OAI22X1M U177 ( .A0(n135), .A1(n278), .B0(n80), .B1(n67), .Y(n257) );
  NOR4X1M U178 ( .A(n81), .B(n55), .C(RdEn), .D(n272), .Y(n80) );
  OAI31X1M U179 ( .A0(n82), .A1(n315), .A2(n83), .B0(n260), .Y(n81) );
  NAND3X2M U180 ( .A(n317), .B(n313), .C(RX_P_Data[0]), .Y(n82) );
  OAI22X1M U181 ( .A0(n135), .A1(n274), .B0(n90), .B1(n67), .Y(n258) );
  NOR4X1M U182 ( .A(n91), .B(n92), .C(n270), .D(n94), .Y(n90) );
  NOR3X2M U183 ( .A(n262), .B(state[4]), .C(state[1]), .Y(n94) );
  NAND4BX1M U184 ( .AN(n131), .B(n96), .C(n78), .D(n88), .Y(n91) );
  BUFX2M U185 ( .A(n69), .Y(n131) );
  NOR3X2M U186 ( .A(n124), .B(state[1]), .C(n262), .Y(n69) );
  NOR2X2M U187 ( .A(n268), .B(state[3]), .Y(n128) );
  NAND2X2M U188 ( .A(state[4]), .B(n278), .Y(n124) );
  INVX2M U189 ( .A(state[0]), .Y(n268) );
  OAI2BB2X1M U190 ( .B0(n66), .B1(n67), .A0N(n67), .A1N(state[4]), .Y(n255) );
  NOR3X2M U191 ( .A(n264), .B(n267), .C(n131), .Y(n66) );
  INVX2M U192 ( .A(state[1]), .Y(n274) );
  INVX2M U193 ( .A(state[3]), .Y(n276) );
  INVX2M U194 ( .A(state[2]), .Y(n278) );
  NOR2X2M U195 ( .A(n134), .B(n123), .Y(TX_P_Data[0]) );
  AOI222X1M U196 ( .A0(n130), .A1(alu_res_reg[8]), .B0(n131), .B1(
        alu_res_reg[0]), .C0(n116), .C1(rd_data_reg[0]), .Y(n123) );
  NOR2X2M U197 ( .A(n134), .B(n122), .Y(TX_P_Data[1]) );
  AOI222X1M U198 ( .A0(n130), .A1(alu_res_reg[9]), .B0(n131), .B1(
        alu_res_reg[1]), .C0(n116), .C1(rd_data_reg[1]), .Y(n122) );
  NOR2X2M U199 ( .A(n134), .B(n121), .Y(TX_P_Data[2]) );
  AOI222X1M U200 ( .A0(n130), .A1(alu_res_reg[10]), .B0(n131), .B1(
        alu_res_reg[2]), .C0(n116), .C1(rd_data_reg[2]), .Y(n121) );
  NOR2X2M U201 ( .A(n134), .B(n120), .Y(TX_P_Data[3]) );
  AOI222X1M U202 ( .A0(n130), .A1(alu_res_reg[11]), .B0(n131), .B1(
        alu_res_reg[3]), .C0(n116), .C1(rd_data_reg[3]), .Y(n120) );
  NOR2X2M U203 ( .A(n134), .B(n119), .Y(TX_P_Data[4]) );
  AOI222X1M U204 ( .A0(n130), .A1(alu_res_reg[12]), .B0(n131), .B1(
        alu_res_reg[4]), .C0(n116), .C1(rd_data_reg[4]), .Y(n119) );
  NOR2X2M U205 ( .A(n134), .B(n118), .Y(TX_P_Data[5]) );
  AOI222X1M U206 ( .A0(n130), .A1(alu_res_reg[13]), .B0(n131), .B1(
        alu_res_reg[5]), .C0(n116), .C1(rd_data_reg[5]), .Y(n118) );
  NOR2X2M U207 ( .A(n134), .B(n117), .Y(TX_P_Data[6]) );
  AOI222X1M U208 ( .A0(n130), .A1(alu_res_reg[14]), .B0(n131), .B1(
        alu_res_reg[6]), .C0(n116), .C1(rd_data_reg[6]), .Y(n117) );
  NOR2X2M U209 ( .A(n134), .B(n114), .Y(TX_P_Data[7]) );
  AOI222X1M U210 ( .A0(n130), .A1(alu_res_reg[15]), .B0(n131), .B1(
        alu_res_reg[7]), .C0(n116), .C1(rd_data_reg[7]), .Y(n114) );
  NOR2X2M U211 ( .A(n268), .B(n57), .Y(n54) );
  NOR4X1M U212 ( .A(n57), .B(n312), .C(n316), .D(state[0]), .Y(n76) );
  NAND3X2M U213 ( .A(n19), .B(n20), .C(RX_D_VLD), .Y(n1) );
  NAND3X2M U214 ( .A(n108), .B(n268), .C(state[3]), .Y(n23) );
  NAND4X2M U215 ( .A(RX_P_Data[6]), .B(RX_P_Data[4]), .C(n76), .D(n103), .Y(
        n85) );
  NOR4X1M U216 ( .A(RX_P_Data[5]), .B(RX_P_Data[1]), .C(n319), .D(n317), .Y(
        n103) );
  INVX2M U217 ( .A(RX_P_Data[2]), .Y(n317) );
  INVX2M U218 ( .A(RX_P_Data[0]), .Y(n319) );
  NAND3X2M U219 ( .A(state[3]), .B(n268), .C(n109), .Y(n36) );
  INVX2M U220 ( .A(RX_P_Data[3]), .Y(n316) );
  NAND3X2M U221 ( .A(RX_P_Data[5]), .B(RX_P_Data[1]), .C(n76), .Y(n83) );
  INVX2M U283 ( .A(RX_P_Data[7]), .Y(n312) );
  AND2X2M U284 ( .A(RdData_Valid), .B(n272), .Y(n24) );
  AO2B2X2M U285 ( .B0(RdData[1]), .B1(n24), .A0(rd_data_reg[1]), .A1N(n24), 
        .Y(n191) );
  AO2B2X2M U286 ( .B0(RdData[2]), .B1(n24), .A0(rd_data_reg[2]), .A1N(n24), 
        .Y(n193) );
  AO2B2X2M U287 ( .B0(RdData[3]), .B1(n24), .A0(rd_data_reg[3]), .A1N(n24), 
        .Y(n195) );
  AO2B2X2M U288 ( .B0(RdData[4]), .B1(n24), .A0(rd_data_reg[4]), .A1N(n24), 
        .Y(n197) );
  AO2B2X2M U289 ( .B0(RdData[5]), .B1(n24), .A0(rd_data_reg[5]), .A1N(n24), 
        .Y(n199) );
  AO2B2X2M U290 ( .B0(RdData[6]), .B1(n24), .A0(rd_data_reg[6]), .A1N(n24), 
        .Y(n201) );
  AO2B2X2M U291 ( .B0(RdData[7]), .B1(n24), .A0(rd_data_reg[7]), .A1N(n24), 
        .Y(n203) );
  AO2B2X2M U292 ( .B0(RdData[0]), .B1(n24), .A0(rd_data_reg[0]), .A1N(n24), 
        .Y(n205) );
  AO2B2X2M U293 ( .B0(ALU_OUT[1]), .B1(n133), .A0(alu_res_reg[1]), .A1N(n133), 
        .Y(n159) );
  AO2B2X2M U294 ( .B0(ALU_OUT[2]), .B1(n21), .A0(alu_res_reg[2]), .A1N(n21), 
        .Y(n161) );
  AO2B2X2M U295 ( .B0(ALU_OUT[3]), .B1(n133), .A0(alu_res_reg[3]), .A1N(n133), 
        .Y(n163) );
  AO2B2X2M U296 ( .B0(ALU_OUT[4]), .B1(n21), .A0(alu_res_reg[4]), .A1N(n21), 
        .Y(n165) );
  AO2B2X2M U297 ( .B0(ALU_OUT[5]), .B1(n133), .A0(alu_res_reg[5]), .A1N(n133), 
        .Y(n167) );
  AO2B2X2M U298 ( .B0(ALU_OUT[6]), .B1(n21), .A0(alu_res_reg[6]), .A1N(n21), 
        .Y(n169) );
  AO2B2X2M U299 ( .B0(ALU_OUT[7]), .B1(n133), .A0(alu_res_reg[7]), .A1N(n133), 
        .Y(n171) );
  AO2B2X2M U300 ( .B0(ALU_OUT[8]), .B1(n21), .A0(alu_res_reg[8]), .A1N(n21), 
        .Y(n173) );
  AO2B2X2M U301 ( .B0(ALU_OUT[9]), .B1(n133), .A0(alu_res_reg[9]), .A1N(n133), 
        .Y(n175) );
  AO2B2X2M U302 ( .B0(ALU_OUT[10]), .B1(n21), .A0(alu_res_reg[10]), .A1N(n21), 
        .Y(n177) );
  AO2B2X2M U303 ( .B0(ALU_OUT[11]), .B1(n133), .A0(alu_res_reg[11]), .A1N(n133), .Y(n179) );
  AO2B2X2M U304 ( .B0(ALU_OUT[12]), .B1(n21), .A0(alu_res_reg[12]), .A1N(n21), 
        .Y(n181) );
  AO2B2X2M U305 ( .B0(ALU_OUT[13]), .B1(n133), .A0(alu_res_reg[13]), .A1N(n133), .Y(n183) );
  AO2B2X2M U306 ( .B0(ALU_OUT[14]), .B1(n21), .A0(alu_res_reg[14]), .A1N(n21), 
        .Y(n185) );
  AO2B2X2M U307 ( .B0(ALU_OUT[15]), .B1(n133), .A0(alu_res_reg[15]), .A1N(n133), .Y(n187) );
  AO2B2X2M U308 ( .B0(ALU_OUT[0]), .B1(n21), .A0(alu_res_reg[0]), .A1N(n21), 
        .Y(n189) );
  NAND2X2M U309 ( .A(n266), .B(RX_D_VLD), .Y(n37) );
  NOR3X2M U310 ( .A(RX_P_Data[2]), .B(RX_P_Data[6]), .C(RX_P_Data[4]), .Y(n102) );
  INVX2M U311 ( .A(RX_P_Data[1]), .Y(n318) );
  INVX2M U312 ( .A(RX_P_Data[6]), .Y(n313) );
  INVX2M U313 ( .A(RX_P_Data[5]), .Y(n314) );
  INVX2M U314 ( .A(RX_P_Data[4]), .Y(n315) );
  BUFX2M U315 ( .A(n27), .Y(n132) );
  NOR2BX2M U316 ( .AN(RX_D_VLD), .B(n36), .Y(n27) );
  INVX2M U317 ( .A(data_reg[0]), .Y(n306) );
  INVX2M U318 ( .A(data_reg[1]), .Y(n305) );
  INVX2M U319 ( .A(data_reg[2]), .Y(n304) );
  INVX2M U320 ( .A(data_reg[3]), .Y(n303) );
  INVX2M U321 ( .A(data_reg[4]), .Y(n302) );
  INVX2M U322 ( .A(data_reg[5]), .Y(n301) );
  INVX2M U323 ( .A(data_reg[6]), .Y(n300) );
  INVX2M U324 ( .A(data_reg[7]), .Y(n299) );
  INVX2M U325 ( .A(alu_a_reg[0]), .Y(n291) );
  INVX2M U326 ( .A(alu_a_reg[1]), .Y(n298) );
  INVX2M U327 ( .A(alu_a_reg[2]), .Y(n297) );
  INVX2M U328 ( .A(alu_a_reg[3]), .Y(n296) );
  INVX2M U329 ( .A(alu_a_reg[4]), .Y(n295) );
  INVX2M U330 ( .A(alu_a_reg[5]), .Y(n294) );
  INVX2M U331 ( .A(alu_a_reg[6]), .Y(n293) );
  INVX2M U332 ( .A(alu_a_reg[7]), .Y(n292) );
  INVX2M U333 ( .A(alu_b_reg[0]), .Y(n283) );
  INVX2M U334 ( .A(alu_b_reg[1]), .Y(n290) );
  INVX2M U335 ( .A(alu_b_reg[2]), .Y(n289) );
  INVX2M U336 ( .A(alu_b_reg[3]), .Y(n288) );
  INVX2M U337 ( .A(n334), .Y(n287) );
  INVX2M U338 ( .A(alu_b_reg[5]), .Y(n286) );
  INVX2M U339 ( .A(alu_b_reg[6]), .Y(n285) );
  INVX2M U340 ( .A(alu_b_reg[7]), .Y(n284) );
  INVX2M U341 ( .A(OUT_Valid), .Y(n311) );
  INVX2M U342 ( .A(n125), .Y(CLK_EN) );
  INVXLM U343 ( .A(test_so1), .Y(n331) );
  INVXLM U344 ( .A(n331), .Y(n332) );
  DLY1X1M U345 ( .A(test_se), .Y(n333) );
  DLY1X1M U346 ( .A(n332), .Y(n334) );
  SDFFRHQX1M \alu_b_reg_reg[4]  ( .D(n229), .SI(alu_b_reg[3]), .SE(n333), .CK(
        CLK), .RN(RST), .Q(alu_b_reg[4]) );
  INVX2M U3 ( .A(1'b0), .Y(clk_div_en) );
  INVXLM U5 ( .A(alu_b_reg[4]), .Y(n4) );
  INVX2M U6 ( .A(n4), .Y(test_so1) );
endmodule


module DF_SYNC_WIDTH4_test_0 ( dest_clk, dest_rst_n, async_in, sync_out, 
        test_si, test_se );
  input [3:0] async_in;
  output [3:0] sync_out;
  input dest_clk, dest_rst_n, test_si, test_se;

  wire   [3:0] sync_ff1;

  SDFFRQX1M \sync_out_reg[3]  ( .D(sync_ff1[3]), .SI(sync_out[2]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[3]) );
  SDFFRQX1M \sync_out_reg[2]  ( .D(sync_ff1[2]), .SI(sync_out[1]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[2]) );
  SDFFRQX1M \sync_out_reg[1]  ( .D(sync_ff1[1]), .SI(sync_out[0]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[1]) );
  SDFFRQX1M \sync_out_reg[0]  ( .D(sync_ff1[0]), .SI(sync_ff1[3]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[0]) );
  SDFFRQX1M \sync_ff1_reg[3]  ( .D(async_in[3]), .SI(sync_ff1[2]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[3]) );
  SDFFRQX1M \sync_ff1_reg[2]  ( .D(async_in[2]), .SI(sync_ff1[1]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[2]) );
  SDFFRQX1M \sync_ff1_reg[1]  ( .D(async_in[1]), .SI(sync_ff1[0]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[1]) );
  SDFFRQX1M \sync_ff1_reg[0]  ( .D(async_in[0]), .SI(test_si), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[0]) );
endmodule


module DF_SYNC_WIDTH4_test_1 ( dest_clk, dest_rst_n, async_in, sync_out, 
        test_si, test_se );
  input [3:0] async_in;
  output [3:0] sync_out;
  input dest_clk, dest_rst_n, test_si, test_se;

  wire   [3:0] sync_ff1;

  SDFFRQX2M \sync_out_reg[3]  ( .D(sync_ff1[3]), .SI(sync_out[2]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[3]) );
  SDFFRQX2M \sync_out_reg[2]  ( .D(sync_ff1[2]), .SI(sync_out[1]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[2]) );
  SDFFRQX2M \sync_out_reg[1]  ( .D(sync_ff1[1]), .SI(sync_out[0]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[1]) );
  SDFFRQX2M \sync_out_reg[0]  ( .D(sync_ff1[0]), .SI(sync_ff1[3]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_out[0]) );
  SDFFRQX2M \sync_ff1_reg[3]  ( .D(async_in[3]), .SI(sync_ff1[2]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[3]) );
  SDFFRQX2M \sync_ff1_reg[2]  ( .D(async_in[2]), .SI(sync_ff1[1]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[2]) );
  SDFFRQX2M \sync_ff1_reg[1]  ( .D(async_in[1]), .SI(sync_ff1[0]), .SE(test_se), .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[1]) );
  SDFFRQX2M \sync_ff1_reg[0]  ( .D(async_in[0]), .SI(test_si), .SE(test_se), 
        .CK(dest_clk), .RN(dest_rst_n), .Q(sync_ff1[0]) );
endmodule


module FIFO_WR_ADDR_WIDTH3_test_1 ( wclk, wrst_n, winc, wq2_rptr, waddr, wptr, 
        wfull, test_si, test_se );
  input [3:0] wq2_rptr;
  output [2:0] waddr;
  output [3:0] wptr;
  input wclk, wrst_n, winc, test_si, test_se;
  output wfull;
  wire   \wbin[3] , wfull_next, n10, n11, n12, n13, n14, n15, n16, n17;
  wire   [3:0] wbin_next;
  wire   [2:0] wptr_next;

  SDFFRQX1M \wbin_reg[0]  ( .D(wbin_next[0]), .SI(test_si), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(waddr[0]) );
  SDFFRQX1M \wbin_reg[1]  ( .D(wbin_next[1]), .SI(waddr[0]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[1]) );
  SDFFRQX1M \wbin_reg[2]  ( .D(wbin_next[2]), .SI(waddr[1]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(waddr[2]) );
  SDFFRQX1M \wptr_reg[3]  ( .D(wbin_next[3]), .SI(wptr[2]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[3]) );
  SDFFRQX1M \wbin_reg[3]  ( .D(wbin_next[3]), .SI(waddr[2]), .SE(test_se), 
        .CK(wclk), .RN(wrst_n), .Q(\wbin[3] ) );
  SDFFRQX1M \wptr_reg[0]  ( .D(wptr_next[0]), .SI(wfull), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[0]) );
  SDFFRQX1M \wptr_reg[2]  ( .D(wptr_next[2]), .SI(wptr[1]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[2]) );
  SDFFRQX1M \wptr_reg[1]  ( .D(wptr_next[1]), .SI(wptr[0]), .SE(test_se), .CK(
        wclk), .RN(wrst_n), .Q(wptr[1]) );
  SDFFRQX1M wfull_reg ( .D(wfull_next), .SI(\wbin[3] ), .SE(test_se), .CK(wclk), .RN(wrst_n), .Q(wfull) );
  CLKXOR2X2M U21 ( .A(wbin_next[1]), .B(wbin_next[0]), .Y(wptr_next[0]) );
  CLKXOR2X2M U22 ( .A(wbin_next[2]), .B(wbin_next[1]), .Y(wptr_next[1]) );
  CLKXOR2X2M U23 ( .A(wbin_next[3]), .B(wbin_next[2]), .Y(wptr_next[2]) );
  XNOR2X2M U24 ( .A(n16), .B(waddr[2]), .Y(wbin_next[2]) );
  NAND2X2M U25 ( .A(waddr[1]), .B(n15), .Y(n16) );
  XNOR2X2M U26 ( .A(n14), .B(\wbin[3] ), .Y(wbin_next[3]) );
  NAND3X2M U27 ( .A(waddr[1]), .B(n15), .C(waddr[2]), .Y(n14) );
  NOR4X1M U28 ( .A(n10), .B(n11), .C(n12), .D(n13), .Y(wfull_next) );
  XNOR2X2M U29 ( .A(wbin_next[3]), .B(wq2_rptr[3]), .Y(n11) );
  XNOR2X2M U30 ( .A(wptr_next[2]), .B(wq2_rptr[2]), .Y(n10) );
  CLKXOR2X2M U31 ( .A(wq2_rptr[0]), .B(wptr_next[0]), .Y(n12) );
  NOR2BX2M U32 ( .AN(winc), .B(wfull), .Y(n17) );
  AND2X2M U33 ( .A(waddr[0]), .B(n17), .Y(n15) );
  CLKXOR2X2M U34 ( .A(n15), .B(waddr[1]), .Y(wbin_next[1]) );
  CLKXOR2X2M U35 ( .A(wq2_rptr[1]), .B(wptr_next[1]), .Y(n13) );
  CLKXOR2X2M U36 ( .A(n17), .B(waddr[0]), .Y(wbin_next[0]) );
endmodule


module FIFO_RD_ADDR_WIDTH3_test_1 ( rclk, rrst_n, rinc, rq2_wptr, raddr, rptr, 
        rempty, test_si2, test_si1, test_se );
  input [3:0] rq2_wptr;
  output [2:0] raddr;
  output [3:0] rptr;
  input rclk, rrst_n, rinc, test_si2, test_si1, test_se;
  output rempty;
  wire   \rbin[3] , N8, n12, n13, n14, n15, n16, n17, n18, n19;
  wire   [3:0] rbin_next;
  wire   [2:0] rptr_next;

  SDFFRQX2M \rbin_reg[3]  ( .D(rbin_next[3]), .SI(raddr[2]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(\rbin[3] ) );
  SDFFSQX2M rempty_reg ( .D(N8), .SI(\rbin[3] ), .SE(test_se), .CK(rclk), .SN(
        rrst_n), .Q(rempty) );
  SDFFRQX2M \rbin_reg[0]  ( .D(rbin_next[0]), .SI(test_si1), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(raddr[0]) );
  SDFFRQX2M \rbin_reg[1]  ( .D(rbin_next[1]), .SI(test_si2), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(raddr[1]) );
  SDFFRQX2M \rbin_reg[2]  ( .D(rbin_next[2]), .SI(raddr[1]), .SE(test_se), 
        .CK(rclk), .RN(rrst_n), .Q(raddr[2]) );
  SDFFRQX2M \rptr_reg[0]  ( .D(rptr_next[0]), .SI(rempty), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[0]) );
  SDFFRQX2M \rptr_reg[1]  ( .D(rptr_next[1]), .SI(rptr[0]), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[1]) );
  SDFFRQX2M \rptr_reg[3]  ( .D(rbin_next[3]), .SI(rptr[2]), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[3]) );
  SDFFRQX2M \rptr_reg[2]  ( .D(rptr_next[2]), .SI(rptr[1]), .SE(test_se), .CK(
        rclk), .RN(rrst_n), .Q(rptr[2]) );
  CLKXOR2X2M U12 ( .A(rbin_next[2]), .B(rbin_next[1]), .Y(rptr_next[1]) );
  CLKXOR2X2M U13 ( .A(rbin_next[3]), .B(rbin_next[2]), .Y(rptr_next[2]) );
  CLKXOR2X2M U14 ( .A(rbin_next[1]), .B(rbin_next[0]), .Y(rptr_next[0]) );
  XNOR2X2M U15 ( .A(n19), .B(\rbin[3] ), .Y(rbin_next[3]) );
  NAND2X2M U16 ( .A(n18), .B(raddr[2]), .Y(n19) );
  XNOR2X2M U17 ( .A(n17), .B(raddr[1]), .Y(rbin_next[1]) );
  NOR2BX2M U18 ( .AN(rinc), .B(rempty), .Y(n16) );
  NOR2BX2M U19 ( .AN(raddr[1]), .B(n17), .Y(n18) );
  NOR4X1M U20 ( .A(n12), .B(n13), .C(n14), .D(n15), .Y(N8) );
  CLKXOR2X2M U21 ( .A(rq2_wptr[0]), .B(rptr_next[0]), .Y(n14) );
  CLKXOR2X2M U22 ( .A(rq2_wptr[3]), .B(rbin_next[3]), .Y(n13) );
  CLKXOR2X2M U23 ( .A(rq2_wptr[2]), .B(rptr_next[2]), .Y(n12) );
  NAND2X2M U24 ( .A(raddr[0]), .B(n16), .Y(n17) );
  CLKXOR2X2M U25 ( .A(n18), .B(raddr[2]), .Y(rbin_next[2]) );
  CLKXOR2X2M U26 ( .A(rq2_wptr[1]), .B(rptr_next[1]), .Y(n15) );
  CLKXOR2X2M U27 ( .A(n16), .B(raddr[0]), .Y(rbin_next[0]) );
endmodule


module FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3_test_1 ( wclk, winc_valid, waddr, 
        wdata, rclk, rrst_n, rinc_valid, raddr, rdata, test_si, test_so, 
        test_se );
  input [2:0] waddr;
  input [7:0] wdata;
  input [2:0] raddr;
  output [7:0] rdata;
  input wclk, winc_valid, rclk, rrst_n, rinc_valid, test_si, test_se;
  output test_so;
  wire   N10, N11, N12, \mem[0][7] , \mem[0][6] , \mem[0][5] , \mem[0][4] ,
         \mem[0][3] , \mem[0][2] , \mem[0][1] , \mem[0][0] , \mem[1][7] ,
         \mem[1][6] , \mem[1][5] , \mem[1][4] , \mem[1][3] , \mem[1][2] ,
         \mem[1][1] , \mem[1][0] , \mem[2][7] , \mem[2][6] , \mem[2][5] ,
         \mem[2][4] , \mem[2][3] , \mem[2][2] , \mem[2][1] , \mem[2][0] ,
         \mem[3][7] , \mem[3][6] , \mem[3][5] , \mem[3][4] , \mem[3][3] ,
         \mem[3][2] , \mem[3][1] , \mem[3][0] , \mem[4][7] , \mem[4][6] ,
         \mem[4][5] , \mem[4][4] , \mem[4][3] , \mem[4][2] , \mem[4][1] ,
         \mem[4][0] , \mem[5][7] , \mem[5][6] , \mem[5][5] , \mem[5][4] ,
         \mem[5][3] , \mem[5][2] , \mem[5][1] , \mem[5][0] , \mem[6][7] ,
         \mem[6][6] , \mem[6][5] , \mem[6][4] , \mem[6][3] , \mem[6][2] ,
         \mem[6][1] , \mem[6][0] , \mem[7][7] , \mem[7][6] , \mem[7][5] ,
         \mem[7][4] , \mem[7][3] , \mem[7][2] , \mem[7][1] , \mem[7][0] , n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n194, n195,
         n196;
  assign N10 = raddr[0];
  assign N11 = raddr[1];
  assign N12 = raddr[2];
  assign test_so = \mem[7][7] ;

  SDFFQX2M \mem_reg[0][7]  ( .D(n148), .SI(\mem[0][6] ), .SE(n194), .CK(wclk), 
        .Q(\mem[0][7] ) );
  SDFFQX2M \mem_reg[0][6]  ( .D(n147), .SI(\mem[0][5] ), .SE(n196), .CK(wclk), 
        .Q(\mem[0][6] ) );
  SDFFQX2M \mem_reg[0][5]  ( .D(n146), .SI(\mem[0][4] ), .SE(n195), .CK(wclk), 
        .Q(\mem[0][5] ) );
  SDFFQX2M \mem_reg[0][4]  ( .D(n145), .SI(\mem[0][3] ), .SE(n194), .CK(wclk), 
        .Q(\mem[0][4] ) );
  SDFFQX2M \mem_reg[0][3]  ( .D(n144), .SI(\mem[0][2] ), .SE(n196), .CK(wclk), 
        .Q(\mem[0][3] ) );
  SDFFQX2M \mem_reg[0][2]  ( .D(n143), .SI(\mem[0][1] ), .SE(n195), .CK(wclk), 
        .Q(\mem[0][2] ) );
  SDFFQX2M \mem_reg[0][1]  ( .D(n142), .SI(\mem[0][0] ), .SE(n194), .CK(wclk), 
        .Q(\mem[0][1] ) );
  SDFFQX2M \mem_reg[0][0]  ( .D(n141), .SI(test_si), .SE(n196), .CK(wclk), .Q(
        \mem[0][0] ) );
  SDFFQX2M \mem_reg[1][7]  ( .D(n140), .SI(\mem[1][6] ), .SE(n195), .CK(wclk), 
        .Q(\mem[1][7] ) );
  SDFFQX2M \mem_reg[1][6]  ( .D(n139), .SI(\mem[1][5] ), .SE(n194), .CK(wclk), 
        .Q(\mem[1][6] ) );
  SDFFQX2M \mem_reg[1][5]  ( .D(n138), .SI(\mem[1][4] ), .SE(n196), .CK(wclk), 
        .Q(\mem[1][5] ) );
  SDFFQX2M \mem_reg[1][4]  ( .D(n137), .SI(\mem[1][3] ), .SE(n195), .CK(wclk), 
        .Q(\mem[1][4] ) );
  SDFFQX2M \mem_reg[1][3]  ( .D(n136), .SI(\mem[1][2] ), .SE(n194), .CK(wclk), 
        .Q(\mem[1][3] ) );
  SDFFQX2M \mem_reg[1][2]  ( .D(n135), .SI(\mem[1][1] ), .SE(n196), .CK(wclk), 
        .Q(\mem[1][2] ) );
  SDFFQX2M \mem_reg[1][1]  ( .D(n134), .SI(\mem[1][0] ), .SE(n195), .CK(wclk), 
        .Q(\mem[1][1] ) );
  SDFFQX2M \mem_reg[1][0]  ( .D(n133), .SI(\mem[0][7] ), .SE(n194), .CK(wclk), 
        .Q(\mem[1][0] ) );
  SDFFQX2M \mem_reg[4][7]  ( .D(n116), .SI(\mem[4][6] ), .SE(n196), .CK(wclk), 
        .Q(\mem[4][7] ) );
  SDFFQX2M \mem_reg[4][6]  ( .D(n115), .SI(\mem[4][5] ), .SE(n195), .CK(wclk), 
        .Q(\mem[4][6] ) );
  SDFFQX2M \mem_reg[4][5]  ( .D(n114), .SI(\mem[4][4] ), .SE(n194), .CK(wclk), 
        .Q(\mem[4][5] ) );
  SDFFQX2M \mem_reg[4][4]  ( .D(n113), .SI(\mem[4][3] ), .SE(n196), .CK(wclk), 
        .Q(\mem[4][4] ) );
  SDFFQX2M \mem_reg[4][3]  ( .D(n112), .SI(\mem[4][2] ), .SE(n195), .CK(wclk), 
        .Q(\mem[4][3] ) );
  SDFFQX2M \mem_reg[4][2]  ( .D(n111), .SI(\mem[4][1] ), .SE(n194), .CK(wclk), 
        .Q(\mem[4][2] ) );
  SDFFQX2M \mem_reg[4][1]  ( .D(n110), .SI(\mem[4][0] ), .SE(n196), .CK(wclk), 
        .Q(\mem[4][1] ) );
  SDFFQX2M \mem_reg[4][0]  ( .D(n109), .SI(\mem[3][7] ), .SE(n195), .CK(wclk), 
        .Q(\mem[4][0] ) );
  SDFFQX2M \mem_reg[5][7]  ( .D(n108), .SI(\mem[5][6] ), .SE(n194), .CK(wclk), 
        .Q(\mem[5][7] ) );
  SDFFQX2M \mem_reg[5][6]  ( .D(n107), .SI(\mem[5][5] ), .SE(n196), .CK(wclk), 
        .Q(\mem[5][6] ) );
  SDFFQX2M \mem_reg[5][5]  ( .D(n106), .SI(\mem[5][4] ), .SE(n195), .CK(wclk), 
        .Q(\mem[5][5] ) );
  SDFFQX2M \mem_reg[5][4]  ( .D(n105), .SI(\mem[5][3] ), .SE(n194), .CK(wclk), 
        .Q(\mem[5][4] ) );
  SDFFQX2M \mem_reg[5][3]  ( .D(n104), .SI(\mem[5][2] ), .SE(n196), .CK(wclk), 
        .Q(\mem[5][3] ) );
  SDFFQX2M \mem_reg[5][2]  ( .D(n103), .SI(\mem[5][1] ), .SE(n195), .CK(wclk), 
        .Q(\mem[5][2] ) );
  SDFFQX2M \mem_reg[5][1]  ( .D(n102), .SI(\mem[5][0] ), .SE(n194), .CK(wclk), 
        .Q(\mem[5][1] ) );
  SDFFQX2M \mem_reg[5][0]  ( .D(n101), .SI(\mem[4][7] ), .SE(n196), .CK(wclk), 
        .Q(\mem[5][0] ) );
  SDFFQX2M \mem_reg[6][7]  ( .D(n100), .SI(\mem[6][6] ), .SE(n195), .CK(wclk), 
        .Q(\mem[6][7] ) );
  SDFFQX2M \mem_reg[6][6]  ( .D(n99), .SI(\mem[6][5] ), .SE(n194), .CK(wclk), 
        .Q(\mem[6][6] ) );
  SDFFQX2M \mem_reg[6][5]  ( .D(n98), .SI(\mem[6][4] ), .SE(n196), .CK(wclk), 
        .Q(\mem[6][5] ) );
  SDFFQX2M \mem_reg[6][4]  ( .D(n97), .SI(\mem[6][3] ), .SE(n195), .CK(wclk), 
        .Q(\mem[6][4] ) );
  SDFFQX2M \mem_reg[6][3]  ( .D(n96), .SI(\mem[6][2] ), .SE(n194), .CK(wclk), 
        .Q(\mem[6][3] ) );
  SDFFQX2M \mem_reg[6][2]  ( .D(n95), .SI(\mem[6][1] ), .SE(n196), .CK(wclk), 
        .Q(\mem[6][2] ) );
  SDFFQX2M \mem_reg[6][1]  ( .D(n94), .SI(\mem[6][0] ), .SE(n195), .CK(wclk), 
        .Q(\mem[6][1] ) );
  SDFFQX2M \mem_reg[6][0]  ( .D(n93), .SI(\mem[5][7] ), .SE(n194), .CK(wclk), 
        .Q(\mem[6][0] ) );
  SDFFQX2M \mem_reg[7][7]  ( .D(n92), .SI(\mem[7][6] ), .SE(n196), .CK(wclk), 
        .Q(\mem[7][7] ) );
  SDFFQX2M \mem_reg[7][6]  ( .D(n91), .SI(\mem[7][5] ), .SE(n195), .CK(wclk), 
        .Q(\mem[7][6] ) );
  SDFFQX2M \mem_reg[7][5]  ( .D(n90), .SI(\mem[7][4] ), .SE(n194), .CK(wclk), 
        .Q(\mem[7][5] ) );
  SDFFQX2M \mem_reg[7][4]  ( .D(n89), .SI(\mem[7][3] ), .SE(n196), .CK(wclk), 
        .Q(\mem[7][4] ) );
  SDFFQX2M \mem_reg[7][3]  ( .D(n88), .SI(\mem[7][2] ), .SE(n195), .CK(wclk), 
        .Q(\mem[7][3] ) );
  SDFFQX2M \mem_reg[7][2]  ( .D(n87), .SI(\mem[7][1] ), .SE(n194), .CK(wclk), 
        .Q(\mem[7][2] ) );
  SDFFQX2M \mem_reg[7][1]  ( .D(n86), .SI(\mem[7][0] ), .SE(n196), .CK(wclk), 
        .Q(\mem[7][1] ) );
  SDFFQX2M \mem_reg[7][0]  ( .D(n85), .SI(\mem[6][7] ), .SE(n195), .CK(wclk), 
        .Q(\mem[7][0] ) );
  SDFFQX2M \mem_reg[2][7]  ( .D(n132), .SI(\mem[2][6] ), .SE(n194), .CK(wclk), 
        .Q(\mem[2][7] ) );
  SDFFQX2M \mem_reg[2][6]  ( .D(n131), .SI(\mem[2][5] ), .SE(n196), .CK(wclk), 
        .Q(\mem[2][6] ) );
  SDFFQX2M \mem_reg[2][5]  ( .D(n130), .SI(\mem[2][4] ), .SE(n195), .CK(wclk), 
        .Q(\mem[2][5] ) );
  SDFFQX2M \mem_reg[2][4]  ( .D(n129), .SI(\mem[2][3] ), .SE(n194), .CK(wclk), 
        .Q(\mem[2][4] ) );
  SDFFQX2M \mem_reg[2][3]  ( .D(n128), .SI(\mem[2][2] ), .SE(n196), .CK(wclk), 
        .Q(\mem[2][3] ) );
  SDFFQX2M \mem_reg[2][2]  ( .D(n127), .SI(\mem[2][1] ), .SE(n195), .CK(wclk), 
        .Q(\mem[2][2] ) );
  SDFFQX2M \mem_reg[2][1]  ( .D(n126), .SI(\mem[2][0] ), .SE(n194), .CK(wclk), 
        .Q(\mem[2][1] ) );
  SDFFQX2M \mem_reg[2][0]  ( .D(n125), .SI(\mem[1][7] ), .SE(n196), .CK(wclk), 
        .Q(\mem[2][0] ) );
  SDFFQX2M \mem_reg[3][7]  ( .D(n124), .SI(\mem[3][6] ), .SE(n195), .CK(wclk), 
        .Q(\mem[3][7] ) );
  SDFFQX2M \mem_reg[3][6]  ( .D(n123), .SI(\mem[3][5] ), .SE(n194), .CK(wclk), 
        .Q(\mem[3][6] ) );
  SDFFQX2M \mem_reg[3][5]  ( .D(n122), .SI(\mem[3][4] ), .SE(n196), .CK(wclk), 
        .Q(\mem[3][5] ) );
  SDFFQX2M \mem_reg[3][4]  ( .D(n121), .SI(\mem[3][3] ), .SE(n195), .CK(wclk), 
        .Q(\mem[3][4] ) );
  SDFFQX2M \mem_reg[3][3]  ( .D(n120), .SI(\mem[3][2] ), .SE(n194), .CK(wclk), 
        .Q(\mem[3][3] ) );
  SDFFQX2M \mem_reg[3][2]  ( .D(n119), .SI(\mem[3][1] ), .SE(n196), .CK(wclk), 
        .Q(\mem[3][2] ) );
  SDFFQX2M \mem_reg[3][1]  ( .D(n118), .SI(\mem[3][0] ), .SE(n195), .CK(wclk), 
        .Q(\mem[3][1] ) );
  SDFFQX2M \mem_reg[3][0]  ( .D(n117), .SI(\mem[2][7] ), .SE(n194), .CK(wclk), 
        .Q(\mem[3][0] ) );
  BUFX2M U66 ( .A(n77), .Y(n181) );
  BUFX2M U67 ( .A(n83), .Y(n178) );
  BUFX2M U68 ( .A(n80), .Y(n180) );
  BUFX2M U69 ( .A(n82), .Y(n179) );
  NOR2X2M U70 ( .A(n175), .B(n176), .Y(n171) );
  NAND3X2M U71 ( .A(n190), .B(n191), .C(n76), .Y(n79) );
  NAND3X2M U72 ( .A(n190), .B(n191), .C(n81), .Y(n84) );
  NOR2X2M U73 ( .A(N11), .B(N12), .Y(n168) );
  NOR2X2M U74 ( .A(n176), .B(N12), .Y(n169) );
  NOR2X2M U75 ( .A(n175), .B(N11), .Y(n172) );
  INVX2M U76 ( .A(N12), .Y(n175) );
  INVX2M U77 ( .A(N11), .Y(n176) );
  INVX2M U78 ( .A(wdata[0]), .Y(n189) );
  INVX2M U79 ( .A(wdata[1]), .Y(n188) );
  INVX2M U80 ( .A(wdata[2]), .Y(n187) );
  INVX2M U81 ( .A(wdata[3]), .Y(n186) );
  INVX2M U82 ( .A(wdata[4]), .Y(n185) );
  INVX2M U83 ( .A(wdata[5]), .Y(n184) );
  INVX2M U84 ( .A(wdata[6]), .Y(n183) );
  INVX2M U85 ( .A(wdata[7]), .Y(n182) );
  NAND3X2M U86 ( .A(n76), .B(n191), .C(waddr[0]), .Y(n78) );
  NAND3X2M U87 ( .A(waddr[0]), .B(n76), .C(waddr[1]), .Y(n75) );
  NOR2BX2M U88 ( .AN(winc_valid), .B(waddr[2]), .Y(n81) );
  OAI2BB2X1M U89 ( .B0(n75), .B1(n189), .A0N(\mem[7][0] ), .A1N(n75), .Y(n85)
         );
  OAI2BB2X1M U90 ( .B0(n75), .B1(n188), .A0N(\mem[7][1] ), .A1N(n75), .Y(n86)
         );
  OAI2BB2X1M U91 ( .B0(n75), .B1(n187), .A0N(\mem[7][2] ), .A1N(n75), .Y(n87)
         );
  OAI2BB2X1M U92 ( .B0(n75), .B1(n186), .A0N(\mem[7][3] ), .A1N(n75), .Y(n88)
         );
  OAI2BB2X1M U93 ( .B0(n75), .B1(n185), .A0N(\mem[7][4] ), .A1N(n75), .Y(n89)
         );
  OAI2BB2X1M U94 ( .B0(n75), .B1(n184), .A0N(\mem[7][5] ), .A1N(n75), .Y(n90)
         );
  OAI2BB2X1M U95 ( .B0(n75), .B1(n183), .A0N(\mem[7][6] ), .A1N(n75), .Y(n91)
         );
  OAI2BB2X1M U96 ( .B0(n75), .B1(n182), .A0N(\mem[7][7] ), .A1N(n75), .Y(n92)
         );
  OAI2BB2X1M U97 ( .B0(n189), .B1(n78), .A0N(\mem[5][0] ), .A1N(n78), .Y(n101)
         );
  OAI2BB2X1M U98 ( .B0(n188), .B1(n78), .A0N(\mem[5][1] ), .A1N(n78), .Y(n102)
         );
  OAI2BB2X1M U99 ( .B0(n187), .B1(n78), .A0N(\mem[5][2] ), .A1N(n78), .Y(n103)
         );
  OAI2BB2X1M U100 ( .B0(n186), .B1(n78), .A0N(\mem[5][3] ), .A1N(n78), .Y(n104) );
  OAI2BB2X1M U101 ( .B0(n185), .B1(n78), .A0N(\mem[5][4] ), .A1N(n78), .Y(n105) );
  OAI2BB2X1M U102 ( .B0(n184), .B1(n78), .A0N(\mem[5][5] ), .A1N(n78), .Y(n106) );
  OAI2BB2X1M U103 ( .B0(n183), .B1(n78), .A0N(\mem[5][6] ), .A1N(n78), .Y(n107) );
  OAI2BB2X1M U104 ( .B0(n182), .B1(n78), .A0N(\mem[5][7] ), .A1N(n78), .Y(n108) );
  OAI2BB2X1M U105 ( .B0(n189), .B1(n84), .A0N(\mem[0][0] ), .A1N(n84), .Y(n141) );
  OAI2BB2X1M U106 ( .B0(n188), .B1(n84), .A0N(\mem[0][1] ), .A1N(n84), .Y(n142) );
  OAI2BB2X1M U107 ( .B0(n187), .B1(n84), .A0N(\mem[0][2] ), .A1N(n84), .Y(n143) );
  OAI2BB2X1M U108 ( .B0(n186), .B1(n84), .A0N(\mem[0][3] ), .A1N(n84), .Y(n144) );
  OAI2BB2X1M U109 ( .B0(n185), .B1(n84), .A0N(\mem[0][4] ), .A1N(n84), .Y(n145) );
  OAI2BB2X1M U110 ( .B0(n184), .B1(n84), .A0N(\mem[0][5] ), .A1N(n84), .Y(n146) );
  OAI2BB2X1M U111 ( .B0(n183), .B1(n84), .A0N(\mem[0][6] ), .A1N(n84), .Y(n147) );
  OAI2BB2X1M U112 ( .B0(n182), .B1(n84), .A0N(\mem[0][7] ), .A1N(n84), .Y(n148) );
  OAI2BB2X1M U113 ( .B0(n189), .B1(n79), .A0N(\mem[4][0] ), .A1N(n79), .Y(n109) );
  OAI2BB2X1M U114 ( .B0(n188), .B1(n79), .A0N(\mem[4][1] ), .A1N(n79), .Y(n110) );
  OAI2BB2X1M U115 ( .B0(n187), .B1(n79), .A0N(\mem[4][2] ), .A1N(n79), .Y(n111) );
  OAI2BB2X1M U116 ( .B0(n186), .B1(n79), .A0N(\mem[4][3] ), .A1N(n79), .Y(n112) );
  OAI2BB2X1M U117 ( .B0(n185), .B1(n79), .A0N(\mem[4][4] ), .A1N(n79), .Y(n113) );
  OAI2BB2X1M U118 ( .B0(n184), .B1(n79), .A0N(\mem[4][5] ), .A1N(n79), .Y(n114) );
  OAI2BB2X1M U119 ( .B0(n183), .B1(n79), .A0N(\mem[4][6] ), .A1N(n79), .Y(n115) );
  OAI2BB2X1M U120 ( .B0(n182), .B1(n79), .A0N(\mem[4][7] ), .A1N(n79), .Y(n116) );
  OAI2BB2X1M U121 ( .B0(n189), .B1(n181), .A0N(\mem[6][0] ), .A1N(n181), .Y(
        n93) );
  OAI2BB2X1M U122 ( .B0(n188), .B1(n181), .A0N(\mem[6][1] ), .A1N(n181), .Y(
        n94) );
  OAI2BB2X1M U123 ( .B0(n187), .B1(n181), .A0N(\mem[6][2] ), .A1N(n181), .Y(
        n95) );
  OAI2BB2X1M U124 ( .B0(n186), .B1(n181), .A0N(\mem[6][3] ), .A1N(n181), .Y(
        n96) );
  OAI2BB2X1M U125 ( .B0(n185), .B1(n181), .A0N(\mem[6][4] ), .A1N(n181), .Y(
        n97) );
  OAI2BB2X1M U126 ( .B0(n184), .B1(n181), .A0N(\mem[6][5] ), .A1N(n181), .Y(
        n98) );
  OAI2BB2X1M U127 ( .B0(n183), .B1(n181), .A0N(\mem[6][6] ), .A1N(n181), .Y(
        n99) );
  OAI2BB2X1M U128 ( .B0(n182), .B1(n181), .A0N(\mem[6][7] ), .A1N(n181), .Y(
        n100) );
  OAI2BB2X1M U129 ( .B0(n189), .B1(n180), .A0N(\mem[3][0] ), .A1N(n180), .Y(
        n117) );
  OAI2BB2X1M U130 ( .B0(n188), .B1(n180), .A0N(\mem[3][1] ), .A1N(n180), .Y(
        n118) );
  OAI2BB2X1M U131 ( .B0(n187), .B1(n180), .A0N(\mem[3][2] ), .A1N(n180), .Y(
        n119) );
  OAI2BB2X1M U132 ( .B0(n186), .B1(n180), .A0N(\mem[3][3] ), .A1N(n180), .Y(
        n120) );
  OAI2BB2X1M U133 ( .B0(n185), .B1(n180), .A0N(\mem[3][4] ), .A1N(n180), .Y(
        n121) );
  OAI2BB2X1M U134 ( .B0(n184), .B1(n180), .A0N(\mem[3][5] ), .A1N(n180), .Y(
        n122) );
  OAI2BB2X1M U135 ( .B0(n183), .B1(n180), .A0N(\mem[3][6] ), .A1N(n180), .Y(
        n123) );
  OAI2BB2X1M U136 ( .B0(n182), .B1(n180), .A0N(\mem[3][7] ), .A1N(n180), .Y(
        n124) );
  OAI2BB2X1M U137 ( .B0(n189), .B1(n179), .A0N(\mem[2][0] ), .A1N(n179), .Y(
        n125) );
  OAI2BB2X1M U138 ( .B0(n188), .B1(n179), .A0N(\mem[2][1] ), .A1N(n179), .Y(
        n126) );
  OAI2BB2X1M U139 ( .B0(n187), .B1(n179), .A0N(\mem[2][2] ), .A1N(n179), .Y(
        n127) );
  OAI2BB2X1M U140 ( .B0(n186), .B1(n179), .A0N(\mem[2][3] ), .A1N(n179), .Y(
        n128) );
  OAI2BB2X1M U141 ( .B0(n185), .B1(n179), .A0N(\mem[2][4] ), .A1N(n179), .Y(
        n129) );
  OAI2BB2X1M U142 ( .B0(n184), .B1(n179), .A0N(\mem[2][5] ), .A1N(n179), .Y(
        n130) );
  OAI2BB2X1M U143 ( .B0(n183), .B1(n179), .A0N(\mem[2][6] ), .A1N(n179), .Y(
        n131) );
  OAI2BB2X1M U144 ( .B0(n182), .B1(n179), .A0N(\mem[2][7] ), .A1N(n179), .Y(
        n132) );
  OAI2BB2X1M U145 ( .B0(n189), .B1(n178), .A0N(\mem[1][0] ), .A1N(n178), .Y(
        n133) );
  OAI2BB2X1M U146 ( .B0(n188), .B1(n178), .A0N(\mem[1][1] ), .A1N(n178), .Y(
        n134) );
  OAI2BB2X1M U147 ( .B0(n187), .B1(n178), .A0N(\mem[1][2] ), .A1N(n178), .Y(
        n135) );
  OAI2BB2X1M U148 ( .B0(n186), .B1(n178), .A0N(\mem[1][3] ), .A1N(n178), .Y(
        n136) );
  OAI2BB2X1M U149 ( .B0(n185), .B1(n178), .A0N(\mem[1][4] ), .A1N(n178), .Y(
        n137) );
  OAI2BB2X1M U150 ( .B0(n184), .B1(n178), .A0N(\mem[1][5] ), .A1N(n178), .Y(
        n138) );
  OAI2BB2X1M U151 ( .B0(n183), .B1(n178), .A0N(\mem[1][6] ), .A1N(n178), .Y(
        n139) );
  OAI2BB2X1M U152 ( .B0(n182), .B1(n178), .A0N(\mem[1][7] ), .A1N(n178), .Y(
        n140) );
  AND2X2M U153 ( .A(winc_valid), .B(waddr[2]), .Y(n76) );
  NAND3X2M U154 ( .A(n76), .B(n190), .C(waddr[1]), .Y(n77) );
  NAND3X2M U155 ( .A(waddr[1]), .B(waddr[0]), .C(n81), .Y(n80) );
  NAND3X2M U156 ( .A(waddr[1]), .B(n190), .C(n81), .Y(n82) );
  NAND3X2M U157 ( .A(waddr[0]), .B(n191), .C(n81), .Y(n83) );
  INVX2M U158 ( .A(N10), .Y(n177) );
  INVX2M U159 ( .A(waddr[1]), .Y(n191) );
  INVX2M U160 ( .A(waddr[0]), .Y(n190) );
  AO22X1M U161 ( .A0(\mem[3][0] ), .A1(n169), .B0(\mem[1][0] ), .B1(n168), .Y(
        n65) );
  AOI221XLM U162 ( .A0(\mem[5][0] ), .A1(n172), .B0(\mem[7][0] ), .B1(n171), 
        .C0(n65), .Y(n68) );
  AO22X1M U163 ( .A0(\mem[2][0] ), .A1(n169), .B0(\mem[0][0] ), .B1(n168), .Y(
        n66) );
  AOI221XLM U164 ( .A0(\mem[4][0] ), .A1(n172), .B0(\mem[6][0] ), .B1(n171), 
        .C0(n66), .Y(n67) );
  OAI22X1M U165 ( .A0(n177), .A1(n68), .B0(N10), .B1(n67), .Y(rdata[0]) );
  AO22X1M U166 ( .A0(\mem[3][1] ), .A1(n169), .B0(\mem[1][1] ), .B1(n168), .Y(
        n69) );
  AOI221XLM U167 ( .A0(\mem[5][1] ), .A1(n172), .B0(\mem[7][1] ), .B1(n171), 
        .C0(n69), .Y(n72) );
  AO22X1M U168 ( .A0(\mem[2][1] ), .A1(n169), .B0(\mem[0][1] ), .B1(n168), .Y(
        n70) );
  AOI221XLM U169 ( .A0(\mem[4][1] ), .A1(n172), .B0(\mem[6][1] ), .B1(n171), 
        .C0(n70), .Y(n71) );
  OAI22X1M U170 ( .A0(n177), .A1(n72), .B0(N10), .B1(n71), .Y(rdata[1]) );
  AO22X1M U171 ( .A0(\mem[3][2] ), .A1(n169), .B0(\mem[1][2] ), .B1(n168), .Y(
        n73) );
  AOI221XLM U172 ( .A0(\mem[5][2] ), .A1(n172), .B0(\mem[7][2] ), .B1(n171), 
        .C0(n73), .Y(n150) );
  AO22X1M U173 ( .A0(\mem[2][2] ), .A1(n169), .B0(\mem[0][2] ), .B1(n168), .Y(
        n74) );
  AOI221XLM U174 ( .A0(\mem[4][2] ), .A1(n172), .B0(\mem[6][2] ), .B1(n171), 
        .C0(n74), .Y(n149) );
  OAI22X1M U175 ( .A0(n177), .A1(n150), .B0(N10), .B1(n149), .Y(rdata[2]) );
  AO22X1M U176 ( .A0(\mem[3][3] ), .A1(n169), .B0(\mem[1][3] ), .B1(n168), .Y(
        n151) );
  AOI221XLM U177 ( .A0(\mem[5][3] ), .A1(n172), .B0(\mem[7][3] ), .B1(n171), 
        .C0(n151), .Y(n154) );
  AO22X1M U178 ( .A0(\mem[2][3] ), .A1(n169), .B0(\mem[0][3] ), .B1(n168), .Y(
        n152) );
  AOI221XLM U179 ( .A0(\mem[4][3] ), .A1(n172), .B0(\mem[6][3] ), .B1(n171), 
        .C0(n152), .Y(n153) );
  OAI22X1M U180 ( .A0(n177), .A1(n154), .B0(N10), .B1(n153), .Y(rdata[3]) );
  AO22X1M U181 ( .A0(\mem[3][4] ), .A1(n169), .B0(\mem[1][4] ), .B1(n168), .Y(
        n155) );
  AOI221XLM U182 ( .A0(\mem[5][4] ), .A1(n172), .B0(\mem[7][4] ), .B1(n171), 
        .C0(n155), .Y(n158) );
  AO22X1M U183 ( .A0(\mem[2][4] ), .A1(n169), .B0(\mem[0][4] ), .B1(n168), .Y(
        n156) );
  AOI221XLM U184 ( .A0(\mem[4][4] ), .A1(n172), .B0(\mem[6][4] ), .B1(n171), 
        .C0(n156), .Y(n157) );
  OAI22X1M U185 ( .A0(n177), .A1(n158), .B0(N10), .B1(n157), .Y(rdata[4]) );
  AO22X1M U186 ( .A0(\mem[3][5] ), .A1(n169), .B0(\mem[1][5] ), .B1(n168), .Y(
        n159) );
  AOI221XLM U187 ( .A0(\mem[5][5] ), .A1(n172), .B0(\mem[7][5] ), .B1(n171), 
        .C0(n159), .Y(n162) );
  AO22X1M U188 ( .A0(\mem[2][5] ), .A1(n169), .B0(\mem[0][5] ), .B1(n168), .Y(
        n160) );
  AOI221XLM U189 ( .A0(\mem[4][5] ), .A1(n172), .B0(\mem[6][5] ), .B1(n171), 
        .C0(n160), .Y(n161) );
  OAI22X1M U190 ( .A0(n177), .A1(n162), .B0(N10), .B1(n161), .Y(rdata[5]) );
  AO22X1M U191 ( .A0(\mem[3][6] ), .A1(n169), .B0(\mem[1][6] ), .B1(n168), .Y(
        n163) );
  AOI221XLM U192 ( .A0(\mem[5][6] ), .A1(n172), .B0(\mem[7][6] ), .B1(n171), 
        .C0(n163), .Y(n166) );
  AO22X1M U193 ( .A0(\mem[2][6] ), .A1(n169), .B0(\mem[0][6] ), .B1(n168), .Y(
        n164) );
  AOI221XLM U194 ( .A0(\mem[4][6] ), .A1(n172), .B0(\mem[6][6] ), .B1(n171), 
        .C0(n164), .Y(n165) );
  OAI22X1M U195 ( .A0(n177), .A1(n166), .B0(N10), .B1(n165), .Y(rdata[6]) );
  AO22X1M U196 ( .A0(\mem[3][7] ), .A1(n169), .B0(\mem[1][7] ), .B1(n168), .Y(
        n167) );
  AOI221XLM U197 ( .A0(\mem[5][7] ), .A1(n172), .B0(\mem[7][7] ), .B1(n171), 
        .C0(n167), .Y(n174) );
  AO22X1M U198 ( .A0(\mem[2][7] ), .A1(n169), .B0(\mem[0][7] ), .B1(n168), .Y(
        n170) );
  AOI221XLM U199 ( .A0(\mem[4][7] ), .A1(n172), .B0(\mem[6][7] ), .B1(n171), 
        .C0(n170), .Y(n173) );
  OAI22X1M U200 ( .A0(n174), .A1(n177), .B0(N10), .B1(n173), .Y(rdata[7]) );
  DLY1X1M U201 ( .A(test_se), .Y(n194) );
  DLY1X1M U202 ( .A(test_se), .Y(n195) );
  DLY1X1M U203 ( .A(test_se), .Y(n196) );
endmodule


module ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_test_1 ( W_CLK, W_RST, W_INC, 
        WR_DATA, FULL, R_CLK, R_RST, R_INC, RD_DATA, EMPTY, test_si2, test_si1, 
        test_so2, test_so1, test_se );
  input [7:0] WR_DATA;
  output [7:0] RD_DATA;
  input W_CLK, W_RST, W_INC, R_CLK, R_RST, R_INC, test_si2, test_si1, test_se;
  output FULL, EMPTY, test_so2, test_so1;
  wire   winc_valid, rinc_valid, n2;
  wire   [3:0] rptr;
  wire   [3:0] wq2_rptr;
  wire   [3:0] wptr;
  wire   [3:0] rq2_wptr;
  wire   [2:0] waddr;
  wire   [2:0] raddr;
  assign test_so2 = wptr[3];
  assign test_so1 = raddr[0];

  NOR2BX2M U1 ( .AN(R_INC), .B(EMPTY), .Y(rinc_valid) );
  NOR2BX2M U2 ( .AN(W_INC), .B(FULL), .Y(winc_valid) );
  DF_SYNC_WIDTH4_test_0 sync_r2w ( .dest_clk(W_CLK), .dest_rst_n(W_RST), 
        .async_in(rptr), .sync_out(wq2_rptr), .test_si(test_si1), .test_se(
        test_se) );
  DF_SYNC_WIDTH4_test_1 sync_w2r ( .dest_clk(R_CLK), .dest_rst_n(R_RST), 
        .async_in(wptr), .sync_out(rq2_wptr), .test_si(wq2_rptr[3]), .test_se(
        test_se) );
  FIFO_WR_ADDR_WIDTH3_test_1 u_fifo_wr ( .wclk(W_CLK), .wrst_n(W_RST), .winc(
        W_INC), .wq2_rptr(wq2_rptr), .waddr(waddr), .wptr(wptr), .wfull(FULL), 
        .test_si(rptr[3]), .test_se(test_se) );
  FIFO_RD_ADDR_WIDTH3_test_1 u_fifo_rd ( .rclk(R_CLK), .rrst_n(R_RST), .rinc(
        R_INC), .rq2_wptr(rq2_wptr), .raddr(raddr), .rptr(rptr), .rempty(EMPTY), .test_si2(test_si2), .test_si1(n2), .test_se(test_se) );
  FIFO_MEM_CNTRL_DATA_WIDTH8_ADDR_WIDTH3_test_1 u_fifo_mem_cntrl ( .wclk(W_CLK), .winc_valid(winc_valid), .waddr(waddr), .wdata(WR_DATA), .rclk(R_CLK), 
        .rrst_n(R_RST), .rinc_valid(rinc_valid), .raddr(raddr), .rdata(RD_DATA), .test_si(rq2_wptr[3]), .test_so(n2), .test_se(test_se) );
endmodule


module CLKDIV_MUX_WIDTH8 ( IN, OUT );
  input [5:0] IN;
  output [7:0] OUT;
  wire   n5, n6, n7, n8, n9, n14, n15, n16, n17;

  NAND4BX1M U11 ( .AN(IN[4]), .B(IN[3]), .C(n15), .D(n14), .Y(n6) );
  NAND4BX1M U12 ( .AN(IN[3]), .B(IN[4]), .C(n15), .D(n14), .Y(n7) );
  NOR3X2M U13 ( .A(n7), .B(IN[1]), .C(IN[0]), .Y(OUT[1]) );
  NOR4X1M U14 ( .A(n5), .B(IN[3]), .C(IN[5]), .D(IN[4]), .Y(OUT[3]) );
  NAND3X2M U15 ( .A(n17), .B(n16), .C(IN[2]), .Y(n5) );
  NOR3X2M U16 ( .A(n6), .B(IN[1]), .C(IN[0]), .Y(OUT[2]) );
  INVX2M U17 ( .A(IN[2]), .Y(n15) );
  INVX2M U18 ( .A(IN[0]), .Y(n17) );
  INVX2M U19 ( .A(IN[1]), .Y(n16) );
  INVX2M U20 ( .A(IN[5]), .Y(n14) );
  OAI211X2M U21 ( .A0(n8), .A1(n9), .B0(n17), .C0(n16), .Y(OUT[0]) );
  NOR4X1M U22 ( .A(IN[5]), .B(IN[4]), .C(IN[3]), .D(n15), .Y(n8) );
  NAND2X2M U23 ( .A(n7), .B(n6), .Y(n9) );
  INVX2M U3 ( .A(1'b1), .Y(OUT[7]) );
  INVX2M U5 ( .A(1'b1), .Y(OUT[6]) );
  INVX2M U7 ( .A(1'b1), .Y(OUT[5]) );
  INVX2M U9 ( .A(1'b1), .Y(OUT[4]) );
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
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module INT_CLK_DIV_test_1 ( REF_CLK, RST, CLK_EN, DIV_RATIO, O_DIV_CLK, 
        test_si, test_so, test_se );
  input [7:0] DIV_RATIO;
  input REF_CLK, RST, CLK_EN, test_si, test_se;
  output O_DIV_CLK, test_so;
  wire   N7, N8, div_clk_reg, odd_flag, N19, N20, N21, N22, N24, N25, N28, N29,
         N30, N31, N32, N33, N34, N35, N103, N104, N105, N106, N107, N108,
         N109, N110, N119, n37, n38, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10,
         n11, n12, n13, n14, n15, n16, n17, n28, n29, n30, n31, n32, n33, n34,
         n35, n36, n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50,
         n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62;
  wire   [7:0] counter;
  assign N8 = CLK_EN;
  assign test_so = odd_flag;

  SDFFRQX2M div_clk_reg_reg ( .D(n37), .SI(counter[7]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(div_clk_reg) );
  SDFFRQX2M odd_flag_reg ( .D(n38), .SI(div_clk_reg), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(odd_flag) );
  SDFFRQX2M \counter_reg[7]  ( .D(N110), .SI(counter[6]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N103), .SI(test_si), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N109), .SI(counter[5]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N104), .SI(counter[0]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N107), .SI(counter[3]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N106), .SI(counter[2]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N105), .SI(counter[1]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N108), .SI(counter[4]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[5]) );
  CLKXOR2X2M U9 ( .A(DIV_RATIO[6]), .B(n5), .Y(n1) );
  OR2X2M U10 ( .A(n15), .B(n7), .Y(n14) );
  OR2X2M U11 ( .A(DIV_RATIO[2]), .B(DIV_RATIO[1]), .Y(n2) );
  MX2X2M U12 ( .A(div_clk_reg), .B(REF_CLK), .S0(N7), .Y(N119) );
  MX2X2M U13 ( .A(1'b0), .B(N119), .S0(N8), .Y(O_DIV_CLK) );
  OAI2BB1X1M U14 ( .A0N(DIV_RATIO[1]), .A1N(DIV_RATIO[2]), .B0(n2), .Y(N19) );
  OR2X1M U19 ( .A(n2), .B(DIV_RATIO[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(DIV_RATIO[3]), .B0(n3), .Y(N20) );
  OR2X1M U21 ( .A(n3), .B(DIV_RATIO[4]), .Y(n4) );
  OAI2BB1X1M U22 ( .A0N(n3), .A1N(DIV_RATIO[4]), .B0(n4), .Y(N21) );
  OR2X1M U23 ( .A(n4), .B(DIV_RATIO[5]), .Y(n5) );
  OAI2BB1X1M U24 ( .A0N(n4), .A1N(DIV_RATIO[5]), .B0(n5), .Y(N22) );
  NOR3X1M U25 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n5), .Y(N25) );
  OAI21X1M U26 ( .A0(DIV_RATIO[6]), .A1(n5), .B0(DIV_RATIO[7]), .Y(n6) );
  NAND2BX1M U27 ( .AN(N25), .B(n6), .Y(N24) );
  NOR2X1M U28 ( .A(n7), .B(n8), .Y(n38) );
  MXI2X1M U29 ( .A(n9), .B(n10), .S0(odd_flag), .Y(n8) );
  CLKNAND2X2M U30 ( .A(DIV_RATIO[0]), .B(n11), .Y(n10) );
  NOR2BX1M U31 ( .AN(DIV_RATIO[0]), .B(n12), .Y(n9) );
  MXI2X1M U32 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n37) );
  NAND2BX1M U33 ( .AN(n7), .B(n15), .Y(n13) );
  CLKINVX1M U34 ( .A(n16), .Y(N7) );
  NOR2BX1M U35 ( .AN(N35), .B(n14), .Y(N110) );
  NOR2BX1M U36 ( .AN(N34), .B(n14), .Y(N109) );
  NOR2BX1M U37 ( .AN(N33), .B(n14), .Y(N108) );
  NOR2BX1M U38 ( .AN(N32), .B(n14), .Y(N107) );
  NOR2BX1M U39 ( .AN(N31), .B(n14), .Y(N106) );
  NOR2BX1M U40 ( .AN(N30), .B(n14), .Y(N105) );
  NOR2BX1M U41 ( .AN(N29), .B(n14), .Y(N104) );
  NOR2BX1M U42 ( .AN(N28), .B(n14), .Y(N103) );
  CLKNAND2X2M U43 ( .A(N8), .B(n16), .Y(n7) );
  NAND4X1M U44 ( .A(n17), .B(n28), .C(n29), .D(n30), .Y(n16) );
  NOR4X1M U45 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n30) );
  MXI2X1M U46 ( .A(n12), .B(n31), .S0(n32), .Y(n15) );
  AND2X1M U47 ( .A(DIV_RATIO[0]), .B(odd_flag), .Y(n32) );
  CLKINVX1M U48 ( .A(n11), .Y(n31) );
  OAI211X1M U49 ( .A0(DIV_RATIO[7]), .A1(n33), .B0(n34), .C0(n35), .Y(n11) );
  OAI21X1M U50 ( .A0(counter[5]), .A1(n36), .B0(n39), .Y(n34) );
  AOI21X1M U51 ( .A0(DIV_RATIO[7]), .A1(n33), .B0(n40), .Y(n39) );
  AOI221XLM U52 ( .A0(counter[4]), .A1(n41), .B0(counter[5]), .B1(n36), .C0(
        n42), .Y(n40) );
  AOI221XLM U53 ( .A0(DIV_RATIO[4]), .A1(n43), .B0(DIV_RATIO[5]), .B1(n44), 
        .C0(n45), .Y(n42) );
  AOI221XLM U54 ( .A0(counter[2]), .A1(n28), .B0(counter[3]), .B1(n46), .C0(
        n47), .Y(n45) );
  AOI221XLM U55 ( .A0(DIV_RATIO[3]), .A1(n48), .B0(DIV_RATIO[2]), .B1(n49), 
        .C0(n50), .Y(n47) );
  AOI211X1M U56 ( .A0(counter[1]), .A1(n17), .B0(n29), .C0(counter[0]), .Y(n50) );
  CLKINVX1M U57 ( .A(DIV_RATIO[1]), .Y(n29) );
  CLKINVX1M U58 ( .A(DIV_RATIO[2]), .Y(n17) );
  CLKINVX1M U59 ( .A(DIV_RATIO[4]), .Y(n46) );
  CLKINVX1M U60 ( .A(DIV_RATIO[3]), .Y(n28) );
  CLKINVX1M U61 ( .A(DIV_RATIO[5]), .Y(n41) );
  CLKINVX1M U62 ( .A(DIV_RATIO[6]), .Y(n36) );
  AOI2B1X1M U63 ( .A1N(N25), .A0(counter[7]), .B0(n51), .Y(n12) );
  AOI221XLM U64 ( .A0(n33), .A1(N24), .B0(n35), .B1(N25), .C0(n52), .Y(n51) );
  OA22X1M U65 ( .A0(n53), .A1(n54), .B0(N24), .B1(n33), .Y(n52) );
  NOR2X1M U66 ( .A(counter[5]), .B(n1), .Y(n54) );
  AOI221XLM U67 ( .A0(counter[4]), .A1(n55), .B0(counter[5]), .B1(n1), .C0(n56), .Y(n53) );
  AOI221XLM U68 ( .A0(N21), .A1(n43), .B0(N22), .B1(n44), .C0(n57), .Y(n56) );
  AOI222X1M U69 ( .A0(counter[2]), .A1(n58), .B0(n59), .B1(n60), .C0(
        counter[3]), .C1(n61), .Y(n57) );
  CLKINVX1M U70 ( .A(N21), .Y(n61) );
  OAI211X1M U71 ( .A0(N19), .A1(n49), .B0(n62), .C0(n29), .Y(n60) );
  CLKINVX1M U72 ( .A(counter[0]), .Y(n62) );
  AOI22X1M U73 ( .A0(N20), .A1(n48), .B0(N19), .B1(n49), .Y(n59) );
  CLKINVX1M U74 ( .A(counter[1]), .Y(n49) );
  CLKINVX1M U75 ( .A(counter[2]), .Y(n48) );
  CLKINVX1M U76 ( .A(N20), .Y(n58) );
  CLKINVX1M U77 ( .A(counter[4]), .Y(n44) );
  CLKINVX1M U78 ( .A(counter[3]), .Y(n43) );
  CLKINVX1M U79 ( .A(N22), .Y(n55) );
  CLKINVX1M U80 ( .A(counter[7]), .Y(n35) );
  CLKINVX1M U81 ( .A(counter[6]), .Y(n33) );
  INT_CLK_DIV_0_DW01_inc_0 r84 ( .A(counter), .SUM({N35, N34, N33, N32, N31, 
        N30, N29, N28}) );
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
  CLKXOR2X2M U1 ( .A(carry[7]), .B(A[7]), .Y(SUM[7]) );
  CLKINVX1M U2 ( .A(A[0]), .Y(SUM[0]) );
endmodule


module INT_CLK_DIV_test_0 ( REF_CLK, RST, CLK_EN, DIV_RATIO, O_DIV_CLK, 
        test_si, test_so, test_se );
  input [7:0] DIV_RATIO;
  input REF_CLK, RST, CLK_EN, test_si, test_se;
  output O_DIV_CLK, test_so;
  wire   N7, N8, div_clk_reg, odd_flag, N19, N20, N21, N22, N24, N25, N28, N29,
         N30, N31, N32, N33, N34, N35, N103, N104, N105, N106, N107, N108,
         N109, N110, N119, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12,
         n13, n14, n15, n16, n17, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n39, n40, n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64;
  wire   [7:0] counter;
  assign N8 = CLK_EN;
  assign test_so = odd_flag;

  SDFFRQX2M div_clk_reg_reg ( .D(n64), .SI(counter[7]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(div_clk_reg) );
  SDFFRQX2M odd_flag_reg ( .D(n63), .SI(div_clk_reg), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(odd_flag) );
  SDFFRQX2M \counter_reg[7]  ( .D(N110), .SI(counter[6]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[7]) );
  SDFFRQX2M \counter_reg[0]  ( .D(N103), .SI(test_si), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[0]) );
  SDFFRQX2M \counter_reg[6]  ( .D(N109), .SI(counter[5]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[6]) );
  SDFFRQX2M \counter_reg[1]  ( .D(N104), .SI(counter[0]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[4]  ( .D(N107), .SI(counter[3]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[4]) );
  SDFFRQX2M \counter_reg[3]  ( .D(N106), .SI(counter[2]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[3]) );
  SDFFRQX2M \counter_reg[2]  ( .D(N105), .SI(counter[1]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[2]) );
  SDFFRQX2M \counter_reg[5]  ( .D(N108), .SI(counter[4]), .SE(test_se), .CK(
        REF_CLK), .RN(RST), .Q(counter[5]) );
  CLKXOR2X2M U9 ( .A(DIV_RATIO[6]), .B(n5), .Y(n1) );
  OR2X2M U10 ( .A(DIV_RATIO[2]), .B(DIV_RATIO[1]), .Y(n2) );
  OR2X2M U11 ( .A(n15), .B(n7), .Y(n14) );
  MX2X2M U12 ( .A(div_clk_reg), .B(REF_CLK), .S0(N7), .Y(N119) );
  MX2X2M U13 ( .A(1'b0), .B(N119), .S0(N8), .Y(O_DIV_CLK) );
  OAI2BB1X1M U14 ( .A0N(DIV_RATIO[1]), .A1N(DIV_RATIO[2]), .B0(n2), .Y(N19) );
  OR2X1M U19 ( .A(n2), .B(DIV_RATIO[3]), .Y(n3) );
  OAI2BB1X1M U20 ( .A0N(n2), .A1N(DIV_RATIO[3]), .B0(n3), .Y(N20) );
  OR2X1M U21 ( .A(n3), .B(DIV_RATIO[4]), .Y(n4) );
  OAI2BB1X1M U22 ( .A0N(n3), .A1N(DIV_RATIO[4]), .B0(n4), .Y(N21) );
  OR2X1M U23 ( .A(n4), .B(DIV_RATIO[5]), .Y(n5) );
  OAI2BB1X1M U24 ( .A0N(n4), .A1N(DIV_RATIO[5]), .B0(n5), .Y(N22) );
  NOR3X1M U25 ( .A(DIV_RATIO[6]), .B(DIV_RATIO[7]), .C(n5), .Y(N25) );
  OAI21X1M U26 ( .A0(DIV_RATIO[6]), .A1(n5), .B0(DIV_RATIO[7]), .Y(n6) );
  NAND2BX1M U27 ( .AN(N25), .B(n6), .Y(N24) );
  NOR2X1M U28 ( .A(n7), .B(n8), .Y(n63) );
  MXI2X1M U29 ( .A(n9), .B(n10), .S0(odd_flag), .Y(n8) );
  CLKNAND2X2M U30 ( .A(DIV_RATIO[0]), .B(n11), .Y(n10) );
  NOR2BX1M U31 ( .AN(DIV_RATIO[0]), .B(n12), .Y(n9) );
  MXI2X1M U32 ( .A(n13), .B(n14), .S0(div_clk_reg), .Y(n64) );
  NAND2BX1M U33 ( .AN(n7), .B(n15), .Y(n13) );
  CLKINVX1M U34 ( .A(n16), .Y(N7) );
  NOR2BX1M U35 ( .AN(N35), .B(n14), .Y(N110) );
  NOR2BX1M U36 ( .AN(N34), .B(n14), .Y(N109) );
  NOR2BX1M U37 ( .AN(N33), .B(n14), .Y(N108) );
  NOR2BX1M U38 ( .AN(N32), .B(n14), .Y(N107) );
  NOR2BX1M U39 ( .AN(N31), .B(n14), .Y(N106) );
  NOR2BX1M U40 ( .AN(N30), .B(n14), .Y(N105) );
  NOR2BX1M U41 ( .AN(N29), .B(n14), .Y(N104) );
  NOR2BX1M U42 ( .AN(N28), .B(n14), .Y(N103) );
  CLKNAND2X2M U43 ( .A(N8), .B(n16), .Y(n7) );
  NAND4X1M U44 ( .A(n17), .B(n28), .C(n29), .D(n30), .Y(n16) );
  NOR4X1M U45 ( .A(DIV_RATIO[7]), .B(DIV_RATIO[6]), .C(DIV_RATIO[5]), .D(
        DIV_RATIO[4]), .Y(n30) );
  MXI2X1M U46 ( .A(n12), .B(n31), .S0(n32), .Y(n15) );
  AND2X1M U47 ( .A(DIV_RATIO[0]), .B(odd_flag), .Y(n32) );
  CLKINVX1M U48 ( .A(n11), .Y(n31) );
  OAI211X1M U49 ( .A0(DIV_RATIO[7]), .A1(n33), .B0(n34), .C0(n35), .Y(n11) );
  OAI21X1M U50 ( .A0(counter[5]), .A1(n36), .B0(n39), .Y(n34) );
  AOI21X1M U51 ( .A0(DIV_RATIO[7]), .A1(n33), .B0(n40), .Y(n39) );
  AOI221XLM U52 ( .A0(counter[4]), .A1(n41), .B0(counter[5]), .B1(n36), .C0(
        n42), .Y(n40) );
  AOI221XLM U53 ( .A0(DIV_RATIO[4]), .A1(n43), .B0(DIV_RATIO[5]), .B1(n44), 
        .C0(n45), .Y(n42) );
  AOI221XLM U54 ( .A0(counter[2]), .A1(n28), .B0(counter[3]), .B1(n46), .C0(
        n47), .Y(n45) );
  AOI221XLM U55 ( .A0(DIV_RATIO[3]), .A1(n48), .B0(DIV_RATIO[2]), .B1(n49), 
        .C0(n50), .Y(n47) );
  AOI211X1M U56 ( .A0(counter[1]), .A1(n17), .B0(n29), .C0(counter[0]), .Y(n50) );
  CLKINVX1M U57 ( .A(DIV_RATIO[1]), .Y(n29) );
  CLKINVX1M U58 ( .A(DIV_RATIO[2]), .Y(n17) );
  CLKINVX1M U59 ( .A(DIV_RATIO[4]), .Y(n46) );
  CLKINVX1M U60 ( .A(DIV_RATIO[3]), .Y(n28) );
  CLKINVX1M U61 ( .A(DIV_RATIO[5]), .Y(n41) );
  CLKINVX1M U62 ( .A(DIV_RATIO[6]), .Y(n36) );
  AOI2B1X1M U63 ( .A1N(N25), .A0(counter[7]), .B0(n51), .Y(n12) );
  AOI221XLM U64 ( .A0(n33), .A1(N24), .B0(n35), .B1(N25), .C0(n52), .Y(n51) );
  OA22X1M U65 ( .A0(n53), .A1(n54), .B0(N24), .B1(n33), .Y(n52) );
  NOR2X1M U66 ( .A(counter[5]), .B(n1), .Y(n54) );
  AOI221XLM U67 ( .A0(counter[4]), .A1(n55), .B0(counter[5]), .B1(n1), .C0(n56), .Y(n53) );
  AOI221XLM U68 ( .A0(N21), .A1(n43), .B0(N22), .B1(n44), .C0(n57), .Y(n56) );
  AOI222X1M U69 ( .A0(counter[2]), .A1(n58), .B0(n59), .B1(n60), .C0(
        counter[3]), .C1(n61), .Y(n57) );
  CLKINVX1M U70 ( .A(N21), .Y(n61) );
  OAI211X1M U71 ( .A0(N19), .A1(n49), .B0(n62), .C0(n29), .Y(n60) );
  CLKINVX1M U72 ( .A(counter[0]), .Y(n62) );
  AOI22X1M U73 ( .A0(N20), .A1(n48), .B0(N19), .B1(n49), .Y(n59) );
  CLKINVX1M U74 ( .A(counter[1]), .Y(n49) );
  CLKINVX1M U75 ( .A(counter[2]), .Y(n48) );
  CLKINVX1M U76 ( .A(N20), .Y(n58) );
  CLKINVX1M U77 ( .A(counter[4]), .Y(n44) );
  CLKINVX1M U78 ( .A(counter[3]), .Y(n43) );
  CLKINVX1M U79 ( .A(N22), .Y(n55) );
  CLKINVX1M U80 ( .A(counter[7]), .Y(n35) );
  CLKINVX1M U81 ( .A(counter[6]), .Y(n33) );
  INT_CLK_DIV_1_DW01_inc_0 r84 ( .A(counter), .SUM({N35, N34, N33, N32, N31, 
        N30, N29, N28}) );
endmodule


module PULSE_GEN_test_1 ( clk, rst, lvl_sig, pulse_sig, test_si, test_so, 
        test_se );
  input clk, rst, lvl_sig, test_si, test_se;
  output pulse_sig, test_so;
  wire   pls_flop, rcv_flop;
  assign test_so = rcv_flop;

  SDFFRQX2M rcv_flop_reg ( .D(lvl_sig), .SI(pls_flop), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(rcv_flop) );
  SDFFRQX2M pls_flop_reg ( .D(rcv_flop), .SI(test_si), .SE(test_se), .CK(clk), 
        .RN(rst), .Q(pls_flop) );
  NOR2BX2M U5 ( .AN(rcv_flop), .B(pls_flop), .Y(pulse_sig) );
endmodule


module FSM_test_1 ( DATA_VALID, PAR_EN, SER_DONE, RST, CLK, MUX_SEL, BUSY, 
        LOAD, SER_EN, test_si, test_so, test_se );
  output [2:0] MUX_SEL;
  input DATA_VALID, PAR_EN, SER_DONE, RST, CLK, test_si, test_se;
  output BUSY, LOAD, SER_EN, test_so;
  wire   n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n4, n5;
  wire   [2:0] current_st;
  assign test_so = current_st[2];

  SDFFRQX2M \current_st_reg[2]  ( .D(n13), .SI(current_st[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_st[2]) );
  SDFFRQX2M \current_st_reg[0]  ( .D(n15), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(current_st[0]) );
  SDFFRQX2M \current_st_reg[1]  ( .D(n14), .SI(current_st[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(current_st[1]) );
  NOR2X2M U6 ( .A(SER_DONE), .B(n8), .Y(SER_EN) );
  NAND2X2M U7 ( .A(n11), .B(n5), .Y(MUX_SEL[0]) );
  NAND2X2M U8 ( .A(MUX_SEL[0]), .B(n9), .Y(BUSY) );
  AOI21BX2M U9 ( .A0(n11), .A1(n5), .B0N(n9), .Y(MUX_SEL[2]) );
  NOR3X2M U10 ( .A(n4), .B(current_st[2]), .C(current_st[1]), .Y(LOAD) );
  NAND3X2M U11 ( .A(n4), .B(n5), .C(current_st[1]), .Y(n8) );
  INVX2M U12 ( .A(current_st[2]), .Y(n5) );
  INVX2M U13 ( .A(current_st[0]), .Y(n4) );
  OAI21BX1M U14 ( .A0(current_st[1]), .A1(DATA_VALID), .B0N(SER_EN), .Y(n7) );
  NAND2X2M U15 ( .A(current_st[0]), .B(current_st[1]), .Y(n9) );
  OAI21X2M U16 ( .A0(current_st[2]), .A1(n9), .B0(MUX_SEL[0]), .Y(n14) );
  AOI21X2M U17 ( .A0(n8), .A1(n10), .B0(n7), .Y(n15) );
  OR2X2M U18 ( .A(n11), .B(current_st[2]), .Y(n10) );
  CLKXOR2X2M U19 ( .A(current_st[0]), .B(current_st[1]), .Y(n11) );
  NOR2BX2M U20 ( .AN(n6), .B(n7), .Y(n13) );
  OAI22X1M U21 ( .A0(PAR_EN), .A1(n8), .B0(current_st[2]), .B1(n9), .Y(n6) );
  NAND2X2M U22 ( .A(n12), .B(current_st[0]), .Y(MUX_SEL[1]) );
  CLKXOR2X2M U23 ( .A(current_st[1]), .B(n5), .Y(n12) );
endmodule


module SERIALIZER_test_1 ( CLK, RST, LOAD, P_DATA, SER_EN, SER_DONE, SER_DATA, 
        test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, LOAD, SER_EN, test_si, test_se;
  output SER_DONE, SER_DATA, test_so;
  wire   N25, n13, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n12, n14, n15,
         n39, n40, n42, n44, n45;
  wire   [7:1] shift_reg;
  wire   [2:0] counter;
  assign test_so = shift_reg[7];
  assign SER_DONE = N25;

  SDFFSQX2M \shift_reg_reg[7]  ( .D(n28), .SI(shift_reg[6]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[7]) );
  SDFFSQX2M \shift_reg_reg[6]  ( .D(n29), .SI(shift_reg[5]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[6]) );
  SDFFSQX2M \shift_reg_reg[5]  ( .D(n30), .SI(shift_reg[4]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[5]) );
  SDFFSQX2M \shift_reg_reg[4]  ( .D(n31), .SI(shift_reg[3]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[4]) );
  SDFFSQX2M \shift_reg_reg[3]  ( .D(n32), .SI(shift_reg[2]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[3]) );
  SDFFSQX2M \shift_reg_reg[2]  ( .D(n33), .SI(shift_reg[1]), .SE(n45), .CK(CLK), .SN(RST), .Q(shift_reg[2]) );
  SDFFSQX2M \shift_reg_reg[1]  ( .D(n34), .SI(SER_DATA), .SE(n45), .CK(CLK), 
        .SN(RST), .Q(shift_reg[1]) );
  SDFFSQX2M \shift_reg_reg[0]  ( .D(n35), .SI(n42), .SE(n45), .CK(CLK), .SN(
        RST), .Q(SER_DATA) );
  SDFFRQX2M \counter_reg[1]  ( .D(n36), .SI(counter[0]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(counter[1]) );
  SDFFRQX2M \counter_reg[0]  ( .D(n38), .SI(test_si), .SE(n45), .CK(CLK), .RN(
        RST), .Q(counter[0]) );
  SDFFRX1M \counter_reg[2]  ( .D(n37), .SI(counter[1]), .SE(n45), .CK(CLK), 
        .RN(RST), .Q(n42), .QN(n13) );
  NOR2X2M U14 ( .A(n12), .B(n14), .Y(n16) );
  INVX2M U15 ( .A(n14), .Y(n15) );
  AOI21X2M U16 ( .A0(n39), .A1(n14), .B0(n16), .Y(n26) );
  BUFX2M U17 ( .A(n18), .Y(n14) );
  NOR3BX2M U18 ( .AN(SER_EN), .B(N25), .C(n12), .Y(n18) );
  BUFX2M U19 ( .A(LOAD), .Y(n12) );
  OAI32X1M U20 ( .A0(n15), .A1(counter[1]), .A2(n39), .B0(n26), .B1(n40), .Y(
        n36) );
  OAI2BB1X2M U21 ( .A0N(SER_DATA), .A1N(n16), .B0(n25), .Y(n35) );
  AOI22X1M U22 ( .A0(P_DATA[0]), .A1(n12), .B0(shift_reg[1]), .B1(n14), .Y(n25) );
  OAI2BB1X2M U23 ( .A0N(n16), .A1N(shift_reg[1]), .B0(n24), .Y(n34) );
  AOI22X1M U24 ( .A0(P_DATA[1]), .A1(n12), .B0(shift_reg[2]), .B1(n14), .Y(n24) );
  OAI2BB1X2M U25 ( .A0N(n16), .A1N(shift_reg[3]), .B0(n22), .Y(n32) );
  AOI22X1M U26 ( .A0(P_DATA[3]), .A1(n12), .B0(shift_reg[4]), .B1(n14), .Y(n22) );
  OAI2BB1X2M U27 ( .A0N(n16), .A1N(shift_reg[4]), .B0(n21), .Y(n31) );
  AOI22X1M U28 ( .A0(P_DATA[4]), .A1(n12), .B0(shift_reg[5]), .B1(n14), .Y(n21) );
  OAI2BB1X2M U29 ( .A0N(n16), .A1N(shift_reg[5]), .B0(n20), .Y(n30) );
  AOI22X1M U30 ( .A0(P_DATA[5]), .A1(n12), .B0(shift_reg[6]), .B1(n14), .Y(n20) );
  OAI2BB1X2M U31 ( .A0N(n16), .A1N(shift_reg[6]), .B0(n19), .Y(n29) );
  AOI22X1M U32 ( .A0(P_DATA[6]), .A1(n12), .B0(n14), .B1(shift_reg[7]), .Y(n19) );
  OAI2BB1X2M U33 ( .A0N(n16), .A1N(shift_reg[2]), .B0(n23), .Y(n33) );
  AOI22X1M U34 ( .A0(P_DATA[2]), .A1(n12), .B0(shift_reg[3]), .B1(n14), .Y(n23) );
  OAI2BB1X2M U35 ( .A0N(n16), .A1N(shift_reg[7]), .B0(n17), .Y(n28) );
  AOI21X2M U36 ( .A0(P_DATA[7]), .A1(n12), .B0(n14), .Y(n17) );
  OAI32X1M U37 ( .A0(n15), .A1(n39), .A2(n40), .B0(n27), .B1(n13), .Y(n37) );
  AND2X2M U38 ( .A(n26), .B(n15), .Y(n27) );
  NOR3X2M U39 ( .A(n40), .B(n39), .C(n13), .Y(N25) );
  OAI2BB2X1M U40 ( .B0(counter[0]), .B1(n15), .A0N(counter[0]), .A1N(n16), .Y(
        n38) );
  INVX2M U41 ( .A(counter[0]), .Y(n39) );
  INVX2M U42 ( .A(counter[1]), .Y(n40) );
  INVXLM U43 ( .A(test_se), .Y(n44) );
  INVXLM U44 ( .A(n44), .Y(n45) );
endmodule


module Parity_Calc_test_1 ( CLK, RST, LOAD, P_DATA, PAR_TYP, PAR_BIT, test_si, 
        test_se );
  input [7:0] P_DATA;
  input CLK, RST, LOAD, PAR_TYP, test_si, test_se;
  output PAR_BIT;
  wire   n1, n3, n4, n5, n6, n8, n2;

  SDFFRQX2M PAR_BIT_reg ( .D(n8), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(PAR_BIT) );
  XOR3XLM U2 ( .A(P_DATA[5]), .B(P_DATA[4]), .C(n6), .Y(n3) );
  CLKXOR2X2M U3 ( .A(P_DATA[7]), .B(P_DATA[6]), .Y(n6) );
  XNOR2X2M U4 ( .A(P_DATA[3]), .B(P_DATA[2]), .Y(n5) );
  OAI2BB2X1M U5 ( .B0(n1), .B1(n2), .A0N(PAR_BIT), .A1N(n2), .Y(n8) );
  INVX2M U6 ( .A(LOAD), .Y(n2) );
  XOR3XLM U7 ( .A(n3), .B(PAR_TYP), .C(n4), .Y(n1) );
  XOR3XLM U8 ( .A(P_DATA[1]), .B(P_DATA[0]), .C(n5), .Y(n4) );
endmodule


module MUX4x1 ( START_BIT, STOP_BIT, SER_DATA, PAR_BIT, MUX_SEL, TX_OUT );
  input [2:0] MUX_SEL;
  input START_BIT, STOP_BIT, SER_DATA, PAR_BIT;
  output TX_OUT;
  wire   n4, n5, n1, n2, n3;

  OAI221X4M U2 ( .A0(MUX_SEL[1]), .A1(n4), .B0(n5), .B1(n3), .C0(n2), .Y(
        TX_OUT) );
  INVX2M U3 ( .A(MUX_SEL[0]), .Y(n1) );
  INVX2M U4 ( .A(MUX_SEL[2]), .Y(n2) );
  INVX2M U5 ( .A(MUX_SEL[1]), .Y(n3) );
  AOI22X1M U6 ( .A0(SER_DATA), .A1(n1), .B0(PAR_BIT), .B1(MUX_SEL[0]), .Y(n5)
         );
  AOI22X1M U7 ( .A0(START_BIT), .A1(n1), .B0(STOP_BIT), .B1(MUX_SEL[0]), .Y(n4) );
endmodule


module UART_TX_TOP_test_1 ( CLK, RST, DATA_VALID, PAR_EN, PAR_TYP, P_DATA, 
        TX_OUT, BUSY, test_si, test_so, test_se );
  input [7:0] P_DATA;
  input CLK, RST, DATA_VALID, PAR_EN, PAR_TYP, test_si, test_se;
  output TX_OUT, BUSY, test_so;
  wire   SER_DONE, LOAD, SER_EN, SER_DATA, PAR_BIT, n3;
  wire   [2:0] MUX_SEL;

  FSM_test_1 U_FSM ( .DATA_VALID(DATA_VALID), .PAR_EN(PAR_EN), .SER_DONE(
        SER_DONE), .RST(RST), .CLK(CLK), .MUX_SEL(MUX_SEL), .BUSY(BUSY), 
        .LOAD(LOAD), .SER_EN(SER_EN), .test_si(test_si), .test_so(n3), 
        .test_se(test_se) );
  SERIALIZER_test_1 U_SERIALIZER ( .CLK(CLK), .RST(RST), .LOAD(LOAD), .P_DATA(
        P_DATA), .SER_EN(SER_EN), .SER_DONE(SER_DONE), .SER_DATA(SER_DATA), 
        .test_si(PAR_BIT), .test_so(test_so), .test_se(test_se) );
  Parity_Calc_test_1 U_PARITY ( .CLK(CLK), .RST(RST), .LOAD(LOAD), .P_DATA(
        P_DATA), .PAR_TYP(PAR_TYP), .PAR_BIT(PAR_BIT), .test_si(n3), .test_se(
        test_se) );
  MUX4x1 U_MUX ( .START_BIT(1'b0), .STOP_BIT(1'b1), .SER_DATA(SER_DATA), 
        .PAR_BIT(PAR_BIT), .MUX_SEL(MUX_SEL), .TX_OUT(TX_OUT) );
endmodule


module uart_rx_fsm_test_1 ( CLK, RST, RX_IN, PAR_EN, sample_valid, strt_glitch, 
        par_err, stp_err, bit_cnt, dat_samp_en, deser_en, strt_chk_en, 
        par_chk_en, stp_chk_en, enable, data_valid, test_so, test_se );
  input [3:0] bit_cnt;
  input CLK, RST, RX_IN, PAR_EN, sample_valid, strt_glitch, par_err, stp_err,
         test_se;
  output dat_samp_en, deser_en, strt_chk_en, par_chk_en, stp_chk_en, enable,
         data_valid, test_so;
  wire   parity_error, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22,
         n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n34, n35, n36, n5,
         n6, n7, n8, n9, n10, n11;
  wire   [2:0] Current_st;
  assign test_so = parity_error;

  SDFFRQX2M parity_error_reg ( .D(n6), .SI(Current_st[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(parity_error) );
  SDFFRQX2M \Current_st_reg[2]  ( .D(n35), .SI(Current_st[1]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_st[2]) );
  SDFFRQX2M \Current_st_reg[1]  ( .D(n34), .SI(Current_st[0]), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(Current_st[1]) );
  SDFFRQX2M \Current_st_reg[0]  ( .D(n36), .SI(par_err), .SE(test_se), .CK(CLK), .RN(RST), .Q(Current_st[0]) );
  NOR2X2M U7 ( .A(n28), .B(n9), .Y(n16) );
  OAI22X1M U8 ( .A0(n8), .A1(n19), .B0(n17), .B1(n11), .Y(n35) );
  NAND2BX2M U9 ( .AN(n28), .B(n9), .Y(n30) );
  NOR2X2M U10 ( .A(n10), .B(n8), .Y(n17) );
  NAND2X2M U11 ( .A(n31), .B(n30), .Y(dat_samp_en) );
  NAND2X2M U12 ( .A(n29), .B(n9), .Y(n15) );
  INVX2M U13 ( .A(n32), .Y(n10) );
  NAND2X2M U14 ( .A(n30), .B(n12), .Y(n24) );
  NOR2X2M U15 ( .A(n12), .B(n7), .Y(strt_chk_en) );
  AOI2B1X1M U16 ( .A1N(n20), .A0(n10), .B0(n16), .Y(n19) );
  NOR2X2M U17 ( .A(n30), .B(n7), .Y(stp_chk_en) );
  INVX2M U18 ( .A(n14), .Y(par_chk_en) );
  NOR4BX1M U19 ( .AN(n12), .B(n5), .C(n16), .D(n10), .Y(n31) );
  NOR2X2M U20 ( .A(RX_IN), .B(n15), .Y(n5) );
  NOR2X2M U21 ( .A(Current_st[1]), .B(Current_st[2]), .Y(n29) );
  OAI221X1M U22 ( .A0(n8), .A1(n21), .B0(n22), .B1(n9), .C0(n18), .Y(n36) );
  AOI21BX2M U23 ( .A0(PAR_EN), .A1(n10), .B0N(n15), .Y(n21) );
  AOI21X2M U24 ( .A0(n10), .A1(n20), .B0(n8), .Y(n22) );
  OAI2B11X2M U25 ( .A1N(Current_st[1]), .A0(n17), .B0(n18), .C0(n19), .Y(n34)
         );
  INVX2M U26 ( .A(n23), .Y(n8) );
  OAI31X1M U27 ( .A0(n24), .A1(n10), .A2(n25), .B0(n26), .Y(n23) );
  OAI21X2M U28 ( .A0(Current_st[0]), .A1(n27), .B0(sample_valid), .Y(n26) );
  AOI22X1M U29 ( .A0(Current_st[0]), .A1(n28), .B0(n27), .B1(n9), .Y(n25) );
  NAND2X2M U30 ( .A(Current_st[0]), .B(n29), .Y(n12) );
  NAND3X2M U31 ( .A(Current_st[0]), .B(n11), .C(Current_st[1]), .Y(n32) );
  NAND2X2M U32 ( .A(RX_IN), .B(n29), .Y(n27) );
  INVX2M U33 ( .A(Current_st[0]), .Y(n9) );
  OAI21X2M U34 ( .A0(sample_valid), .A1(n30), .B0(n31), .Y(enable) );
  NAND2X2M U35 ( .A(Current_st[2]), .B(Current_st[1]), .Y(n28) );
  INVX2M U36 ( .A(Current_st[2]), .Y(n11) );
  OR3X2M U37 ( .A(strt_glitch), .B(n8), .C(n12), .Y(n18) );
  INVX2M U38 ( .A(n13), .Y(n6) );
  AOI32X1M U39 ( .A0(parity_error), .A1(n14), .A2(n15), .B0(par_chk_en), .B1(
        par_err), .Y(n13) );
  NOR2X2M U40 ( .A(n7), .B(n32), .Y(deser_en) );
  NAND4BBX1M U41 ( .AN(bit_cnt[2]), .BN(bit_cnt[1]), .C(bit_cnt[3]), .D(
        bit_cnt[0]), .Y(n20) );
  NOR3BX2M U42 ( .AN(stp_chk_en), .B(stp_err), .C(parity_error), .Y(data_valid) );
  NAND2X2M U43 ( .A(n16), .B(sample_valid), .Y(n14) );
  INVX2M U44 ( .A(sample_valid), .Y(n7) );
endmodule


module edge_bit_counter_test_1 ( CLK, RST, Prescale, enable, edge_cnt, bit_cnt, 
        test_si, test_se );
  input [5:0] Prescale;
  output [5:0] edge_cnt;
  output [3:0] bit_cnt;
  input CLK, RST, enable, test_si, test_se;
  wire   N7, N8, N9, N10, N11, N12, N13, N20, N21, N22, N23, N36, N37, N38,
         N39, N40, N41, n17, n18, n19, n20, n21, n22, n23, n24, n25, n26,
         \add_35/carry[5] , \add_35/carry[4] , \add_35/carry[3] ,
         \add_35/carry[2] , n1, n2, n13, n14, n15, n16, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39;

  SDFFRQX2M \bit_cnt_reg[3]  ( .D(n26), .SI(bit_cnt[2]), .SE(test_se), .CK(CLK), .RN(RST), .Q(bit_cnt[3]) );
  SDFFRQX2M \bit_cnt_reg[1]  ( .D(n24), .SI(bit_cnt[0]), .SE(test_se), .CK(CLK), .RN(RST), .Q(bit_cnt[1]) );
  SDFFRQX2M \bit_cnt_reg[2]  ( .D(n23), .SI(bit_cnt[1]), .SE(test_se), .CK(CLK), .RN(RST), .Q(bit_cnt[2]) );
  SDFFRQX2M \bit_cnt_reg[0]  ( .D(n25), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(bit_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[5]  ( .D(N41), .SI(edge_cnt[4]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[5]) );
  SDFFRQX2M \edge_cnt_reg[0]  ( .D(N36), .SI(bit_cnt[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[0]) );
  SDFFRQX2M \edge_cnt_reg[3]  ( .D(N39), .SI(edge_cnt[2]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[3]) );
  SDFFRQX2M \edge_cnt_reg[2]  ( .D(N38), .SI(edge_cnt[1]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[2]) );
  SDFFRQX2M \edge_cnt_reg[1]  ( .D(N37), .SI(edge_cnt[0]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[1]) );
  SDFFRQX2M \edge_cnt_reg[4]  ( .D(N40), .SI(edge_cnt[3]), .SE(test_se), .CK(
        CLK), .RN(RST), .Q(edge_cnt[4]) );
  INVX2M U7 ( .A(n20), .Y(n36) );
  NOR2X2M U14 ( .A(n37), .B(N13), .Y(n20) );
  NOR2BX2M U15 ( .AN(N20), .B(n36), .Y(N37) );
  NOR2BX2M U16 ( .AN(N21), .B(n36), .Y(N38) );
  NOR2BX2M U17 ( .AN(N22), .B(n36), .Y(N39) );
  NOR2BX2M U18 ( .AN(N23), .B(n36), .Y(N40) );
  OAI32X1M U19 ( .A0(n37), .A1(bit_cnt[0]), .A2(n20), .B0(n38), .B1(n36), .Y(
        n25) );
  OAI22X1M U20 ( .A0(n39), .A1(n36), .B0(n19), .B1(n37), .Y(n24) );
  AOI32X1M U21 ( .A0(n36), .A1(n39), .A2(bit_cnt[0]), .B0(bit_cnt[1]), .B1(n38), .Y(n19) );
  INVX2M U22 ( .A(bit_cnt[1]), .Y(n39) );
  AND3X2M U23 ( .A(N13), .B(bit_cnt[1]), .C(bit_cnt[0]), .Y(n18) );
  OR2X2M U24 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n2) );
  INVX2M U25 ( .A(Prescale[3]), .Y(n16) );
  NOR2X2M U26 ( .A(edge_cnt[0]), .B(n36), .Y(N36) );
  NOR2X2M U27 ( .A(n1), .B(n36), .Y(N41) );
  XNOR2X2M U28 ( .A(\add_35/carry[5] ), .B(edge_cnt[5]), .Y(n1) );
  NOR2X2M U29 ( .A(n21), .B(n37), .Y(n26) );
  CLKXOR2X2M U30 ( .A(n22), .B(bit_cnt[3]), .Y(n21) );
  NAND2X2M U31 ( .A(n18), .B(bit_cnt[2]), .Y(n22) );
  NOR2X2M U32 ( .A(n17), .B(n37), .Y(n23) );
  XNOR2X2M U33 ( .A(n18), .B(bit_cnt[2]), .Y(n17) );
  INVX2M U34 ( .A(enable), .Y(n37) );
  ADDHX1M U35 ( .A(edge_cnt[1]), .B(edge_cnt[0]), .CO(\add_35/carry[2] ), .S(
        N20) );
  ADDHX1M U36 ( .A(edge_cnt[2]), .B(\add_35/carry[2] ), .CO(\add_35/carry[3] ), 
        .S(N21) );
  ADDHX1M U37 ( .A(edge_cnt[3]), .B(\add_35/carry[3] ), .CO(\add_35/carry[4] ), 
        .S(N22) );
  INVX2M U38 ( .A(bit_cnt[0]), .Y(n38) );
  ADDHX1M U39 ( .A(edge_cnt[4]), .B(\add_35/carry[4] ), .CO(\add_35/carry[5] ), 
        .S(N23) );
  CLKINVX1M U40 ( .A(Prescale[0]), .Y(N7) );
  OAI2BB1X1M U41 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n2), .Y(N8) );
  NOR2X1M U42 ( .A(n2), .B(Prescale[2]), .Y(n13) );
  AO21XLM U43 ( .A0(n2), .A1(Prescale[2]), .B0(n13), .Y(N9) );
  CLKNAND2X2M U44 ( .A(n13), .B(n16), .Y(n14) );
  OAI21X1M U45 ( .A0(n13), .A1(n16), .B0(n14), .Y(N10) );
  XNOR2X1M U46 ( .A(Prescale[4]), .B(n14), .Y(N11) );
  NOR2X1M U47 ( .A(Prescale[4]), .B(n14), .Y(n15) );
  CLKXOR2X2M U48 ( .A(Prescale[5]), .B(n15), .Y(N12) );
  NOR2BX1M U49 ( .AN(edge_cnt[0]), .B(N7), .Y(n27) );
  OAI2B2X1M U50 ( .A1N(N8), .A0(n27), .B0(edge_cnt[1]), .B1(n27), .Y(n31) );
  NOR2BX1M U51 ( .AN(N7), .B(edge_cnt[0]), .Y(n28) );
  OAI2B2X1M U52 ( .A1N(edge_cnt[1]), .A0(n28), .B0(N8), .B1(n28), .Y(n30) );
  XNOR2X1M U53 ( .A(N12), .B(edge_cnt[5]), .Y(n29) );
  NAND3X1M U54 ( .A(n31), .B(n30), .C(n29), .Y(n35) );
  CLKXOR2X2M U55 ( .A(N11), .B(edge_cnt[4]), .Y(n34) );
  CLKXOR2X2M U56 ( .A(N9), .B(edge_cnt[2]), .Y(n33) );
  CLKXOR2X2M U57 ( .A(N10), .B(edge_cnt[3]), .Y(n32) );
  NOR4X1M U58 ( .A(n35), .B(n34), .C(n33), .D(n32), .Y(N13) );
endmodule


module data_sampling_test_1 ( CLK, RST, RX_IN, Prescale, dat_samp_en, edge_cnt, 
        sample_valid, sampled_bit, test_si, test_so, test_se );
  input [5:0] Prescale;
  input [5:0] edge_cnt;
  input CLK, RST, RX_IN, dat_samp_en, test_si, test_se;
  output sample_valid, sampled_bit, test_so;
  wire   \sampled_ones[0] , N7, N8, N9, N10, N11, N12, N16, N17, N18, N19, N20,
         N23, N24, N25, N26, N27, N28, n31, n32, n33, \add_34/carry[4] ,
         \add_34/carry[3] , \add_34/carry[2] , n2, n3, n4, n5, n6, n7, n8, n9,
         n10, n11, n12, n13, n14, n19, n20, n21, n22, n23, n24, n25, n26, n27,
         n28, n29, n30, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46, n47, n48, n49, n50, n51, n52, n53, n54, n55, n56, n57, n58,
         n59, n60;

  SDFFRQX2M \sampled_ones_reg[0]  ( .D(n33), .SI(sampled_bit), .SE(test_se), 
        .CK(CLK), .RN(RST), .Q(\sampled_ones[0] ) );
  SDFFSQX2M sampled_bit_reg ( .D(n31), .SI(sample_valid), .SE(test_se), .CK(
        CLK), .SN(RST), .Q(sampled_bit) );
  SDFFRQX2M sample_valid_reg ( .D(n60), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(sample_valid) );
  SDFFRX1M \sampled_ones_reg[1]  ( .D(n32), .SI(\sampled_ones[0] ), .SE(
        test_se), .CK(CLK), .RN(RST), .Q(n59), .QN(test_so) );
  OR2X2M U7 ( .A(Prescale[1]), .B(Prescale[0]), .Y(n5) );
  OR2X2M U8 ( .A(Prescale[2]), .B(Prescale[1]), .Y(n2) );
  ADDHX1M U9 ( .A(Prescale[5]), .B(\add_34/carry[4] ), .CO(N20), .S(N19) );
  INVX2M U10 ( .A(Prescale[3]), .Y(n9) );
  ADDHX1M U11 ( .A(Prescale[3]), .B(\add_34/carry[2] ), .CO(\add_34/carry[3] ), 
        .S(N17) );
  ADDHX1M U13 ( .A(Prescale[4]), .B(\add_34/carry[3] ), .CO(\add_34/carry[4] ), 
        .S(N18) );
  ADDHX1M U14 ( .A(Prescale[2]), .B(Prescale[1]), .CO(\add_34/carry[2] ), .S(
        N16) );
  CLKINVX1M U15 ( .A(Prescale[1]), .Y(N7) );
  OAI2BB1X1M U16 ( .A0N(Prescale[1]), .A1N(Prescale[2]), .B0(n2), .Y(N8) );
  OR2X1M U17 ( .A(n2), .B(Prescale[3]), .Y(n3) );
  OAI2BB1X1M U18 ( .A0N(n2), .A1N(Prescale[3]), .B0(n3), .Y(N9) );
  XNOR2X1M U19 ( .A(Prescale[4]), .B(n3), .Y(N10) );
  NOR3X1M U20 ( .A(Prescale[4]), .B(Prescale[5]), .C(n3), .Y(N12) );
  OAI21X1M U21 ( .A0(Prescale[4]), .A1(n3), .B0(Prescale[5]), .Y(n4) );
  NAND2BX1M U22 ( .AN(N12), .B(n4), .Y(N11) );
  CLKINVX1M U23 ( .A(Prescale[0]), .Y(N23) );
  OAI2BB1X1M U24 ( .A0N(Prescale[0]), .A1N(Prescale[1]), .B0(n5), .Y(N24) );
  NOR2X1M U25 ( .A(n5), .B(Prescale[2]), .Y(n6) );
  AO21XLM U26 ( .A0(n5), .A1(Prescale[2]), .B0(n6), .Y(N25) );
  CLKNAND2X2M U27 ( .A(n6), .B(n9), .Y(n7) );
  OAI21X1M U28 ( .A0(n6), .A1(n9), .B0(n7), .Y(N26) );
  XNOR2X1M U29 ( .A(Prescale[4]), .B(n7), .Y(N27) );
  NOR2X1M U30 ( .A(Prescale[4]), .B(n7), .Y(n8) );
  CLKXOR2X2M U31 ( .A(Prescale[5]), .B(n8), .Y(N28) );
  MXI2X1M U32 ( .A(n10), .B(n11), .S0(\sampled_ones[0] ), .Y(n33) );
  CLKINVX1M U33 ( .A(n12), .Y(n11) );
  CLKNAND2X2M U34 ( .A(RX_IN), .B(n13), .Y(n10) );
  MXI2X1M U35 ( .A(n14), .B(n19), .S0(n59), .Y(n32) );
  AOI2BB1X1M U36 ( .A0N(\sampled_ones[0] ), .A1N(n20), .B0(n12), .Y(n19) );
  OAI32X1M U37 ( .A0(n21), .A1(n22), .A2(n23), .B0(RX_IN), .B1(n20), .Y(n12)
         );
  NAND3X1M U38 ( .A(RX_IN), .B(n13), .C(\sampled_ones[0] ), .Y(n14) );
  CLKINVX1M U39 ( .A(n20), .Y(n13) );
  CLKNAND2X2M U40 ( .A(dat_samp_en), .B(n23), .Y(n20) );
  CLKMX2X2M U41 ( .A(sampled_bit), .B(n59), .S0(n60), .Y(n31) );
  NOR3BX1M U42 ( .AN(n22), .B(n23), .C(n21), .Y(n60) );
  CLKINVX1M U43 ( .A(dat_samp_en), .Y(n21) );
  OAI211X1M U44 ( .A0(n24), .A1(n25), .B0(n26), .C0(n27), .Y(n23) );
  NAND4X1M U45 ( .A(n28), .B(n29), .C(n30), .D(n34), .Y(n27) );
  NOR3X1M U46 ( .A(n35), .B(edge_cnt[5]), .C(n36), .Y(n34) );
  CLKXOR2X2M U47 ( .A(edge_cnt[0]), .B(Prescale[1]), .Y(n36) );
  CLKXOR2X2M U48 ( .A(edge_cnt[4]), .B(Prescale[5]), .Y(n35) );
  XNOR2X1M U49 ( .A(edge_cnt[2]), .B(Prescale[3]), .Y(n30) );
  XNOR2X1M U50 ( .A(edge_cnt[3]), .B(Prescale[4]), .Y(n29) );
  XNOR2X1M U51 ( .A(edge_cnt[1]), .B(Prescale[2]), .Y(n28) );
  NAND4X1M U52 ( .A(n37), .B(n38), .C(n39), .D(n40), .Y(n26) );
  NOR3X1M U53 ( .A(n41), .B(n42), .C(n43), .Y(n40) );
  CLKXOR2X2M U54 ( .A(edge_cnt[4]), .B(N11), .Y(n43) );
  CLKXOR2X2M U55 ( .A(edge_cnt[0]), .B(N7), .Y(n42) );
  CLKXOR2X2M U56 ( .A(edge_cnt[5]), .B(N12), .Y(n41) );
  XNOR2X1M U57 ( .A(edge_cnt[2]), .B(N9), .Y(n39) );
  XNOR2X1M U58 ( .A(edge_cnt[3]), .B(N10), .Y(n38) );
  XNOR2X1M U59 ( .A(edge_cnt[1]), .B(N8), .Y(n37) );
  NAND3X1M U60 ( .A(n44), .B(n45), .C(n46), .Y(n25) );
  CLKXOR2X2M U61 ( .A(n47), .B(N19), .Y(n46) );
  CLKINVX1M U62 ( .A(edge_cnt[4]), .Y(n47) );
  XNOR2X1M U63 ( .A(edge_cnt[5]), .B(N20), .Y(n45) );
  XNOR2X1M U64 ( .A(edge_cnt[3]), .B(N18), .Y(n44) );
  NAND3X1M U65 ( .A(n48), .B(n49), .C(n50), .Y(n24) );
  XNOR2X1M U66 ( .A(edge_cnt[1]), .B(N16), .Y(n50) );
  XNOR2X1M U67 ( .A(edge_cnt[2]), .B(N17), .Y(n49) );
  CLKXOR2X2M U68 ( .A(n51), .B(N7), .Y(n48) );
  CLKINVX1M U69 ( .A(edge_cnt[0]), .Y(n51) );
  AND4X1M U70 ( .A(n52), .B(n53), .C(n54), .D(n55), .Y(n22) );
  NOR3X1M U71 ( .A(n56), .B(n57), .C(n58), .Y(n55) );
  CLKXOR2X2M U72 ( .A(edge_cnt[4]), .B(N27), .Y(n58) );
  CLKXOR2X2M U73 ( .A(edge_cnt[1]), .B(N24), .Y(n57) );
  CLKXOR2X2M U74 ( .A(edge_cnt[0]), .B(N23), .Y(n56) );
  XNOR2X1M U75 ( .A(edge_cnt[2]), .B(N25), .Y(n54) );
  XNOR2X1M U76 ( .A(edge_cnt[3]), .B(N26), .Y(n53) );
  XNOR2X1M U77 ( .A(edge_cnt[5]), .B(N28), .Y(n52) );
endmodule


module strt_check ( strt_chk_en, sampled_bit, strt_glitch );
  input strt_chk_en, sampled_bit;
  output strt_glitch;


  AND2X2M U2 ( .A(strt_chk_en), .B(sampled_bit), .Y(strt_glitch) );
endmodule


module deserializer_test_1 ( CLK, RST, deser_en, sample_valid, sampled_bit, 
        P_DATA, test_si, test_se );
  output [7:0] P_DATA;
  input CLK, RST, deser_en, sample_valid, sampled_bit, test_si, test_se;
  wire   n1, n11, n13, n15, n17, n19, n21, n23, n25, n2, n3, n4, n5, n6, n7,
         n8, n9;

  SDFFRQX2M \P_DATA_reg[0]  ( .D(n11), .SI(test_si), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[0]) );
  SDFFRQX2M \P_DATA_reg[5]  ( .D(n21), .SI(P_DATA[4]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[5]) );
  SDFFRQX2M \P_DATA_reg[1]  ( .D(n13), .SI(P_DATA[0]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[1]) );
  SDFFRQX2M \P_DATA_reg[4]  ( .D(n19), .SI(P_DATA[3]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[4]) );
  SDFFRQX2M \P_DATA_reg[7]  ( .D(n25), .SI(P_DATA[6]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[7]) );
  SDFFRQX2M \P_DATA_reg[3]  ( .D(n17), .SI(P_DATA[2]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[3]) );
  SDFFRQX2M \P_DATA_reg[6]  ( .D(n23), .SI(P_DATA[5]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[6]) );
  SDFFRQX2M \P_DATA_reg[2]  ( .D(n15), .SI(P_DATA[1]), .SE(test_se), .CK(CLK), 
        .RN(RST), .Q(P_DATA[2]) );
  OAI22X1M U2 ( .A0(n9), .A1(n8), .B0(n1), .B1(n7), .Y(n13) );
  OAI22X1M U3 ( .A0(n9), .A1(n7), .B0(n1), .B1(n6), .Y(n15) );
  OAI22X1M U4 ( .A0(n9), .A1(n6), .B0(n1), .B1(n5), .Y(n17) );
  OAI22X1M U5 ( .A0(n9), .A1(n5), .B0(n1), .B1(n4), .Y(n19) );
  OAI22X1M U6 ( .A0(n9), .A1(n4), .B0(n1), .B1(n3), .Y(n21) );
  OAI22X1M U7 ( .A0(n9), .A1(n3), .B0(n1), .B1(n2), .Y(n23) );
  INVX2M U8 ( .A(n1), .Y(n9) );
  NAND2X2M U9 ( .A(sample_valid), .B(deser_en), .Y(n1) );
  OAI2BB2X1M U10 ( .B0(n1), .B1(n8), .A0N(P_DATA[0]), .A1N(n1), .Y(n11) );
  OAI2BB2X1M U11 ( .B0(n9), .B1(n2), .A0N(sampled_bit), .A1N(n9), .Y(n25) );
  INVX2M U12 ( .A(P_DATA[2]), .Y(n7) );
  INVX2M U13 ( .A(P_DATA[6]), .Y(n3) );
  INVX2M U14 ( .A(P_DATA[7]), .Y(n2) );
  INVX2M U15 ( .A(P_DATA[3]), .Y(n6) );
  INVX2M U16 ( .A(P_DATA[4]), .Y(n5) );
  INVX2M U17 ( .A(P_DATA[5]), .Y(n4) );
  INVX2M U18 ( .A(P_DATA[1]), .Y(n8) );
endmodule


module parity_check_test_1 ( CLK, RST, par_chk_en, strt_chk_en, PAR_TYP, data, 
        sampled_bit, par_err, test_si, test_se );
  input [7:0] data;
  input CLK, RST, par_chk_en, strt_chk_en, PAR_TYP, sampled_bit, test_si,
         test_se;
  output par_err;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10;

  SDFFRQX2M par_err_reg ( .D(n10), .SI(test_si), .SE(test_se), .CK(CLK), .RN(
        RST), .Q(par_err) );
  OAI31X1M U4 ( .A0(n2), .A1(strt_chk_en), .A2(n3), .B0(n4), .Y(n10) );
  NAND2X2M U5 ( .A(par_err), .B(n3), .Y(n4) );
  NOR2X2M U6 ( .A(par_chk_en), .B(strt_chk_en), .Y(n3) );
  XOR3XLM U7 ( .A(n5), .B(n6), .C(n7), .Y(n2) );
  XNOR2X2M U8 ( .A(sampled_bit), .B(PAR_TYP), .Y(n7) );
  XOR3XLM U9 ( .A(data[5]), .B(data[4]), .C(n8), .Y(n6) );
  XNOR2X2M U10 ( .A(data[7]), .B(data[6]), .Y(n8) );
  XOR3XLM U11 ( .A(data[1]), .B(data[0]), .C(n9), .Y(n5) );
  XNOR2X2M U12 ( .A(data[3]), .B(data[2]), .Y(n9) );
endmodule


module stop_check_test_1 ( CLK, RST, stp_chk_en, strt_chk_en, sampled_bit, 
        stp_err, test_si, test_se );
  input CLK, RST, stp_chk_en, strt_chk_en, sampled_bit, test_si, test_se;
  output stp_err;
  wire   n2, n4, n5;

  SDFFRX2M stp_err_reg ( .D(n4), .SI(test_si), .SE(test_se), .CK(CLK), .RN(RST), .Q(stp_err), .QN(n2) );
  OAI32X1M U5 ( .A0(n2), .A1(strt_chk_en), .A2(stp_chk_en), .B0(sampled_bit), 
        .B1(n5), .Y(n4) );
  INVX2M U6 ( .A(stp_chk_en), .Y(n5) );
endmodule


module UART_RX_TOP_test_1 ( CLK, RST, RX_IN, Prescale, PAR_EN, PAR_TYP, P_DATA, 
        data_valid, par_err, stp_err, test_si2, test_si1, test_so1, test_se );
  input [5:0] Prescale;
  output [7:0] P_DATA;
  input CLK, RST, RX_IN, PAR_EN, PAR_TYP, test_si2, test_si1, test_se;
  output data_valid, par_err, stp_err, test_so1;
  wire   sample_valid, strt_glitch, dat_samp_en, deser_en, strt_chk_en,
         par_chk_en, stp_chk_en, enable, sampled_bit, n3;
  wire   [3:0] bit_cnt;
  wire   [5:0] edge_cnt;

  uart_rx_fsm_test_1 U_UART_RX_FSM ( .CLK(CLK), .RST(RST), .RX_IN(RX_IN), 
        .PAR_EN(PAR_EN), .sample_valid(sample_valid), .strt_glitch(strt_glitch), .par_err(par_err), .stp_err(stp_err), .bit_cnt(bit_cnt), .dat_samp_en(
        dat_samp_en), .deser_en(deser_en), .strt_chk_en(strt_chk_en), 
        .par_chk_en(par_chk_en), .stp_chk_en(stp_chk_en), .enable(enable), 
        .data_valid(data_valid), .test_so(test_so1), .test_se(test_se) );
  edge_bit_counter_test_1 U_EDGE_BIT_COUNTER ( .CLK(CLK), .RST(RST), 
        .Prescale(Prescale), .enable(enable), .edge_cnt(edge_cnt), .bit_cnt(
        bit_cnt), .test_si(P_DATA[7]), .test_se(test_se) );
  data_sampling_test_1 U_DATA_SAMPLING ( .CLK(CLK), .RST(RST), .RX_IN(RX_IN), 
        .Prescale(Prescale), .dat_samp_en(dat_samp_en), .edge_cnt(edge_cnt), 
        .sample_valid(sample_valid), .sampled_bit(sampled_bit), .test_si(
        test_si1), .test_so(n3), .test_se(test_se) );
  strt_check U_STRT_CHECK ( .strt_chk_en(strt_chk_en), .sampled_bit(
        sampled_bit), .strt_glitch(strt_glitch) );
  deserializer_test_1 U_DESERIALIZER ( .CLK(CLK), .RST(RST), .deser_en(
        deser_en), .sample_valid(sample_valid), .sampled_bit(sampled_bit), 
        .P_DATA(P_DATA), .test_si(n3), .test_se(test_se) );
  parity_check_test_1 U_PARITY_CHECK ( .CLK(CLK), .RST(RST), .par_chk_en(
        par_chk_en), .strt_chk_en(strt_chk_en), .PAR_TYP(PAR_TYP), .data(
        P_DATA), .sampled_bit(sampled_bit), .par_err(par_err), .test_si(
        edge_cnt[5]), .test_se(test_se) );
  stop_check_test_1 U_STOP_CHECK ( .CLK(CLK), .RST(RST), .stp_chk_en(
        stp_chk_en), .strt_chk_en(strt_chk_en), .sampled_bit(sampled_bit), 
        .stp_err(stp_err), .test_si(test_si2), .test_se(test_se) );
endmodule


module UART_TOP_DATA_WIDTH8_test_1 ( RX_CLK, TX_CLK, RST_N, RX_IN, TX_OUT, 
        PRESCALE, PAR_EN, PAR_TYP, TX_P_DATA, F_EMPTY, RX_P_DATA, RX_D_VLD, 
        PAR_ERR, STP_ERR, TX_BUSY, test_si, test_se );
  input [5:0] PRESCALE;
  input [7:0] TX_P_DATA;
  output [7:0] RX_P_DATA;
  input RX_CLK, TX_CLK, RST_N, RX_IN, PAR_EN, PAR_TYP, F_EMPTY, test_si,
         test_se;
  output TX_OUT, RX_D_VLD, PAR_ERR, STP_ERR, TX_BUSY;
  wire   n1, n3, n4;

  INVX2M U1 ( .A(F_EMPTY), .Y(n1) );
  UART_TX_TOP_test_1 u_uart_tx ( .CLK(TX_CLK), .RST(RST_N), .DATA_VALID(n1), 
        .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(TX_P_DATA), .TX_OUT(TX_OUT), .BUSY(TX_BUSY), .test_si(n4), .test_so(n3), .test_se(test_se) );
  UART_RX_TOP_test_1 u_uart_rx ( .CLK(RX_CLK), .RST(RST_N), .RX_IN(RX_IN), 
        .Prescale(PRESCALE), .PAR_EN(PAR_EN), .PAR_TYP(PAR_TYP), .P_DATA(
        RX_P_DATA), .data_valid(RX_D_VLD), .par_err(PAR_ERR), .stp_err(STP_ERR), .test_si2(n3), .test_si1(test_si), .test_so1(n4), .test_se(test_se) );
endmodule


module SYS_TOP_dft ( REF_CLK, UART_CLK, RST_N, UART_RX_IN, UART_TX_O, 
        parity_error, framing_error, scan_clk, scan_rst, test_mode, SE, SI, SO, 
        test_si4 );
  input [2:0] SI;
  output [2:0] SO;
  input REF_CLK, UART_CLK, RST_N, UART_RX_IN, scan_clk, scan_rst, test_mode,
         SE, test_si4;
  output UART_TX_O, parity_error, framing_error;
  wire   N0, REF_CLK_M, UART_CLK_M, UART_TX_CLK_M, UART_TX_CLK, UART_RX_CLK_M,
         UART_RX_CLK, REF_RST_M, SYNC_REF_RST, UART_RST_M, SYNC_UART_RST,
         UART_RX_V_OUT, UART_RX_V_SYNC, RF_RdEn, RF_WrEn, RF_RdData_VLD,
         _0_net_, ALU_CLK, CLKG_EN, ALU_EN, ALU_OUT_VLD, FIFO_FULL,
         UART_TX_VLD, UART_TX_Busy_PULSE, FIFO_EMPTY, UART_TX_Busy, n2, n3, n6,
         n9, n10, n11, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28;
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
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3;
  assign N0 = test_mode;

  MX2X6M U8 ( .A(SYNC_UART_RST), .B(scan_rst), .S0(N0), .Y(UART_RST_M) );
  OR2X2M U9 ( .A(CLKG_EN), .B(N0), .Y(_0_net_) );
  MX2X2M U10 ( .A(UART_TX_CLK), .B(scan_clk), .S0(N0), .Y(UART_TX_CLK_M) );
  MX2X2M U11 ( .A(UART_RX_CLK), .B(scan_clk), .S0(N0), .Y(UART_RX_CLK_M) );
  MX2X2M U12 ( .A(UART_CLK), .B(scan_clk), .S0(N0), .Y(UART_CLK_M) );
  MX2X8M U13 ( .A(REF_CLK), .B(scan_clk), .S0(N0), .Y(REF_CLK_M) );
  MX2X8M U14 ( .A(SYNC_REF_RST), .B(scan_rst), .S0(N0), .Y(REF_RST_M) );
  DLY1X1M U20 ( .A(n16), .Y(n15) );
  INVXLM U21 ( .A(n26), .Y(n16) );
  DLY1X1M U22 ( .A(n22), .Y(n17) );
  DLY1X1M U23 ( .A(n20), .Y(n18) );
  INVXLM U24 ( .A(n27), .Y(n19) );
  INVXLM U25 ( .A(n19), .Y(n20) );
  INVXLM U26 ( .A(n19), .Y(n21) );
  INVXLM U27 ( .A(n19), .Y(n22) );
  INVXLM U28 ( .A(n28), .Y(n23) );
  INVXLM U29 ( .A(n23), .Y(n24) );
  INVXLM U30 ( .A(n23), .Y(n25) );
  INVXLM U31 ( .A(SE), .Y(n26) );
  INVXLM U32 ( .A(n26), .Y(n27) );
  INVXLM U33 ( .A(n26), .Y(n28) );
  RST_SYNC_0 u_RST_SYNC_REF ( .RST(RST_N), .CLK(REF_CLK_M), .SYNC_RST(
        SYNC_REF_RST) );
  RST_SYNC_1 u_RST_SYNC_UART ( .RST(RST_N), .CLK(UART_CLK_M), .SYNC_RST(
        SYNC_UART_RST) );
  Data_sync_BUS_WIDTH8_NUM_STAGES2_test_1 u_Data_sync ( .Unsync_bus(
        UART_RX_OUT), .bus_enable(UART_RX_V_OUT), .CLK(REF_CLK_M), .RST(
        REF_RST_M), .sync_bus(UART_RX_SYNC), .enable_pulse(UART_RX_V_SYNC), 
        .test_si(n11), .test_so(n10), .test_se(n24) );
  REG_FILE_ADDR_WIDTH4_DATA_WIDTH8_test_1 u_REG_FILE ( .RD_EN(RF_RdEn), 
        .WR_EN(RF_WrEn), .RST(REF_RST_M), .CLK(REF_CLK_M), .ADDRESS(RF_Address), .WR_DATA(RF_WrData), .RD_DATA(RF_RdData), .RdData_VLD(RF_RdData_VLD), .REG0(
        Operand_A), .REG1(Operand_B), .REG2(UART_Config), .REG3(DIV_RATIO), 
        .test_si2(SI[0]), .test_si1(n9), .test_so1(SO[1]), .test_se(SE) );
  CLK_GATE u_CLK_GATE ( .CLK_EN(_0_net_), .CLK(REF_CLK_M), .GATED_CLK(ALU_CLK)
         );
  ALU_OPER_WIDTH8_OUT_WIDTH16_test_1 u_ALU ( .A(Operand_A), .B(Operand_B), 
        .EN(ALU_EN), .ALU_FUN(ALU_FUN), .CLK(ALU_CLK), .RST(REF_RST_M), 
        .ALU_OUT(ALU_OUT), .OUT_VALID(ALU_OUT_VLD), .test_si(SI[2]), .test_se(
        n17) );
  SYS_CTRL_DATA_WIDTH8_ADDR_WIDTH4_test_1 u_SYS_CTRL ( .CLK(REF_CLK_M), .RST(
        REF_RST_M), .ALU_OUT(ALU_OUT), .OUT_Valid(ALU_OUT_VLD), .RdData(
        RF_RdData), .RdData_Valid(RF_RdData_VLD), .RX_P_Data(UART_RX_SYNC), 
        .RX_D_VLD(UART_RX_V_SYNC), .FIFO_FULL(FIFO_FULL), .ALU_FUN(ALU_FUN), 
        .EN(ALU_EN), .CLK_EN(CLKG_EN), .Address(RF_Address), .WrEN(RF_WrEn), 
        .RdEn(RF_RdEn), .WrData(RF_WrData), .TX_P_Data(UART_TX_IN), .TX_D_VLD(
        UART_TX_VLD), .test_si2(test_si4), .test_si1(n6), .test_so2(n3), 
        .test_so1(SO[0]), .test_se(n15) );
  ASYNC_FIFO_DATA_WIDTH8_ADDR_WIDTH3_test_1 u_ASYNC_FIFO ( .W_CLK(REF_CLK_M), 
        .W_RST(REF_RST_M), .W_INC(UART_TX_VLD), .WR_DATA(UART_TX_IN), .FULL(
        FIFO_FULL), .R_CLK(UART_TX_CLK_M), .R_RST(UART_RST_M), .R_INC(
        UART_TX_Busy_PULSE), .RD_DATA(FIFO_RD_DATA), .EMPTY(FIFO_EMPTY), 
        .test_si2(SI[1]), .test_si1(ALU_OUT_VLD), .test_so2(n11), .test_so1(
        SO[2]), .test_se(SE) );
  CLKDIV_MUX_WIDTH8 u_CLKDIV_MUX ( .IN(UART_Config[7:2]), .OUT({
        SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, DIV_RATIO_RX[3:0]})
         );
  INT_CLK_DIV_test_1 u_TX_CLK_DIV ( .REF_CLK(UART_CLK_M), .RST(UART_RST_M), 
        .CLK_EN(1'b1), .DIV_RATIO(DIV_RATIO), .O_DIV_CLK(UART_TX_CLK), 
        .test_si(n3), .test_so(n2), .test_se(n25) );
  INT_CLK_DIV_test_0 u_RX_CLK_DIV ( .REF_CLK(UART_CLK_M), .RST(UART_RST_M), 
        .CLK_EN(1'b1), .DIV_RATIO({1'b0, 1'b0, 1'b0, 1'b0, DIV_RATIO_RX[3:0]}), 
        .O_DIV_CLK(UART_RX_CLK), .test_si(RF_RdData_VLD), .test_so(n6), 
        .test_se(n21) );
  PULSE_GEN_test_1 u_PULSE_GEN ( .clk(UART_TX_CLK_M), .rst(UART_RST_M), 
        .lvl_sig(UART_TX_Busy), .pulse_sig(UART_TX_Busy_PULSE), .test_si(n10), 
        .test_so(n9), .test_se(n25) );
  UART_TOP_DATA_WIDTH8_test_1 u_UART_TOP ( .RX_CLK(UART_RX_CLK_M), .TX_CLK(
        UART_TX_CLK_M), .RST_N(UART_RST_M), .RX_IN(UART_RX_IN), .TX_OUT(
        UART_TX_O), .PRESCALE(UART_Config[7:2]), .PAR_EN(UART_Config[0]), 
        .PAR_TYP(UART_Config[1]), .TX_P_DATA(FIFO_RD_DATA), .F_EMPTY(
        FIFO_EMPTY), .RX_P_DATA(UART_RX_OUT), .RX_D_VLD(UART_RX_V_OUT), 
        .PAR_ERR(parity_error), .STP_ERR(framing_error), .TX_BUSY(UART_TX_Busy), .test_si(n2), .test_se(n18) );
endmodule

