/*identify deid subjects*/
libname ti_pwnyu "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets"; run;

%macro dataset(new, old);

data &new; set &old;
if	Study_ID=		9005		then	newdeid=1;
if	Study_ID=		9010		then	newdeid=1;
if	Study_ID=		9012		then	newdeid=1;
if	Study_ID=		9014		then	newdeid=1;
if	Study_ID=		9016		then	newdeid=1;
if	Study_ID=		9017		then	newdeid=1;
if	Study_ID=		9018		then	newdeid=1;
if	Study_ID=		9021		then	newdeid=1;
if	Study_ID=		9025		then	newdeid=1;
if	Study_ID=		9032		then	newdeid=1;
if	Study_ID=		9036		then	newdeid=1;
if	Study_ID=		9037		then	newdeid=1;
if	Study_ID=		9042		then	newdeid=1;
if	Study_ID=		9043		then	newdeid=1;
if	Study_ID=		9046		then	newdeid=1;
if	Study_ID=		9049		then	newdeid=1;
if	Study_ID=		9050		then	newdeid=1;
if	Study_ID=		9051		then	newdeid=1;
if	Study_ID=		9053		then	newdeid=1;
if	Study_ID=		9061		then	newdeid=1;
if	Study_ID=		9063		then	newdeid=1;
if	Study_ID=		9064		then	newdeid=1;
if	Study_ID=		9066		then	newdeid=1;
if	Study_ID=		9067		then	newdeid=1;
if	Study_ID=		9071		then	newdeid=1;
if	Study_ID=		9073		then	newdeid=1;
if	Study_ID=		9087		then	newdeid=1;
if	Study_ID=		9088		then	newdeid=1;
if	Study_ID=		9089		then	newdeid=1;
if	Study_ID=		9091		then	newdeid=1;
if	Study_ID=		9095		then	newdeid=1;
if	Study_ID=		9097		then	newdeid=1;
if	Study_ID=		9099		then	newdeid=1;
if	Study_ID=		9100		then	newdeid=1;
if	Study_ID=		9101		then	newdeid=1;
if	Study_ID=		9102		then	newdeid=1;
if	Study_ID=		9103		then	newdeid=1;
if	Study_ID=		9104		then	newdeid=1;
if	Study_ID=		9107		then	newdeid=1;
if	Study_ID=		9108		then	newdeid=1;
if	Study_ID=		9109		then	newdeid=1;
if	Study_ID=		9111		then	newdeid=1;
if	Study_ID=		9112		then	newdeid=1;
if	Study_ID=		9120		then	newdeid=1;
if	Study_ID=		9122		then	newdeid=1;
if	Study_ID=		9123		then	newdeid=1;
if	Study_ID=		9124		then	newdeid=1;
if	Study_ID=		9126		then	newdeid=1;
if	Study_ID=		9133		then	newdeid=1;
if	Study_ID=		9139		then	newdeid=1;
if	Study_ID=		9140		then	newdeid=1;
if	Study_ID=		9142		then	newdeid=1;
if	Study_ID=		9146		then	newdeid=1;
if	Study_ID=		9147		then	newdeid=1;
if	Study_ID=		9150		then	newdeid=1;
if	Study_ID=		9151		then	newdeid=1;
if	Study_ID=		9152		then	newdeid=1;
if	Study_ID=		9155		then	newdeid=1;
if	Study_ID=		9157		then	newdeid=1;
if	Study_ID=		9159		then	newdeid=1;
if	Study_ID=		9160		then	newdeid=1;
if	Study_ID=		9167		then	newdeid=1;
if	Study_ID=		9168		then	newdeid=1;
if	Study_ID=		9170		then	newdeid=1;
if	Study_ID=		9171		then	newdeid=1;
if	Study_ID=		9174		then	newdeid=1;
if	Study_ID=		9175		then	newdeid=1;
if	Study_ID=		9176		then	newdeid=1;
if	Study_ID=		9179		then	newdeid=1;
if	Study_ID=		9180		then	newdeid=1;
if	Study_ID=		9181		then	newdeid=1;
if	Study_ID=		9183		then	newdeid=1;
if	Study_ID=		9186		then	newdeid=1;
if	Study_ID=		9187		then	newdeid=1;
if	Study_ID=		9189		then	newdeid=1;
if	Study_ID=		9190		then	newdeid=1;
if	Study_ID=		9193		then	newdeid=1;
if	Study_ID=		9195		then	newdeid=1;
if	Study_ID=		9198		then	newdeid=1;
if	Study_ID=		9199		then	newdeid=1;
if	Study_ID=		9203		then	newdeid=1;
if	Study_ID=		9204		then	newdeid=1;
if	Study_ID=		9206		then	newdeid=1;
if	Study_ID=		9208		then	newdeid=1;
if	Study_ID=		9210		then	newdeid=1;
if	Study_ID=		9211		then	newdeid=1;
run;

