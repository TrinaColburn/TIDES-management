/* Edit the following line to reflect the full path to your CSV file */

libname q2_comp "J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q2"; run;
%let csv_file = 'J:\PM\TIDES_Data\REDCap Master Database\Proc Compares Post redcap import\Q2\ <new file name>';

OPTIONS nofmterr;

data q2_comp.q2_redcap; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t2_sysid $500. ;
	informat t2_userid $500. ;
	informat t2_q2_date $500. ;
	informat t2_paperdt yymmdd10. ;
	informat t2_paperusername $500. ;
	informat t2_time_stamp $500. ;
	informat t2_time_started $500. ;
	informat t2_time_started_raw $500. ;
	informat t2_time_end_raw $500. ;
	informat t2_paperyn best32. ;
	informat t2_pageno $500. ;
	informat t2_last_page $500. ;
	informat t2_page_1 $500. ;
	informat t2_page_2 $500. ;
	informat t2_page_3 $500. ;
	informat t2_page_4 $500. ;
	informat t2_page_5 $500. ;
	informat t2_page_6 $500. ;
	informat t2_page_7 $500. ;
	informat t2_complete $500. ;
	informat t2_dropped best32. ;
	informat t2_q3 best32. ;
	informat t2_q1_days best32. ;
	informat t2_q1_wks best32. ;
	informat t2_q1_dk best32. ;
	informat t2_q1_wks_recode best32. ;
	informat t2_q2_wt_kg best32. ;
	informat t2_q2_wt_lbs best32. ;
	informat t2_q2_wt_lbs_recode best32. ;
	informat t2_q4d best32. ;
	informat t2_q4e best32. ;
	informat t2_q4f best32. ;
	informat t2_q4g best32. ;
	informat t2_q4h best32. ;
	informat t2_q4i best32. ;
	informat t2_q4j best32. ;
	informat t2_q5 best32. ;
	informat t2_q5_dk best32. ;
	informat t2_q6a_yn best32. ;
	informat t2_q6a_drugs best32. ;
	informat t2_q6a_surg best32. ;
	informat t2_q6a_other best32. ;
	informat t2_q6b_yn best32. ;
	informat t2_q6b_drugs best32. ;
	informat t2_q6b_surg best32. ;
	informat t2_q6b_other best32. ;
	informat t2_q6c_yn best32. ;
	informat t2_q6c_drugs best32. ;
	informat t2_q6c_surg best32. ;
	informat t2_q6c_other best32. ;
	informat t2_q6d_yn best32. ;
	informat t2_q6d_drugs best32. ;
	informat t2_q6d_surg best32. ;
	informat t2_q6d_other best32. ;
	informat t2_q6e_yn best32. ;
	informat t2_q6e_drugs best32. ;
	informat t2_q6e_surg best32. ;
	informat t2_q6e_other best32. ;
	informat t2_q6f_yn best32. ;
	informat t2_q6f_drugs best32. ;
	informat t2_q6f_surg best32. ;
	informat t2_q6f_other best32. ;
	informat t2_q6g_yn best32. ;
	informat t2_q6g_drugs best32. ;
	informat t2_q6g_surg best32. ;
	informat t2_q6g_other best32. ;
	informat t2_q6h_yn best32. ;
	informat t2_q6h_drugs best32. ;
	informat t2_q6h_surg best32. ;
	informat t2_q6h_other best32. ;
	informat t2_q6i_yn best32. ;
	informat t2_q6i_drugs best32. ;
	informat t2_q6i_surg best32. ;
	informat t2_q6i_other best32. ;
	informat t2_q6j_yn best32. ;
	informat t2_q6j_drugs best32. ;
	informat t2_q6j_surg best32. ;
	informat t2_q6j_other best32. ;
	informat t2_q6k_yn best32. ;
	informat t2_q6k_drugs best32. ;
	informat t2_q6k_surg best32. ;
	informat t2_q6k_other best32. ;
	informat t2_q6l_yn best32. ;
	informat t2_q6l_drugs best32. ;
	informat t2_q6l_surg best32. ;
	informat t2_q6l_other best32. ;
	informat t2_q7 best32. ;
	informat t2_q8 best32. ;
	informat t2_q9 best32. ;
	informat t2_q9a best32. ;
	informat t2_q10 best32. ;
	informat t2_q11 best32. ;
	informat t2_q11a_yn best32. ;
	informat t2_q11b best32. ;
	informat t2_q12 best32. ;
	informat t2_q12a best32. ;
	informat t2_q12b_1_date $500. ;
	informat t2_q12b_1_begin_mo $500. ;
	informat t2_q12b_1_begin_yr best32. ;
	informat t2_q12b_1_duration_wks best32. ;
	informat t2_q12b_1_duration_mos $500. ;
	informat t2_q12b_1_duration_wks_recode $500. ;
	informat t2_q12b_1_outcome best32. ;
	informat t2_q12b_1_tx_no best32. ;
	informat t2_q12b_1_tx_insem best32. ;
	informat t2_q12b_1_tx_ovinduct best32. ;
	informat t2_q12b_1_tx_eggdonation best32. ;
	informat t2_q12b_1_tx_other best32. ;
	informat t2_q12b_1_sex best32. ;
	informat t2_q12b_1_breastfeed_wks best32. ;
	informat t2_q12b_1_breastfeed_mos best32. ;
	informat t2_q12b_1_breastfeed_v_0 $500. ;
	informat t2_q12b_2_date $500. ;
	informat t2_q12b_2_begin_mo $500. ;
	informat t2_q12b_2_begin_yr best32. ;
	informat t2_q12b_2_duration_wks best32. ;
	informat t2_q12b_2_duration_mos $500. ;
	informat t2_q12b_2_duration_wks_recode $500. ;
	informat t2_q12b_2_outcome best32. ;
	informat t2_q12b_2_tx_no best32. ;
	informat t2_q12b_2_tx_insem best32. ;
	informat t2_q12b_2_tx_ovinduct best32. ;
	informat t2_q12b_2_tx_eggdonation best32. ;
	informat t2_q12b_2_tx_other best32. ;
	informat t2_q12b_2_sex best32. ;
	informat t2_q12b_2_breastfeed_wks best32. ;
	informat t2_q12b_2_breastfeed_mos best32. ;
	informat t2_q12b_2_breastfeed_v_1 $500. ;
	informat t2_q12b_3_date $500. ;
	informat t2_q12b_3_begin_mo $500. ;
	informat t2_q12b_3_begin_yr best32. ;
	informat t2_q12b_3_duration_wks best32. ;
	informat t2_q12b_3_duration_mos $500. ;
	informat t2_q12b_3_duration_wks_recode $500. ;
	informat t2_q12b_3_outcome best32. ;
	informat t2_q12b_3_tx_no best32. ;
	informat t2_q12b_3_tx_insem best32. ;
	informat t2_q12b_3_tx_ovinduct best32. ;
	informat t2_q12b_3_tx_eggdonation best32. ;
	informat t2_q12b_3_tx_other best32. ;
	informat t2_q12b_3_sex best32. ;
	informat t2_q12b_3_breastfeed_wks best32. ;
	informat t2_q12b_3_breastfeed_mos best32. ;
	informat t2_q12b_3_breastfeed_v_2 $500. ;
	informat t2_q12b_4_date $500. ;
	informat t2_q12b_4_begin_mo $500. ;
	informat t2_q12b_4_begin_yr best32. ;
	informat t2_q12b_4_duration_wks best32. ;
	informat t2_q12b_4_duration_mos $500. ;
	informat t2_q12b_4_duration_wks_recode $500. ;
	informat t2_q12b_4_outcome best32. ;
	informat t2_q12b_4_tx_no best32. ;
	informat t2_q12b_4_tx_insem best32. ;
	informat t2_q12b_4_tx_ovinduct best32. ;
	informat t2_q12b_4_tx_eggdonation best32. ;
	informat t2_q12b_4_tx_other best32. ;
	informat t2_q12b_4_sex best32. ;
	informat t2_q12b_4_breastfeed_wks best32. ;
	informat t2_q12b_4_breastfeed_mos best32. ;
	informat t2_q12b_4_breastfeed_v_3 $500. ;
	informat t2_q12b_5_date $500. ;
	informat t2_q12b_5_begin_mo $500. ;
	informat t2_q12b_5_begin_yr best32. ;
	informat t2_q12b_5_duration_wks best32. ;
	informat t2_q12b_5_duration_mos $500. ;
	informat t2_q12b_5_duration_wks_recode $500. ;
	informat t2_q12b_5_outcome best32. ;
	informat t2_q12b_5_tx_no best32. ;
	informat t2_q12b_5_tx_insem best32. ;
	informat t2_q12b_5_tx_ovinduct best32. ;
	informat t2_q12b_5_tx_eggdonation best32. ;
	informat t2_q12b_5_tx_other best32. ;
	informat t2_q12b_5_sex best32. ;
	informat t2_q12b_5_breastfeed_wks best32. ;
	informat t2_q12b_5_breastfeed_mos best32. ;
	informat t2_q12b_5_breastfeed_v_4 $500. ;
	informat t2_q12b_6_date $500. ;
	informat t2_q12b_6_begin_mo $500. ;
	informat t2_q12b_6_begin_yr best32. ;
	informat t2_q12b_6_duration_wks best32. ;
	informat t2_q12b_6_duration_mos $500. ;
	informat t2_q12b_6_duration_wks_recode $500. ;
	informat t2_q12b_6_outcome best32. ;
	informat t2_q12b_6_tx_no best32. ;
	informat t2_q12b_6_tx_insem best32. ;
	informat t2_q12b_6_tx_ovinduct best32. ;
	informat t2_q12b_6_tx_eggdonation best32. ;
	informat t2_q12b_6_tx_other best32. ;
	informat t2_q12b_6_sex best32. ;
	informat t2_q12b_6_breastfeed_wks best32. ;
	informat t2_q12b_6_breastfeed_mos best32. ;
	informat t2_q12b_6_breastfeed_v_5 $500. ;
	informat t2_q12b_7_date $500. ;
	informat t2_q12b_7_begin_mo $500. ;
	informat t2_q12b_7_begin_yr best32. ;
	informat t2_q12b_7_duration_wks best32. ;
	informat t2_q12b_7_duration_mos $500. ;
	informat t2_q12b_7_duration_wks_recode $500. ;
	informat t2_q12b_7_outcome best32. ;
	informat t2_q12b_7_tx_no best32. ;
	informat t2_q12b_7_tx_insem best32. ;
	informat t2_q12b_7_tx_ovinduct best32. ;
	informat t2_q12b_7_tx_eggdonation best32. ;
	informat t2_q12b_7_tx_other best32. ;
	informat t2_q12b_7_sex best32. ;
	informat t2_q12b_7_breastfeed_wks best32. ;
	informat t2_q12b_7_breastfeed_mos best32. ;
	informat t2_q12b_7_breastfeed_v_6 $500. ;
	informat t2_q12b_8_date $500. ;
	informat t2_q12b_8_begin_mo $500. ;
	informat t2_q12b_8_begin_yr best32. ;
	informat t2_q12b_8_duration_wks best32. ;
	informat t2_q12b_8_duration_mos $500. ;
	informat t2_q12b_8_duration_wks_recode $500. ;
	informat t2_q12b_8_outcome best32. ;
	informat t2_q12b_8_tx_no best32. ;
	informat t2_q12b_8_tx_insem best32. ;
	informat t2_q12b_8_tx_ovinduct best32. ;
	informat t2_q12b_8_tx_eggdonation best32. ;
	informat t2_q12b_8_tx_other best32. ;
	informat t2_q12b_8_sex best32. ;
	informat t2_q12b_8_breastfeed_wks best32. ;
	informat t2_q12b_8_breastfeed_mos best32. ;
	informat t2_q12b_8_breastfeed_v_7 $500. ;
	informat t2_q12b_9_date $500. ;
	informat t2_q12b_9_begin_mo $500. ;
	informat t2_q12b_9_begin_yr best32. ;
	informat t2_q12b_9_duration_wks best32. ;
	informat t2_q12b_9_duration_mos $500. ;
	informat t2_q12b_9_duration_wks_recode $500. ;
	informat t2_q12b_9_outcome best32. ;
	informat t2_q12b_9_tx_no best32. ;
	informat t2_q12b_9_tx_insem best32. ;
	informat t2_q12b_9_tx_ovinduct best32. ;
	informat t2_q12b_9_tx_eggdonation best32. ;
	informat t2_q12b_9_tx_other best32. ;
	informat t2_q12b_9_sex best32. ;
	informat t2_q12b_9_breastfeed_wks best32. ;
	informat t2_q12b_9_breastfeed_mos best32. ;
	informat t2_q12b_9_breastfeed_v_8 $500. ;
	informat t2_q12b_10_date $500. ;
	informat t2_q12b_10_begin_mo $500. ;
	informat t2_q12b_10_begin_yr best32. ;
	informat t2_q12b_10_duration_wks best32. ;
	informat t2_q12b_10_duration_mos $500. ;
	informat t2_q12b_10_duration_wks_recode $500. ;
	informat t2_q12b_10_outcome best32. ;
	informat t2_q12b_10_tx_no best32. ;
	informat t2_q12b_10_tx_insem best32. ;
	informat t2_q12b_10_tx_ovinduct best32. ;
	informat t2_q12b_10_tx_eggdonation best32. ;
	informat t2_q12b_10_tx_other best32. ;
	informat t2_q12b_10_sex best32. ;
	informat t2_q12b_10_breastfeed_wks best32. ;
	informat t2_q12b_10_breastfeed_mos best32. ;
	informat t2_q12b_10_breastfee_v_9 $500. ;
	informat t2_q12b_11_date $500. ;
	informat t2_q12b_11_begin_mo $500. ;
	informat t2_q12b_11_begin_yr best32. ;
	informat t2_q12b_11_duration_wks best32. ;
	informat t2_q12b_11_duration_mos $500. ;
	informat t2_q12b_11_duration_wks_recode $500. ;
	informat t2_q12b_11_outcome best32. ;
	informat t2_q12b_11_tx_no best32. ;
	informat t2_q12b_11_tx_insem best32. ;
	informat t2_q12b_11_tx_ovinduct best32. ;
	informat t2_q12b_11_tx_eggdonation best32. ;
	informat t2_q12b_11_tx_other best32. ;
	informat t2_q12b_11_sex best32. ;
	informat t2_q12b_11_breastfeed_wks best32. ;
	informat t2_q12b_11_breastfeed_mos best32. ;
	informat t2_q12b_11_breastfee_v_10 $500. ;
	informat t2_q23 best32. ;
	informat t2_q23a1 best32. ;
	informat t2_q23a2 best32. ;
	informat t2_q23a3 best32. ;
	informat t2_q23a4 best32. ;
	informat t2_q23a5 best32. ;
	informat t2_q23a6 best32. ;
	informat t2_q23a7 best32. ;
	informat t2_q23a8 best32. ;
	informat t2_q23a9 best32. ;
	informat t2_q23a10 best32. ;
	informat t2_q23b_a best32. ;
	informat t2_q23b1 best32. ;
	informat t2_q23b_b best32. ;
	informat t2_q23b2 best32. ;
	informat t2_q23b_c best32. ;
	informat t2_q23b3_a best32. ;
	informat t2_q23b3_b best32. ;
	informat t2_q23b3_c best32. ;
	informat t2_q23b3_d best32. ;
	informat t2_q23b_d best32. ;
	informat t2_q23b4 best32. ;
	informat t2_q23b4_a best32. ;
	informat t2_q23b4_b best32. ;
	informat t2_q23b4_c best32. ;
	informat t2_q23b4_d best32. ;
	informat t2_q23b4_e best32. ;
	informat t2_q23b4_f best32. ;
	informat t2_q23b4_g best32. ;
	informat t2_q23b4_h best32. ;
	informat t2_q23b4_i best32. ;
	informat t2_q23b4_j best32. ;
	informat t2_q23b4_l best32. ;
	informat t2_q23b_e best32. ;
	informat t2_q23b_f best32. ;
	informat t2_q23c best32. ;
	informat t2_q23d best32. ;
	informat t2_q23e best32. ;
	informat t2_q23e1 best32. ;
	informat t2_q23f best32. ;
	informat t2_q24 best32. ;
	informat t2_q25 best32. ;
	informat t2_q26 best32. ;
	informat t2_q27 best32. ;
	informat t2_q28 best32. ;
	informat t2_q29 best32. ;
	informat t2_q30 best32. ;
	informat t2_q31 best32. ;
	informat t2_q32 best32. ;
	informat t2_q33 best32. ;
	informat t2_q34 best32. ;
	informat t2_q35 best32. ;
	informat t2_q36 best32. ;
	informat t2_q37 best32. ;
	informat t2_q38 best32. ;
	informat t2_q39 best32. ;
	informat t2_q40 best32. ;
	informat t2_q41 best32. ;
	informat t2_q42 best32. ;
	informat t2_q43 best32. ;
	informat t2_q44 best32. ;
	informat t2_q45 best32. ;
	informat t2_q46 best32. ;
	informat t2_q47 best32. ;
	informat t2_q48 best32. ;
	informat t2_q49 best32. ;
	informat t2_q50 best32. ;
	informat t2_q51 best32. ;
	informat t2_q52 best32. ;
	informat t2_q53 best32. ;
	informat t2_q53a best32. ;
	informat t2_q53b best32. ;
	informat t2_q54a best32. ;
	informat second_trimester_que_v_11 best32. ;
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
	informat nutritional_suppleme_v_12 best32. ;
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
	informat pregnancy_complicati_v_13 best32. ;

