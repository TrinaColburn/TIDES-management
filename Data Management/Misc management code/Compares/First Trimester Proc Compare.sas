/* Edit the following line to reflect the full path to your CSV file */
libname q1_comp "J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q1"; run;
%let csv_file = 'J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\<new>';

OPTIONS nofmterr;

data q1_comp.q1_rc_2021125; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=2 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t1_sysid $500. ;
	informat t1_userid $500. ;
	informat t1_qversion $500. ;
	informat t1_qversionnumber $500. ;
	informat t1_today_dt yymmdd10. ;
	informat t1_paperdt yymmdd10. ;
	informat t1_paperusername $500. ;
	informat t1_time_stamp $500. ;
	informat t1_time_started $500. ;
	informat t1_time_started_raw $500. ;
	informat t1_time_end_raw $500. ;
	informat t1_dropped best32. ;
	informat t1_bypassed $500. ;
	informat t1_pageno $500. ;
	informat t1_last_page $500. ;
	informat t1_page_0 $500. ;
	informat t1_page_1 $500. ;
	informat t1_page_2 $500. ;
	informat t1_page_3 $500. ;
	informat t1_page_4 $500. ;
	informat t1_page_5 $500. ;
	informat t1_page_6 $500. ;
	informat t1_page_7 $500. ;
	informat t1_page_8 $500. ;
	informat t1_page_9 $500. ;
	informat t1_page_10 $500. ;
	informat t1_page_11 $500. ;
	informat t1_complete $500. ;
	informat t1_paperyn best32. ;
	informat t1_q4 best32. ;
	informat t1_q5_lmp $500. ;
	informat t1_q5_dk best32. ;
	informat t1_q5_ns best32. ;
	informat t1_q1_wks best32. ;
	informat t1_q1_days best32. ;
	informat t1_q1_wks_recode best32. ;
	informat t1_q1_dk best32. ;
	informat t1_q2_ht_cm best32. ;
	informat t1_q2_ht_ft best32. ;
	informat t1_q2_ht_in best32. ;
	informat t1_q2_wt_kg best32. ;
	informat t1_q2_wt_lbs best32. ;
	informat t1_q2_ht_in_recode best32. ;
	informat t1_q2_wt_lbs_recode best32. ;
	informat t1_q6d best32. ;
	informat t1_q6e best32. ;
	informat t1_q6f best32. ;
	informat t1_q6g best32. ;
	informat t1_q6h best32. ;
	informat t1_q6i best32. ;
	informat t1_q7 best32. ;
	informat t1_q8 best32. ;
	informat t1_q8a best32. ;
	informat t1_q8a1 best32. ;
	informat t1_q9 best32. ;
	informat t1_q9a_yn best32. ;
	informat t1_q9a1_a best32. ;
	informat t1_q9a1_b best32. ;
	informat t1_q9a1_c best32. ;
	informat t1_q9a1_d best32. ;
	informat t1_q9a1_e best32. ;
	informat t1_q9a1_f best32. ;
	informat t1_q9b best32. ;
	informat t1_q10 best32. ;
	informat t1_q11 best32. ;
	informat t1_q12 best32. ;
	informat t1_q12a_a best32. ;
	informat t1_q12a_b best32. ;
	informat t1_q12a_c best32. ;
	informat t1_q12a_d best32. ;
	informat t1_q12a_e best32. ;
	informat t1_q12a_f best32. ;
	informat t1_q12a_g best32. ;
	informat t1_q12a_h best32. ;
	informat t1_q12a_i best32. ;
	informat t1_q13 best32. ;
	informat t1_q14 best32. ;
	informat t1_q15 best32. ;
	informat t1_q16 best32. ;
	informat t1_q17 best32. ;
	informat t1_q18 best32. ;
	informat t1_q19_1___1 best32. ;
	informat t1_q19_2___1 best32. ;
	informat t1_q19_3___1 best32. ;
	informat t1_q19_4___1 best32. ;
	informat t1_q19_5___1 best32. ;
	informat t1_q19_6___1 best32. ;
	informat t1_q19_7___1 best32. ;
	informat t1_q20 best32. ;
	informat t1_q21 best32. ;
	informat t1_q28 best32. ;
	informat t1_q29 best32. ;
	informat t1_q33 best32. ;
	informat t1_q34 best32. ;
	informat t1_q34a best32. ;
	informat t1_q34b best32. ;
	informat t1_q34c_a best32. ;
	informat t1_q34c_b best32. ;
	informat t1_q34c_c best32. ;
	informat t1_q34c_d best32. ;
	informat t1_q34d best32. ;
	informat t1_q34d1_a best32. ;
	informat t1_q34d1_b best32. ;
	informat t1_q34d1_c best32. ;
	informat t1_q34d1_d best32. ;
	informat t1_q34d1_e best32. ;
	informat t1_q34d1_f best32. ;
	informat t1_q34d1_g best32. ;
	informat t1_q34d1_h best32. ;
	informat t1_q34d1_i best32. ;
	informat t1_q34d1_j best32. ;
	informat t1_q35 best32. ;
	informat t1_q36 best32. ;
	informat t1_q37 best32. ;
	informat t1_q37a best32. ;
	informat t1_q38 best32. ;
	informat t1_q39 best32. ;
	informat t1_q39a best32. ;
	informat t1_q39a1_a best32. ;
	informat t1_q39a1_b best32. ;
	informat t1_q39a1_c best32. ;
	informat t1_q39a1_d best32. ;
	informat t1_q39a1_e best32. ;
	informat t1_q39a1_f best32. ;
	informat t1_q39a1_g best32. ;
	informat t1_q39a1_h best32. ;
	informat t1_q39a1_i best32. ;
	informat t1_q39b best32. ;
	informat t1_q39b1_a best32. ;
	informat t1_q39b1_b best32. ;
	informat t1_q39b1_c best32. ;
	informat t1_q39b1_d best32. ;
	informat t1_q39c best32. ;
	informat t1_q40 best32. ;
	informat t1_q41 best32. ;
	informat t1_q42 best32. ;
	informat t1_q43a_1_frag best32. ;
	informat t1_q43a_1_days best32. ;
	informat t1_q43a_2_frag best32. ;
	informat t1_q43a_2_days best32. ;
	informat t1_q43a_3_frag best32. ;
	informat t1_q43a_3_days best32. ;
	informat t1_q43a_4_frag best32. ;
	informat t1_q43a_4_days best32. ;
	informat t1_q43a_5_frag best32. ;
	informat t1_q43a_5_days best32. ;
	informat t1_q43b_1_frag best32. ;
	informat t1_q43b_1_days best32. ;
	informat t1_q43b_2_frag best32. ;
	informat t1_q43b_2_days best32. ;
	informat t1_q43b_3_frag best32. ;
	informat t1_q43b_3_days best32. ;
	informat t1_q43b_4_frag best32. ;
	informat t1_q43b_4_days best32. ;
	informat t1_q43b_5_frag best32. ;
	informat t1_q43b_5_days best32. ;
	informat t1_q43b_6_frag best32. ;
	informat t1_q43b_6_days best32. ;
	informat t1_q43b_7_frag best32. ;
	informat t1_q43b_7_days best32. ;
	informat t1_q43b_8_frag best32. ;
	informat t1_q43b_8_days best32. ;
	informat t1_q43b_9_frag best32. ;
	informat t1_q43b_9_days best32. ;
	informat t1_q43b_10_frag best32. ;
	informat t1_q43b_10_days best32. ;
	informat t1_q43b_11_frag best32. ;
	informat t1_q43b_11_days best32. ;
	informat t1_q43c_frag best32. ;
	informat t1_q43c_days best32. ;
	informat t1_q43d_frag best32. ;
	informat t1_q43d_days best32. ;
	informat t1_q43e_frag best32. ;
	informat t1_q43e_days best32. ;
	informat t1_q43f_frag best32. ;
	informat t1_q43f_days best32. ;
	informat t1_q43g_frag best32. ;
	informat t1_q43g_days best32. ;
	informat t1_q43h_frag best32. ;
	informat t1_q43h_days best32. ;
	informat t1_q43i_frag best32. ;
	informat t1_q43i_days best32. ;
	informat t1_q43j_frag best32. ;
	informat t1_q43j_days best32. ;
	informat t1_q43k_frag best32. ;
	informat t1_q43k_days best32. ;
	informat t1_q44a best32. ;
	informat t1_q44b best32. ;
	informat t1_q44c best32. ;
	informat t1_q44d best32. ;
	informat t1_q44e best32. ;
	informat t1_q44f best32. ;
	informat t1_q44g best32. ;
	informat t1_q44h best32. ;
	informat t1_q44i best32. ;
	informat t1_q44j $500. ;
	informat t1_q44j_recode best32. ;
	informat t1_q44k best32. ;
	informat t1_q48a best32. ;
	informat t1_q48b best32. ;
	informat t1_q48c best32. ;
	informat t1_q48d best32. ;
	informat t1_q48e best32. ;
	informat t1_q48f best32. ;
	informat studyid $500. ;
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

