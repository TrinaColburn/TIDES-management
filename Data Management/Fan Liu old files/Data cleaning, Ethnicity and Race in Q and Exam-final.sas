*OPTIONS FORMCHAR="|----|+|---+=|-/\<>*";
OPTIONS REPLACE NODATE PAGENO=1 linesize=108 pagesize=90 FORMDLIM="=";

/* Report date */
%LET Q1date=071113; * Q1 data, last run 050613 021513(for 3/21/13 report) 012913 042512 012512;
%let Trkdate=0314; *1113, 0813, 0513, 0413 0213; *1212;	
%let EXMdate=0114; * read in Exam data, last run 1013;
%let GESTdate=0314; * read in Gestational data, last run 0913;	
%let AGDdate=030714; * last run,111513_zwt, 102213_zwt, 101713_zwt, 101113_zwt, 091813 091213, 050813 040113, 013113;

proc format;
value ethfmt  1 = "Hispanic/Latino"
			  2 = "Not Hispanic/Latino"
              3 = "Unknown";
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

/* ======================= TRACKING DATA ====================== */
LIBNAME trkdata "J:\PM\TIDES\Data\Reports\ForReport\";
DATA trc(keep=StudyID center dropped MayMtSinaiContact);
SET trkdata.sub_trck_rpt_&trkdate;    if Study_ID ne '0'; * Study_ID!!!!!!!!!!;
proc sort; by studyid;
proc contents;
run;
proc print data=trc n;
run;

/* ======================= Q1 DATA ====================== */
LIBNAME Q1DATA "J:\PM\TIDES\Data\Portal_Q Data\SAS data set\";
data Q1(keep=StudyID center Q47_Ethnic Q48_Race Q48a Q48b Q48c Q48d Q48e Q48f);  
set Q1DATA.TIEDS_Q1_&Q1date;
format center cntfmt. Q47_Ethnic ethfmt. Q48_Race racefmt.;
proc sort data=Q1; by STUDYID;
proc contents data=Q1;
run;

proc print n data=Q1;
var studyid center Q47_Ethnic Q48_Race;
run;

/* -------------- CHECK IN TRACKING DATA: 75 NO Q1 DATA --------------- */ 
data all; 
merge trc(in=intrc) Q1(in=inq1);
by studyid;
if inq1;
proc sort; by studyid;
run;

proc print data=all n;
var studyid center Q47_Ethnic Q48_Race dropped MayMtSinaiContact;
run;

/* ================================================================================ */
* -------- 13 missing on Ethnicity and no missing on race;
proc freq data=all;
table Q47_Ethnic*CENTER/missing NOROW nocol nopercent;
run;

proc freq data=all;
table Q48_Race*CENTER/missing NOROW nocol nopercent;
run;

/* check multiple race category */
* ---------- 37 with multiple race;
OPTIONS REPLACE NODATE PAGENO=1 linesize=138 pagesize=90 FORMDLIM="=";
proc print data=all n noobs width=min;
where Q48_Race=7;
var studyid Q47_Ethnic Q48a Q48b Q48c Q48d Q48e Q48f Q48_Race dropped MayMtSinaiContact;
title " TIDES subjects who had multiple race categories in Q1, &sysdate";
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
proc sort data=all; by center studyid;
proc print data=all n noobs width=min;
where Q47_Ethnic=. ;
var studyid center Q47_Ethnic Q48_Race dropped MayMtSinaiContact;
run;
title1 " ++++++++++++ Missing on Race ++++++++++";
title2 " ";
proc print data=all n noobs width=min;
where Q48_Race=. ;
var studyid center Q47_Ethnic Q48_Race dropped MayMtSinaiContact;
proc sort data=all; by studyid;
run;

/* =============================Exam Data ============================ */
LIBNAME exmdata "J:\PM\TIDES\Data\Reports\ForReport\";

data baby(keep=subid studyid center Sex Ethnicity Exam_Ethnic Race race2 ExmRace RaceMax smp Cohort);
set exmdata.br_exam_&EXMdate;
if ExamDate ne . and Center ne .;   * <<<<< excluding 8: #0 #0 #PS7M061 PS7M062 PS7M063 PS7M064 PS7M065 (training) and S1M003;
if subid='70743' then delete; * no second twin included;

