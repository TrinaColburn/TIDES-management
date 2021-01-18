OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=100 PS=60 label=1 FORMDLIM ='-';

/* Report date */
%let date=0312;									*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<;

LIBNAME indata "J:\TIDES\Data\Reports\ForReport\";

PROC FORMAT;
VALUE CNTFMT 6='UCSF' 7='UMN' 8='URMC' 9='UW';
VALUE SUBFMT 1='Pilot' 0='Subject';
value smpfmt 1='Subject' 2='Pilot' 3='Suppl';
value smp2fmt 1='Main' 2='Suppl';
value sexfmt 1='Boy' 2='Girl';
value q1fmt  0='Not_Yet' 1='Done' 2='Dropped';
RUN;
ods listing;
/* ============================== Import BR Exam data  =============================================== */
data examin(keep=subid center studyid BabyID sex cohort examdate Last_Digit dup Smp);
set indata.br_exam_&date;
by subid;
if substr(subid,1,1) ^in ('S','P'); 
StudyID=substr(subid,1,4);
/* check last coding for id */
if substr(subid,1,1) ^in ('S','P') then do; BabyID=substr(subid,5,1); if babyid ^='2' then Last_Digit='Please check'; end;
/* check duplicate */
if ^(first.subid and last.subid) then dup='Dup';
if studyid='7074' then dup='Dup';
format sex sexfmt. center cntfmt.;
proc sort data=examin;by studyid;
proc contents data=examin varnum;
run;

/* check last coding for studyid and duplicates (#7074 #8113 #9045) */
proc print n data=examin noobs;
where Last_Digit='Please check' or subid='70742' or  dup='Dup';
var subid studyid center babyid sex examdate Last_Digit dup;
title1 "Table 1, TIDES baby whose ID last digit need to be fixed in Exam spreadsheet , &sysdate ";
title2 " -------------------------------------------------------------------------------------- ";
run;

/* ============================== Import Subject tracking data  =============================================== */
DATA trakin(KEEP=study_id StudyID center subt CENTER ConsentDate InfantDOB EDD Q1Date Q2date BirthExamDate Dday Q1); 
SET indata.sub_trck_rpt_&date;
if substr(study_id,1,1) ^in ('P');
StudyID=substr(study_id,1,4);
if substr(study_id,1,1) ^in ('P') and substr(study_id,5,1) ^= '1' then subt=1;

if Dday= . and Q1date ne . then Q1=1;
else if Dday= . and Q1date  = . then Q1=0;
else Q1=2;

format ConsentDate MONYY. CENTER cntfmt. sub subfmt. Q1 q1fmt.;
proc sort;by studyid;run;
proc contents data=trakin varnum;
run;

proc print n data=trakin;
where subt =1;
var studyid study_id subt;
run;

data baby;
merge examin(in=ine) trakin(in=int);
TwoMonth_Pass_DOB=InfantDOB+60;
if infantDOB ^= . and Examdate =. then do;
if TwoMonth_Pass_DOB > today() then If_Pass='Comming Soon';
if TwoMonth_Pass_DOB <= today() then If_Pass='Passed';
end;
by studyid;
format TwoMonth_Pass_DOB mmddyy.;
run;

/* ExamDate not the same in Exam and Tracking data */
proc print n data=baby noobs;
where Examdate ^= birthexamdate;
var studyid center EDD InfantDOB babyid sex examdate birthexamdate ;
title1 " Table 2, baby whose Exam Date not equal in Exam spreadsheet and in Tracking data, &sysdate ";
title2 " ------------------------------------------------------------------------------------------ ";
run;

/* Infant DOB missing (ExamDate assigned) */
proc print n data=baby noobs;
where infantDOB = . and Examdate ^=.;
var studyid center EDD InfantDOB babyid sex examdate birthexamdate ;
title1 "Table 3, TIDES baby who have Exam done but no DOB in Tracking data speadsheet, &sysdate ";
title2 " -------------------------------------------------------------------------------------- ";
run;

/* Infant DOB but ExamDate missing */
OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=120 PS=60 label=1 FORMDLIM ='-';
proc print n data=baby noobs;
where infantDOB ^= . and Examdate =.;
var studyid center EDD InfantDOB babyid sex examdate TwoMonth_Pass_DOB If_Pass birthexamdate Q1 Dday;
title1 "Table 4, TIDES baby have not done BIRTH EXAM but have two months after DOB, &sysdate ";
title2 " ----------------------------------------------------------------------------------- ";
run;