input
	study_id 
	redcap_event_name $
	t1_sysid $
	t1_userid $
	t1_qversion $
	t1_qversionnumber $
	t1_today_dt
	t1_paperdt
	t1_paperusername $
	t1_time_stamp $
	t1_time_started $
	t1_time_started_raw $
	t1_time_end_raw $
	t1_dropped
	t1_bypassed $
	t1_pageno $
	t1_last_page $
	t1_page_0 $
	t1_page_1 $
	t1_page_2 $
	t1_page_3 $
	t1_page_4 $
	t1_page_5 $
	t1_page_6 $
	t1_page_7 $
	t1_page_8 $
	t1_page_9 $
	t1_page_10 $
	t1_page_11 $
	t1_complete $
	t1_paperyn
	t1_q4
	t1_q5_lmp $
	t1_q5_dk 
	t1_q5_ns
	t1_q1_wks
	t1_q1_days
	t1_q1_wks_recode
	t1_q1_dk
	t1_q2_ht_cm
	t1_q2_ht_ft
	t1_q2_ht_in
	t1_q2_wt_kg
	t1_q2_wt_lbs
	t1_q2_ht_in_recode
	t1_q2_wt_lbs_recode
	t1_q6d
	t1_q6e
	t1_q6f
	t1_q6g
	t1_q6h
	t1_q6i
	t1_q7
	t1_q8
	t1_q8a
	t1_q8a1
	t1_q9
	t1_q9a_yn
	t1_q9a1_a
	t1_q9a1_b
	t1_q9a1_c
	t1_q9a1_d
	t1_q9a1_e
	t1_q9a1_f
	t1_q9b
	t1_q10
	t1_q11
	t1_q12
	t1_q12a_a
	t1_q12a_b
	t1_q12a_c
	t1_q12a_d
	t1_q12a_e
	t1_q12a_f
	t1_q12a_g
	t1_q12a_h
	t1_q12a_i
	t1_q13
	t1_q14
	t1_q15
	t1_q16
	t1_q17
	t1_q18
	t1_q19_1___1
	t1_q19_2___1
	t1_q19_3___1
	t1_q19_4___1
	t1_q19_5___1
	t1_q19_6___1
	t1_q19_7___1
	t1_q20
	t1_q21
	t1_q28
	t1_q29
	t1_q33
	t1_q34
	t1_q34a
	t1_q34b
	t1_q34c_a
	t1_q34c_b
	t1_q34c_c
	t1_q34c_d
	t1_q34d
	t1_q34d1_a
	t1_q34d1_b
	t1_q34d1_c
	t1_q34d1_d
	t1_q34d1_e
	t1_q34d1_f
	t1_q34d1_g
	t1_q34d1_h
	t1_q34d1_i
	t1_q34d1_j
	t1_q35
	t1_q36
	t1_q37
	t1_q37a
	t1_q38
	t1_q39
	t1_q39a
	t1_q39a1_a
	t1_q39a1_b
	t1_q39a1_c
	t1_q39a1_d
	t1_q39a1_e
	t1_q39a1_f
	t1_q39a1_g
	t1_q39a1_h
	t1_q39a1_i
	t1_q39b
	t1_q39b1_a
	t1_q39b1_b
	t1_q39b1_c
	t1_q39b1_d
	t1_q39c
	t1_q40
	t1_q41
	t1_q42
	t1_q43a_1_frag
	t1_q43a_1_days
	t1_q43a_2_frag
	t1_q43a_2_days
	t1_q43a_3_frag
	t1_q43a_3_days
	t1_q43a_4_frag
	t1_q43a_4_days
	t1_q43a_5_frag
	t1_q43a_5_days
	t1_q43b_1_frag
	t1_q43b_1_days
	t1_q43b_2_frag
	t1_q43b_2_days
	t1_q43b_3_frag
	t1_q43b_3_days
	t1_q43b_4_frag
	t1_q43b_4_days
	t1_q43b_5_frag
	t1_q43b_5_days
	t1_q43b_6_frag
	t1_q43b_6_days
	t1_q43b_7_frag
	t1_q43b_7_days
	t1_q43b_8_frag
	t1_q43b_8_days
	t1_q43b_9_frag
	t1_q43b_9_days
	t1_q43b_10_frag
	t1_q43b_10_days
	t1_q43b_11_frag
	t1_q43b_11_days
	t1_q43c_frag
	t1_q43c_days
	t1_q43d_frag
	t1_q43d_days
	t1_q43e_frag
	t1_q43e_days
	t1_q43f_frag
	t1_q43f_days
	t1_q43g_frag
	t1_q43g_days
	t1_q43h_frag
	t1_q43h_days
	t1_q43i_frag
	t1_q43i_days
	t1_q43j_frag
	t1_q43j_days
	t1_q43k_frag
	t1_q43k_days
	t1_q44a 
	t1_q44b 
	t1_q44c 
	t1_q44d 
	t1_q44e 
	t1_q44f 
	t1_q44g 
	t1_q44h 
	t1_q44i
	t1_q44j $
	t1_q44j_recode
	t1_q44k 
	t1_q48a
	t1_q48b
	t1_q48c
	t1_q48d
	t1_q48e
	t1_q48f
	studyid $
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
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents data=q1_comp.q1_rc_2021125 order=varnum; run;