input
	study_id 
	redcap_event_name $
	t2_sysid $
	t2_userid $
	t2_q2_date $
	t2_paperdt
	t2_paperusername $
	t2_time_stamp $
	t2_time_started $
	t2_time_started_raw $
	t2_time_end_raw $
	t2_paperyn
	t2_pageno $
	t2_last_page $
	t2_page_1 $
	t2_page_2 $
	t2_page_3 $
	t2_page_4 $
	t2_page_5 $
	t2_page_6 $
	t2_page_7 $
	t2_complete $
	t2_dropped
	t2_q3
	t2_q1_days
	t2_q1_wks
	t2_q1_dk
	t2_q1_wks_recode
	t2_q2_wt_kg
	t2_q2_wt_lbs
	t2_q2_wt_lbs_recode
	t2_q4d
	t2_q4e
	t2_q4f
	t2_q4g
	t2_q4h
	t2_q4i
	t2_q4j
	t2_q5
	t2_q5_dk
	t2_q6a_yn
	t2_q6a_drugs
	t2_q6a_surg
	t2_q6a_other
	t2_q6b_yn
	t2_q6b_drugs
	t2_q6b_surg
	t2_q6b_other
	t2_q6c_yn
	t2_q6c_drugs
	t2_q6c_surg
	t2_q6c_other
	t2_q6d_yn
	t2_q6d_drugs
	t2_q6d_surg
	t2_q6d_other
	t2_q6e_yn
	t2_q6e_drugs
	t2_q6e_surg
	t2_q6e_other
	t2_q6f_yn
	t2_q6f_drugs
	t2_q6f_surg
	t2_q6f_other
	t2_q6g_yn
	t2_q6g_drugs
	t2_q6g_surg
	t2_q6g_other
	t2_q6h_yn
	t2_q6h_drugs
	t2_q6h_surg
	t2_q6h_other
	t2_q6i_yn
	t2_q6i_drugs
	t2_q6i_surg
	t2_q6i_other
	t2_q6j_yn
	t2_q6j_drugs
	t2_q6j_surg
	t2_q6j_other
	t2_q6k_yn
	t2_q6k_drugs
	t2_q6k_surg
	t2_q6k_other
	t2_q6l_yn
	t2_q6l_drugs
	t2_q6l_surg
	t2_q6l_other
	t2_q7
	t2_q8
	t2_q9
	t2_q9a
	t2_q10
	t2_q11
	t2_q11a_yn
	t2_q11b
	t2_q12
	t2_q12a 
	t2_q12b_1_date $
	t2_q12b_1_begin_mo $
	t2_q12b_1_begin_yr
	t2_q12b_1_duration_wks
	t2_q12b_1_duration_mos $
	t2_q12b_1_duration_wks_recode $
	t2_q12b_1_outcome
	t2_q12b_1_tx_no
	t2_q12b_1_tx_insem
	t2_q12b_1_tx_ovinduct
	t2_q12b_1_tx_eggdonation
	t2_q12b_1_tx_other
	t2_q12b_1_sex
	t2_q12b_1_breastfeed_wks
	t2_q12b_1_breastfeed_mos
	t2_q12b_1_breastfeed_v_0 $
	t2_q12b_2_date $
	t2_q12b_2_begin_mo $
	t2_q12b_2_begin_yr
	t2_q12b_2_duration_wks
	t2_q12b_2_duration_mos $
	t2_q12b_2_duration_wks_recode $
	t2_q12b_2_outcome
	t2_q12b_2_tx_no
	t2_q12b_2_tx_insem
	t2_q12b_2_tx_ovinduct
	t2_q12b_2_tx_eggdonation
	t2_q12b_2_tx_other
	t2_q12b_2_sex
	t2_q12b_2_breastfeed_wks
	t2_q12b_2_breastfeed_mos
	t2_q12b_2_breastfeed_v_1 $
	t2_q12b_3_date $
	t2_q12b_3_begin_mo $
	t2_q12b_3_begin_yr
	t2_q12b_3_duration_wks
	t2_q12b_3_duration_mos $
	t2_q12b_3_duration_wks_recode $
	t2_q12b_3_outcome
	t2_q12b_3_tx_no
	t2_q12b_3_tx_insem
	t2_q12b_3_tx_ovinduct
	t2_q12b_3_tx_eggdonation
	t2_q12b_3_tx_other
	t2_q12b_3_sex
	t2_q12b_3_breastfeed_wks
	t2_q12b_3_breastfeed_mos
	t2_q12b_3_breastfeed_v_2 $
	t2_q12b_4_date $
	t2_q12b_4_begin_mo $
	t2_q12b_4_begin_yr
	t2_q12b_4_duration_wks
	t2_q12b_4_duration_mos $
	t2_q12b_4_duration_wks_recode $
	t2_q12b_4_outcome
	t2_q12b_4_tx_no
	t2_q12b_4_tx_insem
	t2_q12b_4_tx_ovinduct
	t2_q12b_4_tx_eggdonation
	t2_q12b_4_tx_other
	t2_q12b_4_sex
	t2_q12b_4_breastfeed_wks
	t2_q12b_4_breastfeed_mos
	t2_q12b_4_breastfeed_v_3 $
	t2_q12b_5_date $
	t2_q12b_5_begin_mo $
	t2_q12b_5_begin_yr
	t2_q12b_5_duration_wks
	t2_q12b_5_duration_mos $
	t2_q12b_5_duration_wks_recode $
	t2_q12b_5_outcome
	t2_q12b_5_tx_no
	t2_q12b_5_tx_insem
	t2_q12b_5_tx_ovinduct
	t2_q12b_5_tx_eggdonation
	t2_q12b_5_tx_other
	t2_q12b_5_sex
	t2_q12b_5_breastfeed_wks
	t2_q12b_5_breastfeed_mos
	t2_q12b_5_breastfeed_v_4 $
	t2_q12b_6_date $
	t2_q12b_6_begin_mo $
	t2_q12b_6_begin_yr
	t2_q12b_6_duration_wks
	t2_q12b_6_duration_mos $
	t2_q12b_6_duration_wks_recode $
	t2_q12b_6_outcome
	t2_q12b_6_tx_no
	t2_q12b_6_tx_insem
	t2_q12b_6_tx_ovinduct
	t2_q12b_6_tx_eggdonation
	t2_q12b_6_tx_other
	t2_q12b_6_sex
	t2_q12b_6_breastfeed_wks
	t2_q12b_6_breastfeed_mos
	t2_q12b_6_breastfeed_v_5 $
	t2_q12b_7_date $
	t2_q12b_7_begin_mo $
	t2_q12b_7_begin_yr
	t2_q12b_7_duration_wks
	t2_q12b_7_duration_mos $
	t2_q12b_7_duration_wks_recode $
	t2_q12b_7_outcome
	t2_q12b_7_tx_no
	t2_q12b_7_tx_insem
	t2_q12b_7_tx_ovinduct
	t2_q12b_7_tx_eggdonation
	t2_q12b_7_tx_other
	t2_q12b_7_sex
	t2_q12b_7_breastfeed_wks
	t2_q12b_7_breastfeed_mos
	t2_q12b_7_breastfeed_v_6 $
	t2_q12b_8_date $
	t2_q12b_8_begin_mo $
	t2_q12b_8_begin_yr
	t2_q12b_8_duration_wks
	t2_q12b_8_duration_mos $
	t2_q12b_8_duration_wks_recode $
	t2_q12b_8_outcome
	t2_q12b_8_tx_no
	t2_q12b_8_tx_insem
	t2_q12b_8_tx_ovinduct
	t2_q12b_8_tx_eggdonation
	t2_q12b_8_tx_other
	t2_q12b_8_sex
	t2_q12b_8_breastfeed_wks
	t2_q12b_8_breastfeed_mos
	t2_q12b_8_breastfeed_v_7 $
	t2_q12b_9_date $
	t2_q12b_9_begin_mo $
	t2_q12b_9_begin_yr
	t2_q12b_9_duration_wks
	t2_q12b_9_duration_mos $
	t2_q12b_9_duration_wks_recode $
	t2_q12b_9_outcome
	t2_q12b_9_tx_no
	t2_q12b_9_tx_insem
	t2_q12b_9_tx_ovinduct
	t2_q12b_9_tx_eggdonation
	t2_q12b_9_tx_other
	t2_q12b_9_sex
	t2_q12b_9_breastfeed_wks
	t2_q12b_9_breastfeed_mos
	t2_q12b_9_breastfeed_v_8 $
	t2_q12b_10_date $
	t2_q12b_10_begin_mo $
	t2_q12b_10_begin_yr
	t2_q12b_10_duration_wks
	t2_q12b_10_duration_mos $
	t2_q12b_10_duration_wks_recode $
	t2_q12b_10_outcome
	t2_q12b_10_tx_no
	t2_q12b_10_tx_insem
	t2_q12b_10_tx_ovinduct
	t2_q12b_10_tx_eggdonation
	t2_q12b_10_tx_other
	t2_q12b_10_sex
	t2_q12b_10_breastfeed_wks
	t2_q12b_10_breastfeed_mos
	t2_q12b_10_breastfee_v_9 $
	t2_q12b_11_date $
	t2_q12b_11_begin_mo $
	t2_q12b_11_begin_yr
	t2_q12b_11_duration_wks
	t2_q12b_11_duration_mos $
	t2_q12b_11_duration_wks_recode $
	t2_q12b_11_outcome
	t2_q12b_11_tx_no
	t2_q12b_11_tx_insem
	t2_q12b_11_tx_ovinduct
	t2_q12b_11_tx_eggdonation
	t2_q12b_11_tx_other
	t2_q12b_11_sex
	t2_q12b_11_breastfeed_wks
	t2_q12b_11_breastfeed_mos
	t2_q12b_11_breastfee_v_10 $
	t2_q23
	t2_q23a1
	t2_q23a2
	t2_q23a3
	t2_q23a4
	t2_q23a5
	t2_q23a6
	t2_q23a7
	t2_q23a8
	t2_q23a9
	t2_q23a10
	t2_q23b_a
	t2_q23b1
	t2_q23b_b
	t2_q23b2
	t2_q23b_c
	t2_q23b3_a
	t2_q23b3_b
	t2_q23b3_c
	t2_q23b3_d
	t2_q23b_d
	t2_q23b4
	t2_q23b4_a
	t2_q23b4_b
	t2_q23b4_c
	t2_q23b4_d
	t2_q23b4_e
	t2_q23b4_f
	t2_q23b4_g
	t2_q23b4_h
	t2_q23b4_i
	t2_q23b4_j
	t2_q23b4_l
	t2_q23b_e
	t2_q23b_f
	t2_q23c
	t2_q23d
	t2_q23e
	t2_q23e1
	t2_q23f
	t2_q24
	t2_q25
	t2_q26
	t2_q27
	t2_q28
	t2_q29
	t2_q30
	t2_q31
	t2_q32
	t2_q33
	t2_q34
	t2_q35
	t2_q36
	t2_q37
	t2_q38
	t2_q39
	t2_q40
	t2_q41
	t2_q42
	t2_q43
	t2_q44
	t2_q45
	t2_q46
	t2_q47
	t2_q48
	t2_q49
	t2_q50
	t2_q51
	t2_q52
	t2_q53
	t2_q53a
	t2_q53b
	t2_q54a
	second_trimester_que_v_11
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
	nutritional_suppleme_v_12
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
	pregnancy_complicati_v_13
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

