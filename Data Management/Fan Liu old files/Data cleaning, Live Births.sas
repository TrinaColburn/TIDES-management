OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=120 PS=60 label=1;* FORMDLIM ='-';

*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<;
LIBNAME indata "J:\PM\TIDES\Data\Reports\ForReport\";
LIBNAME outdata "J:\PM\TIDES\Data\DataFiles\Ages\";

footnote;

PROC FORMAT;
VALUE CNTFMT 6='UCSF' 7='UMN' 8='URMC' 9='UW';
VALUE SUBFMT 1='Pilot' 0='Subject' 2='Dropped';
value smpfmt 1='Subject' 2='Pilot' 3='Suppl';
value smp2fmt 1='TIDES' 2='Suppl' 3='Reported from Center but no BR' 4='have DOB in Tracking but no BR';
value sexfmt 1='Boy' 2='Girl';
value q1fmt  0='Not_Yet' 1='Done';
value livfmt 1='TIDES Infants' 2='Supplemental Infants';
RUN;
ods listing;

/* ================================ Import BR data ============================= */
%let updated=v2_0314; * fix birth weight for #90062, add supp ids in StudyID;
LIBNAME brdata "J:\PM\TIDES\Data\Reports\ForReport\";

data br(keep=StudyID subid CENTER Sample BrSex Date_of_Delivery BrIn);        
set brdata.tides_brr_&updated;
BrIn=1; 
if smp in(1,2) then Sample=1;
if smp=3 then sample=2;
rename BabySex=BrSex;
proc sort; by Studyid;
proc contents data=br;
run;
data brdup; set br; by StudyID;
if ^(first.StudyID & last.StudyID) then dup=1;
run;
/* dups 70743, 7168, 9201 */
proc print data=brdup n;
where dup=1;
run;
* ------ 946 total, 787 TIDES, 159 Supp;
proc freq data=br;
tables sample;
run;

/* ================================ Import BR Exam data and make report =============================================== */
%let examdate=0114;* last run 0513 0413 0213, 1212;	
LIBNAME exdata "J:\PM\TIDES\Data\Reports\ForReport\";
data ex(keep=subid studyid center Sample Gender DOB ExSex ExmIn);
set exdata.br_exam_&examdate;
ExmIn=1;
if smp in(1,2) then Sample=1;
if smp=3 then sample=2;
/* ---------- data excluded ------------- */
if ExamDate ne . and Center ne .;   
* 930 readedin <<<<< excluding 8: #0 #0 #PS7M061 PS7M062 PS7M063 PS7M064 PS7M065 (training) and S1M003;
* ------ reset StudyID for Supplementals;
if Studyid=' ' then StudyID=SubID;
rename sex=ExSex;
format StudyID $11. center cntfmt.;
proc sort data=ex; by StudyID; 
proc contents varnum data=ex;
run;

data exdup; set ex; by StudyID;
if ^(first.StudyID & last.StudyID) then dup=1;
run;
/* dups 70743 */
proc print data=exdup n;
where dup=1;
run;

/* ================================= Tracking data ================================================ */
%let trkdate=0314; *last 1113, 0813;
LIBNAME trkdata "J:\PM\TIDES\Data\Reports\ForReport\";
DATA trk(keep=StudyID center InfantDOB Dropped MayMtSinaiContact Q1date T1_UrineDate T1_BloodDate);
SET trkdata.sub_trck_rpt_&trkdate;
format CENTER cntfmt.;
proc sort; by Studyid;
proc contents data=trk varnum;
run;



/* ====================================Gestational Age ================================= *//*
LIBNAME Gestdata "J:\PM\TIDES\Data\DataFiles\Ages\";
%let GESTdate=0314;* 0913; * read in Gestational data;		
DATA gest;*(keep=studyid subid babysex GestAge_birth_days GestAge_Birth_wks GestAge_U1
               AgeDays_at_Exam BirthWeight_kg GestIn); 
  set Gestdata.exage_gestage_sex_&GESTdate;
     GestIn=1;
   if substr(studyid,1,1) ne 'S';* in('6','7','8','9','P'); * ===== 969, no supplimental included;
   if InfantDOB ne . or DOB ne . or Date_of_Delivery ne .;  * ===== 801 have DOB in Tracking, Exam or BR;
proc sort data=gest;by studyid;
proc contents data=gest varnum;
proc print data=gest n;
var StudyID SubID DOB Date_of_Delivery InfantDOB; 
run;


/* ==================================== The number of LIVE BIRTH ===================================== */
* ------------ 1143 total;
data live;
merge trk(in=intrk) ex(in=inex) br(in=inbr);
by studyid;