proc contents data=q1_comp.Q1_20190514 order=varnum; run;

data q1_comp.Q1_20190514; set q1_comp.Q1_20190514;
if study_id=7047 then delete; run;

data q1_comp.q1_rc_2021125; set q1_comp.q1_rc_2021125;
if study_id=7047 then delete; run;


proc sort data=q1_comp.q1_rc_2021125; by study_id; run;
proc sort data=q1_comp.Q1_20190514; by study_id; run;


%macro one(new, old, name, ident);
proc compare base=q1_comp.q1_rc_2021125 compare=q1_comp.Q1_20190514 out=&name 
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

%one(	t1_sysid	,	T1_SYSID	, var_3	,"var_3	");
%one(	t1_userid	,	T1_USERID	, var_4	,"var_4	");
%one(	t1_dropped	,	Dropped	, var_5	,"var_5	");
%one(	t1_q4	,	T1_Q4	, var_6	,"var_6	");
%one(	t1_q5_lmp	,	T1_Q5_LMP	, var_7	,"var_7	");
%one(	t1_q5_dk	,	T1_Q5_DK	, var_8	,"var_8	");
%one(	t1_q5_ns	,	T1_Q5_NS	, var_9	,"var_9	");
%one(	t1_q1_wks	,	T1_Q1_WKS	, var_10	,"var_10	");
%one(	t1_q1_days	,	T1_Q1_DAYS	, var_11	,"var_11	");
%one(	t1_q1_wks_recode	,	T1_Q1_WKS_Recode	, var_12	,"var_12	"); /*differences to the 10-9 degree*/
		proc compare base=q1_comp.q1_rc_2021125 compare=q1_comp.Q1_20190514 out=t1_weeks_recode outnoequal noprint criterion=1;
		var t1_q1_wks_recode;
		with T1_Q1_WKS_Recode; 
		by study_id; 
		id study_id; run;

		proc print data=t1_weeks_recode noobs;
		by study_id; 
		id study_id;
		title; run;