proc contents data=q2_comp.q2_redcap order=varnum; run;


proc contents data=q2_comp.q2_redcap order=varnum; run;

proc contents data=q2_comp.Q2_22119 order=varnum; run;

data q2_comp.Q2_22119; set q2_comp.Q2_22119;
if study_id=7047 then delete; run;

proc sort data=q2_comp.q2_redcap; by study_id; run;
proc sort data=q2_comp.Q2_22119; by study_id; run;

%macro two(new, old, name, ident);
proc compare base=q2_comp.q2_redcap compare=q2_comp.Q2_22119 out=&name 
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
%two(	t2_complete	,	T2_COMPLETE	,	var_3	,	'var_3'	);
%two(	t2_pageno	,	T2_PAGENO	,	var_4	,	'var_4'	);
%two(	t2_page_1	,	T2_PAGE_1	,	var_5	,	'var_5'	);
%two(	t2_page_2	,	T2_PAGE_2	,	var_6	,	'var_6'	);
%two(	t2_page_3	,	T2_PAGE_3	,	var_7	,	'var_7'	);
%two(	t2_page_4	,	T2_PAGE_4	,	var_8	,	'var_8'	);
%two(	t2_page_5	,	T2_PAGE_5	,	var_9	,	'var_9'	);
%two(	t2_page_6	,	T2_PAGE_6	,	var_10	,	'var_10'	);
%two(	t2_page_7	,	T2_PAGE_7	,	var_11	,	'var_11'	);
%two(	t2_last_page	,	T2_LAST_PAGE	,	var_12	,	'var_12'	);
%two(	t2_paperdt	,	T2_PAPERDT	,	var_13	,	'var_13'	);
%two(	t2_paperusername	,	T2_PAPERUSERNAME	,	var_14	,	'var_14'	);
%two(	t2_paperyn	,	T2_PAPERYN	,	var_15	,	'var_15'	);
%two(	t2_sysid	,	T2_SYSID	,	var_16	,	'var_16'	);
%two(	t2_time_end_raw	,	T2_TIME_END_RAW	,	var_17	,	'var_17'	);
%two(	t2_time_stamp	,	T2_TIME_STAMP	,	var_18	,	'var_18'	);
%two(	t2_time_started	,	T2_TIME_STARTED	,	var_19	,	'var_19'	);
%two(	t2_time_started_raw	,	T2_TIME_STARTED_RAW	,	var_20	,	'var_20'	);
%two(	t2_userid	,	T2_USERID	,	var_21	,	'var_21'	);
%two(	t2_dropped	,	Dropped	,	var_22	,	'var_22'	);
%two(	t2_q1_days	,	T2_Q1_DAYS	,	var_23	,	'var_23'	);
%two(	t2_q1_wks	,	T2_Q1_WKS 	,	var_24	,	'var_24'	);
%two(	t2_q1_dk	,	T2_Q1_DK	,	var_25	,	'var_25'	); /*no one was DK or all were 0. Changed those without wks to 0*/
%two(	t2_q1_wks_recode	,	T2_Q1_wks_recode 	,	var_26	,	'var_26'	);
%two(	t2_q2_wt_kg	,	T2_Q2_WT_KG	,	var_27	,	'var_27'	);
%two(	t2_q2_wt_lbs	,	T2_Q2_WT_LBS	,	var_28	,	'var_28'	);
%two(	t2_q2_date	,	T2_Q2_Date	,	var_29	,	'var_29'	);
%two(	t2_q2_wt_lbs_recode	,	T2_Q2_wt_lbs_Recode	,	var_30	,	'var_30'	);
%two(	t2_q3	,	T2_Q3	,	var_31	,	'var_31'	);
%two(	medications_yn	,	T2_Q4A	,	var_32	,	'var_32'	);
%two(	allergy_yn	,	T2_Q4A1_A_YN	,	var_33	,	'var_33'	);
%two(	allergy_script	,	T2_Q4A1_A_SCRIPT	,	var_34	,	'var_34'	);
%two(	allergy_otc	,	T2_Q4A1_A_OTC	,	var_35	,	'var_35'	);
%two(	arthritis_yn	,	T2_Q4A1_B_YN	,	var_36	,	'var_36'	);
%two(	arthritis_script	,	T2_Q4A1_B_SCRIPT	,	var_37	,	'var_37'	);
%two(	arthritis_otc	,	T2_Q4A1_B_OTC	,	var_38	,	'var_38'	);
%two(	asthma_yn	,	T2_Q4A1_C_YN	,	var_39	,	'var_39'	);
%two(	asthma_script	,	T2_Q4A1_C_SCRIPT	,	var_40	,	'var_40'	);
%two(	asthma_otc	,	T2_Q4A1_C_OTC	,	var_41	,	'var_41'	);
%two(	copd_yn	,	T2_Q4A1_D_YN	,	var_42	,	'var_42'	);
%two(	copd_script	,	T2_Q4A1_D_SCRIPT	,	var_43	,	'var_43'	);
%two(	copd_otc	,	T2_Q4A1_D_OTC	,	var_44	,	'var_44'	);
%two(	depression_yn	,	T2_Q4A1_E_YN	,	var_45	,	'var_45'	);
%two(	depression_script	,	T2_Q4A1_E_SCRIPT	,	var_46	,	'var_46'	);
%two(	despression_otc	,	T2_Q4A1_E_OTC	,	var_47	,	'var_47'	);
%two(	diabetes_yn	,	T2_Q4A1_F_YN	,	var_48	,	'var_48'	);
%two(	diabetes_script	,	T2_Q4A1_F_SCRIPT	,	var_49	,	'var_49'	);
%two(	diabetes_otc	,	T2_Q4A1_F_OTC	,	var_50	,	'var_50'	);
%two(	genital_yn	,	T2_Q4A1_G_YN	,	var_51	,	'var_51'	);
%two(	genital_script	,	T2_Q4A1_G_SCRIPT	,	var_52	,	'var_52'	);
%two(	genital_otc	,	T2_Q4A1_G_OTC	,	var_53	,	'var_53'	);
%two(	gi_yn	,	T2_Q4A1_H_YN	,	var_54	,	'var_54'	);
%two(	gi_script	,	T2_Q4A1_H_SCRIPT	,	var_55	,	'var_55'	);
%two(	gi_otc	,	T2_Q4A1_H_OTC	,	var_56	,	'var_56'	);
%two(	bp_yn	,	T2_Q4A1_I_YN	,	var_57	,	'var_57'	);
%two(	bp_script	,	T2_Q4A1_I_SCRIPT	,	var_58	,	'var_58'	);
%two(	bp_otc	,	T2_Q4A1_I_OTC	,	var_59	,	'var_59'	);
%two(	nausea_yn	,	T2_Q4A1_J_YN	,	var_60	,	'var_60'	);
%two(	nausea_script	,	T2_Q4A1_J_SCRIPT	,	var_61	,	'var_61'	);
%two(	nausea_otc	,	T2_Q4A1_J_OTC	,	var_62	,	'var_62'	);
%two(	pain_yn	,	T2_Q4A1_K_YN	,	var_63	,	'var_63'	);
%two(	pain_script	,	T2_Q4A1_K_SCRIPT	,	var_64	,	'var_64'	);
%two(	pain_otc	,	T2_Q4A1_K_OTC	,	var_65	,	'var_65'	);
%two(	respinfect_yn	,	T2_Q4A1_L_YN	,	var_66	,	'var_66'	);
%two(	respinfect_script	,	T2_Q4A1_L_SCRIPT	,	var_67	,	'var_67'	);
%two(	respinfect_otc	,	T2_Q4A1_L_OTC	,	var_68	,	'var_68'	);
%two(	thyroid_yn	,	T2_Q4A1_M_YN	,	var_69	,	'var_69'	);
%two(	thyroid_script	,	T2_Q4A1_M_SCRIPT	,	var_70	,	'var_70'	);
%two(	thyroid_otc	,	T2_Q4A1_M_OTC	,	var_71	,	'var_71'	);
%two(	urinary_yn	,	T2_Q4A1_N_YN	,	var_72	,	'var_72'	);
%two(	urinary_script	,	T2_Q4A1_N_SCRIPT	,	var_73	,	'var_73'	);
%two(	urinary_otc	,	T2_Q4A1_N_OTC	,	var_74	,	'var_74'	);
%two(	othermed_yn	,	T2_Q4A1_O_YN	,	var_75	,	'var_75'	);
%two(	othermedscript	,	T2_Q4A1_O_SCRIPT	,	var_76	,	'var_76'	);
%two(	othermed_otc	,	T2_Q4A1_O_OTC	,	var_77	,	'var_77'	);
%two(	prenatalvitamin_yn	,	T2_Q4B	,	var_78	,	'var_78'	);
%two(	prenatalvitamin_form	,	T2_Q4B1	,	var_79	,	'var_79'	);
%two(	supplements_yn	,	T2_Q4C	,	var_80	,	'var_80'	);
%two(	multivitamin_yn	,	T2_Q4C_A_YN	,	var_81	,	'var_81'	);
%two(	multivitmain_form	,	T2_Q4C_A_FORM	,	var_82	,	'var_82'	);
%two(	iron_yn	,	T2_Q4C_B_YN	,	var_83	,	'var_83'	);
%two(	iron_form	,	T2_Q4C_B_FORM	,	var_84	,	'var_84'	);
%two(	calcium_yn	,	T2_Q4C_C_YN	,	var_85	,	'var_85'	);
%two(	calcium_form	,	T2_Q4C_C_FORM	,	var_86	,	'var_86'	);
%two(	aminoacid_yn	,	T2_Q4C_D_YN	,	var_87	,	'var_87'	);
%two(	aminoacid_form	,	T2_Q4C_D_FORM	,	var_88	,	'var_88'	);
%two(	herbal_yn	,	T2_Q4C_E_YN	,	var_89	,	'var_89'	);
%two(	herbal_form	,	T2_Q4C_E_FORM	,	var_90	,	'var_90'	);
%two(	vita_yn	,	T2_Q4C_F_YN	,	var_91	,	'var_91'	);
%two(	vita_form	,	T2_Q4C_F_FORM	,	var_92	,	'var_92'	);
%two(	vitc_yn	,	T2_Q4C_G_YN	,	var_93	,	'var_93'	);
%two(	vitc_form	,	T2_Q4C_G_FORM	,	var_94	,	'var_94'	);
%two(	vitd_yn	,	T2_Q4C_H_YN	,	var_95	,	'var_95'	);
%two(	vitd_form	,	T2_Q4C_H_FORM	,	var_96	,	'var_96'	);
%two(	vite_yn	,	T2_Q4C_I_YN	,	var_97	,	'var_97'	);
%two(	vite_form	,	T2_Q4C_I_FORM	,	var_98	,	'var_98'	);
%two(	vitk_yn	,	T2_Q4C_J_YN	,	var_99	,	'var_99'	);
%two(	vitk_form	,	T2_Q4C_J_FORM	,	var_100	,	'var_100'	);
%two(	fishoil_yn	,	T2_Q4C_K_YN	,	var_101	,	'var_101'	);
%two(	fishoil_form	,	T2_Q4C_K_FORM	,	var_102	,	'var_102'	);
%two(	other_yn	,	T2_Q4C_L_YN	,	var_103	,	'var_103'	);
%two(	other_form	,	T2_Q4C_L_FORM	,	var_104	,	'var_104'	);
%two(	unsure_yn	,	T2_Q4C_M_YN	,	var_105	,	'var_105'	);
%two(	unsure_form	,	T2_Q4C_M_FORM	,	var_106	,	'var_106'	);
%two(	t2_q4d	,	T2_Q4D	,	var_107	,	'var_107'	);
%two(	t2_q4e	,	T2_Q4E	,	var_108	,	'var_108'	);
%two(	t2_q4f	,	T2_Q4F	,	var_109	,	'var_109'	);
%two(	t2_q4g	,	T2_Q4G	,	var_110	,	'var_110'	);
%two(	t2_q4h	,	T2_Q4H	,	var_111	,	'var_111'	);
%two(	t2_q4i	,	T2_Q4I	,	var_112	,	'var_112'	);
%two(	t2_q4j	,	T2_Q4J	,	var_113	,	'var_113'	);
%two(	t2_q5	,	t2_q5	,	var_114	,	'var_114'	);
%two(	t2_q5_dk	,	t2_q5_dk	,	var_115	,	'var_115'	);
%two(	t2_q6a_yn	,	t2_q6a_yn	,	var_116	,	'var_116'	);
%two(	t2_q6a_drugs	,	t2_q6a_drugs	,	var_117	,	'var_117'	);
%two(	t2_q6a_surg	,	t2_q6a_surg	,	var_118	,	'var_118'	);
%two(	t2_q6a_other	,	t2_q6a_other	,	var_119	,	'var_119'	);
%two(	t2_q6b_yn	,	t2_q6b_yn	,	var_120	,	'var_120'	);
%two(	t2_q6b_drugs	,	t2_q6b_drugs	,	var_121	,	'var_121'	);
%two(	t2_q6b_surg	,	t2_q6b_surg	,	var_122	,	'var_122'	);
%two(	t2_q6b_other	,	t2_q6b_other	,	var_123	,	'var_123'	);
%two(	t2_q6c_yn	,	t2_q6c_yn	,	var_124	,	'var_124'	);
%two(	t2_q6c_drugs	,	t2_q6c_drugs	,	var_125	,	'var_125'	);
%two(	t2_q6c_surg	,	t2_q6c_surg	,	var_126	,	'var_126'	);
%two(	t2_q6c_other	,	t2_q6c_other	,	var_127	,	'var_127'	);
%two(	t2_q6d_yn	,	t2_q6d_yn	,	var_128	,	'var_128'	);
%two(	t2_q6d_drugs	,	t2_q6d_drugs	,	var_129	,	'var_129'	);
%two(	t2_q6d_surg	,	t2_q6d_surg	,	var_130	,	'var_130'	);
%two(	t2_q6d_other	,	t2_q6d_other	,	var_131	,	'var_131'	);
%two(	t2_q6e_yn	,	t2_q6e_yn	,	var_132	,	'var_132'	);
%two(	t2_q6e_drugs	,	t2_q6e_drugs	,	var_133	,	'var_133'	);
%two(	t2_q6e_surg	,	t2_q6e_surg	,	var_134	,	'var_134'	);
%two(	t2_q6e_other	,	t2_q6e_other	,	var_135	,	'var_135'	);
%two(	t2_q6f_yn	,	t2_q6f_yn	,	var_136	,	'var_136'	);
%two(	t2_q6f_drugs	,	t2_q6f_drugs	,	var_137	,	'var_137'	);
%two(	t2_q6f_surg	,	t2_q6f_surg	,	var_138	,	'var_138'	);
%two(	t2_q6f_other	,	t2_q6f_other	,	var_139	,	'var_139'	);
%two(	t2_q6g_yn	,	t2_q6g_yn	,	var_140	,	'var_140'	);
%two(	t2_q6g_drugs	,	t2_q6g_drugs	,	var_141	,	'var_141'	);
%two(	t2_q6g_surg	,	t2_q6g_surg	,	var_142	,	'var_142'	);
%two(	t2_q6g_other	,	t2_q6g_other	,	var_143	,	'var_143'	);
%two(	t2_q6h_yn	,	t2_q6h_yn	,	var_144	,	'var_144'	);
%two(	t2_q6h_drugs	,	t2_q6h_drugs	,	var_145	,	'var_145'	);
%two(	t2_q6h_surg	,	t2_q6h_surg	,	var_146	,	'var_146'	);
%two(	t2_q6h_other	,	t2_q6h_other	,	var_147	,	'var_147'	);
%two(	t2_q6i_yn	,	t2_q6i_yn	,	var_148	,	'var_148'	);
%two(	t2_q6i_drugs	,	t2_q6i_drugs	,	var_149	,	'var_149'	);
%two(	t2_q6i_surg	,	t2_q6i_surg	,	var_150	,	'var_150'	);
%two(	t2_q6i_other	,	t2_q6i_other	,	var_151	,	'var_151'	);
%two(	t2_q6j_yn	,	t2_q6j_yn	,	var_152	,	'var_152'	);
%two(	t2_q6j_drugs	,	t2_q6j_drugs	,	var_153	,	'var_153'	);
%two(	t2_q6j_surg	,	t2_q6j_surg	,	var_154	,	'var_154'	);
%two(	t2_q6j_other	,	t2_q6j_other	,	var_155	,	'var_155'	);
%two(	t2_q6k_yn	,	t2_q6k_yn	,	var_156	,	'var_156'	);
%two(	t2_q6k_drugs	,	t2_q6k_drugs	,	var_157	,	'var_157'	);
%two(	t2_q6k_surg	,	t2_q6k_surg	,	var_158	,	'var_158'	);
%two(	t2_q6k_other	,	t2_q6k_other	,	var_159	,	'var_159'	);
%two(	t2_q6l_yn	,	t2_q6l_yn	,	var_160	,	'var_160'	);
%two(	t2_q6l_drugs	,	t2_q6l_drugs	,	var_161	,	'var_161'	);
%two(	t2_q6l_surg	,	t2_q6l_surg	,	var_162	,	'var_162'	);
%two(	t2_q6l_other	,	t2_q6l_other	,	var_163	,	'var_163'	);
%two(	t2_q7	,	t2_q7	,	var_164	,	'var_164'	);
%two(	t2_q8	,	t2_q8	,	var_165	,	'var_165'	);
%two(	t2_q9	,	t2_q9	,	var_166	,	'var_166'	);
%two(	t2_q9a	,	t2_q9a	,	var_167	,	'var_167'	);
%two(	t2_q10	,	t2_q10	,	var_168	,	'var_168'	);
%two(	t2_q11	,	t2_q11	,	var_169	,	'var_169'	);
%two(	t2_q11a_yn	,	t2_q11a_yn	,	var_170	,	'var_170'	);
%two(	t2_q11b	,	t2_q11b	,	var_171	,	'var_171'	);
%two(	t2_q12	,	t2_q12	,	var_172	,	'var_172'	);


