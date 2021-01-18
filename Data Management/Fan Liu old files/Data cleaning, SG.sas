/* ======================================================================================== */
/* Cleaning TIDES SG data (SG1 and SG2) */
OPTIONS REPLACE PAGENO=1 NODATE LS=138 PS=60 label=1 FORMDLIM ='=';

/* Report date */
%let date=1212;

LIBNAME indata "J:\PM\TIDES\Data\Reports\ForReport\";
LIBNAME outdata "J:\PM\TIDES\Data\DataFiles\SG\";


PROC FORMAT;
VALUE CNTFMT 6='UCSF' 7='UMN' 8='URMC' 9='UW';
RUN;
data sg; 
set indata.sub_trck_rpt_&date; 
IF DDAY = . and Study_ID ^in('90791' '90801' '90811') then Dropped=0;
 else Dropped=1;
T1_SG_Diff=abs(T1_UrineSG1-T1_UrineSG2);
T2_SG_Diff=abs(T2_UrineSG1-T2_UrineSG2);
T3_SG_Diff=abs(T3_UrineSG1-T3_UrineSG2);
proc sort; by study_id;
run;

title1 "TIDES T1 Urine, two measurements of Specific Gravity (SG), &sysdate";
title2 "+++++++ Samples collected for all 802 subjects(women remaining in study) +++++++++";
title3 ' ';
title4 " ------------- Total -------------";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
var T1_SG_Diff T1_UrineSG1 T1_UrineSG2;
run;
title1 " ------------- CENTER -------------";
title2 " ";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
class center;
var T1_SG_Diff T1_UrineSG1 T1_UrineSG2;
format center cntfmt.;
run;
title1 " ------------- Missing(or zero) SG measures -------------";
title2 " ";
run;
proc print n data=sg noobs;
where T1_UrineSG1 in(.,0) or T1_UrineSG2 in(.,0);
var study_id T1_UrineDate T1_SG_Diff T1_UrineSG1 T1_UrineSG2;
run;

title1 "TIDES T2 Urine, two measurements of Specific Gravity (SG), &sysdate";
title2 "++++++++++++++ For subjects who have urine samples collected ++++++++++++++++";
title3 ' ';
title4 " ------------- Total -------------";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
where T2_UrineDate ne .;
var T2_SG_Diff T2_UrineSG1 T2_UrineSG2;
run;
title1 " ------------- CENTER -------------";
title2 " ";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
where T2_UrineDate ne .;
class center;
var T2_SG_Diff T2_UrineSG1 T2_UrineSG2;
format center cntfmt.;
run;

title1 " ------------- Missing(or zero) SG measures -------------";
title2 " ";
run;
proc print n data=sg noobs;
where (T2_UrineDate ne .) and ((T2_UrineSG1 in(.,0)) or (T2_UrineSG2 in(.,0)));
var study_id T2_UrineDate T2_SG_Diff T2_UrineSG1 T2_UrineSG2;
run;

title1 "TIDES T3 Urine, two measurements of Specific Gravity (SG), &sysdate";
title2 "++++++++++++++ For subjects who have urine samples collected ++++++++++++++++";
title3 ' ';
title4 " ------------- Total -------------";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
where T3_UrineDate ne .;
var T3_SG_Diff T3_UrineSG1 T3_UrineSG2;
run;
title1 " ------------- CENTER -------------";
title2 " ";
proc means data=sg n nmiss mean std p25 median p75 min max maxdec=3;
where T3_UrineDate ne .;
class center;
var T3_SG_Diff T3_UrineSG1 T3_UrineSG2;
format center cntfmt.;
run;
title1 " ------------- Missing(or zero) SG measures -------------";
title2 " ";
proc print n data=sg noobs;
where (T3_UrineDate ne .) and ((T3_UrineSG1 in(.,0)) or (T3_UrineSG2 in(.,0)));
var study_id T3_UrineDate T3_SG_Diff T3_UrineSG1 T3_UrineSG2;
run;

/* SG values need to be fixed */
title1 " ------------- SG values have been fixed in data set -------------";
title2 " ++++ #91971 SG2=10.20 ++++ ";
proc print data=forreport2 n noobs;
where Study_ID in ('91971');
var study_id T1_UrineSG1 T1_UrineSG2 T2_UrineSG1 T2_UrineSG2 ;
run;

/* OUT DATA SET */
DATA outdata.TIDES_SG969_&date;
set SG;
 *IF DDAY = .; *DATA 802;
 *IF DDAY = . and Study_ID ^in('90791' '90801' '90811'); *DATA 799;

 /* fix Urine SG values */
if Study_ID='91971' then T2_UrineSG2=1.02;  * #91971 SG2=10.20;

Label study_id='Subject ID' 
      center= 'Study center, 6=UCSF 7=UMN 8=URMC 9=UW'
      T1_UrineSG1='First specific gravity measurement at first trimester'   
      T1_UrineSG2='Second specific gravity measurement at first trimester' 
      T2_UrineSG1='First specific gravity measurement at second trimester'    
      T2_UrineSG2= 'Second specific gravity measurement at second trimester'
      T3_UrineSG1='First specific gravity measurement at third trimester'    
      T3_UrineSG2='Second specific gravity measurement at third trimester'
      Dropped='1=Dropped from study 0=Remaining in study';

*keep study_id center T1_UrineSG1 T1_UrineSG2 T2_UrineSG1 T2_UrineSG2 T3_UrineSG1 T3_UrineSG2;
keep study_id center dropped T1_UrineSG1 T1_UrineSG2 T2_UrineSG1 T2_UrineSG2 T3_UrineSG1 T3_UrineSG2; *for all data;
proc sort data=outdata.TIDES_SG969_&date;
by study_id;
title;
proc contents data=outdata.TIDES_SG969_&date varnum;
run;

proc print data=sg n;
where dropped=0;
var study_id T1_UrineSG1 T1_UrineSG2 T2_UrineSG1 T2_UrineSG2 T3_UrineSG1 T3_UrineSG2 dropped;
run;

/* ========================================================================= *//*
proc sort data=outdata.sub_trck_rpt_&date;
by InfantDOB;
*by EDD_US;
proc print n data=outdata.sub_trck_rpt_&date;*(firstobs=1 obs=10) noobs;
*where infantdob ne . and substr(study_id,1,1) ne 'P';
var study_id InfantDOB;* LMP EDD EDD_method EDD_US US_date;
run;