%one(	t1_q1_dk	,	T1_Q1_DK	, var_13	,"var_13	");
%one(	t1_q2_ht_cm	,	T1_Q2_HT_CM	, var_14	,"var_14	");
%one(	t1_q2_ht_ft	,	T1_Q2_HT_FT	, var_15	,"var_15	");
%one(	t1_q2_ht_in	,	T1_Q2_HT_IN	, var_16	,"var_16	");
%one(	t1_q2_wt_kg	,	T1_Q2_WT_KG	, var_17	,"var_17	");
%one(	t1_q2_wt_lbs	,	T1_Q2_WT_LBS	, var_18	,"var_18	");
%one(	t1_q2_ht_in_recode	,	T1_Q2_ht_in_Recode	, var_19	,"var_19	");
%one(	t1_q2_wt_lbs_recode	,	T1_Q2_wt_lbs_Recode	, var_20	,"var_20	");
%one(	t1_q6d	,	T1_Q6D	, var_21	,"var_21	");
%one(	t1_q6e	,	T1_Q6E	, var_22	,"var_22	");
%one(	t1_q6f	,	T1_Q6F	, var_23	,"var_23	");
%one(	t1_q6g	,	T1_Q6G	, var_24	,"var_24	");
%one(	t1_q6h	,	T1_Q6H	, var_25	,"var_25	");
%one(	t1_q6i	,	T1_Q6I	, var_26	,"var_26	");
%one(	t1_q7	,	T1_Q7	, var_27	,"var_27	");
%one(	t1_q8	,	T1_Q8	, var_28	,"var_28	"); /*updated 9002 to 0*/
%one(	t1_q8a	,	T1_Q8A	, var_29	,"var_29	"); /*removed zeros to honor REDCap branching logic*/
%one(	t1_q8a1	,	T1_Q8A1	, var_30	,"var_30	");
%one(	t1_q9	,	T1_Q9	, var_31	,"var_31	"); /*changed 8169 t1_q9=0 to honor that they filled out t1_q9a_yn and t1_q9a1_a*/
%one(	t1_q9a_yn	,	T1_Q9A_YN	, var_38	,"var_38	"); /*140 differentm, T1_Q9A, removed 0s to honor missing*/
%one(	t1_q9a1_a	,	T1_Q9A1_A	, var_32	,"var_32	");
%one(	t1_q9a1_b	,	T1_Q9A1_B	, var_33	,"var_33	");
%one(	t1_q9a1_c	,	T1_Q9A1_C	, var_34	,"var_34	");
%one(	t1_q9a1_d	,	T1_Q9A1_D	, var_35	,"var_35	");
%one(	t1_q9a1_e	,	T1_Q9A1_E	, var_36	,"var_36	");
%one(	t1_q9a1_f	,	T1_Q9A1_F	, var_37	,"var_37	");
%one(	t1_q9b	,	T1_Q9B	, var_39	,"var_39	");
%one(	t1_q10	,	T1_Q10	, var_40	,"var_40	");
%one(	t1_q11	,	T1_Q11	, var_41	,"var_41	");
%one(	t1_q12	,	T1_Q12	, var_42	,"var_42	"); /*6065 and 8049 had granular info, updated T1_q12*/
%one(	t1_q12a_a	,	T1_Q12A_A	, var_43	,"var_43	");
%one(	t1_q12a_b	,	T1_Q12A_B	, var_44	,"var_44	");
%one(	t1_q12a_c	,	T1_Q12A_C	, var_45	,"var_45	");
%one(	t1_q12a_d	,	T1_Q12A_D	, var_46	,"var_46	");
%one(	t1_q12a_e	,	T1_Q12A_E	, var_47	,"var_47	");
%one(	t1_q12a_f	,	T1_Q12A_F	, var_48	,"var_48	");
%one(	t1_q12a_g	,	T1_Q12A_G	, var_49	,"var_49	");
%one(	t1_q12a_h	,	T1_Q12A_H	, var_50	,"var_50	");
%one(	t1_q12a_i	,	T1_Q12A_I	, var_51	,"var_51	");
%one(	t1_q13	,	T1_Q13	, var_52	,"var_52	");
%one(	t1_q14	,	T1_Q14	, var_53	,"var_53	");
%one(	t1_q15	,	T1_Q15	, var_54	,"var_54	");
%one(	t1_q16	,	T1_Q16	, var_55	,"var_55	");
%one(	t1_q17	,	T1_Q17	, var_56	,"var_56	");
%one(	t1_q18	,	T1_Q18	, var_57	,"var_57	");

%macro freq(new, old);
proc freq data=q1_comp.q1_rc_2021125;
table &new; 
title; run;

proc freq data=q1_comp.Q1_20190514;
table &old; 
title; run;
%mend;

%freq(	t1_q19_1___1,	T1_Q19_1);
%freq(	t1_q19_2___1,	T1_Q19_2);
%freq(	t1_q19_3___1,	T1_Q19_3);
%freq(	t1_q19_4___1,	T1_Q19_4);
%freq(	t1_q19_5___1,	T1_Q19_5);
%freq(	t1_q19_6___1,	T1_Q19_6);
%freq(	t1_q19_7___1,	T1_Q19_7);

%one(	t1_q20	,	T1_Q20	, var_65	,"var_65	");
%one(	t1_q21	,	T1_Q21	, var_66	,"var_66	");
%one(	t1_q29	,	T1_Q29	, var_67	,"var_67	");
%one(	t1_q33	,	T1_Q33	, var_68	,"var_68	");


%one(	t1_q34	,	T1_Q34	, var_69	,"var_69	"); /*ppt who didn't specify main job and
														  anyone who answered T1_Q34D updated T1_34 to 11. Many from UCSF.*/
