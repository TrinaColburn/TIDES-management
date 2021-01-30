/*identify deid subjects*/
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

%dataset(ti_echo.BIRTHEXAM_20191125_pwnyu, ti_echo.BIRTHEXAM_20191125);
%dataset(ti_echo.BRR_2019430_pwnyu, ti_echo.BRR_2019430);
%dataset(ti_echo.GESTAGES_02202019_pwnyu, ti_echo.GESTAGES_02202019);
%dataset(ti_echo.ONEYREXAM_2019430_pwnyu, ti_echo.ONEYREXAM_2019430);
%dataset(ti_echo.Q1_20190514_pwnyu, ti_echo.Q1_20190514);
%dataset(ti_echo.Q2_22119_pwnyu, ti_echo.Q2_22119);
%dataset(ti_echo.Q3_22119_pwnyu, ti_echo.Q3_22119);
%dataset(ti_echo.TI_INTERIM_2019430_pwnyu, ti_echo.TI_INTERIM_2019430);
%dataset(ti_echo.Y1_EXAM_pwnyu, ti_echo.Y1_EXAM);

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

%drop(ti_echo.BIRTHEXAM_20191125_pwnyu);
%drop(ti_echo.BRR_2019430_pwnyu);
%drop(ti_echo.GESTAGES_02202019_pwnyu);
%drop(ti_echo.ONEYREXAM_2019430_pwnyu);
%drop(ti_echo.Q1_20190514_pwnyu);
%drop(ti_echo.Q2_22119_pwnyu);
%drop(ti_echo.Q3_22119_pwnyu);
%drop(ti_echo.TI_INTERIM_2019430_pwnyu);
%drop(ti_echo.Y1_EXAM_pwnyu);

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

%dateedit(ti_echo.BIRTHEXAM_20191125_pwnyu_2, BuclDate, 		  BuclDate_monthonly, 		  BuclDate_yearonly);
%dateedit(ti_echo.BIRTHEXAM_20191125_pwnyu_2, ExamDate, 		  ExamDate_monthonly, 		  ExamDate_yearonly);
%dateedit(ti_echo.BRR_2019430_pwnyu, 		  BRR_Date, 		  BRR_Date_monthonly, 		  BRR_Date_yearonly);
%dateedit(ti_echo.BRR_2019430_pwnyu, 		  Date_of_Delivery,   Date_of_Delivery_monthonly, Date_of_Delivery_yearonly);
%dateedit(ti_echo.GESTAGES_02202019_pwnyu, 	  LiveBirthDOB, 	  LiveBirthDOB_monthonly,     LiveBirthDOB_yearonly);
%dateedit(ti_echo.GESTAGES_02202019_pwnyu, 	  TIDES_Women_LMP, 	  TIDES_Women_LMP_monthonly,  TIDES_Women_LMP_yearonly);
%dateedit(ti_echo.ONEYREXAM_2019430_pwnyu, 	  BuclDate, 		  BuclDate_monthonly, 		  BuclDate_yearonly);
%dateedit(ti_echo.ONEYREXAM_2019430_pwnyu, 	  DOB,			  	  DOB_monthonly, 			  DOB_yearonly);
%dateedit(ti_echo.ONEYREXAM_2019430_pwnyu, 	  ExamDate, 		  ExamDate_monthonly, 		  ExamDate_yearonly);
%dateedit(ti_echo.Q1_20190514_pwnyu, 		  T1_PAPERDT, 	  	  T1_PAPERDT_monthonly, 	  T1_PAPERDT_yearonly);
%dateedit(ti_echo.Q1_20190514_pwnyu, 		  T1_Q46_DOB, 	      T1_Q46_DOB_monthonly, 	  T1_Q46_DOB_yearonly);
%dateedit(ti_echo.Q1_20190514_pwnyu, 		  T1_TODAY_DT, 	      T1_TODAY_DT_monthonly, 	  T1_TODAY_DT_yearonly);
%dateedit(ti_echo.Q2_22119_pwnyu, 			  T2_PAPERDT, 	  	  T2_PAPERDT_monthonly, 	  T2_PAPERDT_yearonly);
%dateedit(ti_echo.Q2_22119_pwnyu, 			  T2_Q2_Date, 	      T2_Q2_Date_monthonly, 	  T2_Q2_Date_yearonly);
%dateedit(ti_echo.Q3_22119_pwnyu, 			  T3_PAPERDT, 	      T3_PAPERDT_monthonly, 	  T3_PAPERDT_yearonly);
%dateedit(ti_echo.Q3_22119_pwnyu, 			  T3_Q3_Date, 	      T3_Q3_Date_monthonly, 	  T3_Q3_Date_yearonly);
%dateedit(ti_echo.TI_INTERIM_2019430_pwnyu,   dob_child, 		  dob_child_monthonly, 		  dob_child_yearonly);
%dateedit(ti_echo.TI_INTERIM_2019430_pwnyu,   survey_date, 		  survey_date_monthonly, 	  survey_date_yearonly);
%dateedit(ti_echo.Y1_EXAM_pwnyu, 			  BuclDate, 		  BuclDate_monthonly, 		  BuclDate_yearonly);
%dateedit(ti_echo.Y1_EXAM_pwnyu, 			  DOB, 				  DOB_monthonly, 			  DOB_yearonly);
%dateedit(ti_echo.Y1_EXAM_pwnyu, 			  ExamDate, 		  ExamDate_monthonly, 		  ExamDate_yearonly);

data ti_echo.TI_INTERIM_2019430_pwnyu_2; set ti_echo.TI_INTERIM_2019430_pwnyu;
if newdeid=1 then q001_day=.;
if newdeid=1 then q002_day=.;
run;


/*drop newdeid - leave*/

/*export*/

/*Birth Exam*/
/*===copy/paste code======*/

/*Birth Record Review*/
PROC EXPORT DATA= ti_echo.BRR_2019430_pwnyu 
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.BRR_2019430_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Gest Ages*/
PROC EXPORT DATA= ti_echo.GESTAGES_02202019_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.GESTAGES_02202019_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*One Year Exam*/
PROC EXPORT DATA= ti_echo.ONEYREXAM_2019430_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.ONEYREXAM_2019430_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Q1*/
PROC EXPORT DATA= ti_echo.Q1_20190514_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.Q1_20190514_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Q2*/
PROC EXPORT DATA= ti_echo.Q2_22119_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.Q2_22119_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Q3*/
PROC EXPORT DATA= ti_echo.Q3_22119_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.Q3_22119_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Interim*/
PROC EXPORT DATA= ti_echo.TI_INTERIM_2019430_pwnyu_2
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.TI_INTERIM_2019430_pwnyu_2.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

/*Year One*/
PROC EXPORT DATA= ti_echo.Y1_EXAM_pwnyu
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\data dump\ti_echo.Y1_EXAM_pwnyu.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

