/* Edit the following line to reflect the full path to your CSV file */
libname q3_comp "J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q3"; run;

%let csv_file = 'J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q3\TIDESI-ThirdTrimesterQuesti_DATA_NOHDRS_2021-01-26_1127.csv';

data q3_comp.q3_rc; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;
	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t3_sysid $500. ;
	informat t3_userid $500. ;
	informat t3_q_version $500. ;
	informat t3_q3_date yymmdd10. ;
	informat t3_paperdt yymmdd10. ;
	informat t3_paperusername $500. ;
	informat t3_time_stamp $500. ;
	informat t3_time_started $500. ;
	informat t3_time_started_raw $500. ;
	informat t3_time_end_raw $500. ;
	informat t3_timecompleted $500. ;
	informat t3_bypassed $500. ;
	informat t3_currentpage $500. ;
	informat t3_complete $500. ;
	informat t3_paperyn best32. ;
	informat t3_dropped best32. ;
	informat t3_q4 best32. ;
	informat t3_q1_days best32. ;
	informat t3_q1_wks best32. ;
	informat t3_q1_wks_recode best32. ;
	informat t3_q2_wt_kg best32. ;
	informat t3_q2_wt_lbs best32. ;
	informat t3_q2_wt_lbs_recode best32. ;
	informat t3_q3_height_cm best32. ;
	informat t3_q3_height_ft best32. ;
	informat t3_q3_height_in best32. ;
	informat t3_q3_ht_in_recode best32. ;
	informat t3_q5d best32. ;
	informat t3_q5e best32. ;
	informat t3_q5f best32. ;
	informat t3_q5g best32. ;
	informat t3_q5h best32. ;
	informat t3_q5i best32. ;
	informat t3_q5j best32. ;
	informat t3_q5ja best32. ;
	informat t3_q5ja1 best32. ;
	informat t3_q5jb best32. ;
	informat t3_q5k best32. ;
	informat t3_q8 best32. ;
	informat t3_q9 best32. ;
	informat t3_q10 best32. ;
	informat t3_q11 best32. ;
	informat t3_q12 best32. ;
	informat t3_q13 best32. ;
	informat t3_q22 best32. ;
	informat t3_q22a1 best32. ;
	informat t3_q22a2 best32. ;
	informat t3_q22a3 best32. ;
	informat t3_q22a4 best32. ;
	informat t3_q22a5 best32. ;
	informat t3_q22a6 best32. ;
	informat t3_q22a7 best32. ;
	informat t3_q22a8 best32. ;
	informat t3_q22a9 best32. ;
	informat t3_q22a10 best32. ;
	informat t3_q22b_a best32. ;
	informat t3_q22b1 best32. ;
	informat t3_q22b_b best32. ;
	informat t3_q22b2 best32. ;
	informat t3_q22b_c best32. ;
	informat t3_q22b3_a best32. ;
	informat t3_q22b3_b best32. ;
	informat t3_q22b3_c best32. ;
	informat t3_q22b3_d best32. ;
	informat t3_q22b_d best32. ;
	informat t3_q22b4 best32. ;
	informat t3_q22b4_a best32. ;
	informat t3_q22b4_b best32. ;
	informat t3_q22b4_c best32. ;
	informat t3_q22b4_d best32. ;
	informat t3_q22b4_e best32. ;
	informat t3_q22b4_f best32. ;
	informat t3_q22b4_g best32. ;
	informat t3_q22b4_h best32. ;
	informat t3_q22b4_i best32. ;
	informat t3_q22b4_j best32. ;
	informat t3_q22b_e best32. ;
	informat t3_q22b_f best32. ;
	informat t3_q22c best32. ;
	informat t3_q22d best32. ;
	informat t3_q22e best32. ;
	informat t3_q22e1 best32. ;
	informat t3_q22f best32. ;
	informat t3_q23 best32. ;
	informat t3_q24 best32. ;
	informat t3_q25a best32. ;
	informat t3_q25b best32. ;
	informat t3_q25c best32. ;
	informat t3_q25d best32. ;
	informat t3_q25e best32. ;
	informat t3_q25f best32. ;
	informat t3_q31_yn best32. ;
	informat t3_q31a best32. ;
	informat t3_q31b best32. ;
	informat t3_q32 best32. ;
	informat t3_q33 best32. ;
	informat t3_q34 best32. ;
	informat t3_q35 best32. ;
	informat t3_q36 best32. ;
	informat t3_q37_yn best32. ;
	informat t3_q37_t1 best32. ;
	informat t3_q37_t2 best32. ;
	informat t3_q37_t3 best32. ;
	informat t3_q38_yn best32. ;
	informat t3_q38_t1 best32. ;
	informat t3_q38_t2 best32. ;
	informat t3_q38_t3 best32. ;
	informat t3_q39_yn best32. ;
	informat t3_q39_t1 best32. ;
	informat t3_q39_t2 best32. ;
	informat t3_q39_t3 best32. ;
	informat t3_q40_yn best32. ;
	informat t3_q40_t1 best32. ;
	informat t3_q40_t2 best32. ;
	informat t3_q40_t3 best32. ;
	informat t3_q41_yn best32. ;
	informat t3_q41_t1 best32. ;
	informat t3_q41_t2 best32. ;
	informat t3_q41_t3 best32. ;
	informat t3_q42_yn best32. ;
	informat t3_q42_specify $500. ;
	informat t3_q42_t1 best32. ;
	informat t3_q42_t2 best32. ;
	informat t3_q42_t3 best32. ;
	informat t3_q43 best32. ;
	informat third_trimester_ques_v_0 best32. ;
	informat medications_yn best32. ;
	informat allergy_yn best32. ;
	informat allergy_script best32. ;
	informat allergy_otc best32. ;
	informat arthritis_yn best32. ;
	informat arthritis_script best32. ;
	informat arthritis_otc best32. ;
	informat asthma_yn best32. ;
	informat asthma_script best32. ;
	informat asthma_otc best32. ;
	informat copd_yn best32. ;
	informat copd_script best32. ;
	informat copd_otc best32. ;
	informat depression_yn best32. ;
	informat depression_script best32. ;
	informat despression_otc best32. ;
	informat diabetes_yn best32. ;
	informat diabetes_script best32. ;
	informat diabetes_otc best32. ;
	informat genital_yn best32. ;
	informat genital_script best32. ;
	informat genital_otc best32. ;
	informat gi_yn best32. ;
	informat gi_script best32. ;
	informat gi_otc best32. ;
	informat bp_yn best32. ;
	informat bp_script best32. ;
	informat bp_otc best32. ;
	informat nausea_yn best32. ;
	informat nausea_script best32. ;
	informat nausea_otc best32. ;
	informat pain_yn best32. ;
	informat pain_script best32. ;
	informat pain_otc best32. ;
	informat respinfect_yn best32. ;
	informat respinfect_script best32. ;
	informat respinfect_otc best32. ;
	informat thyroid_yn best32. ;
	informat thyroid_script best32. ;
	informat thyroid_otc best32. ;
	informat urinary_yn best32. ;
	informat urinary_script best32. ;
	informat urinary_otc best32. ;
	informat othermed_yn best32. ;
	informat othermedscript best32. ;
	informat othermed_otc best32. ;
	informat medication_history_complete best32. ;
	informat prenatalvitamin_yn best32. ;
	informat prenatalvitamin_form best32. ;
	informat supplements_yn best32. ;
	informat multivitamin_yn best32. ;
	informat multivitmain_form best32. ;
	informat iron_yn best32. ;
	informat iron_form best32. ;
	informat calcium_yn best32. ;
	informat calcium_form best32. ;
	informat aminoacid_yn best32. ;
	informat aminoacid_form best32. ;
	informat herbal_yn best32. ;
	informat herbal_form best32. ;
	informat vita_yn best32. ;
	informat vita_form best32. ;
	informat vitc_yn best32. ;
	informat vitc_form best32. ;
	informat vitd_yn best32. ;
	informat vitd_form best32. ;
	informat vite_yn best32. ;
	informat vite_form best32. ;
	informat vitk_yn best32. ;
	informat vitk_form best32. ;
	informat fishoil_yn best32. ;
	informat fishoil_form best32. ;
	informat other_yn best32. ;
	informat other_form best32. ;
	informat unsure_yn best32. ;
	informat unsure_form best32. ;
	informat nutritional_suppleme_v_1 best32. ;
	informat food_organic best32. ;
	informat food_homegrown best32. ;
	informat food_unprocessed best32. ;
	informat food_canned best32. ;
	informat food_frozen best32. ;
	informat food_fresh best32. ;
	informat mealsperweek_pb best32. ;
	informat mealsperweek_beef best32. ;
	informat mealsperweek_seafood best32. ;
	informat mealsperweek_poultry best32. ;
	informat mealsperweek_othermeats best32. ;
	informat mealsperweek_spices best32. ;
	informat mealsperweek_oils best32. ;
	informat mealsperweek_soy best32. ;
	informat mealsperweek_dairy best32. ;
	informat meals_restaurant best32. ;
	informat meals_fastfood best32. ;
	informat diet_complete best32. ;
	informat cigarettes_yn best32. ;
	informat cigarettes_day best32. ;
	informat cigarettes_week best32. ;
	informat cigarettes_recode best32. ;
	informat redwine_yn best32. ;
	informat redwine_day best32. ;
	informat redwine_week best32. ;
	informat redwine_recode best32. ;
	informat otherwine_yn best32. ;
	informat otherwine_day best32. ;
	informat otherwine_week best32. ;
	informat otherwine_recode best32. ;
	informat beer_yn best32. ;
	informat beer_day best32. ;
	informat beer_week best32. ;
	informat beer_recode best32. ;
	informat liquor_yn best32. ;
	informat liquor_day best32. ;
	informat liquor_week best32. ;
	informat liquor_recode best32. ;
	informat coffee_yn best32. ;
	informat coffee_day best32. ;
	informat coffee_week best32. ;
	informat coffee_recode best32. ;
	informat tea_yn best32. ;
	informat tea_day best32. ;
	informat tea_week best32. ;
	informat tea_recode best32. ;
	informat soda_yn best32. ;
	informat soda_day best32. ;
	informat soda_week best32. ;
	informat soda_recode best32. ;
	informat marijuana_yn best32. ;
	informat marijuana_day best32. ;
	informat marijuana_week best32. ;
	informat marijuana_recode best32. ;
	informat cocaine_yn best32. ;
	informat cocaine_day best32. ;
	informat cocaine_week best32. ;
	informat cocaine_recode best32. ;
	informat shs_hoursday best32. ;
	informat number_smokers best32. ;
	informat lifestyle_habits_complete best32. ;
	informat complications_yn best32. ;
	informat comp_anemia best32. ;
	informat comp_anx_dep best32. ;
	informat comp_bleeding best32. ;
	informat comp_birth_defect best32. ;
	informat comp_cervical_problem best32. ;
	informat comp_gdm best32. ;
	informat comp_htn best32. ;
	informat comp_igr best32. ;
	informat comp_pp best32. ;
	informat comp_pe best32. ;
	informat comp_prom best32. ;
	informat comp_ptl best32. ;
	informat comp_other best32. ;
	informat pregnancy_complicati_v_2 best32. ;

