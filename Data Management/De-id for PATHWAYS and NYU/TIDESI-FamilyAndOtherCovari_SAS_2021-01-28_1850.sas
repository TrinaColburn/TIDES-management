libname cov "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Baseline and covariate"; run;

%let cov_rc = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Baseline and covariate\TIDESI-FamilyAndOtherCovari_DATA_NOHDRS_2021-01-28_1850.csv';

data cov.bl_cov_2021128; %let _EFIERR_ = 0;
infile &cov_rc  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat subject_id $500. ;
	informat child_id $500. ;
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
	informat brexrace $500. ;
	informat tworace best32. ;
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
	informat t3_q26 $500. ;
	informat t3_q27_dad_height_ft $500. ;
	informat t3_q27_dad_height_in $500. ;
	informat t3_q27_dad_height_recode $500. ;
	informat t3_q27_dad_height_dk best32. ;
	informat t3_q27_dad_weight_lbs $500. ;
	informat dad_bmi $500. ;
	informat t3_q30 best32. ;
	informat gestage_birth_wks best32. ;
	informat gestage_birth_days best32. ;
	informat tides_women_lmp yymmdd10. ;
	informat birthexamtime time5. ;
	informat birthexamdate yymmdd10. ;

input
	study_id 
	redcap_event_name $
	subject_id $
	child_id $
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
	brexrace $
	tworace
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
	t3_q26 $
	t3_q27_dad_height_ft $
	t3_q27_dad_height_in $
	t3_q27_dad_height_recode $
	t3_q27_dad_height_dk
	t3_q27_dad_weight_lbs $
	dad_bmi $
	t3_q30
	gestage_birth_wks
	gestage_birth_days
	tides_women_lmp
	birthexamtime
	birthexamdate
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;