/*Macro for previous pregnancy matrix outcome/baby sex vars*/
	%macro pp(new, old, name, ident);
	proc compare base=q2_comp.q2_redcap compare=q2_comp.Q2_22119 out=&name 
	outnoequal outbase outcomp outdif noprint nomiss;
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

	%pp(	t2_q12	,	t2_q12	,	var_172	,	'var_172'	);
	%pp(	t2_q12a	,	t2_q12a	,	var_173	,	'var_173'	);
	%two(	t2_q12b_1_outcome	,	t2_q12b_1_outcome	,	var_180	,	'var_180'	);
	%two(	t2_q12b_1_sex	,	t2_q12b_1_sex	,	var_186	,	'var_186'	);
	%two(	t2_q12b_2_outcome	,	t2_q12b_2_outcome	,	var_196	,	'var_196'	);
	%two(	t2_q12b_2_sex	,	t2_q12b_2_sex	,	var_202	,	'var_202'	);
	%two(	t2_q12b_3_outcome	,	t2_q12b_3_outcome	,	var_212	,	'var_212'	);
	%two(	t2_q12b_3_sex	,	t2_q12b_3_sex	,	var_218	,	'var_218'	);
	%two(	t2_q12b_4_outcome	,	t2_q12b_4_outcome	,	var_228	,	'var_228'	);
	%two(	t2_q12b_4_sex	,	t2_q12b_4_sex	,	var_234	,	'var_234'	);
	%two(	t2_q12b_5_outcome	,	t2_q12b_5_outcome	,	var_244	,	'var_244'	);
	%two(	t2_q12b_5_sex	,	t2_q12b_5_sex	,	var_250	,	'var_250'	);
	%two(	t2_q12b_6_outcome	,	t2_q12b_6_outcome	,	var_260	,	'var_260'	);
	%two(	t2_q12b_6_sex	,	t2_q12b_6_sex	,	var_266	,	'var_266'	);
	%two(	t2_q12b_7_outcome	,	t2_q12b_7_outcome	,	var_276	,	'var_276'	);
	%two(	t2_q12b_7_sex	,	t2_q12b_7_sex	,	var_282	,	'var_282'	);
	%two(	t2_q12b_8_outcome	,	t2_q12b_8_outcome	,	var_292	,	'var_292'	);
	%two(	t2_q12b_8_sex	,	t2_q12b_8_sex	,	var_298	,	'var_298'	);
	%two(	t2_q12b_9_outcome	,	t2_q12b_9_outcome	,	var_308	,	'var_308'	);
	%two(	t2_q12b_9_sex	,	t2_q12b_9_sex	,	var_314	,	'var_314'	);
	%two(	t2_q12b_10_outcome	,	t2_q12b_10_outcome	,	var_324	,	'var_324'	);
	%two(	t2_q12b_10_sex	,	t2_q12b_10_sex	,	var_330	,	'var_330'	);
	%two(	t2_q12b_11_outcome	,	t2_q12b_11_outcome	,	var_340	,	'var_340'	);
	%two(	t2_q12b_11_sex	,	t2_q12b_11_sex	,	var_346	,	'var_346'	);