input
	study_id 
	redcap_event_name $
	t3_sysid $
	t3_userid $
	t3_q_version $
	t3_q3_date
	t3_paperdt
	t3_paperusername $
	t3_time_stamp $
	t3_time_started $
	t3_time_started_raw $
	t3_time_end_raw $
	t3_timecompleted $
	t3_bypassed $
	t3_currentpage $
	t3_complete $
	t3_paperyn
	t3_dropped
	t3_q4
	t3_q1_days 
	t3_q1_wks 
	t3_q1_wks_recode 
	t3_q2_wt_kg 
	t3_q2_wt_lbs 
	t3_q2_wt_lbs_recode 
	t3_q3_height_cm 
	t3_q3_height_ft 
	t3_q3_height_in 
	t3_q3_ht_in_recode
	t3_q5d
	t3_q5e
	t3_q5f
	t3_q5g
	t3_q5h
	t3_q5i
	t3_q5j
	t3_q5ja
	t3_q5ja1
	t3_q5jb
	t3_q5k
	t3_q8
	t3_q9
	t3_q10
	t3_q11
	t3_q12
	t3_q13
	t3_q22
	t3_q22a1
	t3_q22a2
	t3_q22a3
	t3_q22a4
	t3_q22a5
	t3_q22a6
	t3_q22a7
	t3_q22a8
	t3_q22a9
	t3_q22a10
	t3_q22b_a
	t3_q22b1
	t3_q22b_b
	t3_q22b2
	t3_q22b_c
	t3_q22b3_a
	t3_q22b3_b
	t3_q22b3_c
	t3_q22b3_d
	t3_q22b_d
	t3_q22b4
	t3_q22b4_a
	t3_q22b4_b
	t3_q22b4_c
	t3_q22b4_d
	t3_q22b4_e
	t3_q22b4_f
	t3_q22b4_g
	t3_q22b4_h
	t3_q22b4_i
	t3_q22b4_j
	t3_q22b_e
	t3_q22b_f
	t3_q22c
	t3_q22d
	t3_q22e
	t3_q22e1
	t3_q22f
	t3_q23
	t3_q24
	t3_q25a
	t3_q25b
	t3_q25c
	t3_q25d
	t3_q25e
	t3_q25f
	t3_q31_yn
	t3_q31a
	t3_q31b
	t3_q32
	t3_q33
	t3_q34
	t3_q35
	t3_q36
	t3_q37_yn
	t3_q37_t1
	t3_q37_t2
	t3_q37_t3
	t3_q38_yn
	t3_q38_t1
	t3_q38_t2
	t3_q38_t3
	t3_q39_yn
	t3_q39_t1
	t3_q39_t2
	t3_q39_t3
	t3_q40_yn
	t3_q40_t1
	t3_q40_t2
	t3_q40_t3
	t3_q41_yn
	t3_q41_t1
	t3_q41_t2
	t3_q41_t3
	t3_q42_yn
	t3_q42_specify $
	t3_q42_t1
	t3_q42_t2
	t3_q42_t3
	t3_q43
	third_trimester_ques_v_0
	medications_yn
	allergy_yn
	allergy_script
	allergy_otc
	arthritis_yn
	arthritis_script
	arthritis_otc
	asthma_yn
	asthma_script
	asthma_otc
	copd_yn
	copd_script
	copd_otc
	depression_yn
	depression_script
	despression_otc
	diabetes_yn
	diabetes_script
	diabetes_otc
	genital_yn
	genital_script
	genital_otc
	gi_yn
	gi_script
	gi_otc
	bp_yn
	bp_script
	bp_otc
	nausea_yn
	nausea_script
	nausea_otc
	pain_yn
	pain_script
	pain_otc
	respinfect_yn
	respinfect_script
	respinfect_otc
	thyroid_yn
	thyroid_script
	thyroid_otc
	urinary_yn
	urinary_script
	urinary_otc
	othermed_yn
	othermedscript
	othermed_otc
	medication_history_complete
	prenatalvitamin_yn
	prenatalvitamin_form
	supplements_yn
	multivitamin_yn
	multivitmain_form
	iron_yn
	iron_form
	calcium_yn
	calcium_form
	aminoacid_yn
	aminoacid_form
	herbal_yn
	herbal_form
	vita_yn
	vita_form
	vitc_yn
	vitc_form
	vitd_yn
	vitd_form
	vite_yn
	vite_form
	vitk_yn
	vitk_form
	fishoil_yn
	fishoil_form
	other_yn
	other_form
	unsure_yn
	unsure_form
	nutritional_suppleme_v_1
	food_organic
	food_homegrown
	food_unprocessed
	food_canned
	food_frozen
	food_fresh
	mealsperweek_pb
	mealsperweek_beef
	mealsperweek_seafood
	mealsperweek_poultry
	mealsperweek_othermeats
	mealsperweek_spices
	mealsperweek_oils
	mealsperweek_soy
	mealsperweek_dairy
	meals_restaurant
	meals_fastfood
	diet_complete
	cigarettes_yn
	cigarettes_day
	cigarettes_week
	cigarettes_recode
	redwine_yn
	redwine_day
	redwine_week
	redwine_recode
	otherwine_yn
	otherwine_day
	otherwine_week
	otherwine_recode
	beer_yn
	beer_day
	beer_week
	beer_recode
	liquor_yn
	liquor_day
	liquor_week
	liquor_recode
	coffee_yn
	coffee_day
	coffee_week
	coffee_recode
	tea_yn
	tea_day
	tea_week
	tea_recode
	soda_yn
	soda_day
	soda_week
	soda_recode
	marijuana_yn
	marijuana_day
	marijuana_week
	marijuana_recode
	cocaine_yn
	cocaine_day
	cocaine_week
	cocaine_recode
	shs_hoursday
	number_smokers
	lifestyle_habits_complete
	complications_yn
	comp_anemia
	comp_anx_dep
	comp_bleeding
	comp_birth_defect
	comp_cervical_problem
	comp_gdm
	comp_htn
	comp_igr
	comp_pp
	comp_pe
	comp_prom
	comp_ptl
	comp_other
	pregnancy_complicati_v_2
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents data=q3_comp.q3_rc order=varnum; run;