%one(	t1_q34a	,	T1_Q34A	, var_70	,"var_70	");
%one(	t1_q34b	,	T1_Q34B	, var_71	,"var_71	");
%one(	t1_q34c_a	,	T1_Q34C_A	, var_72	,"var_72	");
%one(	t1_q34c_b	,	T1_Q34C_B	, var_73	,"var_73	");
%one(	t1_q34c_c	,	T1_Q34C_C	, var_74	,"var_74	");
%one(	t1_q34c_d	,	T1_Q34C_D	, var_75	,"var_75	");
%one(	t1_q34d	,	T1_Q34D	, var_76	,"var_76	");
%one(	t1_q34d1_a	,	T1_Q34D1_A	, var_77	,"var_77	");
%one(	t1_q34d1_b	,	T1_Q34D1_B	, var_78	,"var_78	");
%one(	t1_q34d1_c	,	T1_Q34D1_C	, var_79	,"var_79	");
%one(	t1_q34d1_d	,	T1_Q34D1_D	, var_80	,"var_80	");
%one(	t1_q34d1_e	,	T1_Q34D1_E	, var_81	,"var_81	");
%one(	t1_q34d1_f	,	T1_Q34D1_F	, var_82	,"var_82	");
%one(	t1_q34d1_g	,	T1_Q34D1_G	, var_83	,"var_83	");
%one(	t1_q34d1_h	,	T1_Q34D1_H	, var_84	,"var_84	");
%one(	t1_q34d1_i	,	T1_Q34D1_I	, var_85	,"var_85	");
%one(	t1_q34d1_j	,	T1_Q34D1_J	, var_86	,"var_86	");
%one(	t1_q35	,	T1_Q35	, var_87	,"var_87	");
%one(	t1_q36	,	T1_Q36	, var_88	,"var_88	");
%one(	t1_q37	,	T1_Q37	, var_89	,"var_89	");
%one(	t1_q37a	,	T1_Q37A	, var_90	,"var_90	"); /*8101, set to missing*/ 
%one(	t1_q38	,	T1_Q38	, var_91	,"var_91	");
%one(	t1_q39	,	T1_Q39	, var_92	,"var_92	");
%one(	t1_q39a	,	T1_Q39A	, var_93	,"var_93	");
%one(	t1_q39a1_a	,	T1_Q39A1_A	, var_94	,"var_94	");
%one(	t1_q39a1_b	,	T1_Q39A1_B	, var_95	,"var_95	");
%one(	t1_q39a1_c	,	T1_Q39A1_C	, var_96	,"var_96	");
%one(	t1_q39a1_d	,	T1_Q39A1_D	, var_97	,"var_97	");
%one(	t1_q39a1_e	,	T1_Q39A1_E	, var_98	,"var_98	");
%one(	t1_q39a1_f	,	T1_Q39A1_F	, var_99	,"var_99	");
%one(	t1_q39a1_g	,	T1_Q39A1_G	, var_100	,"var_100	");
%one(	t1_q39a1_h	,	T1_Q39A1_H	, var_101	,"var_101	");
%one(	t1_q39a1_i	,	T1_Q39A1_I	, var_102	,"var_102	");
%one(	t1_q39b	,	T1_Q39B	, var_103	,"var_103	");
%one(	t1_q39b1_a	,	T1_Q39B1_A	, var_104	,"var_104	");
%one(	t1_q39b1_b	,	T1_Q39B1_B	, var_105	,"var_105	");
%one(	t1_q39b1_c	,	T1_Q39B1_C	, var_106	,"var_106	");
%one(	t1_q39b1_d	,	T1_Q39B1_D	, var_107	,"var_107	");
%one(	t1_q39c	,	T1_Q39C	, var_108	,"var_108	");
%one(	t1_q40	,	T1_Q40	, var_109	,"var_109	");
%one(	t1_q41	,	T1_Q41	, var_110	,"var_110	");
%one(	t1_q42	,	T1_Q42	, var_111	,"var_111	");
%one(	t1_q43a_1_frag	,	t1_q43a_1_frag	, var_112	,"var_112	");
%one(	t1_q43a_1_days	,	t1_q43a_1_days	, var_113	,"var_113	");
%one(	t1_q43a_2_frag	,	t1_q43a_2_frag	, var_114	,"var_114	");
%one(	t1_q43a_2_days	,	t1_q43a_2_days	, var_115	,"var_115	");
%one(	t1_q43a_3_frag	,	t1_q43a_3_frag	, var_116	,"var_116	");
%one(	t1_q43a_3_days	,	t1_q43a_3_days	, var_117	,"var_117	");
%one(	t1_q43a_4_frag	,	t1_q43a_4_frag	, var_118	,"var_118	");
%one(	t1_q43a_4_days	,	t1_q43a_4_days	, var_119	,"var_119	");
%one(	t1_q43a_5_frag	,	t1_q43a_5_frag	, var_120	,"var_120	");
%one(	t1_q43a_5_days	,	t1_q43a_5_days	, var_121	,"var_121	");
%one(	t1_q43b_1_frag	,	t1_q43b_1_frag	, var_122	,"var_122	");
%one(	t1_q43b_1_days	,	t1_q43b_1_days	, var_123	,"var_123	");
%one(	t1_q43b_2_frag	,	t1_q43b_2_frag	, var_124	,"var_124	");
%one(	t1_q43b_2_days	,	t1_q43b_2_days	, var_125	,"var_125	");
%one(	t1_q43b_3_frag	,	t1_q43b_3_frag	, var_126	,"var_126	");
%one(	t1_q43b_3_days	,	t1_q43b_3_days	, var_127	,"var_127	");
%one(	t1_q43b_4_frag	,	t1_q43b_4_frag	, var_128	,"var_128	");
%one(	t1_q43b_4_days	,	t1_q43b_4_days	, var_129	,"var_129	");
%one(	t1_q43b_5_frag	,	t1_q43b_5_frag	, var_130	,"var_130	");
%one(	t1_q43b_5_days	,	t1_q43b_5_days	, var_131	,"var_131	");
%one(	t1_q43b_6_frag	,	t1_q43b_6_frag	, var_132	,"var_132	");
%one(	t1_q43b_6_days	,	t1_q43b_6_days	, var_133	,"var_133	");
%one(	t1_q43b_7_frag	,	t1_q43b_7_frag	, var_134	,"var_134	");
%one(	t1_q43b_7_days	,	t1_q43b_7_days	, var_135	,"var_135	");
%one(	t1_q43b_8_frag	,	t1_q43b_8_frag	, var_136	,"var_136	");
%one(	t1_q43b_8_days	,	t1_q43b_8_days	, var_137	,"var_137	");
%one(	t1_q43b_9_frag	,	t1_q43b_9_frag	, var_138	,"var_138	");
%one(	t1_q43b_9_days	,	t1_q43b_9_days	, var_139	,"var_139	");
%one(	t1_q43b_10_frag	,	t1_q43b_10_frag	, var_140	,"var_140	");
%one(	t1_q43b_10_days	,	t1_q43b_10_days	, var_141	,"var_141	");
%one(	t1_q43b_11_frag	,	t1_q43b_11_frag	, var_142	,"var_142	");
%one(	t1_q43b_11_days	,	t1_q43b_11_days	, var_143	,"var_143	");
%one(	t1_q43c_frag	,	t1_q43c_frag	, var_144	,"var_144	");
%one(	t1_q43c_days	,	t1_q43c_days	, var_145	,"var_145	");
%one(	t1_q43d_frag	,	t1_q43d_frag	, var_146	,"var_146	");
%one(	t1_q43d_days	,	t1_q43d_days	, var_147	,"var_147	");
%one(	t1_q43e_frag	,	t1_q43e_frag	, var_148	,"var_148	");
%one(	t1_q43e_days	,	t1_q43e_days	, var_149	,"var_149	");
%one(	t1_q43f_frag	,	t1_q43f_frag	, var_150	,"var_150	");
%one(	t1_q43f_days	,	t1_q43f_days	, var_151	,"var_151	");
%one(	t1_q43g_frag	,	t1_q43g_frag	, var_152	,"var_152	");
%one(	t1_q43g_days	,	t1_q43g_days	, var_153	,"var_153	");
%one(	t1_q43h_frag	,	t1_q43h_frag	, var_154	,"var_154	");
%one(	t1_q43h_days	,	t1_q43h_days	, var_155	,"var_155	");
%one(	t1_q43i_frag	,	t1_q43i_frag	, var_156	,"var_156	");
%one(	t1_q43i_days	,	t1_q43i_days	, var_157	,"var_157	");
%one(	t1_q43j_frag	,	t1_q43j_frag	, var_158	,"var_158	");
%one(	t1_q43j_days	,	t1_q43j_days	, var_159	,"var_159	");
%one(	t1_q43k_frag	,	t1_q43k_frag	, var_160	,"var_160	");
%one(	t1_q43k_days	,	t1_q43k_days	, var_161	,"var_161	"); /*many changes but reflecting the change to 6 issue*/