%two(	complications_yn	,	T2_Q14	,	var_351	,	'var_351'	);
%two(	comp_anemia	,	T2_Q14A_1	,	var_352	,	'var_352'	);
%two(	comp_anx_dep	,	T2_Q14A_2	,	var_353	,	'var_353'	);
%two(	comp_bleeding	,	T2_Q14A_4	,	var_354	,	'var_354'	);
%two(	comp_birth_defect	,	T2_Q14A_3	,	var_355	,	'var_355'	);
%two(	comp_cervical_problem	,	T2_Q14A_5	,	var_356	,	'var_356'	);
%two(	comp_gdm	,	T2_Q14A_6	,	var_357	,	'var_357'	);
%two(	comp_htn	,	T2_Q14A_7	,	var_358	,	'var_358'	);
%two(	comp_igr	,	T2_Q14A_8	,	var_359	,	'var_359'	);
%two(	comp_pp	,	T2_Q14A_9	,	var_360	,	'var_360'	);
%two(	comp_pe	,	T2_Q14A_10	,	var_361	,	'var_361'	);
%two(	comp_prom	,	T2_Q14A_11	,	var_362	,	'var_362'	);
%two(	comp_ptl	,	T2_Q14A_12	,	var_363	,	'var_363'	);
%two(	comp_other	,	T2_Q14A_13	,	var_364	,	'var_364'	);
%two(	food_organic	,	T2_Q15	,	var_365	,	'var_365'	);
%two(	food_homegrown	,	T2_Q16	,	var_366	,	'var_366'	);
%two(	food_unprocessed	,	T2_Q17	,	var_367	,	'var_367'	);
%two(	food_canned	,	T2_Q17A	,	var_368	,	'var_368'	);
%two(	food_frozen	,	T2_Q17B	,	var_369	,	'var_369'	);
%two(	food_fresh	,	T2_Q17C	,	var_370	,	'var_370'	);
%two(	mealsperweek_pb	,	T2_Q18A	,	var_371	,	'var_371'	);
%two(	mealsperweek_beef	,	T2_Q18B	,	var_372	,	'var_372'	);
%two(	mealsperweek_seafood	,	T2_Q18C	,	var_373	,	'var_373'	);
%two(	mealsperweek_poultry	,	T2_Q18D	,	var_374	,	'var_374'	);
%two(	mealsperweek_othermeats	,	T2_Q18E	,	var_375	,	'var_375'	);
%two(	mealsperweek_spices	,	T2_Q18F	,	var_376	,	'var_376'	);
%two(	mealsperweek_oils	,	T2_Q18G	,	var_377	,	'var_377'	);
%two(	mealsperweek_soy	,	T2_Q18H	,	var_378	,	'var_378'	);
%two(	mealsperweek_dairy	,	T2_Q18I	,	var_379	,	'var_379'	);
%two(	meals_restaurant	,	T2_Q19	,	var_380	,	'var_380'	);
%two(	meals_fastfood	,	T2_Q19A	,	var_381	,	'var_381'	);