data q3_comp.Q3_2020; set q3_comp.Q3_22119; 
study_id=input(studyid, best8.); run;


data q3_comp.Q3_2020; format study_id StudyID
t3_sysid
t3_userid
t3_q_version
t3_q3_date
t3_paperdt
t3_paperusername
t3_time_stamp
t3_time_started
t3_time_started_raw
t3_time_end_raw
t3_timecompleted
t3_bypassed
t3_currentpage
t3_complete
t3_paperyn
t3_dropped
t3_q4
t3_q1_days
t3_q1_wks
t3_q1_wks_recode
t3_q2_wt_kg
t3_q2_wt_lbs
t3_q2_wt_lbs_recode
t3_q3_height_cm
t3_q3_height_ft
t3_q3_height_in
t3_q3_ht_in_recode
t3_q5d
t3_q5e
t3_q5f
t3_q5g
t3_q5h
t3_q5i
t3_q5j
t3_q5ja
t3_q5ja1
t3_q5jb
t3_q5k
t3_q8
t3_q9
t3_q10
t3_q11
t3_q12
t3_q13
t3_q22
t3_q22a1
t3_q22a2
t3_q22a3
t3_q22a4
t3_q22a5
t3_q22a6
t3_q22a7
t3_q22a8
t3_q22a9
t3_q22a10
t3_q22b_a
t3_q22b1
t3_q22b_b
t3_q22b2
t3_q22b_c
t3_q22b3_a
t3_q22b3_b
t3_q22b3_c
t3_q22b3_d
t3_q22b_d
t3_q22b4
t3_q22b4_a
t3_q22b4_b
t3_q22b4_c
t3_q22b4_d
t3_q22b4_e
t3_q22b4_f
t3_q22b4_g
t3_q22b4_h
t3_q22b4_i
t3_q22b4_j
t3_q22b_e
t3_q22b_f
t3_q22c
t3_q22d
t3_q22e
t3_q22e1
t3_q22f
t3_q23
t3_q24
t3_q25a
t3_q25b
t3_q25c
t3_q25d
t3_q25e
t3_q25f
t3_q31_yn
t3_q31a
t3_q31b
t3_q32
t3_q33
t3_q34
t3_q35
t3_q36
t3_q37_yn
t3_q37_t1
t3_q37_t2
t3_q37_t3
t3_q38_yn
t3_q38_t1
t3_q38_t2
t3_q38_t3
t3_q39_yn
t3_q39_t1
t3_q39_t2
t3_q39_t3
t3_q40_yn
t3_q40_t1
t3_q40_t2
t3_q40_t3
t3_q41_yn
t3_q41_t1
t3_q41_t2
t3_q41_t3
t3_q42_yn
t3_q42_specify
t3_q42_t1
t3_q42_t2
t3_q42_t3
t3_q43
; set q3_comp.Q3_2020; run;

