libname tidesI "J:\PM\TIDES_Data\REDCap Master Database\TIDES I"; run;

data work.Q2_22119_forimport; set tidesi.Q2_22119; run;

%macro tx(no, insem, ovi, egg, other, ab, parent, xy);
/*finding the ppt who have NO response for TX*/
data work.Q2_22119_forimport; set work.Q2_22119_forimport; 
if &no=. and &INSEM=. and &OVI=. and &EGG=. and &other=. then &ab=1; 
run;

/*double checking # of missing*/
proc freq data=work.Q2_22119_forimport;
table &ab/nocum nocol norow nopercent;
run;

/*flagging the people who answered outcome but did not specify a tx*/
data work.Q2_22119_forimport; set work.Q2_22119_forimport;
if &parent ne . and &ab=1 then &xy=1;
run;

/*double check people who fulfill the above condition*/
proc freq data=work.Q2_22119_forimport;
table &xy/nocum nocol norow nopercent;
run;


/*scanning to make sure the people truly did not specify a tx
despite answering outcome*/
proc print data=work.Q2_22119_forimport noobs ;
var study_id &parent &NO &INSEM &OVI &EGG &other
&ab &xy;
where &xy=1;
run; 
%mend;

%tx(T2_Q12B_2_TX_NO, T2_Q12B_2_TX_INSEM, T2_Q12B_2_TX_OVINDUCT,	T2_Q12B_2_tx_EGGDONATION, 
	T2_Q12B_2_TX_other, T2_Q12B_2_TX_Flag, T2_Q12B_2_OUTCOME, T2_Q12B_2_TX_Flag_two);

%tx(T2_Q12B_3_TX_NO, T2_Q12B_3_TX_INSEM, T2_Q12B_3_TX_OVINDUCT,	T2_Q12B_3_tx_EGGDONATION,
	T2_Q12B_3_TX_other,	T2_Q12B_3_TX_Flag, T2_Q12B_3_OUTCOME, T2_Q12B_3_TX_Flag_two);

%tx(T2_Q12B_4_TX_NO, T2_Q12B_4_TX_INSEM, T2_Q12B_4_TX_OVINDUCT,	T2_Q12B_4_tx_EGGDONATION,
	T2_Q12B_4_TX_other, T2_Q12B_4_TX_Flag, T2_Q12B_4_OUTCOME, T2_Q12B_4_TX_Flag_two);

%tx(T2_Q12B_5_TX_NO, T2_Q12B_5_TX_INSEM, T2_Q12B_5_TX_OVINDUCT,	T2_Q12B_5_tx_EGGDONATION,
	T2_Q12B_5_TX_other,	T2_Q12B_5_TX_Flag, T2_Q12B_5_OUTCOME, T2_Q12B_5_TX_Flag_two);

%tx(T2_Q12B_6_TX_NO, T2_Q12B_6_TX_INSEM, T2_Q12B_6_TX_OVINDUCT,	T2_Q12B_6_tx_EGGDONATION,
	T2_Q12B_6_TX_other,	T2_Q12B_6_TX_Flag, T2_Q12B_6_OUTCOME, T2_Q12B_6_TX_Flag_two);

%tx(T2_Q12B_7_TX_NO, T2_Q12B_7_TX_INSEM, T2_Q12B_7_TX_OVINDUCT, T2_Q12B_7_tx_EGGDONATION,
	T2_Q12B_7_TX_other, T2_Q12B_7_TX_Flag, T2_Q12B_7_OUTCOME, T2_Q12B_7_TX_Flag_two	);

%tx(T2_Q12B_8_TX_NO, T2_Q12B_8_TX_INSEM, T2_Q12B_8_TX_OVINDUCT,	T2_Q12B_8_tx_EGGDONATION,
	T2_Q12B_8_TX_other, T2_Q12B_8_TX_Flag, T2_Q12B_8_OUTCOME, T2_Q12B_8_TX_Flag_two);

%tx(T2_Q12B_9_TX_NO, T2_Q12B_9_TX_INSEM, T2_Q12B_9_TX_OVINDUCT,	T2_Q12B_9_tx_EGGDONATION,
	T2_Q12B_9_TX_other, T2_Q12B_9_TX_Flag,	T2_Q12B_9_OUTCOME, T2_Q12B_9_TX_Flag_two);

