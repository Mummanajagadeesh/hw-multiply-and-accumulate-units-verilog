module kogge (A,
    B,
    SUM);
 input [15:0] A;
 input [15:0] B;
 output [15:0] SUM;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _039_;
 wire _040_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;

 sky130_fd_sc_hd__nor2_2 _094_ (.A(B[0]),
    .B(A[0]),
    .Y(_051_));
 sky130_fd_sc_hd__and2_2 _095_ (.A(B[0]),
    .B(A[0]),
    .X(_052_));
 sky130_fd_sc_hd__nor2_2 _096_ (.A(_051_),
    .B(_052_),
    .Y(SUM[0]));
 sky130_fd_sc_hd__xor2_2 _097_ (.A(B[1]),
    .B(A[1]),
    .X(_053_));
 sky130_fd_sc_hd__xor2_2 _098_ (.A(_052_),
    .B(_053_),
    .X(SUM[1]));
 sky130_fd_sc_hd__and2_2 _099_ (.A(B[1]),
    .B(A[1]),
    .X(_054_));
 sky130_fd_sc_hd__a21o_2 _100_ (.A1(_052_),
    .A2(_053_),
    .B1(_054_),
    .X(_055_));
 sky130_fd_sc_hd__nand2_2 _101_ (.A(B[2]),
    .B(A[2]),
    .Y(_056_));
 sky130_fd_sc_hd__or2_2 _102_ (.A(B[2]),
    .B(A[2]),
    .X(_057_));
 sky130_fd_sc_hd__and2_2 _103_ (.A(_056_),
    .B(_057_),
    .X(_058_));
 sky130_fd_sc_hd__xor2_2 _104_ (.A(_055_),
    .B(_058_),
    .X(SUM[2]));
 sky130_fd_sc_hd__nor2_2 _105_ (.A(B[2]),
    .B(A[2]),
    .Y(_059_));
 sky130_fd_sc_hd__a221oi_2 _106_ (.A1(B[2]),
    .A2(A[2]),
    .B1(_052_),
    .B2(_053_),
    .C1(_054_),
    .Y(_060_));
 sky130_fd_sc_hd__or2_2 _107_ (.A(_059_),
    .B(_060_),
    .X(_061_));
 sky130_fd_sc_hd__xor2_2 _108_ (.A(B[3]),
    .B(A[3]),
    .X(_062_));
 sky130_fd_sc_hd__xnor2_2 _109_ (.A(_061_),
    .B(_062_),
    .Y(SUM[3]));
 sky130_fd_sc_hd__xor2_2 _110_ (.A(B[4]),
    .B(A[4]),
    .X(_063_));
 sky130_fd_sc_hd__and3_2 _111_ (.A(_056_),
    .B(_057_),
    .C(_062_),
    .X(_064_));
 sky130_fd_sc_hd__a22o_2 _112_ (.A1(B[2]),
    .A2(A[2]),
    .B1(B[3]),
    .B2(A[3]),
    .X(_065_));
 sky130_fd_sc_hd__or2_2 _113_ (.A(B[3]),
    .B(A[3]),
    .X(_066_));
 sky130_fd_sc_hd__a22o_2 _114_ (.A1(_055_),
    .A2(_064_),
    .B1(_065_),
    .B2(_066_),
    .X(_067_));
 sky130_fd_sc_hd__xor2_2 _115_ (.A(_063_),
    .B(_067_),
    .X(SUM[4]));
 sky130_fd_sc_hd__xor2_2 _116_ (.A(B[5]),
    .B(A[5]),
    .X(_068_));
 sky130_fd_sc_hd__nand2_2 _117_ (.A(_062_),
    .B(_063_),
    .Y(_069_));
 sky130_fd_sc_hd__a22o_2 _118_ (.A1(B[3]),
    .A2(A[3]),
    .B1(B[4]),
    .B2(A[4]),
    .X(_070_));
 sky130_fd_sc_hd__o21ai_2 _119_ (.A1(B[4]),
    .A2(A[4]),
    .B1(_070_),
    .Y(_071_));
 sky130_fd_sc_hd__o31a_2 _120_ (.A1(_059_),
    .A2(_060_),
    .A3(_069_),
    .B1(_071_),
    .X(_072_));
 sky130_fd_sc_hd__xnor2_2 _121_ (.A(_068_),
    .B(_072_),
    .Y(SUM[5]));
 sky130_fd_sc_hd__xnor2_2 _122_ (.A(B[6]),
    .B(A[6]),
    .Y(_073_));
 sky130_fd_sc_hd__and2_2 _123_ (.A(B[4]),
    .B(A[4]),
    .X(_074_));
 sky130_fd_sc_hd__and2_2 _124_ (.A(B[5]),
    .B(A[5]),
    .X(_075_));
 sky130_fd_sc_hd__nor2_2 _125_ (.A(B[5]),
    .B(A[5]),
    .Y(_076_));
 sky130_fd_sc_hd__o21ba_2 _126_ (.A1(_074_),
    .A2(_075_),
    .B1_N(_076_),
    .X(_077_));
 sky130_fd_sc_hd__and2_2 _127_ (.A(_063_),
    .B(_068_),
    .X(_078_));
 sky130_fd_sc_hd__and4_2 _128_ (.A(_066_),
    .B(_063_),
    .C(_065_),
    .D(_068_),
    .X(_079_));
 sky130_fd_sc_hd__a31o_2 _129_ (.A1(_055_),
    .A2(_064_),
    .A3(_078_),
    .B1(_079_),
    .X(_080_));
 sky130_fd_sc_hd__nor2_2 _130_ (.A(_077_),
    .B(_080_),
    .Y(_081_));
 sky130_fd_sc_hd__xor2_2 _131_ (.A(_073_),
    .B(_081_),
    .X(SUM[6]));
 sky130_fd_sc_hd__or3_2 _132_ (.A(_075_),
    .B(_076_),
    .C(_073_),
    .X(_082_));
 sky130_fd_sc_hd__a22o_2 _133_ (.A1(B[5]),
    .A2(A[5]),
    .B1(B[6]),
    .B2(A[6]),
    .X(_083_));
 sky130_fd_sc_hd__o21ai_2 _134_ (.A1(B[6]),
    .A2(A[6]),
    .B1(_083_),
    .Y(_084_));
 sky130_fd_sc_hd__o21a_2 _135_ (.A1(_071_),
    .A2(_082_),
    .B1(_084_),
    .X(_085_));
 sky130_fd_sc_hd__o31ai_2 _136_ (.A1(_061_),
    .A2(_069_),
    .A3(_082_),
    .B1(_085_),
    .Y(_086_));
 sky130_fd_sc_hd__xnor2_2 _137_ (.A(B[7]),
    .B(A[7]),
    .Y(_087_));
 sky130_fd_sc_hd__xnor2_2 _138_ (.A(_086_),
    .B(_087_),
    .Y(SUM[7]));
 sky130_fd_sc_hd__xnor2_2 _139_ (.A(B[8]),
    .B(A[8]),
    .Y(_088_));
 sky130_fd_sc_hd__nor2_2 _140_ (.A(_073_),
    .B(_087_),
    .Y(_089_));
 sky130_fd_sc_hd__a22o_2 _141_ (.A1(B[6]),
    .A2(A[6]),
    .B1(B[7]),
    .B2(A[7]),
    .X(_090_));
 sky130_fd_sc_hd__o21ai_2 _142_ (.A1(B[7]),
    .A2(A[7]),
    .B1(_090_),
    .Y(_091_));
 sky130_fd_sc_hd__a21bo_2 _143_ (.A1(_077_),
    .A2(_089_),
    .B1_N(_091_),
    .X(_092_));
 sky130_fd_sc_hd__a21oi_2 _144_ (.A1(_080_),
    .A2(_089_),
    .B1(_092_),
    .Y(_093_));
 sky130_fd_sc_hd__xor2_2 _145_ (.A(_088_),
    .B(_093_),
    .X(SUM[8]));
 sky130_fd_sc_hd__xnor2_2 _146_ (.A(B[9]),
    .B(A[9]),
    .Y(_000_));
 sky130_fd_sc_hd__or2_2 _147_ (.A(_087_),
    .B(_088_),
    .X(_001_));
 sky130_fd_sc_hd__a22o_2 _148_ (.A1(B[7]),
    .A2(A[7]),
    .B1(B[8]),
    .B2(A[8]),
    .X(_002_));
 sky130_fd_sc_hd__o21ai_2 _149_ (.A1(B[8]),
    .A2(A[8]),
    .B1(_002_),
    .Y(_003_));
 sky130_fd_sc_hd__o21ai_2 _150_ (.A1(_084_),
    .A2(_001_),
    .B1(_003_),
    .Y(_004_));
 sky130_fd_sc_hd__nor3_2 _151_ (.A(_072_),
    .B(_082_),
    .C(_001_),
    .Y(_005_));
 sky130_fd_sc_hd__or2_2 _152_ (.A(_004_),
    .B(_005_),
    .X(_006_));
 sky130_fd_sc_hd__xnor2_2 _153_ (.A(_000_),
    .B(_006_),
    .Y(SUM[9]));
 sky130_fd_sc_hd__xnor2_2 _154_ (.A(B[10]),
    .B(A[10]),
    .Y(_007_));
 sky130_fd_sc_hd__a22o_2 _155_ (.A1(B[8]),
    .A2(A[8]),
    .B1(B[9]),
    .B2(A[9]),
    .X(_008_));
 sky130_fd_sc_hd__o21ai_2 _156_ (.A1(B[9]),
    .A2(A[9]),
    .B1(_008_),
    .Y(_009_));
 sky130_fd_sc_hd__o31ai_2 _157_ (.A1(_088_),
    .A2(_091_),
    .A3(_000_),
    .B1(_009_),
    .Y(_010_));
 sky130_fd_sc_hd__nor2_2 _158_ (.A(_088_),
    .B(_000_),
    .Y(_011_));
 sky130_fd_sc_hd__o211a_2 _159_ (.A1(_077_),
    .A2(_080_),
    .B1(_089_),
    .C1(_011_),
    .X(_012_));
 sky130_fd_sc_hd__or2_2 _160_ (.A(_010_),
    .B(_012_),
    .X(_013_));
 sky130_fd_sc_hd__xnor2_2 _161_ (.A(_007_),
    .B(_013_),
    .Y(SUM[10]));
 sky130_fd_sc_hd__xnor2_2 _162_ (.A(B[11]),
    .B(A[11]),
    .Y(_014_));
 sky130_fd_sc_hd__or2_2 _163_ (.A(_000_),
    .B(_007_),
    .X(_015_));
 sky130_fd_sc_hd__nor2_2 _164_ (.A(_001_),
    .B(_015_),
    .Y(_016_));
 sky130_fd_sc_hd__a22o_2 _165_ (.A1(B[9]),
    .A2(A[9]),
    .B1(B[10]),
    .B2(A[10]),
    .X(_017_));
 sky130_fd_sc_hd__o21ai_2 _166_ (.A1(B[10]),
    .A2(A[10]),
    .B1(_017_),
    .Y(_018_));
 sky130_fd_sc_hd__o21ai_2 _167_ (.A1(_003_),
    .A2(_015_),
    .B1(_018_),
    .Y(_019_));
 sky130_fd_sc_hd__a21o_2 _168_ (.A1(_086_),
    .A2(_016_),
    .B1(_019_),
    .X(_020_));
 sky130_fd_sc_hd__xnor2_2 _169_ (.A(_014_),
    .B(_020_),
    .Y(SUM[11]));
 sky130_fd_sc_hd__xnor2_2 _170_ (.A(B[12]),
    .B(A[12]),
    .Y(_021_));
 sky130_fd_sc_hd__nor2_2 _171_ (.A(_007_),
    .B(_014_),
    .Y(_022_));
 sky130_fd_sc_hd__inv_2 _172_ (.A(_022_),
    .Y(_023_));
 sky130_fd_sc_hd__nand2_2 _173_ (.A(_011_),
    .B(_022_),
    .Y(_024_));
 sky130_fd_sc_hd__nand2_2 _174_ (.A(B[10]),
    .B(A[10]),
    .Y(_025_));
 sky130_fd_sc_hd__nand2_2 _175_ (.A(B[11]),
    .B(A[11]),
    .Y(_026_));
 sky130_fd_sc_hd__nor2_2 _176_ (.A(B[11]),
    .B(A[11]),
    .Y(_027_));
 sky130_fd_sc_hd__a21o_2 _177_ (.A1(_025_),
    .A2(_026_),
    .B1(_027_),
    .X(_028_));
 sky130_fd_sc_hd__o221a_2 _178_ (.A1(_009_),
    .A2(_023_),
    .B1(_024_),
    .B2(_093_),
    .C1(_028_),
    .X(_029_));
 sky130_fd_sc_hd__xor2_2 _179_ (.A(_021_),
    .B(_029_),
    .X(SUM[12]));
 sky130_fd_sc_hd__xnor2_2 _180_ (.A(B[13]),
    .B(A[13]),
    .Y(_030_));
 sky130_fd_sc_hd__or2_2 _181_ (.A(_014_),
    .B(_021_),
    .X(_031_));
 sky130_fd_sc_hd__nor2_2 _182_ (.A(_015_),
    .B(_031_),
    .Y(_032_));
 sky130_fd_sc_hd__a22o_2 _183_ (.A1(B[11]),
    .A2(A[11]),
    .B1(B[12]),
    .B2(A[12]),
    .X(_033_));
 sky130_fd_sc_hd__o21a_2 _184_ (.A1(B[12]),
    .A2(A[12]),
    .B1(_033_),
    .X(_034_));
 sky130_fd_sc_hd__a2bb2o_2 _185_ (.A1_N(_018_),
    .A2_N(_031_),
    .B1(_032_),
    .B2(_004_),
    .X(_035_));
 sky130_fd_sc_hd__a211o_2 _186_ (.A1(_005_),
    .A2(_032_),
    .B1(_034_),
    .C1(_035_),
    .X(_036_));
 sky130_fd_sc_hd__xnor2_2 _187_ (.A(_030_),
    .B(_036_),
    .Y(SUM[13]));
 sky130_fd_sc_hd__xnor2_2 _188_ (.A(B[14]),
    .B(A[14]),
    .Y(_037_));
 sky130_fd_sc_hd__nor2_2 _189_ (.A(_021_),
    .B(_030_),
    .Y(_038_));
 sky130_fd_sc_hd__a21oi_2 _190_ (.A1(_025_),
    .A2(_026_),
    .B1(_027_),
    .Y(_039_));
 sky130_fd_sc_hd__o211a_2 _191_ (.A1(B[13]),
    .A2(A[13]),
    .B1(B[12]),
    .C1(A[12]),
    .X(_040_));
 sky130_fd_sc_hd__a221o_2 _192_ (.A1(B[13]),
    .A2(A[13]),
    .B1(_039_),
    .B2(_038_),
    .C1(_040_),
    .X(_041_));
 sky130_fd_sc_hd__a31o_2 _193_ (.A1(_010_),
    .A2(_022_),
    .A3(_038_),
    .B1(_041_),
    .X(_042_));
 sky130_fd_sc_hd__a31o_2 _194_ (.A1(_012_),
    .A2(_022_),
    .A3(_038_),
    .B1(_042_),
    .X(_043_));
 sky130_fd_sc_hd__xnor2_2 _195_ (.A(_037_),
    .B(_043_),
    .Y(SUM[14]));
 sky130_fd_sc_hd__nor2_2 _196_ (.A(_030_),
    .B(_037_),
    .Y(_044_));
 sky130_fd_sc_hd__and2b_2 _197_ (.A_N(_031_),
    .B(_044_),
    .X(_045_));
 sky130_fd_sc_hd__o211a_2 _198_ (.A1(B[14]),
    .A2(A[14]),
    .B1(B[13]),
    .C1(A[13]),
    .X(_046_));
 sky130_fd_sc_hd__a221o_2 _199_ (.A1(B[14]),
    .A2(A[14]),
    .B1(_034_),
    .B2(_044_),
    .C1(_046_),
    .X(_047_));
 sky130_fd_sc_hd__a21o_2 _200_ (.A1(_019_),
    .A2(_045_),
    .B1(_047_),
    .X(_048_));
 sky130_fd_sc_hd__a31o_2 _201_ (.A1(_086_),
    .A2(_016_),
    .A3(_045_),
    .B1(_048_),
    .X(_049_));
 sky130_fd_sc_hd__xnor2_2 _202_ (.A(B[15]),
    .B(A[15]),
    .Y(_050_));
 sky130_fd_sc_hd__xnor2_2 _203_ (.A(_049_),
    .B(_050_),
    .Y(SUM[15]));
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
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
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
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_91 ();
endmodule