proc contents data=q3_comp.Q3_2020 order=varnum; run;

proc sort data=q3_comp.q3_rc; by study_id; run;
proc sort data=q3_comp.Q3_2020; by study_id; run;

data q3_comp.Q3_2020; set q3_comp.Q3_2020;
if study_id=7047 then delete; run;

%macro tres(new, old, name, ident);
proc compare base=q3_comp.q3_rc compare=q3_comp.Q3_2020 out=&name 
outnoequal outbase outcomp outdif noprint;
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

%tres(	t3_q4	,	t3_q4	, 	var1	,	'var1'	);
%tres(	t3_q1_days	,	t3_q1_days	, 	var2	,	'var2'	);
%tres(	t3_q1_wks	,	t3_q1_wks	, 	var3	,	'var3'	);
%tres(	t3_q1_wks_recode	,	t3_q1_wks_recode	, 	var4	,	'var4'	);
%tres(	t3_q2_wt_kg	,	t3_q2_wt_kg	, 	var5	,	'var5'	);
%tres(	t3_q2_wt_lbs	,	t3_q2_wt_lbs	, 	var6	,	'var6'	);
%tres(	t3_q2_wt_lbs_recode	,	t3_q2_wt_lbs_recode	, 	var7	,	'var7'	);
%tres(	t3_q3_height_cm	,	t3_q3_height_cm	, 	var8	,	'var8'	);
%tres(	t3_q3_height_ft	,	t3_q3_height_ft	, 	var9	,	'var9'	);
%tres(	t3_q3_height_in	,	t3_q3_height_in	, 	var10	,	'var10'	);
%tres(	t3_q3_ht_in_recode	,	t3_q3_ht_in_recode	, 	var11	,	'var11'	); /*changed 9085 because kg was way out of range, 512*/
%tres(	t3_q5d	,	t3_q5d	, 	var12	,	'var12'	);
%tres(	t3_q5e	,	t3_q5e	, 	var13	,	'var13'	);
%tres(	t3_q5f	,	t3_q5f	, 	var14	,	'var14'	);
%tres(	t3_q5g	,	t3_q5g	, 	var15	,	'var15'	);
%tres(	t3_q5h	,	t3_q5h	, 	var16	,	'var16'	);
%tres(	t3_q5i	,	t3_q5i	, 	var17	,	'var17'	);
%tres(	t3_q5j	,	t3_q5j	, 	var18	,	'var18'	);
%tres(	t3_q5ja	,	t3_q5ja	, 	var19	,	'var19'	);
%tres(	t3_q5ja1	,	t3_q5ja1	, 	var20	,	'var20'	);
%tres(	t3_q5jb	,	t3_q5jb	, 	var21	,	'var21'	); /*new -3*/
%tres(	t3_q5k	,	t3_q5k	, 	var22	,	'var22'	);

%tres(	t3_q8	,	t3_q8	, 	var23	,	'var23'	);
%tres(	t3_q9	,	t3_q9	, 	var24	,	'var24'	);
%tres(	t3_q10	,	t3_q10	, 	var25	,	'var25'	);
%tres(	t3_q11	,	t3_q11	, 	var26	,	'var26'	);
%tres(	t3_q12	,	t3_q12	, 	var27	,	'var27'	);
/*q8 -- 12 all different, run proc freq instead*/

	proc freq data=q3_comp.q3_rc;
	table t3_q8; title; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q8; run; 

	proc freq data=q3_comp.q3_rc;
	table t3_q9; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q9; run; 

	proc freq data=q3_comp.q3_rc;
	table t3_q10; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q10; run;

	proc freq data=q3_comp.q3_rc;
	table t3_q11; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q11; run; 

	proc freq data=q3_comp.q3_rc;
	table t3_q12; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q12; run; 

