module csa (A,
    B,
    C,
    Carry,
    Sum);
 input [15:0] A;
 input [15:0] B;
 input [15:0] C;
 output [15:0] Carry;
 output [15:0] Sum;

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
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
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
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;

 sky130_fd_sc_hd__xnor2_1 _32_ (.A(net17),
    .B(net1),
    .Y(_22_));
 sky130_fd_sc_hd__xnor2_1 _33_ (.A(net33),
    .B(_22_),
    .Y(net65));
 sky130_fd_sc_hd__xnor2_1 _34_ (.A(net24),
    .B(net8),
    .Y(_23_));
 sky130_fd_sc_hd__xnor2_1 _35_ (.A(net40),
    .B(_23_),
    .Y(net72));
 sky130_fd_sc_hd__xnor2_1 _36_ (.A(net25),
    .B(net9),
    .Y(_24_));
 sky130_fd_sc_hd__xnor2_1 _37_ (.A(net41),
    .B(_24_),
    .Y(net73));
 sky130_fd_sc_hd__xnor2_1 _38_ (.A(net26),
    .B(net10),
    .Y(_25_));
 sky130_fd_sc_hd__xnor2_1 _39_ (.A(net42),
    .B(_25_),
    .Y(net74));
 sky130_fd_sc_hd__xnor2_1 _40_ (.A(net27),
    .B(net11),
    .Y(_26_));
 sky130_fd_sc_hd__xnor2_1 _41_ (.A(net43),
    .B(_26_),
    .Y(net75));
 sky130_fd_sc_hd__xnor2_1 _42_ (.A(net28),
    .B(net12),
    .Y(_27_));
 sky130_fd_sc_hd__xnor2_1 _43_ (.A(net44),
    .B(_27_),
    .Y(net76));
 sky130_fd_sc_hd__xnor2_1 _44_ (.A(net29),
    .B(net13),
    .Y(_28_));
 sky130_fd_sc_hd__xnor2_1 _45_ (.A(net45),
    .B(_28_),
    .Y(net77));
 sky130_fd_sc_hd__xnor2_1 _46_ (.A(net30),
    .B(net14),
    .Y(_29_));
 sky130_fd_sc_hd__xnor2_1 _47_ (.A(net46),
    .B(_29_),
    .Y(net78));
 sky130_fd_sc_hd__xnor2_1 _48_ (.A(net31),
    .B(net15),
    .Y(_30_));
 sky130_fd_sc_hd__xnor2_1 _49_ (.A(net47),
    .B(_30_),
    .Y(net79));
 sky130_fd_sc_hd__xnor2_1 _50_ (.A(net32),
    .B(net16),
    .Y(_31_));
 sky130_fd_sc_hd__xnor2_1 _51_ (.A(net48),
    .B(_31_),
    .Y(net80));
 sky130_fd_sc_hd__xnor2_1 _52_ (.A(net18),
    .B(net2),
    .Y(_00_));
 sky130_fd_sc_hd__xnor2_1 _53_ (.A(net34),
    .B(_00_),
    .Y(net66));
 sky130_fd_sc_hd__xnor2_1 _54_ (.A(net19),
    .B(net3),
    .Y(_01_));
 sky130_fd_sc_hd__xnor2_1 _55_ (.A(net35),
    .B(_01_),
    .Y(net67));
 sky130_fd_sc_hd__xnor2_1 _56_ (.A(net20),
    .B(net4),
    .Y(_02_));
 sky130_fd_sc_hd__xnor2_1 _57_ (.A(net36),
    .B(_02_),
    .Y(net68));
 sky130_fd_sc_hd__xnor2_1 _58_ (.A(net21),
    .B(net5),
    .Y(_03_));
 sky130_fd_sc_hd__xnor2_1 _59_ (.A(net37),
    .B(_03_),
    .Y(net69));
 sky130_fd_sc_hd__xnor2_1 _60_ (.A(net22),
    .B(net6),
    .Y(_04_));
 sky130_fd_sc_hd__xnor2_1 _61_ (.A(net38),
    .B(_04_),
    .Y(net70));
 sky130_fd_sc_hd__xnor2_1 _62_ (.A(net23),
    .B(net7),
    .Y(_05_));
 sky130_fd_sc_hd__xnor2_1 _63_ (.A(net39),
    .B(_05_),
    .Y(net71));
 sky130_fd_sc_hd__a21o_1 _64_ (.A1(net17),
    .A2(net1),
    .B1(net33),
    .X(_06_));
 sky130_fd_sc_hd__o21a_1 _65_ (.A1(net17),
    .A2(net1),
    .B1(_06_),
    .X(net49));
 sky130_fd_sc_hd__a21o_1 _66_ (.A1(net24),
    .A2(net8),
    .B1(net40),
    .X(_07_));
 sky130_fd_sc_hd__o21a_1 _67_ (.A1(net24),
    .A2(net8),
    .B1(_07_),
    .X(net56));
 sky130_fd_sc_hd__a21o_1 _68_ (.A1(net25),
    .A2(net9),
    .B1(net41),
    .X(_08_));
 sky130_fd_sc_hd__o21a_1 _69_ (.A1(net25),
    .A2(net9),
    .B1(_08_),
    .X(net57));
 sky130_fd_sc_hd__a21o_1 _70_ (.A1(net26),
    .A2(net10),
    .B1(net42),
    .X(_09_));
 sky130_fd_sc_hd__o21a_1 _71_ (.A1(net26),
    .A2(net10),
    .B1(_09_),
    .X(net58));
 sky130_fd_sc_hd__a21o_1 _72_ (.A1(net27),
    .A2(net11),
    .B1(net43),
    .X(_10_));
 sky130_fd_sc_hd__o21a_1 _73_ (.A1(net27),
    .A2(net11),
    .B1(_10_),
    .X(net59));
 sky130_fd_sc_hd__a21o_1 _74_ (.A1(net28),
    .A2(net12),
    .B1(net44),
    .X(_11_));
 sky130_fd_sc_hd__o21a_1 _75_ (.A1(net28),
    .A2(net12),
    .B1(_11_),
    .X(net60));
 sky130_fd_sc_hd__a21o_1 _76_ (.A1(net29),
    .A2(net13),
    .B1(net45),
    .X(_12_));
 sky130_fd_sc_hd__o21a_1 _77_ (.A1(net29),
    .A2(net13),
    .B1(_12_),
    .X(net61));
 sky130_fd_sc_hd__a21o_1 _78_ (.A1(net30),
    .A2(net14),
    .B1(net46),
    .X(_13_));
 sky130_fd_sc_hd__o21a_1 _79_ (.A1(net30),
    .A2(net14),
    .B1(_13_),
    .X(net62));
 sky130_fd_sc_hd__a21o_1 _80_ (.A1(net31),
    .A2(net15),
    .B1(net47),
    .X(_14_));
 sky130_fd_sc_hd__o21a_1 _81_ (.A1(net31),
    .A2(net15),
    .B1(_14_),
    .X(net63));
 sky130_fd_sc_hd__a21o_1 _82_ (.A1(net32),
    .A2(net16),
    .B1(net48),
    .X(_15_));
 sky130_fd_sc_hd__o21a_1 _83_ (.A1(net32),
    .A2(net16),
    .B1(_15_),
    .X(net64));
 sky130_fd_sc_hd__a21o_1 _84_ (.A1(net18),
    .A2(net2),
    .B1(net34),
    .X(_16_));
 sky130_fd_sc_hd__o21a_1 _85_ (.A1(net18),
    .A2(net2),
    .B1(_16_),
    .X(net50));
 sky130_fd_sc_hd__a21o_1 _86_ (.A1(net19),
    .A2(net3),
    .B1(net35),
    .X(_17_));
 sky130_fd_sc_hd__o21a_1 _87_ (.A1(net19),
    .A2(net3),
    .B1(_17_),
    .X(net51));
 sky130_fd_sc_hd__a21o_1 _88_ (.A1(net20),
    .A2(net4),
    .B1(net36),
    .X(_18_));
 sky130_fd_sc_hd__o21a_1 _89_ (.A1(net20),
    .A2(net4),
    .B1(_18_),
    .X(net52));
 sky130_fd_sc_hd__a21o_1 _90_ (.A1(net21),
    .A2(net5),
    .B1(net37),
    .X(_19_));
 sky130_fd_sc_hd__o21a_1 _91_ (.A1(net21),
    .A2(net5),
    .B1(_19_),
    .X(net53));
 sky130_fd_sc_hd__a21o_1 _92_ (.A1(net22),
    .A2(net6),
    .B1(net38),
    .X(_20_));
 sky130_fd_sc_hd__o21a_1 _93_ (.A1(net22),
    .A2(net6),
    .B1(_20_),
    .X(net54));
 sky130_fd_sc_hd__a21o_1 _94_ (.A1(net23),
    .A2(net7),
    .B1(net39),
    .X(_21_));
 sky130_fd_sc_hd__o21a_1 _95_ (.A1(net23),
    .A2(net7),
    .B1(_21_),
    .X(net55));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
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
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_36 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_37 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_38 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_39 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_40 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_41 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_42 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_43 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_44 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_45 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_46 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_47 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_48 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_49 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_65 ();
 sky130_fd_sc_hd__buf_1 input1 (.A(A[0]),
    .X(net1));
 sky130_fd_sc_hd__buf_1 input2 (.A(A[10]),
    .X(net2));
 sky130_fd_sc_hd__buf_1 input3 (.A(A[11]),
    .X(net3));
 sky130_fd_sc_hd__buf_1 input4 (.A(A[12]),
    .X(net4));
 sky130_fd_sc_hd__buf_1 input5 (.A(A[13]),
    .X(net5));
 sky130_fd_sc_hd__buf_1 input6 (.A(A[14]),
    .X(net6));
 sky130_fd_sc_hd__buf_1 input7 (.A(A[15]),
    .X(net7));
 sky130_fd_sc_hd__buf_1 input8 (.A(A[1]),
    .X(net8));
 sky130_fd_sc_hd__buf_1 input9 (.A(A[2]),
    .X(net9));
 sky130_fd_sc_hd__buf_1 input10 (.A(A[3]),
    .X(net10));
 sky130_fd_sc_hd__buf_1 input11 (.A(A[4]),
    .X(net11));
 sky130_fd_sc_hd__buf_1 input12 (.A(A[5]),
    .X(net12));
 sky130_fd_sc_hd__buf_1 input13 (.A(A[6]),
    .X(net13));
 sky130_fd_sc_hd__buf_1 input14 (.A(A[7]),
    .X(net14));
 sky130_fd_sc_hd__buf_1 input15 (.A(A[8]),
    .X(net15));
 sky130_fd_sc_hd__buf_1 input16 (.A(A[9]),
    .X(net16));
 sky130_fd_sc_hd__buf_1 input17 (.A(B[0]),
    .X(net17));
 sky130_fd_sc_hd__buf_1 input18 (.A(B[10]),
    .X(net18));
 sky130_fd_sc_hd__buf_1 input19 (.A(B[11]),
    .X(net19));
 sky130_fd_sc_hd__buf_1 input20 (.A(B[12]),
    .X(net20));
 sky130_fd_sc_hd__buf_1 input21 (.A(B[13]),
    .X(net21));
 sky130_fd_sc_hd__buf_1 input22 (.A(B[14]),
    .X(net22));
 sky130_fd_sc_hd__buf_1 input23 (.A(B[15]),
    .X(net23));
 sky130_fd_sc_hd__buf_1 input24 (.A(B[1]),
    .X(net24));
 sky130_fd_sc_hd__buf_1 input25 (.A(B[2]),
    .X(net25));
 sky130_fd_sc_hd__buf_1 input26 (.A(B[3]),
    .X(net26));
 sky130_fd_sc_hd__buf_1 input27 (.A(B[4]),
    .X(net27));
 sky130_fd_sc_hd__buf_1 input28 (.A(B[5]),
    .X(net28));
 sky130_fd_sc_hd__buf_1 input29 (.A(B[6]),
    .X(net29));
 sky130_fd_sc_hd__buf_1 input30 (.A(B[7]),
    .X(net30));
 sky130_fd_sc_hd__buf_1 input31 (.A(B[8]),
    .X(net31));
 sky130_fd_sc_hd__buf_1 input32 (.A(B[9]),
    .X(net32));
 sky130_fd_sc_hd__buf_1 input33 (.A(C[0]),
    .X(net33));
 sky130_fd_sc_hd__buf_1 input34 (.A(C[10]),
    .X(net34));
 sky130_fd_sc_hd__buf_1 input35 (.A(C[11]),
    .X(net35));
 sky130_fd_sc_hd__buf_1 input36 (.A(C[12]),
    .X(net36));
 sky130_fd_sc_hd__buf_1 input37 (.A(C[13]),
    .X(net37));
 sky130_fd_sc_hd__buf_1 input38 (.A(C[14]),
    .X(net38));
 sky130_fd_sc_hd__buf_1 input39 (.A(C[15]),
    .X(net39));
 sky130_fd_sc_hd__buf_1 input40 (.A(C[1]),
    .X(net40));
 sky130_fd_sc_hd__buf_1 input41 (.A(C[2]),
    .X(net41));
 sky130_fd_sc_hd__buf_1 input42 (.A(C[3]),
    .X(net42));
 sky130_fd_sc_hd__buf_1 input43 (.A(C[4]),
    .X(net43));
 sky130_fd_sc_hd__buf_1 input44 (.A(C[5]),
    .X(net44));
 sky130_fd_sc_hd__buf_1 input45 (.A(C[6]),
    .X(net45));
 sky130_fd_sc_hd__buf_1 input46 (.A(C[7]),
    .X(net46));
 sky130_fd_sc_hd__buf_1 input47 (.A(C[8]),
    .X(net47));
 sky130_fd_sc_hd__buf_1 input48 (.A(C[9]),
    .X(net48));
 sky130_fd_sc_hd__buf_2 output49 (.A(net49),
    .X(Carry[0]));
 sky130_fd_sc_hd__clkbuf_4 output50 (.A(net50),
    .X(Carry[10]));
 sky130_fd_sc_hd__clkbuf_4 output51 (.A(net51),
    .X(Carry[11]));
 sky130_fd_sc_hd__buf_2 output52 (.A(net52),
    .X(Carry[12]));
 sky130_fd_sc_hd__clkbuf_4 output53 (.A(net53),
    .X(Carry[13]));
 sky130_fd_sc_hd__buf_2 output54 (.A(net54),
    .X(Carry[14]));
 sky130_fd_sc_hd__clkbuf_4 output55 (.A(net55),
    .X(Carry[15]));
 sky130_fd_sc_hd__clkbuf_4 output56 (.A(net56),
    .X(Carry[1]));
 sky130_fd_sc_hd__clkbuf_4 output57 (.A(net57),
    .X(Carry[2]));
 sky130_fd_sc_hd__clkbuf_4 output58 (.A(net58),
    .X(Carry[3]));
 sky130_fd_sc_hd__buf_2 output59 (.A(net59),
    .X(Carry[4]));
 sky130_fd_sc_hd__clkbuf_4 output60 (.A(net60),
    .X(Carry[5]));
 sky130_fd_sc_hd__clkbuf_4 output61 (.A(net61),
    .X(Carry[6]));
 sky130_fd_sc_hd__buf_2 output62 (.A(net62),
    .X(Carry[7]));
 sky130_fd_sc_hd__buf_2 output63 (.A(net63),
    .X(Carry[8]));
 sky130_fd_sc_hd__buf_2 output64 (.A(net64),
    .X(Carry[9]));
 sky130_fd_sc_hd__buf_2 output65 (.A(net65),
    .X(Sum[0]));
 sky130_fd_sc_hd__clkbuf_4 output66 (.A(net66),
    .X(Sum[10]));
 sky130_fd_sc_hd__buf_2 output67 (.A(net67),
    .X(Sum[11]));
 sky130_fd_sc_hd__buf_2 output68 (.A(net68),
    .X(Sum[12]));
 sky130_fd_sc_hd__buf_2 output69 (.A(net69),
    .X(Sum[13]));
 sky130_fd_sc_hd__buf_2 output70 (.A(net70),
    .X(Sum[14]));
 sky130_fd_sc_hd__buf_2 output71 (.A(net71),
    .X(Sum[15]));
 sky130_fd_sc_hd__buf_2 output72 (.A(net72),
    .X(Sum[1]));
 sky130_fd_sc_hd__clkbuf_4 output73 (.A(net73),
    .X(Sum[2]));
 sky130_fd_sc_hd__clkbuf_4 output74 (.A(net74),
    .X(Sum[3]));
 sky130_fd_sc_hd__clkbuf_4 output75 (.A(net75),
    .X(Sum[4]));
 sky130_fd_sc_hd__clkbuf_4 output76 (.A(net76),
    .X(Sum[5]));
 sky130_fd_sc_hd__buf_2 output77 (.A(net77),
    .X(Sum[6]));
 sky130_fd_sc_hd__buf_2 output78 (.A(net78),
    .X(Sum[7]));
 sky130_fd_sc_hd__buf_2 output79 (.A(net79),
    .X(Sum[8]));
 sky130_fd_sc_hd__buf_2 output80 (.A(net80),
    .X(Sum[9]));
endmodule
