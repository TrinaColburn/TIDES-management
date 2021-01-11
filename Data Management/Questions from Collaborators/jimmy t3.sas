libname q1 "J:\PM\TIDES_Data\TIDES I Data\Q1"; run;
libname q2 "J:\PM\TIDES_Data\TIDES I Data\Q2"; run;
libname q3 "J:\PM\TIDES_Data\TIDES I Data\Q3"; run;

data Q1_20190514; set q1.Q1_20190514; run;
data  Q2_22119; set q2.Q2_22119; run;
data  Q3_22119; set q3.Q3_22119; run;

proc contents data=work._all_ order=varnum; run;

proc univariate data=work.Q1_20190514 notabcontents;
var T1_Q2_ht_in_Recode T1_Q2_wt_lbs_Recode T1_Q3_wt_lbs_Recode; run;

proc univariate data=work.Q3_22119 notabcontents;
var T3_Q2_wt_lbs_Recode T3_Q3_ht_in_Recode; run;

proc univariate data=work.Q3_22119 notabcontents;
var T3_Q2_wt_lbs_Recode; run;

proc freq data=work.Q3_22119;
table study_id*T3_Q1_wks_recode/nocum nopercent norow nocol;
where T3_Q1_wks_recode > 39; run;

proc print data=work.Q3_22119;
where study_id=9045; run; 

proc freq data=work.Q1_20190514;
table study_id*(T1_Q2_wt_lbs_Recode T1_Q3_WT_LBS
T1_Q3_WT_KG
T1_Q3_wt_lbs_Recode)/nocum nopercent norow nocol;
where study_id=7129; run;

proc freq data=work.Q1_20190514;
table study_id*T1_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where . < T1_Q2_wt_lbs_Recode < 105;
run;

proc freq data=work.Q3_22119;
table study_id*T3_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where study_id=7078 or 
	  study_id=7110 or 
	  study_id=8016 or 
	  study_id=8050 or study_id=8071 
or study_id=8112 or study_id=9033 or study_id=9147 or study_id=9163 or study_id=9176;
run;

proc freq data=work.Q1_20190514;
table study_id*T1_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where study_id=	6014 or study_id=	6083	or
	  study_id=	6084 or study_id=	6087	or
	  study_id=	6091 or study_id=	6094	or
	  study_id=	6096 or study_id=	6101	or
	  study_id=	6103 or study_id=	6104	or
      study_id=	7001 or study_id=	7002	or
	  study_id=	7093 or study_id=	7106	or
      study_id=	7109 or study_id=	7110	or
	  study_id=	7111 or study_id=	7114	or
	  study_id=	7117 or study_id=	7118	or
      study_id=	7121 or study_id=	7124	or
	  study_id=	7126 or study_id=	7127	or
	  study_id=	7129 or study_id=	7134	or
	  study_id=	8113 or study_id=	8115	or
	  study_id=	8116 or study_id=	8118	or
	  study_id=	8127 or study_id=	8128	or
	  study_id=	8130 or study_id=	8134	or
      study_id=	8135 or study_id=	8150	or
	  study_id=	9081 or study_id=	9082	or
	  study_id=	9083 or study_id=	9084	or
	  study_id=	9085 or	study_id=	9087	or
	  study_id=	9094 or study_id=	9098	or study_id=	9101;
run;




proc freq data=work.Q1_20190514;
table study_id*(T1_Q2_wt_lbs_Recode T1_Q3_wt_lbs_Recode)/nocum nopercent norow nocol;
where T1_Q2_wt_lbs_Recode > 300; run;

proc univariate data=work.Q3_22119;
var T3_Q2_wt_lbs_Recode

proc freq data=work.Q3_22119;
table study_id*T3_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where T3_Q2_wt_lbs_Recode > 300; run;

proc freq data=work.Q3_22119;
table study_id*T3_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where . < T3_Q2_wt_lbs_Recode < 100; run;

/*9023 9030 7050*/
proc freq data=work.Q1_20190514;
table study_id*(T1_Q2_wt_lbs_Recode T1_Q3_wt_lbs_Recode)/nocum nopercent norow nocol;
where study_id=6093; run;

proc freq data=work.Q3_22119;
table study_id*T3_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where study_id=7050; run;


proc freq data=work.Q1_20190514;
table study_id*T1_Q2_ht_in_Recode/nocum nopercent norow nocol;
where T1_Q2_ht_in_Recode > 72;
run;

/*6040 6117 8160 8172  9016*/


proc freq data=work.Q1_20190514;
table study_id*(T1_Q2_HT_CM
T1_Q2_HT_FT
T1_Q2_HT_IN
T1_Q2_ht_in_Recode)/nocum nopercent norow nocol;
where study_id=8172;
run;

/*9051*/

proc freq data=work.Q3_22119;
table study_id*T3_Q3_ht_in_Recode/nocum nopercent norow nocol; 
where study_id=9051;
run;

proc freq data=work.Q1_20190514;
table study_id*T1_Q2_wt_lbs_Recode/nocum nopercent norow nocol;
where . < T1_Q2_wt_lbs_Recode < 105;
run;

proc contents data=tmp2.Tides_sg969_1113 order=varnum; run;

proc means data=tmp2.Tides_sg969_1113; 
var T1_UrineSG1 T1_UrineSG2 T2_UrineSG1  T2_UrineSG2 T3_UrineSG1 T3_UrineSG2;
run;

data Tides_sg969_1113; set tmp2.Tides_sg969_1113;
if studyid='7047' then delete; run;