%tres(	t3_q13	,	t3_q13	, 	var28	,	'var28'	);
%tres(	t3_q22	,	t3_q22	, 	var29	,	'var29'	);
%tres(	t3_q22a1	,	t3_q22a1	, 	var30	,	'var30'	);
%tres(	t3_q22a2	,	t3_q22a2	, 	var31	,	'var31'	);
%tres(	t3_q22a3	,	t3_q22a3	, 	var32	,	'var32'	);
%tres(	t3_q22a4	,	t3_q22a4	, 	var33	,	'var33'	);
%tres(	t3_q22a5	,	t3_q22a5	, 	var34	,	'var34'	);
%tres(	t3_q22a6	,	t3_q22a6	, 	var35	,	'var35'	);
%tres(	t3_q22a7	,	t3_q22a7	, 	var36	,	'var36'	);
%tres(	t3_q22a8	,	t3_q22a8	, 	var37	,	'var37'	);
%tres(	t3_q22a9	,	t3_q22a9	, 	var38	,	'var38'	);

%tres(	t3_q22b_a	,	t3_q22b_a	, 	var39	,	'var39'	);
%tres(	t3_q22b1	,	t3_q22b1	, 	var40	,	'var40'	); /*recoded n=5 to match previous carbonless paper codes*/

%tres(	t3_q22b_b	,	t3_q22b_c	, 	var41	,	'var41'	);
%tres(	t3_q22b2	,	t3_q22b2	, 	var42	,	'var42'	); /*n=4 to match q1, q2, should be food service worker*/

%tres(	t3_q22b_c	,	t3_q22b_e	, 	var43	,	'var43'	);
%tres(	t3_q22b3_a	,	t3_q22b3_a	, 	var44	,	'var44'	);
%tres(	t3_q22b3_b	,	t3_q22b3_c	, 	var45	,	'var45'	);/*6146*/
%tres(	t3_q22b3_c	,	t3_q22b3_b	, 	var46	,	'var46'	);/*6146, likely switch*/
%tres(	t3_q22b3_d	,	t3_q22b3_d	, 	var47	,	'var47'	);

