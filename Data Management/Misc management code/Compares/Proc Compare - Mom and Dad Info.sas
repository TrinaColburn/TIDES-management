/* Edit the following line to reflect the full path to your CSV file */
libname cov_qc "J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\New folder"; run;
%let cov = 'TIDESI-BaselineAndCovariate_DATA_NOHDRS_2021-01-27_1216.csv';

OPTIONS nofmterr;

data cov_qc.cov_redcap; %let _EFIERR_ = 0;
infile &cov  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat subject_id best8. ;
	informat child_id best8. ;
	informat consented best32. ;
	informat consentdate yymmdd10. ;
	informat center best32. ;
	informat child_dob yymmdd10. ;
	informat birthtime time5. ;
	informat child_sex best32. ;
	informat dup best32. ;
	informat twinchild_id best32. ;
	informat brexethnicity best32. ;
	informat infantrace best32. ;
	informat infantethnicity best32. ;
	informat tworace best32. ;
	informat brexrace $500. ;
	informat momdob yymmdd10. ;
	informat momage_yrs best32. ;
	informat momrace best32. ;
	informat momethnic best32. ;
	informat dadage_yrs best32. ;
	informat dadrace best32. ;
	informat dadethnic best32. ;
	informat t1_height_recode best32. ;
	informat t1_q3_wt_lbs best32. ;
	informat t1_q3_wt_kg best32. ;
	informat t1_q3_wt_lbs_recode best32. ;
	informat t1_mombmi_derived best32. ;
	informat t1_q45 best32. ;
	informat t1_q45a best32. ;
	informat t1_q49 best32. ;
	informat t1_q50 best32. ;
	informat t1_q51 best32. ;
	informat t1_q52 best32. ;
	informat t1_q53 best32. ;
	informat t3_q26 best32. ;
	informat t3_q27_dad_height_ft best32. ;
	informat t3_q27_dad_height_in best32. ;
	informat t3_q27_dad_height_recode best32. ;
	informat t3_q27_dad_height_dk best32. ;
	informat t3_q27_dad_weight_lbs best32. ;
	informat dad_bmi best32. ;
	informat t3_q30 best32. ;

	
input
	study_id 
	redcap_event_name $
	subject_id
	child_id 
	consented
	consentdate
	center
	child_dob
	birthtime
	child_sex
	dup
	twinchild_id
	brexethnicity
	infantrace
	infantethnicity
	tworace
	brexrace $
	momdob
	momage_yrs
	momrace
	momethnic
	dadage_yrs
	dadrace
	dadethnic
	t1_height_recode
	t1_q3_wt_lbs
	t1_q3_wt_kg
	t1_q3_wt_lbs_recode
	t1_mombmi_derived
	t1_q45
	t1_q45a
	t1_q49
	t1_q50
	t1_q51
	t1_q52
	t1_q53
	t3_q26 
	t3_q27_dad_height_ft 
	t3_q27_dad_height_in 
	t3_q27_dad_height_recode 
	t3_q27_dad_height_dk
	t3_q27_dad_weight_lbs 
	dad_bmi 
	t3_q30
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents data=cov_qc.cov_redcap order=vanrum; run;

/*mom info*/
%macro mom(new, old, name, ident);
proc compare base=cov_qc.cov_redcap compare=q1_comp.Q1_20190514 out=&name 
outnoequal outbase outcomp outdif noprint criterion=1;
var &new;
with &old; 
by study_id; 
id study_id; run;

proc print data=&name noobs;
by study_id; 
id study_id;
title &ident;
run;
%mend;

%mom(t1_height_recode,	T1_Q2_ht_in_Recode, 		var_3,	"var_3	");
%mom(t1_q3_wt_lbs,		t1_q3_wt_lbs, 			var_4,	"var_4	");
%mom(t1_q3_wt_kg,		t1_q3_wt_kg, 			var_5,	"var_5	");
%mom(t1_q3_wt_lbs_recode,	t1_q3_wt_lbs_recode, var_6,	"var_6	");
%mom(t1_mombmi_derived,	MomBMI, 			 var_7,	"var_7	");
%mom(t1_q45,	t1_q45, 	var_8	,"var_8	");
%mom(t1_q45a,	t1_q45a, 	var_9	,"var_9	");
%mom(t1_q49,	t1_q49,	var_10	,"var_10");
%mom(t1_q50,	t1_q50,	var_11	,"var_11");
%mom(t1_q51,	t1_q51,	 var_12	,"var_12");
%mom(t1_q52,	t1_q52,	 var_13	,"var_13");
%mom(t1_q53,	t1_q53,	 var_14	,"var_14");

proc contents data=q3_comp.Q3_22119 order=varnum; run;

proc sort data=q3_comp.Q3_22119; by study_id; run;

/*dad info*/
%macro dad(new, old, name, ident);
proc compare base=cov_qc.cov_redcap compare=q3_comp.Q3_22119 out=&name 
outnoequal outbase outcomp outdif noprint criterion=1;
var &new;
with &old; 
by study_id; 
id study_id; run;

proc print data=&name noobs;
by study_id; 
id study_id;
title &ident;
run;
%mend;

%dad(	t3_q26	,	t3_q26	,	var_10	,"var_10");
%dad(	t3_q30	,	t3_q30	,	var_11	,"var_11");
%dad(	dadage_yrs	,	t3_q26	,	 var_12	,"var_12");
%dad(	dadrace	,	t3_q29	,	 var_13	,"var_13");
%dad(	dadethnic	,	t3_q28	,	 var_14	,"var_14");
%dad(	t3_q27_dad_height_ft	,	t3_q27_dad_height_ft	,	 var_15	,"var_15");
%dad(	t3_q27_dad_height_in	,	t3_q27_dad_height_in	,	 var_16	,"var_16");
%dad(	t3_q27_dad_height_recode	,	t3_q27_dad_height_recode	,	 var_17	,"var_17");
%dad(	t3_q27_dad_height_dk	,	t3_q27_dad_height_dk	,	 var_18	,"var_18");
%dad(	t3_q27_dad_weight_lbs	,	t3_q27_dad_weight_lbs	,	 var_19	,"var_19");

proc freq data=cov_qc.cov_redcap;
table t3_q30; title; run;
proc freq data=q3_comp.Q3_22119;
table t3_q30; run;

proc freq data=cov_qc.cov_redcap;
table dadrace; title; run;
proc freq data=q3_comp.Q3_22119;
table t3_q29; run;

proc freq data=cov_qc.cov_redcap;
table dadethnic; title; run;
proc freq data=q3_comp.Q3_22119;
table t3_q28; run; /*+1 for 7047*/
