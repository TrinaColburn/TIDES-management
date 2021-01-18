OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=108 PS=65 label=1 FORMDLIM ='-';

/* Report date */
%let expdate=111513_zwt; * last run,102213_zwt, 101713_zwt, 101113_zwt, 091813 091213, 050813 040113, 013113;
%let GESTdate=0214; * last run 0913; * read in Gestational data;		

*<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<;
LIBNAME Gestdata "J:\PM\TIDES\Data\DataFiles\Ages\";
LIBNAME agddata "J:\PM\TIDES\Data\DataFiles\AGD\SAS Data";
footnote;

proc format;
value racefmt 1='Black or African-American' 
	          2='Asian' 
	          4='American Indian or Alaska Native'
		      5='Native Hawaiian or Pacific Islan'
		      6='White'
		      8='Other/Unknown';
value race3fmt 1='Black/Not Hispanic' 
	           2='Other' 
		       3='z.White/Not Hispanic';
value race2fmt 1='White/not Hispanic' 
              2='Non White';
value cntfmt 6='UCSF' 7='UCMN' 8='URMC' 9='UW';
value gagefmt 0='<37 WKS' 1='>=37 WKS';
value phxfmt 1='Yes' 0='No';
value sexfmt 1='Boy' 2='Girl';
run;

/* ============================== Gestational age data ================================= */
/* ------------ Gestational age for TIDES cohort ------------*/
DATA gest(keep=studyid subid babysex InfantDOB DOB Date_of_Delivery 
                AgeDays_at_Exam GestAge_Birth_wks BirthWeight_kg GestIn); 
  set Gestdata.exage_gestage_sex_&GESTdate;
     GestIn=1;
   *if substr(studyid,1,1) ne 'S';* in('6','7','8','9','P'); * ===== 969, no supplimental included;
   *if InfantDOB ne . or DOB ne . or Date_of_Delivery ne .;  * ===== 801 have DOB in Tracking, Exam or BR;
format BirthWeight_kg 8.3;
proc sort data=gest;by studyid;
proc contents data=gest varnum;
run;
proc print data=gest n;
where 0<BirthWeight_kg <1;
var studyid babysex AgeDays_at_Exam GestAge_Birth_wks BirthWeight_kg;
run;

/* ================ TIDES AGD data ================= */
data exam(keep=StudyID Sample center sex Age_Exam ExRace Examweight Examlength);
set agddata.tides_agd_pct_&expdate;
*if sample=1; *pick up TIDES infants;
rename weight=ExamWeight length=ExamLength;
proc sort data=exam; by studyid;
proc contents data=exam;
run;

data chk;
merge exam gest;
by studyid;
proc sort data=chk; by studyid;
proc contents data=chk;
run;

/* Check ID with birth weight < 1000 g,  --------- '8007','8138' not in EXAM */
OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=108 PS=65 label=1 FORMDLIM ='-';
title "TIDES infants, ID with birth weight < 1000 g, &sysdate";
proc print data=chk n noobs width=min;
where 0<BirthWeight_kg <1;
var studyid subid babysex Date_of_Delivery Age_Exam GestAge_Birth_wks Examlength Examweight BirthWeight_kg;
format Examweight 8.3;
run;