%two(	cigarettes_yn	,	T2_Q20A_YN	,	var_382	,	'var_382'	);
%two(	cigarettes_day	,	T2_Q20A_DAY	,	var_383	,	'var_383'	);
%two(	cigarettes_week	,	T2_Q20A_WEEK	,	var_384	,	'var_384'	);
%two(	cigarettes_recode	,	T2_Q20A_WKS_Recode	,	var_385	,	'var_385'	);
%two(	redwine_yn	,	T2_Q20B_YN	,	var_386	,	'var_386'	);
%two(	redwine_day	,	T2_Q20B_DAY	,	var_387	,	'var_387'	);
%two(	redwine_week	,	T2_Q20B_WEEK	,	var_388	,	'var_388'	);
%two(	redwine_recode	,	T2_Q20B_WKS_Recode	,	var_389	,	'var_389'	);
%two(	otherwine_yn	,	T2_Q20C_YN	,	var_390	,	'var_390'	);
%two(	otherwine_day	,	T2_Q20C_DAY	,	var_391	,	'var_391'	);
%two(	otherwine_week	,	T2_Q20C_WEEK	,	var_392	,	'var_392'	);
%two(	otherwine_recode	,	T2_Q20C_WKS_Recode	,	var_393	,	'var_393'	);
%two(	beer_yn	,	T2_Q20D_YN	,	var_394	,	'var_394'	);
%two(	beer_day	,	T2_Q20D_DAY	,	var_395	,	'var_395'	);
%two(	beer_week	,	T2_Q20D_WEEK	,	var_396	,	'var_396'	);
%two(	beer_recode	,	T2_Q20D_WKS_Recode	,	var_397	,	'var_397'	);
%two(	liquor_yn	,	T2_Q20E_YN	,	var_398	,	'var_398'	);
%two(	liquor_day	,	T2_Q20E_DAY	,	var_399	,	'var_399'	);
%two(	liquor_week	,	T2_Q20E_WEEK	,	var_400	,	'var_400'	);
%two(	liquor_recode	,	T2_Q20E_WKS_Recode	,	var_401	,	'var_401'	);
%two(	coffee_yn	,	T2_Q20F_YN	,	var_402	,	'var_402'	);
%two(	coffee_day	,	T2_Q20F_DAY	,	var_403	,	'var_403'	);
%two(	coffee_week	,	T2_Q20F_WEEK	,	var_404	,	'var_404'	);
%two(	coffee_recode	,	T2_Q20F_WKS_Recode	,	var_405	,	'var_405'	);
%two(	tea_yn	,	T2_Q20G_YN	,	var_406	,	'var_406'	);
%two(	tea_day	,	T2_Q20G_DAY	,	var_407	,	'var_407'	);
%two(	tea_week	,	T2_Q20G_WEEK	,	var_408	,	'var_408'	);
%two(	tea_recode	,	T2_Q20G_WKS_Recode	,	var_409	,	'var_409'	);
%two(	soda_yn	,	T2_Q20H_YN	,	var_410	,	'var_410'	);
%two(	soda_day	,	T2_Q20H_DAY	,	var_411	,	'var_411'	);
%two(	soda_week	,	T2_Q20H_WEEK	,	var_412	,	'var_412'	);
%two(	soda_recode	,	T2_Q20H_WKS_Recode	,	var_413	,	'var_413'	);
%two(	marijuana_yn	,	T2_Q20I_YN	,	var_414	,	'var_414'	);
%two(	marijuana_day	,	T2_Q20I_DAY	,	var_415	,	'var_415'	);
%two(	marijuana_week	,	T2_Q20I_WEEK	,	var_416	,	'var_416'	);
%two(	marijuana_recode	,	T2_Q20I_WKS_Recode	,	var_417	,	'var_417'	);
%two(	cocaine_yn	,	T2_Q20J_YN	,	var_418	,	'var_418'	);
%two(	cocaine_day	,	T2_Q20J_DAY	,	var_419	,	'var_419'	);
%two(	cocaine_week	,	T2_Q20J_WEEK	,	var_420	,	'var_420'	);
%two(	cocaine_recode	,	T2_Q20J_WKS_Recode	,	var_421	,	'var_421'	);