proc freq data=&new;
tables newdeid/ nocum norow nocol nopercent;
run;


proc freq data=&new;
tables study_id*newdeid/ nocum norow nocol nopercent;
where newdeid=1;
run;

%mend;

%dataset(ti_pwnyu.q1_2021128_pwnyu, q1_pw.q1_all); /*q1*/
%dataset(ti_pwnyu.q2_2021128_pwnyu, q2_pw.Q2_all); /*q2*/
%dataset(ti_pwnyu.q3_2021128_pwnyu, q3_pw.Q3_all); /*q3*/
%dataset(ti_pwnyu.Be_rc_2021128, be.Be_rc_2021128);/*BE*/
%dataset(ti_pwnyu.Brr_2021128_rc, brr_pw.Brr_2021128_rc);/*BRR*/
%dataset(ti_pwnyu.Bl_cov_2021128, cov.Bl_cov_2021128); /*BL_COV*/




/*drop 7047*/
%macro drop(pwnyu);
data &pwnyu; set &pwnyu;
if study_id=7047 then delete;
run;

proc freq data=&pwnyu;
tables study_id;
where study_id=7047;
title "&pwnyu";
run;
%mend;

%drop(ti_pwnyu.q1_2021128_pwnyu);
%drop(ti_pwnyu.q2_2021128_pwnyu);
%drop(ti_pwnyu.q3_2021128_pwnyu);
%drop(ti_pwnyu.Be_rc_2021128);
%drop(ti_pwnyu.Brr_2021128_rc);
%drop(ti_pwnyu.Bl_cov_2021128);


ods trace on; ods trace off;

proc contents data=ti_pwnyu._all_ order=varnum out=ti_variables (keep=MEMNAME name);run;

PROC EXPORT DATA= WORK.ti_Variables
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets\variable names to find dates.xlsx"
            DBMS=EXCEL REPLACE;
     		SHEET="ti variables"; RUN;

/*Drop unnecessary vars*/
data ti_pwnyu.Q2_2021128_PWNYU; set ti_pwnyu.Q2_2021128_PWNYU;
drop
t2_q12b_10_date
t2_q12b_11_date
t2_q12b_1_date
t2_q12b_2_date
t2_q12b_3_date
t2_q12b_4_date
t2_q12b_5_date
t2_q12b_6_date
t2_q12b_7_date
t2_q12b_8_date
t2_q12b_9_date; run;

/*format dates*/
data ti_pwnyu.BL_COV_2021128; set ti_pwnyu.BL_COV_2021128;
format birthexamdate mmddyy10. 
	   child_dob mmddyy10. 
	   consentdate mmddyy10. 
	   momdob mmddyy10. 
	   tides_women_lmp mmddyy10.
	   birthexamtime hhmm8.
	   birthtime hhmm8.; run;

data ti_pwnyu.BRR_2021128_RC; set ti_pwnyu.BRR_2021128_RC;
format brr_date mmddyy10. 
	   date_of_delivery mmddyy10. 
	   brr_time hhmm8.
	   time_of_delivery hhmm8.; run;

data ti_pwnyu.Q1_2021128_PWNYU; set ti_pwnyu.Q1_2021128_PWNYU;
format t1_paperdt mmddyy10. t1_q5_lmp mmddyy10. t1_today_dt mmddyy10. ; run;

	   
data ti_pwnyu.Q2_2021128_PWNYU; set ti_pwnyu.Q2_2021128_PWNYU;
format t2_paperdt mmddyy10. 
	   t2_q2_date mmddyy10. ; run;

data ti_pwnyu.Q3_2021128_PWNYU; set ti_pwnyu.Q3_2021128_PWNYU;
format t3_paperdt mmddyy10. 
	   t3_q3_date mmddyy10. ; run;

