/* Edit the following line to reflect the full path to your CSV file */
libname q1_pw "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q1"; run;
%let q1_non = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q1\TIDESI-FirstTrimesterNonrep_DATA_NOHDRS_2021-01-27_1413.csv';

/*Run First Trimester Non-Repeated Measures*/

data q1_pw.q1_non_repeat; %let _EFIERR_ = 0;
infile &q1_non  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t1_sysid $500. ;
	informat t1_userid $500. ;
	informat t1_qversion $500. ;
	informat t1_qversionnumber $500. ;
	informat t1_today_dt mmddyy10. ;
	informat t1_paperdt mmddyy10. ;
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
	informat t1_q5_lmp mmddyy10. ;
	informat t1_q5_dk $500. ;
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
	informat t1_q8a $500. ;
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
	informat t1_q28 $500. ;
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
	informat t1_q44a $500. ;
	informat t1_q44b $500. ;
	informat t1_q44c $500. ;
	informat t1_q44d $500. ;
	informat t1_q44e $500. ;
	informat t1_q44f $500. ;
	informat t1_q44g $500. ;
	informat t1_q44h $500. ;
	informat t1_q44i $500. ;
	informat t1_q44j $500. ;
	informat t1_q44j_recode $500. ;
	informat t1_q44k $500. ;
	informat t1_q48a best32. ;
	informat t1_q48b best32. ;
	informat t1_q48c best32. ;
	informat t1_q48d best32. ;
	informat t1_q48e best32. ;
	informat t1_q48f best32. ;
	informat studyid $500. ;

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
	t1_q5_lmp 
	t1_q5_dk $
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
	t1_q8a $
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
	t1_q28 $
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
	t1_q44a $
	t1_q44b $
	t1_q44c $
	t1_q44d $
	t1_q44e $
	t1_q44f $
	t1_q44g $
	t1_q44h $
	t1_q44i $
	t1_q44j $
	t1_q44j_recode $
	t1_q44k $
	t1_q48a
	t1_q48b
	t1_q48c
	t1_q48d
	t1_q48e
	t1_q48f
	studyid $
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;


/*Run First Trimester Repeated Measures*/
%let q1_rep = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q1\TIDESI-FirstTrimesterRepeat_DATA_NOHDRS_2021-01-27_1424.csv';

/*set to work*/
data q1_repeated; %let _EFIERR_ = 0;
infile &q1_rep  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
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

proc contents data=q1_pw.q1_repeated order=varnum; run;

/*Add Prefix to repeated using below macro*/
%macro addprefix(dsn, prefix);
  proc contents data=&dsn out=vlist(keep=name) noprint;
  run;
  proc sql noprint;
    select trim(name) || "=&prefix" || trim(name)
      into: renamestmnt separated by ' '
    from vlist;
  quit;
  proc datasets library=work noprint;
    modify &dsn;
    rename &renamestmnt;
  run;
%mend;

%addprefix(q1_repeated, T1_);

/*set back to file folder*/
data q1_pw.q1_repeated; set q1_repeated;
rename t1_study_id=study_id; run;

/*sort data*/

proc sort data=q2_pw.ti_q2_rep; by study_id; run;
proc sort data=q1_pw.q1_non_repeat; by study_id; run;

data q1_pw.q1_all; merge q1_pw.Q1_non_repeat q1_pw.q1_repeated; by study_id; run;

/*REPEAT FOR ALL datasets*/