%tx(T2_Q12B_10_TX_NO, T2_Q12B_10_TX_INSEM, T2_Q12B_10_TX_OVINDUCT, T2_Q12B_10_tx_EGGDONATION,
	T2_Q12B_10_TX_other, T2_Q12B_10_TX_Flag, T2_Q12B_10_OUTCOME, T2_Q12B_10_TX_Flag_two);

%tx(T2_Q12B_12_TX_NO, T2_Q12B_12_TX_INSEM, T2_Q12B_12_TX_OVINDUCT, T2_Q12B_12_tx_EGGDONATION,
	T2_Q12B_12_TX_other, T2_Q12B_12_TX_Flag, T2_Q12B_12_OUTCOME, T2_Q12B_12_TX_Flag_two);




/*Creating new variable flag three for missing both OUTCOME but not TX*/

%macro three(outcome, flagone, flagthree);
data work.Q2_22119_forimport; set work.Q2_22119_forimport;
if &outcome=. and &flagone=1 then &flagthree=1; run;
%mend;

%three(T2_Q12B_2_OUTCOME, T2_Q12B_2_TX_Flag, T2_Q12B_2_TX_Flag_3);


/*Because ppt missing for T2_Q12B_2_OUTCOME does not 
match T2_Q12B_4_TX_Flag_three=1, we need to find study_ids to recode */

/*identifying participants who answered treatment, but not outcome*/
proc freq data=work.Q2_22119_forimport;
table study_id*T2_Q12B_2_OUTCOME/missing;
where T2_Q12B_2_TX_Flag ne 1 and T2_Q12B_2_OUTCOME=.; run;

proc contents data=work.Q2_22119_forimport order=varnum; run;

/*check for lines of obs*/
%macro baby(sex, beginmo, beginyr, durmons, durwks,  outcome, tx, insem, ovi, egg, other, flag);
proc print data=work.Q2_22119_forimport noobs;
var study_id t2_q12a &sex &beginmo &beginyr &durmons	&durwks	&outcome &tx &insem	&ovi &egg &other &flag;
where &Flag ne 1 and &OUTCOME=.;
run; 
%mend;

%baby(t2_q12b_2_sex, T2_Q12B_2_begin_mo, T2_Q12B_2_begin_yr, T2_Q12B_2_DURATION_MOS, t2_q12b_2_duration_wks,	
	T2_Q12B_2_OUTCOME, T2_Q12B_2_TX_NO, T2_Q12B_2_TX_INSEM,	T2_Q12B_2_TX_OVINDUCT,	
	T2_Q12B_2_tx_EGGDONATION, T2_Q12B_2_TX_other, T2_Q12B_2_TX_Flag);

%baby(t2_q12b_3_sex, T2_Q12B_3_begin_mo, T2_Q12B_3_begin_yr, T2_Q12B_3_DURATION_MOS, t2_q12b_3_duration_wks,	
	T2_Q12B_3_OUTCOME, T2_Q12B_3_TX_NO, T2_Q12B_3_TX_INSEM,	T2_Q12B_3_TX_OVINDUCT,	T2_Q12B_3_tx_EGGDONATION,	
	T2_Q12B_3_TX_other, T2_Q12B_3_TX_Flag);
	
%baby(t2_q12b_4_sex, T2_Q12B_4_begin_mo, T2_Q12B_4_begin_yr, T2_Q12B_4_DURATION_MOS, t2_q12b_4_duration_wks,	
	T2_Q12B_4_OUTCOME, T2_Q12B_4_TX_NO, T2_Q12B_4_TX_INSEM,	T2_Q12B_4_TX_OVINDUCT,	
	T2_Q12B_4_tx_EGGDONATION, T2_Q12B_4_TX_other, T2_Q12B_4_TX_Flag);

%baby(t2_q12b_5_sex, T2_Q12B_5_begin_mo, T2_Q12B_5_begin_yr, T2_Q12B_5_DURATION_MOS, 
	t2_q12b_5_duration_wks,	T2_Q12B_5_OUTCOME, T2_Q12B_5_TX_NO, T2_Q12B_5_TX_INSEM,	T2_Q12B_5_TX_OVINDUCT,	
	T2_Q12B_5_tx_EGGDONATION, T2_Q12B_5_TX_other, T2_Q12B_5_TX_Flag);
	
%baby(t2_q12b_6_sex, T2_Q12B_6_begin_mo, T2_Q12B_6_begin_yr, T2_Q12B_6_DURATION_MOS, 
	t2_q12b_6_duration_wks,	T2_Q12B_6_OUTCOME, T2_Q12B_6_TX_NO, T2_Q12B_6_TX_INSEM,
	T2_Q12B_6_TX_OVINDUCT,	T2_Q12B_6_tx_EGGDONATION, T2_Q12B_6_TX_other, T2_Q12B_6_TX_Flag);

