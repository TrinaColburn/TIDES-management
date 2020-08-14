libname q1 'J:\PM\TIDES_Data\TIDES I Data\Q1\Q1'; run;

proc freq data=q1.Q1_22119;
tables center*t1_Q19_1-t1_Q19_7;
run;

proc freq data=q1.tieds_q1_071113;
tables Q18;
run;

proc contents data=q1.Q1_22119 order=varnum; run;

proc freq data=q1.Q1_22119;
tables T1_Q43A_1_FRAG
T1_Q43A_2_FRAG
T1_Q43A_3_FRAG
T1_Q43A_4_FRAG
T1_Q43A_5_FRAG
T1_Q43B_10_FRAG
T1_Q43B_11_FRAG
T1_Q43B_1_FRAG
T1_Q43B_2_FRAG
T1_Q43B_3_FRAG
T1_Q43B_4_FRAG
T1_Q43B_5_FRAG
T1_Q43B_6_FRAG
T1_Q43B_7_FRAG
T1_Q43B_8_FRAG
T1_Q43B_9_FRAG
T1_Q43C_FRAG
T1_Q43D_FRAG
T1_Q43E_FRAG
T1_Q43F_FRAG
T1_Q43G_FRAG
T1_Q43H_FRAG
T1_Q43I_FRAG
T1_Q43J_FRAG
T1_Q43K_FRAG
;
run;