%one(	t1_q44a	,	T1_Q44A	, var_162	,"var_162	");
%one(	t1_q44b	,	T1_Q44B	, var_163	,"var_163	");
%one(	t1_q44c	,	T1_Q44C	, var_164	,"var_164	");
%one(	t1_q44d	,	T1_Q44D	, var_165	,"var_165	");
%one(	t1_q44e	,	T1_Q44E	, var_166	,"var_166	");
%one(	t1_q44f	,	T1_Q44F	, var_167	,"var_167	");
%one(	t1_q44g	,	T1_Q44G	, var_168	,"var_168	");
%one(	t1_q44h	,	T1_Q44H	, var_169	,"var_169	");
%one(	t1_q44i	,	T1_Q44I	, var_170	,"var_170	");
%one(	t1_q44j	,	T1_Q44J	, var_171	,"var_171	");
/*%one(	t1_q44k	,	T1_Q44K	, var_173	,"var_173	"); corrupted var, best guess at recode in REDCap*/
%one(	t1_q48a	,	T1_Q48A	, var_174	,"var_174	");
%one(	t1_q48b	,	T1_Q48B	, var_175	,"var_175	");
%one(	t1_q48c	,	T1_Q48C	, var_176	,"var_176	");
%one(	t1_q48d	,	T1_Q48D	, var_177	,"var_177	");
%one(	t1_q48e	,	T1_Q48E	, var_178	,"var_178	");
%one(	t1_q48f	,	T1_Q48F	, var_179	,"var_179	");
%one(	medications_yn	,	T1_Q6A	, var_181	,"var_181	");
%one(	allergy_yn	,	T1_Q6A1_A_YN	, var_182	,"var_182	");
		proc print data=q1_comp.q1_rc_2021125;
		var study_id allergy_yn allergy_script allergy_otc;
		where study_id=6025; run;
		proc print data=q1_comp.Q1_20190514;
		var study_id T1_Q6A1_A_YN T1_Q6A1_A_SCRIPT T1_Q6A1_A_OTC;
		where study_id=6025; run; /*given the number of changes, will ignore differences and assume these 
									were the result of cleaning the medication history*/