%baby(t2_q12b_7_sex, T2_Q12B_7_begin_mo, T2_Q12B_7_begin_yr, T2_Q12B_7_DURATION_MOS, t2_q12b_7_duration_wks,	
	T2_Q12B_7_OUTCOME, T2_Q12B_7_TX_NO, T2_Q12B_7_TX_INSEM,	T2_Q12B_7_TX_OVINDUCT,	T2_Q12B_7_tx_EGGDONATION,	
	T2_Q12B_7_TX_other, T2_Q12B_7_TX_Flag);
	
%baby(t2_q12b_8_sex, T2_Q12B_8_begin_mo, T2_Q12B_8_begin_yr, T2_Q12B_8_DURATION_MOS, t2_q12b_8_duration_wks, 
	T2_Q12B_8_OUTCOME, T2_Q12B_8_TX_NO, T2_Q12B_8_TX_INSEM,	T2_Q12B_8_TX_OVINDUCT,	
	T2_Q12B_8_tx_EGGDONATION, T2_Q12B_8_TX_other, T2_Q12B_8_TX_Flag);
	
%baby(t2_q12b_9_sex, T2_Q12B_9_begin_mo, T2_Q12B_9_begin_yr, T2_Q12B_9_DURATION_MOS, t2_q12b_9_duration_wks, 
	T2_Q12B_9_OUTCOME, T2_Q12B_9_TX_NO, T2_Q12B_9_TX_INSEM,	T2_Q12B_9_TX_OVINDUCT, T2_Q12B_9_tx_EGGDONATION, 
	T2_Q12B_9_TX_other, T2_Q12B_9_TX_Flag);

%baby(t2_q12b_10_sex, T2_Q12B_10_begin_mo, T2_Q12B_10_begin_yr,	T2_Q12B_10_DURATION_MOS, t2_q12b_10_duration_wks, 
	T2_Q12B_10_OUTCOME, T2_Q12B_10_TX_NO, T2_Q12B_10_TX_INSEM, T2_Q12B_10_TX_OVINDUCT, T2_Q12B_10_tx_EGGDONATION,	
	T2_Q12B_10_TX_other, T2_Q12B_10_TX_Flag);

%baby(t2_q12b_11_sex, T2_Q12B_11_begin_mo, T2_Q12B_11_begin_yr,	T2_Q12B_11_DURATION_MOS, t2_q12b_11_duration_wks,
	T2_Q12B_11_OUTCOME, T2_Q12B_11_TX_NO, T2_Q12B_11_TX_INSEM, T2_Q12B_11_TX_OVINDUCT, T2_Q12B_11_tx_EGGDONATION,
	T2_Q12B_11_TX_other, T2_Q12B_11_TX_Flag);

proc freq data=work.Q2_22119_forimport;
table T2_Q12B_1_OUTCOME; 
where t2_q12=1;
run;

proc print data=work.Q2_22119_forimport noobs ;
var study_id t2_q12a T2_Q12B_1_OUTCOME t2_q12b_1_sex T2_Q12B_1_begin_mo T2_Q12B_1_begin_yr T2_Q12B_1_DURATION_MOS t2_q12b_1_duration_wks	
	 		 T2_Q12B_1_TX_NO T2_Q12B_1_TX_INSEM T2_Q12B_1_TX_OVINDUCT T2_Q12B_2_tx_EGGDONATION T2_Q12B_2_TX_other;
where T2_Q12B_1_OUTCOME=0 and t2_q12=1;
run; 


proc print data=work.Q2_22119_forimport noobs ;
var study_id T2_Q12B_4_OUTCOME T2_Q12B_4_TX_NO T2_Q12B_4_TX_INSEM T2_Q12B_4_TX_OVINDUCT
T2_Q12B_4_tx_EGGDONATION T2_Q12B_4_TX_other
T2_Q12B_4_TX_Flag T2_Q12B_4_TX_Flag_two T2_Q12B_4_TX_Flag_three;
where study_id=9065;
run; 


data work.Q2_22119_forimport; set work.Q2_22119_forimport;
if ; run;

data work.Q2_22119_forimport; set work.Q2_22119_forimport;
drop T2_Q12B_2_TX_Flag_three; run;