%two(	shs_hoursday	,	T2_Q21	,	var_422	,	'var_422'	);
%two(	number_smokers	,	T2_Q22	,	var_423	,	'var_423'	);
%two(	t2_q23	,	T2_Q23	,	var_424	,	'var_424'	);
%two(	t2_q23a1	,	T2_Q23A1	,	var_425	,	'var_425'	);
%two(	t2_q23a2	,	T2_Q23A2	,	var_426	,	'var_426'	);
%two(	t2_q23a3	,	T2_Q23A3	,	var_427	,	'var_427'	);
%two(	t2_q23a4	,	T2_Q23A4	,	var_428	,	'var_428'	);
%two(	t2_q23a5	,	T2_Q23A5	,	var_429	,	'var_429'	);
%two(	t2_q23a6	,	T2_Q23A6	,	var_430	,	'var_430'	);
%two(	t2_q23a7	,	T2_Q23A7	,	var_431	,	'var_431'	);
%two(	t2_q23a8	,	T2_Q23A8	,	var_432	,	'var_432'	);
%two(	t2_q23a9	,	T2_Q23A9	,	var_433	,	'var_433'	);

%two(	t2_q23b_a	,	T2_Q23B_A	,	var_435	,	'var_435'	);
%two(	t2_q23b1	,	T2_Q23B1	,	var_436	,	'var_436'	);
%two(	t2_q23b_b	,	T2_Q23B_B	,	var_437	,	'var_437'	);
%two(	t2_q23b2	,	T2_Q23B2	,	var_438	,	'var_438'	);
%two(	t2_q23b_c	,	T2_Q23B_C	,	var_439	,	'var_439'	);
%two(	t2_q23b3_a	,	T2_Q23B3_A	,	var_440	,	'var_440'	);
%two(	t2_q23b3_b	,	T2_Q23B3_B	,	var_441	,	'var_441'	);
%two(	t2_q23b3_c	,	T2_Q23B3_C	,	var_442	,	'var_442'	);
%two(	t2_q23b3_d	,	T2_Q23B3_D	,	var_443	,	'var_443'	);
%two(	t2_q23b_d	,	T2_Q23B_D	,	var_444	,	'var_444'	);
%two(	t2_q23b4	,	T2_Q23B4	,	var_445	,	'var_445'	);
%two(	t2_q23b4_a	,	T2_Q23B4_A	,	var_446	,	'var_446'	);
%two(	t2_q23b4_b	,	T2_Q23B4_B	,	var_447	,	'var_447'	);
%two(	t2_q23b4_c	,	T2_Q23B4_C	,	var_448	,	'var_448'	);
%two(	t2_q23b4_d	,	T2_Q23B4_D	,	var_449	,	'var_449'	);
%two(	t2_q23b4_e	,	T2_Q23B4_E	,	var_450	,	'var_450'	);
%two(	t2_q23b4_f	,	T2_Q23B4_F	,	var_451	,	'var_451'	);
%two(	t2_q23b4_g	,	T2_Q23B4_G	,	var_452	,	'var_452'	);
%two(	t2_q23b4_h	,	T2_Q23B4_H	,	var_453	,	'var_453'	);
%two(	t2_q23b4_i	,	T2_Q23B4_I	,	var_454	,	'var_454'	);
%two(	t2_q23b4_j	,	T2_Q23B4_J	,	var_455	,	'var_455'	);
%two(	t2_q23b_e	,	T2_Q23B_E	,	var_456	,	'var_456'	);
%two(	t2_q23c	,	T2_Q23C	,	var_457	,	'var_457'	);
%two(	t2_q23d	,	T2_Q23D	,	var_458	,	'var_458'	);
%two(	t2_q23e	,	T2_Q23E	,	var_459	,	'var_459'	);
%two(	t2_q23e1,	T2_Q23E1	,	var_460	,	'var_460');
%two(	t2_q23f	,	T2_Q23F	,	var_461	,	'var_461'	);
%two(	t2_q24	,	T2_Q24	,	var_462	,	'var_462'	);
%two(	t2_q25	,	T2_Q25	,	var_463	,	'var_463'	);
%two(	t2_q26	,	T2_Q26	,	var_464	,	'var_464'	);
%two(	t2_q27	,	T2_Q27	,	var_465	,	'var_465'	);
%two(	t2_q28	,	T2_Q28	,	var_466	,	'var_466'	);
%two(	t2_q29	,	T2_Q29	,	var_467	,	'var_467'	);
%two(	t2_q30	,	T2_Q30	,	var_468	,	'var_468'	);
%two(	t2_q31	,	T2_Q31	,	var_469	,	'var_469'	);
%two(	t2_q32	,	T2_Q32	,	var_470	,	'var_470'	);
%two(	t2_q33	,	T2_Q33	,	var_471	,	'var_471'	);
%two(	t2_q34	,	T2_Q34	,	var_472	,	'var_472'	);
%two(	t2_q35	,	T2_Q35	,	var_473	,	'var_473'	);
%two(	t2_q36	,	T2_Q36	,	var_474	,	'var_474'	);
%two(	t2_q37	,	T2_Q37	,	var_475	,	'var_475'	);
%two(	t2_q38	,	T2_Q38	,	var_476	,	'var_476'	);
%two(	t2_q39	,	T2_Q39	,	var_477	,	'var_477'	);
%two(	t2_q40	,	T2_Q40	,	var_478	,	'var_478'	);
%two(	t2_q41	,	T2_Q41	,	var_479	,	'var_479'	);
%two(	t2_q42	,	T2_Q42	,	var_480	,	'var_480'	);
%two(	t2_q43	,	T2_Q43	,	var_481	,	'var_481'	);
%two(	t2_q44	,	T2_Q44	,	var_482	,	'var_482'	);
%two(	t2_q45	,	T2_Q45	,	var_483	,	'var_483'	);
%two(	t2_q46	,	T2_Q46	,	var_484	,	'var_484'	);
%two(	t2_q47	,	T2_Q47	,	var_485	,	'var_485'	);
%two(	t2_q48	,	T2_Q48	,	var_486	,	'var_486'	);
%two(	t2_q49	,	T2_Q49	,	var_487	,	'var_487'	);
%two(	t2_q50	,	T2_Q50	,	var_488	,	'var_488'	);
%two(	t2_q51	,	T2_Q51	,	var_489	,	'var_489'	);
%two(	t2_q52	,	T2_Q52	,	var_490	,	'var_490'	);
%two(	t2_q53	,	T2_Q53	,	var_491	,	'var_491'	);
%two(	t2_q53a	,	T2_Q53A	,	var_492	,	'var_492'	);
%two(	t2_q53b	,	T2_Q53B	,	var_493	,	'var_493'	);
%two(	t2_q54a	,	T2_Q54A	,	var_494	,	'var_494'	);
