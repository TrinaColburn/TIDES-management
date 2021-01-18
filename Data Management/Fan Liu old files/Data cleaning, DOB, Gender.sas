OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=120 PS=60 label=1;* FORMDLIM ='-';

/* Report date */
%let date=0513;* last run 0213, 1212;	
%let dst=v1_0513; * v1_0413 v1_0213, v1_1212;

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
/* ------------- Calculating Gestational AGE -------------- */
Gwk=input(Gestational_Age_at_Birth,8.);
Gday=input(GestDays,8.);
GestAge_wk=round((Gwk*7+Gday)/7);
GestAge_day=(Gwk*7+Gday);

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
/* ================================ Import tracking data  =============================================== */

data trk;* (keep=Study_ID center InfantDOB LMP EDD EDD_method EDD_US US_date MayMtSinaiContact);
set indata.sub_trck_rpt_0513;*&date;
                 if Study_ID ne '0'; *!!!!!!!!!!;
TrackIn=1;

if Dday =. then Dropped=0; else Dropped=1;

if substr(Study_ID,1,1) ^in ('P') then do; 
StudyID=trim(left(substr(Study_ID,1,4)));
IndTkID=substr(Study_ID,5,1);
end;
if substr(Study_ID,1,1) in ('P') then do; 
StudyID=trim(left(substr(Study_ID,1,5)));
IndTkID=substr(Study_ID,6,1);
end;
/* Recode Agree to Contact */
if center=7 and MayMtSinaiContact='0' then MayMtSinaiContact='no';
if center=7 and MayMtSinaiContact='1' then MayMtSinaiContact='yes';
if center=8 and MayMtSinaiContact='Yes' then MayMtSinaiContact='yes';
if center=9 and MayMtSinaiContact='0' then MayMtSinaiContact='no';
if center=9 and MayMtSinaiContact='No' then MayMtSinaiContact='no';
if center=9 and MayMtSinaiContact='URMC' then MayMtSinaiContact='yes';
if center=9 and MayMtSinaiContact='Yes' then MayMtSinaiContact='yes';

proc sort data=trk; by StudyID;
proc contents data=trk varnum;
run;

data trkdup; set trk; by StudyID;
if ^(first.StudyID & last.StudyID) then dup=1;
run;
/* dups 70743 */
proc print data=trk n;
where IndTkID ne '1'; * ---- 82241;
var Study_ID StudyID IndTkID infantDOB;
run;
proc print data=trkdup n;
where dup=1;
var Study_ID StudyID IndTkID infantDOB;
run;

/* ---------------------------------- merged data ----------------------- */
data all;
merge trk(in=inTrak) EX(in=inEX) br(in=inBR);
by StudyID;
if ^(first.studyid and last.studyid) then dup=1;
if first.studyid then ChkSmp=1; * -------------- Keep the number of 969, no duplicate;

proc sort; by studyid;
proc contents data=all varnum;
run;

/* -------------- Dup in data set -- #7074(70742-boy, 70743-girl) in EXAM, others in BR -------------------- */
proc print n data=all noobs;
where dup =1;
var subid BrID Study_ID StudyID center sex brsex examdate birthexamdate TrackIn exmin brin;
title " TIDES birth record: Twins and triplets, &sysdate ";
run;

/* --------------------- check Exam date in Tracking and Exam data sheets ----------------------------- */
data check;
set all;
if ChkSmp=1;
/* Calculating */
diff_ExmBr=DOB-Date_of_Delivery;
diff_ExmTrk=DOB-infantDOB;
diff_BrTrk=Date_of_Delivery-InfantDOB;

rename DOB=DOB_Exm Date_of_Delivery=Date_of_Delivery_Br InfantDOB=InfantDOB_Trk;
run;

title " Missing and unequal birth date in Birth Exam, Birth Record Review and Tracking records, &sysdate";
proc print n data=check noobs;
where (subid ne ' ' or brid ne ' ') and (diff_ExmBr ne 0 or diff_ExmTrk ne 0 or diff_BrTrk ne 0);
var subid brid study_id sex BrSex DOB_Exm Date_of_Delivery_Br InfantDOB_Trk diff_ExmBr diff_ExmTrk diff_BrTrk;
run;

proc sort data=check; by sex studyid;
proc print data=check n noobs;
where sex ne . and (diff_ExmBr ne 0 or diff_ExmTrk ne 0 or diff_BrTrk ne 0);
var subid BrID StudyID Sex DOB_Exm Date_of_Delivery_Br infantDOB_Trk diff_ExmBr diff_ExmTrk diff_BrTrk;
title "Missng and unequal birth date in Birth Exam, Birth Record Review and Tracking records, &sysdate";
run;

/* ------------------------------------ Gender cleaning --------------------------------- */
/* ------------------------------------ Gender cleaning --------------------------------- */
proc print n data=all;
where (sex ne brsex) and sex ne . and brsex ne .; 
var subid Study_ID StudyID sex gender DOB brid brsex Date_of_Delivery InfantDOB;
title " Gender in Exam not match to gender in BR";
run;
proc print data=all noobs;
where studyid in('6091','6222','7168');
var subid Study_ID StudyID sex gender DOB brid brsex Date_of_Delivery InfantDOB;
title " Gender in Exam not match to gender in BR";
run;
