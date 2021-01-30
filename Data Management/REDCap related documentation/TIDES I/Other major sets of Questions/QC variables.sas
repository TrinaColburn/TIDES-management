/*QC Variables*/

/*Q1*/
libname qc_vars "J:\PM\TIDES_Data\REDCap Master Database\TIDES I\Trimester Questionnaires\QC of important variables"; run;
/*QC Variables*/

proc contents data=q1.q1_2020_sub order=varnum; run;

data qc_vars.q1; set q1.q1_2020_sub;
keep study_id Center T1_Q45 T1_Q45A 
t1_q46_dob age_months age_yrs 
T1_Q48_Race T1_Q47_Ethnic
T1_Q48A T1_Q48B
T1_Q48C T1_Q48D T1_Q48E T1_Q48F T1_Q49 T1_Q50
T1_Q51 T1_Q52 T1_Q53; run;

data qc_vars.q3; set q3.q3_2020_sub; 
keep study_id T3_Q26 T3_Q27_DAD_HEIGHT_FT T3_Q27_DAD_HEIGHT_IN T3_Q27_DAD_WEIGHT_LBS
T3_Q27_DAD_HEIGHT_DK
T3_Q27_DAD_WEIGHT_DK
T3_Q27_dad_height_recode
T3_Q28 T3_Q29 T3_Q30; run;
proc contents data=qc_vars.q3 order=varnum; run;

/*Previously imported REDCap variables*/
proc contents data=qc_vars.raceeth_rc order=varnum; run;
proc contents data=qc_vars.t1_qc order=varnum; run;


	/*Proc compare between original imported RC dataset*/
	proc compare base=qc_vars.q1 compare=qc_vars.t1_qc
	out=t1_diff_1 outnoequal listequalvars; by study_id; run; 

	proc print data=t1_diff_1; run; /*no obs*/
	/*T1 import of these variables were successful*/


	/*Proc compare between T1 and DOB/Mom years baseline info in RC*/
	proc compare base=qc_vars.q1 compare=qc_vars.raceeth_rc 
	out=t1_diff_2 outnoequal
	CRITERION=1; /*ignore .00001 differences*/
	var t1_q46_dob age_yrs; with momdob momage_yrs; 
	by study_id; run;

	proc print data=t1_diff_2; run; /*no obs*/

	/*Race ethnicity*/
	proc compare base=qc_vars.q1 compare=qc_vars.raceeth_rc 
	out=t1_diff_raceeth outnoequal;
	var T1_Q48_Race T1_Q47_Ethnic;
	with momrace momethnic; 
	by study_id; run;

	proc print data=t1_diff_raceeth; run;
	/*n=16, all have coded information in REDCap.
/*Mom Race/Ethnicity, DOB, and Age clean in REDCap*/

/*Compare Dad and import Dad height/weight information*/
	proc sort data=qc_vars.q3; by study_id; run;
	proc compare base=qc_vars.q3 compare=qc_vars.raceeth_rc
	out=diff_dad outnoequal listequalvars; 
	var T3_Q26 T3_Q28 T3_Q29;
	with dadage_yrs dadethnic dadrace; 
	by study_id; run; 

	/*recode qc_vars.q3*/
	data qc_vars.q3_1; set qc_vars.q3;
	if t3_q28=0 then t3_q28_recode=2;
	if t3_q28=1 then t3_q28_recode=1;

	if t3_q29=0 then t3_q29_recode=4;
	if t3_q29=1 then t3_q29_recode=2;
	if t3_q29=2 then t3_q29_recode=1;
	if t3_q29=3 then t3_q29_recode=5;
	if t3_q29=4 then t3_q29_recode=6; 
	if t3_q29=9 then t3_q29_recode=8; run;

	proc compare base=qc_vars.q3_1 compare=qc_vars.raceeth_rc
	out=diff_dad outnoequal listequalvars; 
	var T3_Q26 T3_Q28_recode T3_Q29_recode;
	with dadage_yrs dadethnic dadrace; 
	by study_id; run; 


	proc print data=diff_dad; run; /*no obs*/
	/*8078, 8083, 8089, 8138, 8150 different but coded as unknown*/
	/*Info in redcap same as original data*/

/*run frequencies of height/weight vars*/
proc freq data=qc_vars.q3_1; 
table T3_Q30 T3_Q27_dad_height_recode T3_Q27_DAD_WEIGHT_LBS T3_Q27_DAD_WEIGHT_DK; run;
/*outliers but nothing out of the ordinary*/

data qc_vars.q3_dadinfo; set qc_vars.q3_1;
keep study_id T3_Q26 T3_Q27_DAD_HEIGHT_FT T3_Q27_DAD_HEIGHT_IN T3_Q27_DAD_WEIGHT_LBS
T3_Q27_DAD_HEIGHT_DK
T3_Q27_DAD_WEIGHT_DK
T3_Q27_dad_height_recode T3_Q30; run;

data qc_vars.q3_dadinfo; set qc_vars.q3_dadinfo;
dad_bmi=(T3_Q27_DAD_WEIGHT_LBS/(T3_Q27_dad_height_recode*T3_Q27_dad_height_recode))*703; run;

proc means data=qc_vars.q3_dadinfo;
var dad_bmi; run;

proc freq data=qc_vars.q3_dadinfo_1; 
table T3_Q30 t3_q30_recode; run;
data qc_vars.q3_dadinfo_1; set qc_vars.q3_dadinfo;
if T3_Q30 ne 9 then t3_q30_recode=T3_Q30+1;
if T3_Q30=9 then t3_q30_recode=9; run;
/*Will import*/
PROC EXPORT DATA= QC_VARS.Q3_dadinfo_1 
            OUTFILE= "J:\PM\TIDES_Data\REDCap Master Database\TIDES I\Tr
imester Questionnaires\QC of important variables\dad_info.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;