%one(	allergy_script	,	T1_Q6A1_A_SCRIPT	, var_183	,"var_183	"); /*8108, 8162, 8234 missing despite having parent q yes*/
%one(	allergy_otc	,	T1_Q6A1_A_OTC	, var_184	,"var_184	"); /*8108, 8162, 8234 missing despite having parent q yes*/
%one(	arthritis_yn	,	T1_Q6A1_B_YN	, var_185	,"var_185	");
%one(	arthritis_script	,	T1_Q6A1_B_SCRIPT	, var_186	,"var_186	");
%one(	arthritis_otc	,	T1_Q6A1_B_OTC	, var_187	,"var_187	");
%one(	asthma_yn	,	T1_Q6A1_C_YN	, var_188	,"var_188	"); /*updating ppt who reported rx or otc*/
%one(	asthma_script	,	T1_Q6A1_C_SCRIPT	, var_189	,"var_189	"); /*known missing*/
%one(	asthma_otc	,	T1_Q6A1_C_OTC	, var_190	,"var_190	");
%one(	copd_yn	,	T1_Q6A1_D_YN	, var_191	,"var_191	");
%one(	copd_script	,	T1_Q6A1_D_SCRIPT	, var_192	,"var_192	");
%one(	copd_otc	,	T1_Q6A1_D_OTC	, var_193	,"var_193	");
%one(	depression_yn	,	T1_Q6A1_E_YN	, var_194	,"var_194	");
%one(	depression_script	,	T1_Q6A1_E_SCRIPT	, var_195	,"var_195	");
%one(	despression_otc	,	T1_Q6A1_E_OTC	, var_196	,"var_196	");
%one(	diabetes_yn	,	T1_Q6A1_F_YN	, var_197	,"var_197	");
%one(	diabetes_script	,	T1_Q6A1_F_SCRIPT	, var_198	,"var_198	");
%one(	diabetes_otc	,	T1_Q6A1_F_OTC	, var_199	,"var_199	");
%one(	genital_yn	,	T1_Q6A1_G_YN	, var_200	,"var_200	");
%one(	genital_script	,	T1_Q6A1_G_SCRIPT	, var_201	,"var_201	");
%one(	genital_otc	,	T1_Q6A1_G_OTC	, var_202	,"var_202	");
%one(	gi_yn	,	T1_Q6A1_H_YN	, var_203	,"var_203	");
%one(	gi_script	,	T1_Q6A1_H_SCRIPT	, var_204	,"var_204	");
%one(	gi_otc	,	T1_Q6A1_H_OTC	, var_205	,"var_205	");
%one(	bp_yn	,	T1_Q6A1_I_YN	, var_206	,"var_206	");
%one(	bp_script	,	T1_Q6A1_I_SCRIPT	, var_207	,"var_207	");
%one(	bp_otc	,	T1_Q6A1_I_OTC	, var_208	,"var_208	");
%one(	nausea_yn	,	T1_Q6A1_J_YN	, var_209	,"var_209	");
%one(	nausea_script	,	T1_Q6A1_J_SCRIPT	, var_210	,"var_210	");
%one(	nausea_otc	,	T1_Q6A1_J_OTC	, var_211	,"var_211	");
%one(	pain_yn	,	T1_Q6A1_K_YN	, var_212	,"var_212	");
%one(	pain_script	,	T1_Q6A1_K_SCRIPT	, var_213	,"var_213	");
%one(	pain_otc	,	T1_Q6A1_K_OTC	, var_214	,"var_214	");
%one(	respinfect_yn	,	T1_Q6A1_L_YN	, var_215	,"var_215	");
%one(	respinfect_script	,	T1_Q6A1_L_SCRIPT	, var_216	,"var_216	");
%one(	respinfect_otc	,	T1_Q6A1_L_OTC	, var_217	,"var_217	");
%one(	thyroid_yn	,	T1_Q6A1_M_YN	, var_218	,"var_218	");
%one(	thyroid_script	,	T1_Q6A1_M_SCRIPT	, var_219	,"var_219	");
%one(	thyroid_otc	,	T1_Q6A1_M_OTC	, var_220	,"var_220	");
%one(	urinary_yn	,	T1_Q6A1_N_YN	, var_221	,"var_221	");
%one(	urinary_script	,	T1_Q6A1_N_SCRIPT	, var_222	,"var_222	");
%one(	urinary_otc	,	T1_Q6A1_N_OTC	, var_223	,"var_223	");
%one(	othermed_yn	,	T1_Q6A1_O_YN	, var_224	,"var_224	");
%one(	othermedscript	,	T1_Q6A1_O_SCRIPT	, var_225	,"var_225	");
%one(	othermed_otc	,	T1_Q6A1_O_OTC	, var_226	,"var_226	");
%one(	prenatalvitamin_yn	,	T1_Q6B	, var_227	,"var_227	");
%one(	prenatalvitamin_form	,	T1_Q6B1	, var_228	,"var_228	");
%one(	supplements_yn	,	T1_Q6C	, var_229	,"var_229	");
%one(	multivitamin_yn	,	t1_q6c_a_yn	, var_230	,"var_230	");
%one(	multivitmain_form	,	t1_q6c_a_form	, var_231	,"var_231	");
%one(	iron_yn	,	t1_q6c_b_yn	, var_232	,"var_232	");
%one(	iron_form	,	t1_q6c_b_form	, var_233	,"var_233	");
%one(	calcium_yn	,	t1_q6c_c_yn	, var_234	,"var_234	");
%one(	calcium_form	,	t1_q6c_c_form	, var_235	,"var_235	");
%one(	aminoacid_yn	,	t1_q6c_d_yn	, var_236	,"var_236	");
%one(	aminoacid_form	,	t1_q6c_d_form	, var_237	,"var_237	");
%one(	herbal_yn	,	t1_q6c_e_yn	, var_238	,"var_238	");
%one(	herbal_form	,	t1_q6c_e_form	, var_239	,"var_239	");
%one(	vita_yn	,	t1_q6c_f_yn	, var_240	,"var_240	");
%one(	vita_form	,	t1_q6c_f_form	, var_241	,"var_241	");
%one(	vitc_yn	,	t1_q6c_g_yn	, var_242	,"var_242	");
%one(	vitc_form	,	t1_q6c_g_form	, var_243	,"var_243	");
%one(	vitd_yn	,	t1_q6c_h_yn	, var_244	,"var_244	");
%one(	vitd_form	,	t1_q6c_h_form	, var_245	,"var_245	");
%one(	vite_yn	,	t1_q6c_i_yn	, var_246	,"var_246	");
%one(	vite_form	,	t1_q6c_i_form	, var_247	,"var_247	");
%one(	vitk_yn	,	t1_q6c_j_yn	, var_248	,"var_248	");
%one(	vitk_form	,	t1_q6c_j_form	, var_249	,"var_249	");
%one(	fishoil_yn	,	t1_q6c_k_yn	, var_250	,"var_250	");
%one(	fishoil_form	,	t1_q6c_k_form	, var_251	,"var_251	");
%one(	other_yn	,	t1_q6c_l_yn	, var_252	,"var_252	");
%one(	other_form	,	t1_q6c_l_form	, var_253	,"var_253	");
%one(	unsure_yn	,	t1_q6c_m_yn	, var_254	,"var_254	");
%one(	unsure_form	,	t1_q6c_m_form	, var_255	,"var_255	");
%one(	food_organic	,	T1_Q22	, var_256	,"var_256	");
%one(	food_homegrown	,	T1_Q23	, var_257	,"var_257	");
%one(	food_unprocessed	,	T1_Q24	, var_258	,"var_258	");
%one(	food_canned	,	T1_Q25A	, var_259	,"var_259	");
%one(	food_frozen	,	T1_Q25B	, var_260	,"var_260	");
%one(	food_fresh	,	T1_Q25C	, var_261	,"var_261	"); /*missing and skipped ppt*/

