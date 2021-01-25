/*Subset for Stephanie Eick*/
Options nofmterr;
data roost.Tides_SE_20210114; set roost.Tides_compwideanalysis_20210114;
keep
STUDYID
STUDYVISIT
CENTER
AGE
age_cat
T1_EDUCATION
EDUC
civil
T1_MARITAL_STAT
T1_LIVED_W_SPOUSE
MARRIAGE
race
T1_RACE
T1_ETHNICITY
T1_INCOME
INCOME
SMOKE
SMOKE_BINARY
t1_cig
t2_cig
t3_cig
ALCOHOL_BINARY
ALCOHOL
T1_ALCOHOL
T2_ALCOHOL
T3_ALCOHOL
PRENATAL_VITAMINS_EVER
T1_MED_PRENATAL
T2_MED_PRENATAL
T3_MED_PRENATAL
infantsex
T1_BE_SEX
parity
gravidity
T1_MOMBMI
prepreg_bmi
bmi_cat
pe
DEL_MODE
PRETERM_ABS
spon_pt
spon_labor
plac_del
plac_pt
prom
spon_prom
preterm
prev_preterm
BR_GESTAGE_DAYS
BR_GESTAGE_WKS
GA_WEEK_DAY
BIRTHWEIGHT_KG
INTERGROWTH_BIRTH_ZSCORE
T1_COMPL_CERVICAL
T2_COMPL_CERVICAL
T3_COMPL_CERVICAL
T1_COMPL_GESTDIAB 
T2_COMPL_GESTDIAB 
T3_COMPL_GESTDIAB 
GDM
CREAT
ISO_C
PGF_C
ISOM_C
ISOENZ_C
ISOCH_C
ISO
PGF
ISOM
ISOENZ 
ISOCH 
ISO_SG
PGF_SG
ISOE_NONCORRECT 
ISOC_NONCORRECT 
T3_URINESG
T1_URINESG
T2_URINESG
US_1_GA_WEEKS_FINAL
US_2_GA_WEEKS_FINAL
US_3_GA_WEEKS_FINAL
US_4_GA_WEEKS_FINAL 
US_5_GA_WEEKS_FINAL 
US_6_GA_WEEKS_FINAL
UNEMPLOYED
SERIOUSILL
FAMILYDEATH
FINPROBLEMS
OTHER
MARITALDIFFICULT
STRESS_TRIMESTER1
STRESS_TRIMESTER2 
STRESS_TRIMESTER3 
STRESSEVER 
STRESSCONTV3
STRESSCONTV2
STRESSCONTV1
HELPLESS4
SOLVEPROB4 
NOTPROUD4 
BOTHERED4 
LITTLECONTROL4 
WORTH4 
GOODQUAL4 
ABLE4 
LACKCONFIDENCE4 
SATISFIED 
POSATTITUDE 
CALMCOLLECTED 
SECURE 
HAPPY 
CONTENT
DEPRESSED 
SAD
DISAPPOINTMENTS 
NERVOUSSTRAIN 
UNIMPORTTHOUGHTS
FEARFUL
BLUES
FAILURE
CRYINGSPELLS
TENSENERVOUS 
LONELY 
MASTERY 
ANXIETY 
DEPRESSION 
PSYCHOSOCIAL 
PSYCHHILO 
SUBJECTIVE
SELFESTEEM; run;



/*TIDES I variables from REDCap*/

%let csv_file = 'J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q1\TIDESI-StephanieEickECHOWid_DATA_NOHDRS_2021-01-25_1738.csv';

OPTIONS nofmterr;

data q1_comp.eick_select; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t1_q10 best32. ;
	informat t1_q11 best32. ;
	informat t1_q33 best32. ;
input
	study_id 
	redcap_event_name $
	t1_q10
	t1_q11
	t1_q33
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;


proc freq data=q1_comp.eick_select;
table t1_q10; run;

proc freq data=q1_comp.eick_select;
table t1_q11; run;

proc freq data=q1_comp.eick_select;
table t1_q33; run;
