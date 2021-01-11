/*I am working on a submission with the TIDES data and have a couple questions for you. 

1.	What are the ”paperdt” variables? There are several records in the third trimester questionnaire that are missing “T3_Q3_Date”  
	and the month/year only variables as well but have a paperdt and I was wondering if I could use this.
2.	In the third trimester questionnaire, almost every participant that has a height or weight in imperial units also has a height or weight 
	in metric units.  This isn’t the case for the other two prenatal questionnaires where the minority of participants have values in metric units. Were the metric units(kgs/cms) imputed in this questionnaire and if so, do you recommend using the imperial or the metric values?
*/


libname pw_nyu "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\Nov 2019\TIDES I"; run;

proc contents data=pw_nyu.Q3_22119_pwnyu order=varnum; run;

proc freq data=pw_nyu.Q3_22119_pwnyu;
tables t3_paperdt T3_Q3_Date/missing;
run;

proc freq data=pw_nyu.Q3_22119_pwnyu;
tables study_id*t3_paperyn/norow nocol nocum nopercent missing;
where t3_paperyn ne .;
run;

proc freq data=pw_nyu.Q3_22119_pwnyu;
tables t3_paperyn/norow nocol nocum nopercent;
run;

proc univariate data=pw_nyu.Q3_22119_pwnyu;
var T3_Q1_DAYS T3_Q1_WKS
T3_Q2_WT_KG T3_Q2_WT_LBS
T3_Q3_HEIGHT_CM
T3_Q3_HEIGHT_FT
T3_Q3_HEIGHT_IN
T3_Q2_wt_lbs_Recode
T3_Q3_ht_in_Recode;
histogram;
run;

data Q3_height_weight; set pw_nyu.Q3_22119_pwnyu;
keep study_id T3_PAPERDT T3_Q_VERSION T3_Q3_Date T3_Q1_DAYS T3_Q1_WKS
T3_Q2_WT_KG T3_Q2_WT_LBS
T3_Q3_HEIGHT_CM
T3_Q3_HEIGHT_FT
T3_Q3_HEIGHT_IN
T3_Q2_wt_lbs_Recode
T3_Q3_ht_in_Recode; run;

data Q3_height_weight; 
format study_id T3_PAPERDT T3_Q_VERSION T3_Q3_Date T3_Q1_DAYS T3_Q1_WKS
T3_Q2_WT_KG T3_Q2_WT_LBS
T3_Q3_HEIGHT_CM
T3_Q3_HEIGHT_FT
T3_Q3_HEIGHT_IN
T3_Q2_wt_lbs_Recode
T3_Q3_ht_in_Recode;
set Q3_height_weight; run;



data Q3_height_weight_outliers; set Q3_height_weight;
if T3_Q2_WT_KG > 155; run;

proc print data=Q3_height_weight_outliers; run;

proc univariate data=Q3_height_weight;
var T3_Q3_Date;
histogram; run;