%one(	mealsperweek_pb	,	T1_Q26A	, var_262	,"var_262	");
%one(	mealsperweek_beef	,	T1_Q26B	, var_263	,"var_263	");
%one(	mealsperweek_seafood	,	T1_Q26C	, var_264	,"var_264	");
%one(	mealsperweek_poultry	,	T1_Q26D	, var_265	,"var_265	");
%one(	mealsperweek_othermeats	,	T1_Q26E	, var_266	,"var_266	");
%one(	mealsperweek_spices	,	T1_Q26F	, var_267	,"var_267	");
%one(	mealsperweek_oils	,	T1_Q26G	, var_268	,"var_268	");
%one(	mealsperweek_soy	,	T1_Q26H	, var_269	,"var_269	");
%one(	mealsperweek_dairy	,	T1_Q26I	, var_270	,"var_270	");
%one(	meals_restaurant	,	T1_Q27	, var_271	,"var_271	"); /*same n=5 ppt missing likely*/

%one(	meals_fastfood	,	T1_Q27A	, var_272	,"var_272	");
/*the participants that were recoded here:
data diet.q1_import_v2; set diet.q1_import_v2;
if meals_restaurant=0 and meals_fastfood=0 then meals_fastfood=.; run;*/


%one(	cigarettes_yn	,	T1_Q30A_YN	, var_273	,"var_273	");
%one(	cigarettes_recode	,	T1_Q30a_week_Recode	, var_276	,"var_276	");
%one(	redwine_yn	,	T1_Q30B_YN	, var_277	,"var_277	");
%one(	redwine_recode	,	T1_Q30b_week_Recode	, var_280	,"var_280	");
%one(	otherwine_yn	,	T1_Q30C_YN	, var_281	,"var_281	");
%one(	otherwine_recode	,	T1_Q30c_week_Recode	, var_284	,"var_284	");
%one(	beer_yn	,	T1_Q30D_YN	, var_285	,"var_285	");
%one(	beer_recode	,	T1_Q30d_week_Recode	, var_288	,"var_288	");
%one(	liquor_yn	,	T1_Q30E_YN	, var_289	,"var_289	");
%one(	liquor_recode	,	T1_Q30e_week_Recode	, var_292	,"var_292	");
%one(	coffee_yn	,	T1_Q30F_YN	, var_293	,"var_293	");
%one(	coffee_recode	,	T1_Q30f_week_Recode	, var_296	,"var_296	");
%one(	tea_yn	,	T1_Q30G_YN	, var_297	,"var_297	");
%one(	tea_recode	,	T1_Q30g_week_Recode	, var_300	,"var_300	");
%one(	soda_yn	,	T1_Q30H_YN	, var_301	,"var_301	");
%one(	soda_recode	,	T1_Q30h_week_Recode	, var_304	,"var_304	");
%one(	marijuana_yn	,	T1_Q30I_YN	, var_305	,"var_305	");
%one(	marijuana_recode	,	T1_Q30i_week_Recode	, var_308	,"var_308	");
%one(	cocaine_yn	,	T1_Q30J_YN	, var_309	,"var_309	");
%one(	cocaine_recode	,	T1_Q30j_week_Recode	, var_312	,"var_312	");
%one(	shs_hoursday	,	T1_Q31	, var_313	,"var_313	");
%one(	number_smokers	,	T1_Q32	, var_314	,"var_314	"); /*reflecting updated missings*/

proc compare base=q1_comp.q1_rc_2021125 compare=q1_comp.Q1_20190514 
			 out=q12;
var t1_q12;
with t1_q12; 
by study_id; 
id study_id; 
title; run;

proc print data=q12; run;

proc compare base=q1_comp.q1_rc_2021125 compare=q1_comp.Q1_20190514 out=q19_1 nomissing;
var t1_q19_1___1;
with T1_Q19_1; 
by study_id; 
id study_id; 
title; run;

