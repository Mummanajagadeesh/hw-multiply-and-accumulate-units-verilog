// This is the unpowered netlist.
module rca (A,
    B,
    SUM);
 input [7:0] A;
 input [7:0] B;
 output [7:0] SUM;

 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _06_;
 wire _07_;
 wire _08_;
 wire _09_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_ef_sc_hd__decap_12 FILLER_0_0_12 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_0_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_41 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_0_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_0_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_0_62 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_10_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_10_41 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_10_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_10_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_10_9 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_11_34 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_1_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_1_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_24 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_2_42 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_2_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_2_62 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_2_70 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_25 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_3_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_3_49 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3_61 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_3_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_4_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_4_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_4_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_4_43 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_4_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_5_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_5_6 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_5_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_16 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_6_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_6_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_6_71 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_21 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_7_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_7_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_7_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_8_18 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_8_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_8_43 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_8_51 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_8_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_8_71 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_8_9 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_9_14 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_9_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9_45 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_9_64 ();
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_24 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_25 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_26 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_27 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_28 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_29 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_30 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_31 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_32 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_33 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_34 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__xor2_1 _26_ (.A(net9),
    .B(net1),
    .X(net17));
 sky130_fd_sc_hd__a21o_1 _27_ (.A1(net9),
    .A2(net1),
    .B1(net2),
    .X(_00_));
 sky130_fd_sc_hd__nand3_1 _28_ (.A(net9),
    .B(net1),
    .C(net2),
    .Y(_01_));
 sky130_fd_sc_hd__a21oi_1 _29_ (.A1(_00_),
    .A2(_01_),
    .B1(net10),
    .Y(_02_));
 sky130_fd_sc_hd__and3_1 _30_ (.A(net10),
    .B(_00_),
    .C(_01_),
    .X(_03_));
 sky130_fd_sc_hd__nor2_1 _31_ (.A(_02_),
    .B(_03_),
    .Y(net18));
 sky130_fd_sc_hd__and3_1 _32_ (.A(net9),
    .B(net1),
    .C(net2),
    .X(_04_));
 sky130_fd_sc_hd__or3_1 _33_ (.A(net3),
    .B(_04_),
    .C(_03_),
    .X(_05_));
 sky130_fd_sc_hd__o21ai_1 _34_ (.A1(_04_),
    .A2(_03_),
    .B1(net3),
    .Y(_06_));
 sky130_fd_sc_hd__and2_1 _35_ (.A(_05_),
    .B(_06_),
    .X(_07_));
 sky130_fd_sc_hd__xor2_1 _36_ (.A(net11),
    .B(_07_),
    .X(net19));
 sky130_fd_sc_hd__a21bo_1 _37_ (.A1(net11),
    .A2(_05_),
    .B1_N(_06_),
    .X(_08_));
 sky130_fd_sc_hd__xor2_1 _38_ (.A(net4),
    .B(_08_),
    .X(_09_));
 sky130_fd_sc_hd__xor2_1 _39_ (.A(net12),
    .B(_09_),
    .X(net20));
 sky130_fd_sc_hd__and2_1 _40_ (.A(net4),
    .B(_08_),
    .X(_10_));
 sky130_fd_sc_hd__a21oi_2 _41_ (.A1(net12),
    .A2(_09_),
    .B1(_10_),
    .Y(_11_));
 sky130_fd_sc_hd__xnor2_1 _42_ (.A(net5),
    .B(_11_),
    .Y(_12_));
 sky130_fd_sc_hd__xor2_1 _43_ (.A(net13),
    .B(_12_),
    .X(net21));
 sky130_fd_sc_hd__and2b_1 _44_ (.A_N(_11_),
    .B(net5),
    .X(_13_));
 sky130_fd_sc_hd__a21oi_2 _45_ (.A1(net13),
    .A2(_12_),
    .B1(_13_),
    .Y(_14_));
 sky130_fd_sc_hd__xnor2_1 _46_ (.A(net6),
    .B(_14_),
    .Y(_15_));
 sky130_fd_sc_hd__or2_1 _47_ (.A(net14),
    .B(_15_),
    .X(_16_));
 sky130_fd_sc_hd__nand2_1 _48_ (.A(_15_),
    .B(net14),
    .Y(_17_));
 sky130_fd_sc_hd__and2_1 _49_ (.A(_16_),
    .B(_17_),
    .X(_18_));
 sky130_fd_sc_hd__clkbuf_1 _50_ (.A(_18_),
    .X(net22));
 sky130_fd_sc_hd__or2b_1 _51_ (.A(_14_),
    .B_N(net6),
    .X(_19_));
 sky130_fd_sc_hd__nand3b_1 _52_ (.A_N(net7),
    .B(_19_),
    .C(_17_),
    .Y(_20_));
 sky130_fd_sc_hd__a21bo_1 _53_ (.A1(_19_),
    .A2(_17_),
    .B1_N(net7),
    .X(_21_));
 sky130_fd_sc_hd__nand2_1 _54_ (.A(_20_),
    .B(_21_),
    .Y(_22_));
 sky130_fd_sc_hd__xnor2_1 _55_ (.A(net15),
    .B(_22_),
    .Y(net23));
 sky130_fd_sc_hd__a21boi_1 _56_ (.A1(_19_),
    .A2(_17_),
    .B1_N(net7),
    .Y(_23_));
 sky130_fd_sc_hd__a21oi_1 _57_ (.A1(net15),
    .A2(_20_),
    .B1(_23_),
    .Y(_24_));
 sky130_fd_sc_hd__xor2_1 _58_ (.A(net8),
    .B(net16),
    .X(_25_));
 sky130_fd_sc_hd__xnor2_1 _59_ (.A(_24_),
    .B(_25_),
    .Y(net24));
 sky130_fd_sc_hd__dlymetal6s2s_1 input1 (.A(A[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input10 (.A(B[1]),
    .X(net10));
 sky130_fd_sc_hd__buf_1 input11 (.A(B[2]),
    .X(net11));
 sky130_fd_sc_hd__buf_1 input12 (.A(B[3]),
    .X(net12));
 sky130_fd_sc_hd__buf_1 input13 (.A(B[4]),
    .X(net13));
 sky130_fd_sc_hd__buf_1 input14 (.A(B[5]),
    .X(net14));
 sky130_fd_sc_hd__buf_1 input15 (.A(B[6]),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_1 input16 (.A(B[7]),
    .X(net16));
 sky130_fd_sc_hd__buf_1 input2 (.A(A[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(A[2]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(A[3]),
    .X(net4));
 sky130_fd_sc_hd__buf_1 input5 (.A(A[4]),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(A[5]),
    .X(net6));
 sky130_fd_sc_hd__buf_1 input7 (.A(A[6]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_1 input8 (.A(A[7]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(B[0]),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_4 output17 (.A(net17),
    .X(SUM[0]));
 sky130_fd_sc_hd__buf_2 output18 (.A(net18),
    .X(SUM[1]));
 sky130_fd_sc_hd__clkbuf_4 output19 (.A(net19),
    .X(SUM[2]));
 sky130_fd_sc_hd__clkbuf_4 output20 (.A(net20),
    .X(SUM[3]));
 sky130_fd_sc_hd__clkbuf_4 output21 (.A(net21),
    .X(SUM[4]));
 sky130_fd_sc_hd__clkbuf_4 output22 (.A(net22),
    .X(SUM[5]));
 sky130_fd_sc_hd__buf_4 output23 (.A(net23),
    .X(SUM[6]));
 sky130_fd_sc_hd__buf_2 output24 (.A(net24),
    .X(SUM[7]));
endmodule