%tres(	t3_q22b_d	,	t3_q22b_b	, 	var48	,	'var48'	);
%tres(	t3_q22b4	,	t3_q22b4	, 	var49	,	'var49'	);
%tres(	t3_q22b4_a	,	t3_q22b4_a	, 	var50	,	'var50'	);
%tres(	t3_q22b4_b	,	t3_q22b4_b	, 	var51	,	'var51'	);
%tres(	t3_q22b4_c	,	t3_q22b4_c	, 	var52	,	'var52'	);
%tres(	t3_q22b4_d	,	t3_q22b4_d	, 	var53	,	'var53'	);
%tres(	t3_q22b4_e	,	t3_q22b4_e	, 	var54	,	'var54'	);
%tres(	t3_q22b4_f	,	t3_q22b4_f	, 	var55	,	'var55'	);
%tres(	t3_q22b4_g	,	t3_q22b4_g	, 	var56	,	'var56'	);
%tres(	t3_q22b4_h	,	t3_q22b4_h	, 	var57	,	'var57'	);
%tres(	t3_q22b4_i	,	t3_q22b4_i	, 	var58	,	'var58'	);
%tres(	t3_q22b4_j	,	t3_q22b4_j	, 	var59	,	'var59'	);
%tres(	t3_q22b_e	,	t3_q22b_d	, 	var60	,	'var60'	);
%tres(	t3_q22c	,	t3_q22c	, 	var61	,	'var61'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q22c; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q22c; run; /*new -3 for 11 that should have filled this out*/
%tres(	t3_q22d	,	t3_q22d	, 	var62	,	'var62'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q22d; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q22d; run;/*new -3 for 11 that should have filled this out*/
%tres(	t3_q22e	,	t3_q22e	, 	var63	,	'var63'	);
%tres(	t3_q22e1,	t3_q22e1, 	var64	,	'var64'	);
%tres(	t3_q22f	,	t3_q22f	, 	var65	,	'var65'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q22f; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q22f; run;/*new -3 for 13 that should have filled this out*/
%tres(	t3_q23	,	t3_q23	, 	var66	,	'var66'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q23; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q23; run;
%tres(	t3_q24	,	t3_q24	, 	var67	,	'var67'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q24; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q24; run;
%tres(	t3_q25a	,	t3_q25a	, 	var68	,	'var68'	);
%tres(	t3_q25b	,	t3_q25b	, 	var69	,	'var69'	);
%tres(	t3_q25c	,	t3_q25c	, 	var70	,	'var70'	);
%tres(	t3_q25d	,	t3_q25d	, 	var71	,	'var71'	);
%tres(	t3_q25e	,	t3_q25e	, 	var72	,	'var72'	);

%tres(	t3_q31_yn,	t3_q31_yn, 	var73	,	'var73'	);
%tres(	t3_q31a	,	t3_q31a	, 	var74	,	'var74'	);
%tres(	t3_q31b	,	t3_q31b	, 	var75	,	'var75'	);
	proc freq data=q3_comp.q3_rc;
	table t3_q31b; run;
	proc freq data=q3_comp.Q3_2020;
	table t3_q31b; run; /*old had 4 as category, set to missing in RC*/

%tres(	t3_q32	,	t3_q32	, 	var76	,	'var76'	);
%tres(	t3_q33	,	t3_q33	, 	var77	,	'var77'	);
%tres(	t3_q34	,	t3_q34	, 	var78	,	'var78'	);
%tres(	t3_q35	,	t3_q35	, 	var79	,	'var79'	);
%tres(	t3_q36	,	t3_q36	, 	var80	,	'var80'	); /*old had 4 as category, set to missing in RC*/

%tres(	t3_q37_yn	,	t3_q37_yn	, 	var81	,	'var81'	);
%tres(	t3_q37_t1	,	t3_q37_t1	, 	var82	,	'var82'	); /*8111 known missing*/
%tres(	t3_q37_t2	,	t3_q37_t2	, 	var83	,	'var83'	);
%tres(	t3_q37_t3	,	t3_q37_t3	, 	var84	,	'var84'	);
%tres(	t3_q38_yn	,	t3_q38_yn	, 	var85	,	'var85'	);
%tres(	t3_q38_t1	,	t3_q38_t1	, 	var86	,	'var86'	); /*7077, 9045 known missing*/
%tres(	t3_q38_t2	,	t3_q38_t2	, 	var87	,	'var87'	); /*7077, 9045 known missing*/
%tres(	t3_q38_t3	,	t3_q38_t3	, 	var88	,	'var88'	); /*7077, 9045 known missing*/
%tres(	t3_q39_yn	,	t3_q39_yn	, 	var89	,	'var89'	); /*weirdly had 2 code, recoded to 1*/
%tres(	t3_q39_t1	,	t3_q39_t1	, 	var90	,	'var90'	);
%tres(	t3_q39_t2	,	t3_q39_t2	, 	var91	,	'var91'	);
%tres(	t3_q39_t3	,	t3_q39_t3	, 	var92	,	'var92'	);
%tres(	t3_q40_yn	,	t3_q40_yn	, 	var93	,	'var93'	);
%tres(	t3_q40_t1	,	t3_q40_t1	, 	var94	,	'var94'	); /*7094 known missing*/
%tres(	t3_q40_t2	,	t3_q40_t2	, 	var95	,	'var95'	); /*7094 known missing*/
%tres(	t3_q40_t3	,	t3_q40_t3	, 	var96	,	'var96'	); /*7094 known missing*/
%tres(	t3_q41_yn	,	t3_q41_yn	, 	var97	,	'var97'	);
%tres(	t3_q41_t1	,	t3_q41_t1	, 	var98	,	'var98'	); /*9045 known missing*/
%tres(	t3_q41_t2	,	t3_q41_t2	, 	var99	,	'var99'	); /*9045 known missing*/
%tres(	t3_q41_t3	,	t3_q41_t3	, 	var100	,	'var100'); /*9045 known missing*/
%tres(	t3_q42_yn	,	t3_q42_yn	, 	var101	,	'var101'); 
%tres(	t3_q42_specify,	t3_q42_specify, 	var102	,	'var102');
%tres(	t3_q42_t1	,	t3_q42_t1	, 	var103	,	'var103'	); /*n4 6010, 6022, 7063, 8251, known missing*/
%tres(	t3_q42_t2	,	t3_q42_t2	, 	var104	,	'var104'	); /*n4 6010, 6022, 7063, 8251, known missing*/
%tres(	t3_q42_t3	,	t3_q42_t3	, 	var105	,	'var105'	); /*n4 6010, 6022, 7063, 8251, known missing*/
%tres(	t3_q43	,	t3_q43	, 	var106	,	'var106'	);

/*repeated vars*/
%macro yn(new, old);
	proc freq data=q3_comp.q3_rc;
	table &new; title; run;

	proc freq data=q3_comp.Q3_2020;
	table &old; run;
%mend;
%tres(	allergy_yn	,	T3_Q5A1_A_YN	, 	var1	,	'var1'	);
%tres(	allergy_script	,	T3_Q5A1_A_SCRIPT	, 	var2	,	'var2'	);
%tres(	allergy_otc	,	T3_Q5A1_A_OTC	, 	var3	,	'var3'	);
%tres(	arthritis_yn	,	T3_Q5A1_B_YN	, 	var4	,	'var4'	);
%tres(	arthritis_script	,	T3_Q5A1_B_SCRIPT	, 	var5	,	'var5'	);
%tres(	arthritis_otc	,	T3_Q5A1_B_OTC	, 	var6	,	'var6'	);
%tres(	asthma_yn	,	T3_Q5A1_C_YN	, 	var7	,	'var7'	);
%tres(	asthma_script	,	T3_Q5A1_C_SCRIPT	, 	var8	,	'var8'	);
%tres(	asthma_otc	,	T3_Q5A1_C_OTC	, 	var9	,	'var9'	);
%tres(	copd_yn	,	T3_Q5A1_D_YN	, 	var10	,	'var10'	);
%tres(	copd_script	,	T3_Q5A1_D_SCRIPT	, 	var11	,	'var11'	);
%tres(	copd_otc	,	T3_Q5A1_D_OTC	, 	var12	,	'var12'	);
%tres(	depression_yn	,	T3_Q5A1_E_YN	, 	var13	,	'var13'	);
%tres(	depression_script	,	T3_Q5A1_E_SCRIPT	, 	var14	,	'var14'	);
%tres(	despression_otc	,	T3_Q5A1_E_OTC	, 	var15	,	'var15'	);
%tres(	diabetes_yn	,	T3_Q5A1_F_YN	, 	var16	,	'var16'	);
%tres(	diabetes_script	,	T3_Q5A1_F_SCRIPT	, 	var17	,	'var17'	);
%tres(	diabetes_otc	,	T3_Q5A1_F_OTC	, 	var18	,	'var18'	);

%tres(	genital_yn	,	T3_Q5A1_G_YN	, 	var19	,	'var19'	);
%tres(	genital_script	,	T3_Q5A1_G_SCRIPT	, 	var20	,	'var20'	);
%tres(	genital_otc	,	T3_Q5A1_G_OTC	, 	var21	,	'var21'	);

%tres(	gi_yn	,	T3_Q5A1_H_YN	, 	var22	,	'var22'	);
%tres(	gi_script	,	T3_Q5A1_H_SCRIPT	, 	var23	,	'var23'	);
%tres(	gi_otc	,	T3_Q5A1_H_OTC	, 	var24	,	'var24'	);

%tres(	bp_yn	,	T3_Q5A1_I_YN	, 	var25	,	'var25'	);
%tres(	bp_script	,	T3_Q5A1_I_SCRIPT	, 	var26	,	'var26'	);
%tres(	bp_otc	,	T3_Q5A1_I_OTC	, 	var27	,	'var27'	);

%tres(	nausea_yn	,	T3_Q5A1_J_YN	, 	var28	,	'var28'	);
%tres(	nausea_script	,	T3_Q5A1_J_SCRIPT	, 	var29	,	'var29'	);
%tres(	nausea_otc	,	T3_Q5A1_J_OTC	, 	var30	,	'var30'	);

%tres(	pain_yn	,	T3_Q5A1_K_YN	, 	var31	,	'var31'	);
%tres(	pain_script	,	T3_Q5A1_K_SCRIPT	, 	var32	,	'var32'	);
%tres(	pain_otc	,	T3_Q5A1_K_OTC	, 	var33	,	'var33'	);

%tres(	respinfect_yn	,	T3_Q5A1_L_YN	, 	var34	,	'var34'	);
%tres(	respinfect_script	,	T3_Q5A1_L_SCRIPT	, 	var35	,	'var35'	);
%tres(	respinfect_otc	,	T3_Q5A1_L_OTC	, 	var36	,	'var36'	);

%tres(	thyroid_yn	,	T3_Q5A1_M_YN	, 	var37	,	'var37'	);
%tres(	thyroid_script	,	T3_Q5A1_M_SCRIPT	, 	var38	,	'var38'	);
%tres(	thyroid_otc	,	T3_Q5A1_M_OTC	, 	var39	,	'var39'	);

%tres(	urinary_yn	,	T3_Q5A1_N_YN	, 	var40	,	'var40'	);
%tres(	urinary_script	,	T3_Q5A1_N_SCRIPT	, 	var41	,	'var41'	);
%tres(	urinary_otc	,	T3_Q5A1_N_OTC	, 	var42	,	'var42'	);


%tres(	othermed_yn	,	T3_Q5A1_O_YN	, 	var43	,	'var43'	);
%tres(	othermedscript	,	T3_Q5A1_O_SCRIPT	, 	var44	,	'var44'	);
%tres(	othermed_otc	,	T3_Q5A1_O_OTC	, 	var45	,	'var45'	);

%yn(	prenatalvitamin_yn	,	T3_Q5B	);
%tres(	prenatalvitamin_form	,	T3_Q5B1	, 	var47	,	'var47'	);
%yn(	supplements_yn	,	T3_Q5C	);

%tres(	multivitamin_yn	,	T3_Q5C_A_YN	, 	var49	,	'var49'	);
%tres(	multivitmain_form	,	T3_Q5C_A_FORM	, 	var50	,	'var50'	);
%tres(	iron_yn	,	T3_Q5C_B_YN	, 	var51	,	'var51'	);
%tres(	iron_form	,	T3_Q5C_B_FORM	, 	var52	,	'var52'	);
%tres(	calcium_yn	,	T3_Q5C_C_YN	, 	var53	,	'var53'	);
%tres(	calcium_form	,	T3_Q5C_C_FORM	, 	var54	,	'var54'	);
%tres(	aminoacid_yn	,	T3_Q5C_D_YN	, 	var55	,	'var55'	);
%tres(	aminoacid_form	,	T3_Q5C_D_FORM	, 	var56	,	'var56'	);
%tres(	herbal_yn	,	T3_Q5C_E_YN	, 	var57	,	'var57'	);
%tres(	herbal_form	,	T3_Q5C_E_FORM	, 	var58	,	'var58'	);
%tres(	vita_yn	,	T3_Q5C_F_YN	, 	var59	,	'var59'	);
%tres(	vita_form	,	T3_Q5C_F_FORM	, 	var60	,	'var60'	);
%tres(	vitc_yn	,	T3_Q5C_G_YN	, 	var61	,	'var61'	);
%tres(	vitc_form	,	T3_Q5C_G_FORM	, 	var62	,	'var62'	);
%tres(	vitd_yn	,	T3_Q5C_H_YN	, 	var63	,	'var63'	);
%tres(	vitd_form	,	T3_Q5C_H_FORM	, 	var64	,	'var64'	);
%tres(	vite_yn	,	T3_Q5C_I_YN	, 	var65	,	'var65'	);
%tres(	vite_form	,	T3_Q5C_I_FORM	, 	var66	,	'var66'	);
%tres(	vitk_yn	,	T3_Q5C_J_YN	, 	var67	,	'var67'	);
%tres(	vitk_form	,	T3_Q5C_J_FORM	, 	var68	,	'var68'	);
%tres(	fishoil_yn	,	T3_Q5C_K_YN	, 	var69	,	'var69'	);
%tres(	fishoil_form	,	T3_Q5C_K_FORM	, 	var70	,	'var70'	);
%tres(	other_yn	,	T3_Q5C_L_YN	, 	var71	,	'var71'	);
%tres(	other_form	,	T3_Q5C_L_FORM	, 	var72	,	'var72'	);
%tres(	unsure_yn	,	T3_Q5C_M_YN	, 	var73	,	'var73'	);
%tres(	unsure_form	,	T3_Q5C_M_FORM	, 	var74	,	'var74'	); /*-3s and 1s to yn*/


%yn(	food_organic	,	T3_Q14	);
%yn(	food_homegrown	,	T3_Q15	);
%yn(	food_unprocessed	,	T3_Q16	);
%yn(	food_canned	,	T3_Q16A	);
%yn(	food_frozen	,	T3_Q16B	);
%yn(	food_fresh	,	T3_Q16C	);

%tres(	mealsperweek_pb	,	T3_Q17A	, 	var81	,	'var81'	);
%tres(	mealsperweek_beef	,	T3_Q17B	, 	var82	,	'var82'	);
%tres(	mealsperweek_seafood	,	T3_Q17C	, 	var83	,	'var83'	);
%tres(	mealsperweek_poultry	,	T3_Q17D	, 	var84	,	'var84'	);
%tres(	mealsperweek_othermeats	,	T3_Q17E	, 	var85	,	'var85'	);
%tres(	mealsperweek_spices	,	T3_Q17F	, 	var86	,	'var86'	);
%tres(	mealsperweek_oils	,	T3_Q17G	, 	var87	,	'var87'	);
%tres(	mealsperweek_soy	,	T3_Q17H	, 	var88	,	'var88'	);
%tres(	mealsperweek_dairy	,	T3_Q17I	, 	var89	,	'var89'	);
%tres(	meals_restaurant	,	T3_Q18	, 	var90	,	'var90'	);
%tres(	meals_fastfood	,	T3_Q18A	, 	var91	,	'var91'	); /*0s to blank because it's a branched q*/

%tres(	complications_yn	,	T3_Q7	, 	var92	,	'var92'	);
%tres(	comp_anemia	,	T3_Q7A_1	, 	var93	,	'var93'	);
%tres(	comp_anx_dep	,	T3_Q7A_3	, 	var94	,	'var94'	);
%tres(	comp_bleeding	,	T3_Q7A_7	, 	var95	,	'var95'	);
%tres(	comp_birth_defect	,	T3_Q7A_5	, 	var96	,	'var96'	);
%tres(	comp_cervical_problem	,	T3_Q7A_9	, 	var97	,	'var97'	);
%tres(	comp_gdm	,	T3_Q7A_11	, 	var98	,	'var98'	);
%tres(	comp_htn	,	T3_Q7A_13	, 	var99	,	'var99'	);
%tres(	comp_igr	,	T3_Q7A_2	, 	var100	,	'var100'	);
%tres(	comp_pp	,	T3_Q7A_4	, 	var101	,	'var101'	);
%tres(	comp_pe	,	T3_Q7A_6	, 	var102	,	'var102'	);
%tres(	comp_prom	,	T3_Q7A_8	, 	var103	,	'var103'	);
%tres(	comp_ptl	,	T3_Q7A_10	, 	var104	,	'var104'	);
%tres(	comp_other	,	T3_Q7A_12	, 	var105	,	'var105'	);


%yn(	cigarettes_yn	,	T3_Q19A_YN	);
%yn(	cigarettes_day	,	T3_Q19A_DAY	);
%yn(	cigarettes_week	,	T3_Q19A_WEEK	);
%tres(	cigarettes_recode,	T3_Q19A_WKS_Recode, var105,	'var105'); /*6232*/

%yn(	redwine_yn	,	T3_Q19B_YN	);
%yn(	redwine_day	,	T3_Q19B_DAY	);
%yn(	redwine_week	,	T3_Q19B_WEEK	);
%tres(	redwine_recode,	T3_Q19B_WKS_Recode, var105,	'var105'); /*6232, 6157*/

%yn(	otherwine_yn	,	T3_Q19C_YN	);
%yn(	otherwine_day	,	T3_Q19C_DAY	);
%yn(	otherwine_week	,	T3_Q19C_WEEK	);
%yn(	otherwine_recode	,	T3_Q19C_WKS_Recode	);
%tres(	otherwine_recode,	T3_Q19C_WKS_Recode, var105,	'var105');


%yn(	beer_yn	,	T3_Q19D_YN	);
%yn(	beer_day	,	T3_Q19D_DAY	);
%yn(	beer_week	,	T3_Q19D_WEEK	);
%yn(	beer_recode	,	T3_Q19D_WKS_Recode	);
%tres(	beer_recode,	T3_Q19D_WKS_Recode, var105,	'var105'); /*9061*/

%yn(	liquor_yn	,	T3_Q19E_YN	);
%yn(	liquor_day	,	T3_Q19E_DAY	);
%yn(	liquor_week	,	T3_Q19E_WEEK	);
%yn(	liquor_recode	,	T3_Q19E_WKS_Recode	);
%tres(	liquor_recode,	T3_Q19E_WKS_Recode, var105,	'var105'); 

%yn(	coffee_yn	,	T3_Q19F_YN	);
%yn(	coffee_day	,	T3_Q19F_DAY	);
%yn(	coffee_week	,	T3_Q19F_WEEK	);
%yn(	coffee_recode	,	T3_Q19F_WKS_Recode	);
%tres(	coffee_recode,	T3_Q19F_WKS_Recode, var105,	'var105'); /*6157, 6165, 9045*/


%yn(	tea_yn	,	T3_Q19G_YN	);
%yn(	tea_day	,	T3_Q19G_DAY	);
%yn(	tea_week	,	T3_Q19G_WEEK	);
%tres(	tea_recode,	T3_Q19G_WKS_Recode, var105,	'var105'); /*6030, 9038, 9045*/


%yn(	soda_yn	,	T3_Q19H_YN	);
%yn(	soda_day	,	T3_Q19H_DAY	);
%yn(	soda_week	,	T3_Q19H_WEEK	);
%tres(	soda_recode,	T3_Q19H_WKS_Recode, var105,	'var105'); /*6157, 6165, 7100*/

%yn(	marijuana_yn	,	T3_Q19I_YN	);
%yn(	marijuana_day	,	T3_Q19I_DAY	);
%yn(	marijuana_week	,	T3_Q19I_WEEK	);
%yn(	marijuana_recode	,	T3_Q19I_WKS_Recode	);
%tres(	marijuana_recode,	T3_Q19I_WKS_Recode, var105,	'var105');


%yn(	cocaine_yn	,	T3_Q19J_YN	);
%yn(	cocaine_day	,	T3_Q19J_DAY	);
%yn(	cocaine_week	,	T3_Q19J_WEEK	);
%yn(	cocaine_recode	,	T3_Q19J_WKS_Recode	);
%yn(	shs_hoursday	,	T3_Q20	);
%yn(	number_smokers	,	T3_Q21	);

