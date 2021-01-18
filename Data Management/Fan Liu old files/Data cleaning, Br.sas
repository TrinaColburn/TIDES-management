OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=120 PS=60 label=1;* FORMDLIM ='-';

/* Report date */
%let date=0513;* last run 0413 0213, 1212;	
%let dst=v1_0513; *v1_0413 v1_0213, v1_1212;

*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<;
LIBNAME indata "J:\PM\TIDES\Data\Reports\ForReport\";
LIBNAME outdata "J:\PM\TIDES\Data\DataFiles\Ages\";

footnote;

PROC FORMAT;
VALUE CNTFMT 6='UCSF' 7='UMN' 8='URMC' 9='UW';
VALUE SUBFMT 1='Pilot' 0='Subject' 2='Dropped';
value smpfmt 1='Subject' 2='Pilot' 3='Suppl';
value smp2fmt 1='Main' 2='Suppl';
value sexfmt 1='Boy' 2='Girl';
value q1fmt  0='Not_Yet' 1='Done' 2='Dropped';
RUN;
ods listing;

ods trace off;
/* ================================ Import BR Exam data and make report =============================================== */
data ex;
set indata.br_exam_&date;
by subid;
ExmIn=1;

if smp in(1,2) then Sample=1;
if smp=3 then sample=2;
/* ---------- data excluded ------------- */
if ExamDate ne . and Center ne .;   * <<<<< excluding 8: #0 #0 #PS7M061 PS7M062 PS7M063 PS7M064 PS7M065 (training) and S1M003;
if sample=1; *<<<<<<<<<<  without Supplemental ;

if substr(subid,1,1) ^in ('P') then do; 
StudyID=substr(subid,1,4);
IndvID=substr(subid,5,1);
end;
if substr(subid,1,1) in ('P') then do; 
StudyID=substr(subid,1,5);
IndvID=substr(subid,6,1);
end;
format center cntfmt. sample smp2fmt. ExamDate MMDDYY.;
proc sort data=ex; by StudyID; 
proc contents varnum data=ex;
run;
data exdup; set ex; by StudyID;
if ^(first.StudyID & last.StudyID) then dup=1;
run;

/* dups 70743 */
proc print data=exdup n;
where IndvID ne '2'; * ---- 82241;
var subid StudyID IndvID DOB sample examdate;
run;
proc print data=exdup n;
where dup=1;
var subid StudyID IndvID DOB sample examdate;
run;

/* ================================ Import Birth Record data  =============================================== */
ods listing;
data br;*(keep=BrID StudyID center BRin Date_of_Delivery GestAge_wk GestAge_day BRsex BirthWeight_kg);
set indata.br_record_&dst;
by subid;
BrIn=1;
/* Recode for Supplemental */
if smp in(1,2) then Sample=1;
if smp=3 then sample=2;

/* Recode ID for merge data */
if substr(subid,1,1) ^in ('P') then do; 
StudyID=substr(subid,1,4);
IndivID=substr(subid,5,1);
end;
if substr(subid,1,1) in ('P') then do; 
StudyID=substr(subid,1,5);
IndivID=substr(subid,6,1);
end;

rename SubID=BrID 
       sex=BRsex
       Birthweight__kg_=BirthWeight_kg;

/* ---------- data excluded ------------- */
if sex ne .; *<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<;
if sample=1; *<<<<<<<<<<  without Supplemental ;
/* BR data (EXCLUDING TWINS AND TRIPLETES) */
proc sort data=br; by StudyID;
run;
data brdup; set br; by StudyID;
if ^(first.StudyID & last.StudyID) then dup=1;
run;
/* dup: 70742 70743, 71682, 92012*/
proc print data=br n;
where IndivID ne '2';
var Brid StudyID IndivID;
run;
proc print data=brdup n;
where dup=1;
var Brid StudyID IndivID;
run;

/* ---------------------------------- merged data ----------------------- */
data both;
merge EX(in=inEX) br(in=inBR);
by StudyID;
if ^(first.studyid and last.studyid) then dup=1;
if first.studyid then ChkSmp=1; * -------------- number of no duplicate;
/* ---------------------- */
if inex and inbr then chknum=1;
if inex and ^inbr then chknum=2;
if ^inex and inbr then chknum=3;

proc sort; by studyid;
*proc contents data=all varnum;
run;

data check;
set both;
if ChkSmp=1;
run;
/* check number in EXAM and BR */
proc freq data=both;
tables chknum;
run;
/* --------- ID with Exam done but no birth record review form, 81822, 81862 as of 05-15-13  ---------------- */
proc print data=both n noobs;
where chknum=2;
var subid;
title " TIDES infants with EXAM done but no Birth Record Review form entered, &sysdate";
run;