/* ------- missing data ------------ */
* ---------- Reported DOB and Sex from center but no BR;
if StudyID='6009' then do; BrSex=2; Date_of_Delivery='20JUN2011'D; Sample=3; end;
if StudyID='6040' then do; BrSex=2; Date_of_Delivery='16SEP2011'D; Sample=3; end;
if StudyID='6179' then do; BrSex=2; Date_of_Delivery='28OCT2012'D; Sample=3; end;

if Studyid in('6069','6114','6142','6212','6229') then do; BrSex=1; Sample=3; end;
if Studyid in('6138') then do; BrSex=2; Sample=3; end;

* ------------- Wait for update;
if StudyID='9044' then do; BrSex=1; Date_of_Delivery='04SEP2011'D; Sample=1; end;
if StudyID='9058' then do; BrSex=1; Date_of_Delivery='15OCT2011'D; Sample=1; end;
if StudyID='9070' then do; BrSex=2; Date_of_Delivery='16OCT2011'D; Sample=1; end;
if StudyID='9153' then do; BrSex=2; Date_of_Delivery='29JUN2011'D; Sample=1; end;
if StudyID='9205' then do; BrSex=1; Date_of_Delivery='07MAR2013'D; Sample=1; end;

* ---------- have DOB reported in Tracking but no BR;
if Studyid in('6096','6209','7093','9036','9067','9102') then Sample=4;

* --------- Live Births with a DOB or Sex reported;
if InfantDOB ne . or DOB ne . or Date_of_Delivery ne . or BrSex ne . then LiveBirth=1;  
      * ===== 801 have DOB in Tracking, Exam or BR;
else LiveBirth=0;

* ---------- TIDES vs Supplemental;
if LiveBirth=1 and Sample in(1,3,4) then LiveBirth_Sample=1;
if LiveBirth=1 and Sample =2 then LiveBirth_Sample=2;

* -------------------- Dups;
if ^(first.studyid) then Dup=1;

format sample smp2fmt. LiveBirth_Sample livfmt.;
proc sort; by Studyid;
proc contents data=live varnum;
run;

* ---------------- Live Briths;
proc freq data=live;
tables livebirth*sample/missing list;
run;

* ---------------- Live Briths;
proc freq data=live;
tables livebirth*LiveBirth_Sample/missing list;
run;

* ------------------ Twins;
proc print data=live n;
where dup=1;
var StudyID subid CENTER Sample BrSex Exsex infantDOB DOB Date_of_Delivery BrIn exmin ;
run;

/* ============================== Live Births ============================ */
* ------- 978 total, 807 TIDES, 171 Supplemental, 3 twins;
data livebirth;
set live;
if livebirth=1;
* Recode DOB and Sex;
Infant_Sex=.;
   if Infant_Sex=. then Infant_Sex=BrSex;
   if Infant_Sex=. then Infant_Sex=ExSex;
Infant_DOB=.;
   if Infant_DOB=. then Infant_DOB=Date_of_Delivery;
   if Infant_DOB=. then Infant_DOB=DOB;
   if Infant_DOB=. then Infant_DOB=infantDOB;
format infant_DOB date9. Infant_Sex sexfmt. ;
proc sort; by Studyid;
run;

/* ---------------------------------- Report ---------------------------- */
OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=110 PS=160 label=0 FORMDLIM =' ';
* ---------------- Live Briths;
title "Table 1. TIDES Live Births, including 3 twins, &sysdate ";
proc freq data=livebirth;
*where LiveBirth_Sample=1;
tables Center*LiveBirth_Sample/list out=out1 noprint;
proc sort; by LiveBirth_Sample;
proc print data=out1 noobs;
by LiveBirth_Sample;
id LiveBirth_Sample;
sum count percent;
run;

title "Table 2. TIDES Infants, including 3 twins, &sysdate ";
proc freq data=livebirth;
where sample ne 2;
tables center*sample/list out=out2 noprint;
proc sort; by Sample;
proc print data=out2 noobs;
by Sample;
id Sample;
sum count percent;
run;

* -------------- no birth record;
title "Table 3. TIDES Infants reported gender and DOB from center but NO Birth Record Review data entered, &sysdate ";
proc print data=livebirth n noobs;
where sample =3;
var StudyID infant_sex infant_DOB Dropped Q1date T1_UrineDate T1_BloodDate MayMtSinaiContact;
run;

title "Table 4.  Infants reported DOB in Tracking data sheet but NO Birth Record Review data entered, &sysdate ";
proc print data=livebirth n noobs;
where sample =4;
var StudyID infant_Sex infant_DOB Dropped Q1date T1_UrineDate T1_BloodDate MayMtSinaiContact;
run;



/* -- Numbers of live births (804 no twins) and not dropped, Total 791 (388 boys and 402 girls, 1 missing gender )-- */
proc freq data=livebirth;
where sample ne 2 and livebirth=1 and dup ne 1 and dropped=0; 
tables infant_Sex/list missing;
run;


