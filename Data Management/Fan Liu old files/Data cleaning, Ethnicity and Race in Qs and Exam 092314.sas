OPTIONS REPLACE NODATE PAGENO=1 linesize=128 pagesize=690 FORMDLIM="-";

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
LIBNAME q1data "J:\PM\TIDES_Data\Q1\";
%LET q1date=071113; * Q1 data, last run 050613 021513(for 3/21/13 report) 012913 042512 012512;

/* ---- Q1 data---- */
data Q1(keep=StudyID center Q47_Ethnic Q48a Q48b Q48c Q48d Q48e Q48f Q48_Race dropped);
set q1data.tieds_q1_&q1date;
*set Q1DATA.Qrace_&DST; * created from 'For Anul Meeting Report-Ethnic and Race, 0312.SAS'; 
*format center cntfmt. Q47_Ethnic ethfmt. Q48_Race racefmt. dropped ynfmt.;
proc sort; by studyid;
proc contents data=Q1;
run;

/* ---- Q3 data---- */
LIBNAME q3data "J:\PM\TIDES_Data\Q3\";
%LET q3date=082713; 
data Q3(keep=StudyID center Q29 Q3Race);
set q3data.tieds_q3_&q3date;
 /* ------ Recode race as of 092314 ------*/
                                    * ---- Q3 race code ---- ;
 if Q29=0 then Q3Race=4;  *  0 = "American Indian or Alaska Native" ;
 if Q29=1 then Q3Race=2;  *  1 = "Asian";
 if Q29=2 then Q3Race=1;  *  2 = "Black or African-American";
 if Q29=3 then Q3Race=5;  *  3 = "Native Hawaiian or Pacific Islander";
 if Q29=4 then Q3Race=6;  *  4 = "White";
 if Q29=9 then Q3Race=8;  *  9 = "Other";

              /* ---- Q1 race code ---- ;
			  1='Black or African-American' 
			  2='Asian' 
              3='Hispanic or Latino, no race specified'
              4='American Indian or Alaska Native'
			  5='Native Hawaiian or Pacific Islan'
			  6='White'
			  7='More than one race'
			  8='Other'
              9='Unknown'; */
proc sort; by studyid;
proc contents data=Q3;
run;

proc freq data=q3;
tables Q29 q3race ;
run;

/* -----   ------- */
LIBNAME exdata "J:\PM\TIDES\Data\Reports\ForReport\";
%LET exdate=0914; *Last run 0114 0513 0213 0412 0212;
data exam(keep=subid StudyID center Sex Ethnicity ExamEthnicity Race ExRace ExamRaceSpecify smp Cohort);
set exdata.br_exam_&exdate;
*merge OUTQDATA.ExamRace_&DST(in=inexm) Q(keep=studyid dropped); * created from 'For Anul Meeting Report-Ethnic and Race, 0312.SAS';
/* clean traning data */
if center ne . and CV_AGDas_af1 ne .; * <<<<< excluding 8: #0 #0 #PS7M061 PS7M062 PS7M063 PS7M064 PS7M065 (training) and S1M003;
if subid='70743' then delete; * no second twin included;
if Cohort ne 'Supplemental Cohort';
/* recode Ethnicity to num */
if Ethnicity='Hispanic or Latino' then ExamEthnicity=1;
if Ethnicity='Not Hispanic or Latino' then ExamEthnicity=2;
if Ethnicity='Unknown' then ExamEthnicity=.;
rename race2=ExamRaceSpecify;
*format center cntfmt. sex sexfmt. ExamEthnicity ethfmt. ExmRace racefmt.;
proc sort; by studyid;
proc contents data=exam varnum;
run;

proc freq data=exam;
tables race exrace ;
run;

proc print data=exam n;
where exrace=4;
run;

data race;
merge q1(in=in1) q3(in=in3) exam(in=inex);
by studyid;
if in1 then InQ1=1;
if in3 then InQ3=1;
if inex then InExam=1;
* ----- Parental Race;
MotherRace=Q48_Race;
FatherRace=Q3Race;
format MotherRace FatherRace racefmt.;
proc sort; by studyid;
proc contents data=race varnum;
run;

proc print data=race n;
where studyid in('8083','8089');
*var subid StudyID center Sex Q47_Ethnic Ethnicity ExamEthnicity Q48_Race Q3Race Race ExRace ExamRaceSpecify;
var subid Sex StudyID Q48_Race Q3Race ExRace Race ExamRaceSpecify;
run;