if Ethnicity=' ' then Ethnicity='Unknown';
/* recode Ethnicity */
if Ethnicity='Hispanic or Latino ' then Exam_Ethnic=1;
if Ethnicity='Not Hispanic or Latino ' then Exam_Ethnic=2;
if Ethnicity='Unknown' then Exam_Ethnic=3;

 /* ------ Recode race ------*/
if RACE ne ' ' and race2 = ' ' then RaceMax=1;
if RACE ne ' ' and race2 ne ' ' then RaceMax=2;

if RaceMax=. then ExmRace=9; 
if RaceMax=1 then do;
 if RACE='Black or African-American' then ExmRace=1;
 if RACE='Asian' then ExmRace=2;
 if RACE='American Indian or Alaska Native ' then ExmRace=4;   
 if RACE='Native Hawaiian or Pacific Islan' then ExmRace=5; 
 if RACE='White' then ExmRace=6;
 if RACE='Unknown or Other' then ExmRace=9; 
 end;
if RaceMax=2 then do;
 if RACE ^='Unknown or Othe' and race2 ^= ' ' then ExmRace=7;
 if RACE='Unknown or Other' and race2 ^=' ' then ExmRace=8; 
 if RACE='Unknown or Other' and race2 =' ' then ExmRace=9;  
 end;
 
if Cohort='Training' then do; center=7; Cohort='Supplemental Cohort';end;
if subid='S7F022' then Cohort='Supplemental Cohort';

format center cntfmt. sex sexfmt. smp smpfmt. Exam_Ethnic ethfmt. ExmRace racefmt.;
proc sort data=baby; by StudyID;
proc contents data=baby;
run;

/* ================================================================================ */
* -------- no missing on Ethnicity and 6 missing on race;
proc freq data=baby;
table Exam_Ethnic*CENTER/missing NOROW nocol nopercent;
run;

proc freq data=baby;
table ExmRace*CENTER/missing NOROW nocol nopercent;
run;


/* =========================Missing data for Infants ================== */
data allbaby;
merge all(in=inall) baby(in=inbaby);
by studyid;
if inbaby;
proc sort data=allbaby; by center studyid;
run;

title1 " +++++++++++++++++++++ Infants (missing on Exam ) +++++++++++++++++++++++";
title2 " ";
title3 " ++++++++++++ Missing on Ethnicity ++++++++++";
title4 " ";
proc print data=allbaby n noobs width=min;
where Exam_Ethnic=. ;
var studyid subid center Exam_Ethnic ExmRace dropped MayMtSinaiContact;
run;
title3 " ++++++++++++ Missing on Race ++++++++++";
title4 " ";
proc print data=allbaby n noobs width=min;
where ExmRace=. ;
var studyid subid center sex Exam_Ethnic ExmRace dropped MayMtSinaiContact;
proc sort data=allbaby; by studyid;
run;







/* ============================================ =========================================*/
data allsub;
merge all(in=inall) baby(in=inbaby);
by studyid;
proc sort data=allsub; by center studyid;
run;

OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=140 PS=68 label=1 FORMDLIM =' ';
title;
data _null_;
file print;
put @15 "=========================================================================================="/;
put @25 " TIDES subjects unreported or missing on Ethnicity and Race, &sysdate"/;
put @15 "==========================================================================================";
run;
title1 " +++++++++++++++++++++ Women and Infants +++++++++++++++++++++++";
title2 " ";
title3 " ++++++++++++ Missing on Ethnicity ++++++++++";
title4 " ";
proc sort data=allsub; by center studyid;
proc print data=allsub n noobs width=min;
where smp ne 3 and (Q47_Ethnic=. or Exam_Ethnic=.);
var studyid subid smp center Q47_Ethnic Exam_Ethnic Q48_Race ExmRace dropped MayMtSinaiContact;
run;
title1 " ++++++++++++ Missing on Race ++++++++++";
title2 " ";
proc print data=allsub n noobs width=min;
where smp ne 3 and (Q47_Ethnic=. or Exam_Ethnic=.);
var studyid center Q47_Ethnic Exam_Ethnic Q48_Race ExmRace dropped MayMtSinaiContact;
proc sort data=allsub; by studyid;
run;
