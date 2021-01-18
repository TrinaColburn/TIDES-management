
OPTIONS REPLACE NODATE PAGENO=1 linesize=128 pagesize=90 FORMDLIM="-";

LIBNAME OUTQDATA "J:\PM\TIDES\Data\Portal_Q Data\SAS data set\";
LIBNAME outdata "J:\PM\TIDES\Data\Reports\ForReport\";

%LET DST=071113; * Q1 data, last run 050613 021513(for 3/21/13 report) 012913 042512 012512;
%LET DATE=0513; *Last run 0213 0412 0212;

/* RUN Q1 formats */
%INCLUDE "J:\TIDES\Data\Portal_Q Data\Code\Q1_FORMAT.sas";

proc format;
value Ethfmt  . = 'Unknown' 1='Hispanic or Latino' 2='Not Hispanic or Latino';
value racefmt 1='Black or African-American' 
			  2='Asian' 
              3='Hispanic or Latino, no race specified'
              4='American Indian or Alaska Native'
			  5='Native Hawaiian or Pacific Islan'
			  6='White'
			  7='More than one race'
			  8='Other'
              9='Unknown';
 value cntfmt 6='UCSF' 7='UMN' 8='UR' 9='UW';
 value smpfmt 1='Subject' 2='Pilot' 3='Suppl';
 value sexfmt 1='Boy' 2='Girl';
 value ynfmt  1='Yes' 0='No';
run;

footnote;

/* ---- (keep=Study_ID center Ethnicity Q48a Q48b Q48c Q48d Q48e Q48f Q48max Portal_Race)---- */
data Q(keep=StudyID center Q47_Ethnic Q48a Q48b Q48c Q48d Q48e Q48f Q48_Race dropped);
set OUTQDATA.Qrace_&DST; * created from 'For Anul Meeting Report-Ethnic and Race, 0312.SAS'; 
*rename Ethnicity=Ethnicity_Q;
format center cntfmt. Q47_Ethnic ethfmt. Q48_Race racefmt. dropped ynfmt.;
proc sort; by studyid;
proc contents data=Q;* varnum;
run;

proc freq data=Q;
tables Q47_Ethnic Q48_Race/missing;
run;

/* ============================================ */
OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=120 PS=68 label=1 FORMDLIM =' ';
title;
data _null_;
file print;
put @15 "=========================================================================================="/;
put @25 " TIDES subjects unreported or missing on Ethnicity and Race, &sysdate"/;
put @15 "==========================================================================================";
run;
title1 " +++++++++++++++++++++ WOMEN (missing on Q1 ) +++++++++++++++++++++++";
title2 " ";
title3 " ++++++++++++ Missing on Ethnicity ++++++++++";
title4 " ";
proc sort data=Q; by center studyid Q48_Race;
proc print data=q n noobs;
where Q47_Ethnic=. ;
var studyid center Q47_Ethnic Q48_Race dropped;
run;
title1 " ++++++++++++ Missing on Race ++++++++++";
title2 " ";
proc sort data=Q; by center studyid Q47_Ethnic;
proc print data=q n noobs;
where Q48_Race=9;
var studyid center Q47_Ethnic Q48_Race dropped;
proc sort data=Q; by studyid;
run;

/* -----   ------- */
proc sort data=OUTQDATA.ExamRace_&DST; by studyid;
data exam(keep=subid StudyID center Sex ExamEthnicity ExmRace smp Cohort dropped);
merge OUTQDATA.ExamRace_&DST(in=inexm) Q(keep=studyid dropped); * created from 'For Anul Meeting Report-Ethnic and Race, 0312.SAS';
by studyid;
if inexm;
if Cohort ne 'Supplemental Cohort';
/* recode Ethnicity to num */
if Ethnicity='Hispanic or Latino' then ExamEthnicity=1;
if Ethnicity='Not Hispanic or Latino' then ExamEthnicity=2;
if Ethnicity='Unknown' then ExamEthnicity=.;

rename race2=ExamRaceSpecify;
format center cntfmt. sex sexfmt. ExamEthnicity ethfmt. ExmRace racefmt.;
proc sort; by studyid;
proc contents data=exam varnum;
run;

proc freq data=exam;
tables ExamEthnicity ExmRace/missing;
run;

title1 " +++++++++++++++++++++ BABY (missing on Exam data) +++++++++++++++++++++++";
title2 " ";
title3 " ++++++++++++ Missing on Ethnicity ++++++++++";
title4 " ";
proc sort data=exam; by center studyid Q48_Race;
proc print data=exam n noobs;
where ExamEthnicity=. ;
var studyid center sex ExamEthnicity ExmRace dropped;
run;
title1 " ++++++++++++ Missing on Race ++++++++++";
title2 " ";
proc sort data=exam; by center studyid ExamEthnicity;
proc print data=exam n noobs;
where ExmRace=9;
var studyid center sex ExamEthnicity ExmRace dropped;
proc sort data=exam; by studyid;
run;


data all;
merge q(in=inq) exam(in=ine);
by studyid;

if ^inq and ine then dset='in Exam only';
if inq and ^ine then dset='in Q only';
if inq and ine then dset='in both';
proc sort nodupkey; by studyid;
run;

/* ---------------- */
proc freq data=all;
tables dset/missing;
run;

/* ---------------- */
proc freq data=all;
where dset='in both';
tables Q47_Ethnic*ExamEthnicity Q48_Race*ExmRace/nocol norow nopercent missing;
run;


* ????????????????;
proc print data=all n;
where dset='in Exam only';
run;

OPTIONS REPLACE NODATE PAGENO=1 linesize=188 pagesize=90 FORMDLIM="=";
/* check Ethnicity */
proc print data=all n noobs;
where (Ethnicity_Q ne Ethnicity_Exam) and (Ethnicity_Exam ne .);
var studyid center sex Ethnicity_Q Ethnicity_Exam Portal_Race ExmRace ExamRaceSpecify;
TITLE 'TIDES, Ethnicity not equaL in Q1 and in BIRTH EXAM';	
run;

/* More than one race */
proc print data=all n noobs;
where Portal_Race=7;
var studyid center sex Ethnicity_Q Ethnicity_Exam Portal_Race ExmRace ExamRaceSpecify Q48max RaceMax;
TITLE 'MORE THEN ONE RACE';	
run;

/* Other */
proc print data=all n noobs;
where Portal_Race=8;
var studyid center sex Ethnicity_Q Ethnicity_Exam Portal_Race ExmRace ExamRaceSpecify Q48max RaceMax;
TITLE 'OTHER RACE';	
run;

/* Unkown */
proc print data=all n noobs;
where Portal_Race=9;
var studyid center sex Ethnicity_Q Ethnicity_Exam Portal_Race ExmRace ExamRaceSpecify Q48max RaceMax;
TITLE 'RACE UNKNOWN';	
run;







