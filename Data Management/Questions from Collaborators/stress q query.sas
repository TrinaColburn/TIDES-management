/*ods pdf file="J:\PM\TIDES_Data\TIDES I Data\BirthRecordReview (BRR)\Current Clean Copy\TIDES BRR.pdf";
proc contents data=tmp1.tides_brr_02202019 order=varnum;
run;
ods pdf close;*/

libname box "J:\PM\TIDES_Data\TIDES I Data\New Bulk upload to box"; run;

proc contents data=box.Q2_22119 order=varnum;
run;

/*figure out macros*/

ods pdf file="H:\missing stress.pdf";
proc freq data=box.Q2_22119; tables study_id*	t2_q26	/nocum nopercent norow nocol; where	t2_q26	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q27	/nocum nopercent norow nocol; where	t2_q27	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q28	/nocum nopercent norow nocol; where	t2_q28	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q29	/nocum nopercent norow nocol; where	t2_q29	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q30	/nocum nopercent norow nocol; where	t2_q30	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q31	/nocum nopercent norow nocol; where	t2_q31	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q32	/nocum nopercent norow nocol; where	t2_q32	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q33	/nocum nopercent norow nocol; where	t2_q33	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q34	/nocum nopercent norow nocol; where	t2_q34	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q35	/nocum nopercent norow nocol; where	t2_q35	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q36	/nocum nopercent norow nocol; where	t2_q36	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q37	/nocum nopercent norow nocol; where	t2_q37	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q38	/nocum nopercent norow nocol; where	t2_q38	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q39	/nocum nopercent norow nocol; where	t2_q39	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q40	/nocum nopercent norow nocol; where	t2_q40	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q41	/nocum nopercent norow nocol; where	t2_q41	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q42	/nocum nopercent norow nocol; where	t2_q42	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q43	/nocum nopercent norow nocol; where	t2_q43	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q44	/nocum nopercent norow nocol; where	t2_q44	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q45	/nocum nopercent norow nocol; where	t2_q45	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q46	/nocum nopercent norow nocol; where	t2_q46	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q47	/nocum nopercent norow nocol; where	t2_q47	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q48	/nocum nopercent norow nocol; where	t2_q48	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q49	/nocum nopercent norow nocol; where	t2_q49	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q50	/nocum nopercent norow nocol; where	t2_q50	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q51	/nocum nopercent norow nocol; where	t2_q51	=0; run;
proc freq data=box.Q2_22119; tables study_id*	t2_q52	/nocum nopercent norow nocol; where	t2_q52	=0; run;
ods pdf close;

/*proc freq data=box.Q2_22119;
data stress; set box.Q2_22119;
array stress (27) t2_q26-t2_q52;
do i=1 to 27;
if stress(i)=0;
end;
drop i;
run;*/