/*edit date variables where newdeid=1*/
%macro dateedit(dataset, problemvar, varmonth, varyear);
	data &dataset; set &dataset;
	if newdeid=1 then &varmonth=month(&problemvar);
	if newdeid=1 then &varyear=year(&problemvar);
	run;

	data &dataset; set &dataset;
	if newdeid=1 then &problemvar=.;
	run;

	proc freq data=&dataset;
	tables study_id*&problemvar/nocum norow nocol nopercent;
	where newdeid=1;
	run;
%mend;

/*Baseline date information*/
%dateedit(ti_pwnyu.BL_COV_2021128, 		 birthexamdate, 	be_date_monthonly,  	  be_date_yearonly);
%dateedit(ti_pwnyu.BL_COV_2021128, 		 child_dob, 		child_dob_monthonly, 	  child_dob_yearonly);
%dateedit(ti_pwnyu.BL_COV_2021128, 		 consentdate, 	    consentdate_monthonly, 	  consentdate_yearonly);
%dateedit(ti_pwnyu.BL_COV_2021128, 		 momdob, 	      	momdob_monthonly, 	  	  momdob_yearonly);
%dateedit(ti_pwnyu.BL_COV_2021128, 		 tides_women_lmp, 	_lmp_monthonly, 	  	  _lmp_yearonly);

/*BRR*/
%dateedit(ti_pwnyu.BRR_2021128_RC, 	 	 brr_date, 	  	  	  brr_date_monthonly, 	  brr_date_yearonly);
%dateedit(ti_pwnyu.BRR_2021128_RC,		 date_of_delivery, 	  dod_monthonly, 	  	  dod_yearonly);

/*Q1*/
%dateedit(ti_pwnyu.Q1_2021128_PWNYU, 	 t1_paperdt, 	      t1_paperdt_monthonly, 	  t1_paperdt_yearonly);
%dateedit(ti_pwnyu.Q1_2021128_PWNYU, 	 t1_q5_lmp, 	      t1_q5_lmp_monthonly, 	  	  t1_q5_lmp_yearonly);
%dateedit(ti_pwnyu.Q1_2021128_PWNYU, 	 t1_today_dt, 	      t1_today_dt_monthonly, 	  t1_today_dt_yearonly);

/*Q2*/
%dateedit(ti_pwnyu.Q2_2021128_PWNYU, 	t2_paperdt, 		  t2_paperdt_monthonly, 	  t2_paperdt_yearonly);
%dateedit(ti_pwnyu.Q2_2021128_PWNYU, 	t2_q2_date, 		  t2_q2_date_monthonly, 	  t2_q2_date_yearonly);

/*Q3*/
%dateedit(ti_pwnyu.Q3_2021128_PWNYU,  	T3_PAPERDT, 	      T3_PAPERDT_monthonly, 	  T3_PAPERDT_yearonly);
%dateedit(ti_pwnyu.Q3_2021128_PWNYU,  	T3_Q3_Date, 	      T3_Q3_Date_monthonly, 	  T3_Q3_Date_yearonly);

proc sort data=ti_pwnyu.BL_COV_2021128; by study_id; run; 
proc sort data=ti_pwnyu.BRR_2021128_RC; by study_id; run; 
proc sort data=ti_pwnyu.BE_RC_2021128; by study_id; run; 

data ti_pwnyu.bl_brr_be_2021128; merge ti_pwnyu.BL_COV_2021128 
									   ti_pwnyu.BRR_2021128_RC
									   ti_pwnyu.BE_RC_2021128;
by study_id; run;
									   
data ti_pwnyu.bl_brr_be_2021128; set ti_pwnyu.bl_brr_be_2021128;
drop redcap_event_name; run;

/***EXPORT****/
PROC EXPORT DATA= TI_PWNYU.Bl_brr_be_2021128 
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets\BL_BRR_BRR_2021128.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES; RUN;

PROC EXPORT DATA= TI_PWNYU.Q1_2021128_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets\Q1_2021128.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES; RUN;

PROC EXPORT DATA= TI_PWNYU.Q2_2021128_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets\Q2_2021128.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES; RUN;

PROC EXPORT DATA= TI_PWNYU.Q3_2021128_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Final datasets\Q3_2021128.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES; RUN;