OPTIONS REPLACE NODATE PAGENO=1 linesize=195 pagesize=690 FORMDLIM="-";
proc sort data=race; by ExRace;
title "Data cleaning - TIDES EXAM RACE, &sysdate";
proc print data=race n noobs double; *width=min;
where Sex ne . and (ExRace ne Q48_Race) and (ExRace ne Q3Race);
*var subid StudyID center Sex Q47_Ethnic Ethnicity ExamEthnicity Q48_Race Q3Race Race ExRace ExamRaceSpecify;
var subid Sex Q48_Race MotherRace Q3Race FatherRace ExRace Race ExamRaceSpecify;
proc sort; by studyid;
run;

/* =============================================================================================== */
		/* ----------------------------- fix Exam Race ------------------------------- */
/* =============================================================================================== */

data ExRace;
length InfantRace $40.;
set race;

   * -------------- missing Race;
   if SubID='61052' then Race='White';
* --------------- Fix ExRace;
if Sex ne . and (ExRace ne Q48_Race) and (ExRace ne Q3Race) then do;
   * --- fix unknown to more than one race;
	if Race='Unknown or Other' then ExRace=7;
    if SubID in('81332','82092','82492','81202','90942','92142','71172') then ExRace=7;
end;
   * -------------- fix to White;
if SubID in('60512','60992','61122','61392','61682','80142','80162','80212','81182','71782','71532') then ExRace=6;
   * -------------- fix to Black;
if SubID in('70112','70392','81682','82732') then ExRace=1;
* -------------- fix to Other;
if SubID in('70542','71542','71782','82202','81302') then ExRace=8;
* -------------- fix to Unknown;
if SubID in('90462') then ExRace=9;

* ------------------- fix Race as InfantRace;
 if ExRace=1 then InfantRace='Black or African-American'; 
 if ExRace=2 then InfantRace='Asian'; 
 if ExRace=3 then InfantRace='Hispanic or Latino, no race specified';
 if ExRace=4 then InfantRace='American Indian or Alaska Native';
 if ExRace=5 then InfantRace='Native Hawaiian or Pacific Islan';
 if ExRace=6 then InfantRace='White';
 if ExRace=7 then InfantRace='More than one race';
 if ExRace=8 then InfantRace='Other';
 if ExRace=9 then InfantRace='Unknown'; 
 format InfantRace $40.;

proc sort data=exrace; by studyid;
proc contents data=exrace varnum;
run;

OPTIONS REPLACE NODATE PAGENO=1 linesize=108 pagesize=690 FORMDLIM="-";
proc freq data=exrace;
tables exrace infantrace race;
run;


*------------- 53 neither of both mom and dad, including 44 more than one race;
OPTIONS REPLACE NODATE PAGENO=1 linesize=155 pagesize=690 FORMDLIM="-";
proc sort data=exrace; by ExRace;
title "Data cleaning - TIDES EXAM RACE, &sysdate";
proc print data=exrace n noobs double width=min;
where Sex ne . and (ExRace ne Q48_Race) and (ExRace ne Q3Race);
var subid Sex Q48_Race Q3Race ExRace InfantRace Race ExamRaceSpecify;
proc sort; by studyid;
run;

* ------------- 705 =both or = either of both mom and dad;
OPTIONS REPLACE NODATE PAGENO=1 linesize=155 pagesize=800 FORMDLIM="-";
proc sort data=exrace; by ExRace;
title "Data cleaning - TIDES EXAM RACE, &sysdate";
proc print data=exrace n noobs double width=min;
where Sex ne . and ((ExRace = Q48_Race) or (ExRace = Q3Race));
var subid Sex Q48_Race Q3Race ExRace InfantRace Race ExamRaceSpecify;
proc sort; by studyid;
run;

* ------------- 532 = both mom and dad;
OPTIONS REPLACE NODATE PAGENO=1 linesize=155 pagesize=800 FORMDLIM="-";
proc sort data=exrace; by ExRace;
title "Data cleaning - TIDES EXAM RACE, &sysdate";
proc print data=exrace n noobs double width=min;
where Sex ne . and ((ExRace = Q48_Race) and (ExRace = Q3Race));
var subid Sex Q48_Race Q3Race ExRace InfantRace Race ExamRaceSpecify;
proc sort; by studyid;
run;

* ================== Export data to Exam data set;
data exp(keep=subid Sex ExRace InfantRace);
set exrace;
if subid ne ' ';
proc sort data=exp; by ExRace;
proc contents data=exp;
run;

proc freq data=exp;
tables sex exrace infantrace;
run;

* ------------------- Export SAS data set;
LIBNAME expdata "J:\PM\TIDES\Data\DataFiles\BirthExam\SAS Data\";
%let expdate=100914;

data expdata.tides_br_exam_race_&expdate;
set exp;
proc sort data=expdata.tides_br_exam_race_&expdate; 
by SubID;
run;

proc contents data=expdata.tides_br_exam_race_&expdate; 
run;

proc print data=expdata.tides_br_exam_race_&expdate n;
run;
