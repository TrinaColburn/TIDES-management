/* Edit the following line to reflect the full path to your CSV file */
libname q2_pw "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q2"; run;
%let q2_rc = 'TIDESI-SecondTrimesterNonre_DATA_NOHDRS_2021-01-28_0845.csv';

OPTIONS nofmterr;

data q2_pw.ti_q2_2021128; %let _EFIERR_ = 0;
infile &q2_rc  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat t2_sysid $500. ;
	informat t2_userid $500. ;
	informat t2_q2_date mmddyy10. ;
	informat t2_paperdt mmddyy10. ;
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
	informat t2_q12a $500. ;
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

input
	study_id
	redcap_event_name $
	t2_sysid $
	t2_userid $
	t2_q2_date 
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
	t2_q12a $
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
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;


/* Edit the following line to reflect the full path to your CSV file */
%let q2_rep = 'TIDESI-SecondTrimesterRepea_DATA_NOHDRS_2021-01-28_0845.csv';

OPTIONS nofmterr;

/*set to work*/
data ti_q2_rep; %let _EFIERR_ = 0;
infile &q2_rep  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

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
	informat nutritional_suppleme_v_0 best32. ;
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
	informat pregnancy_complicati_v_1 best32. ;

	format study_id best8. ;
	format redcap_event_name $500. ;
	format medications_yn best12. ;
	format allergy_yn best12. ;
	format allergy_script best12. ;
	format allergy_otc best12. ;
	format arthritis_yn best12. ;
	format arthritis_script best12. ;
	format arthritis_otc best12. ;
	format asthma_yn best12. ;
	format asthma_script best12. ;
	format asthma_otc best12. ;
	format copd_yn best12. ;
	format copd_script best12. ;
	format copd_otc best12. ;
	format depression_yn best12. ;
	format depression_script best12. ;
	format despression_otc best12. ;
	format diabetes_yn best12. ;
	format diabetes_script best12. ;
	format diabetes_otc best12. ;
	format genital_yn best12. ;
	format genital_script best12. ;
	format genital_otc best12. ;
	format gi_yn best12. ;
	format gi_script best12. ;
	format gi_otc best12. ;
	format bp_yn best12. ;
	format bp_script best12. ;
	format bp_otc best12. ;
	format nausea_yn best12. ;
	format nausea_script best12. ;
	format nausea_otc best12. ;
	format pain_yn best12. ;
	format pain_script best12. ;
	format pain_otc best12. ;
	format respinfect_yn best12. ;
	format respinfect_script best12. ;
	format respinfect_otc best12. ;
	format thyroid_yn best12. ;
	format thyroid_script best12. ;
	format thyroid_otc best12. ;
	format urinary_yn best12. ;
	format urinary_script best12. ;
	format urinary_otc best12. ;
	format othermed_yn best12. ;
	format othermedscript best12. ;
	format othermed_otc best12. ;
	format medication_history_complete best12. ;
	format prenatalvitamin_yn best12. ;
	format prenatalvitamin_form best12. ;
	format supplements_yn best12. ;
	format multivitamin_yn best12. ;
	format multivitmain_form best12. ;
	format iron_yn best12. ;
	format iron_form best12. ;
	format calcium_yn best12. ;
	format calcium_form best12. ;
	format aminoacid_yn best12. ;
	format aminoacid_form best12. ;
	format herbal_yn best12. ;
	format herbal_form best12. ;
	format vita_yn best12. ;
	format vita_form best12. ;
	format vitc_yn best12. ;
	format vitc_form best12. ;
	format vitd_yn best12. ;
	format vitd_form best12. ;
	format vite_yn best12. ;
	format vite_form best12. ;
	format vitk_yn best12. ;
	format vitk_form best12. ;
	format fishoil_yn best12. ;
	format fishoil_form best12. ;
	format other_yn best12. ;
	format other_form best12. ;
	format unsure_yn best12. ;
	format unsure_form best12. ;
	format nutritional_suppleme_v_0 best12. ;
	format food_organic best12. ;
	format food_homegrown best12. ;
	format food_unprocessed best12. ;
	format food_canned best12. ;
	format food_frozen best12. ;
	format food_fresh best12. ;
	format mealsperweek_pb best12. ;
	format mealsperweek_beef best12. ;
	format mealsperweek_seafood best12. ;
	format mealsperweek_poultry best12. ;
	format mealsperweek_othermeats best12. ;
	format mealsperweek_spices best12. ;
	format mealsperweek_oils best12. ;
	format mealsperweek_soy best12. ;
	format mealsperweek_dairy best12. ;
	format meals_restaurant best12. ;
	format meals_fastfood best12. ;
	format diet_complete best12. ;
	format cigarettes_yn best12. ;
	format cigarettes_day best12. ;
	format cigarettes_week best12. ;
	format cigarettes_recode best12. ;
	format redwine_yn best12. ;
	format redwine_day best12. ;
	format redwine_week best12. ;
	format redwine_recode best12. ;
	format otherwine_yn best12. ;
	format otherwine_day best12. ;
	format otherwine_week best12. ;
	format otherwine_recode best12. ;
	format beer_yn best12. ;
	format beer_day best12. ;
	format beer_week best12. ;
	format beer_recode best12. ;
	format liquor_yn best12. ;
	format liquor_day best12. ;
	format liquor_week best12. ;
	format liquor_recode best12. ;
	format coffee_yn best12. ;
	format coffee_day best12. ;
	format coffee_week best12. ;
	format coffee_recode best12. ;
	format tea_yn best12. ;
	format tea_day best12. ;
	format tea_week best12. ;
	format tea_recode best12. ;
	format soda_yn best12. ;
	format soda_day best12. ;
	format soda_week best12. ;
	format soda_recode best12. ;
	format marijuana_yn best12. ;
	format marijuana_day best12. ;
	format marijuana_week best12. ;
	format marijuana_recode best12. ;
	format cocaine_yn best12. ;
	format cocaine_day best12. ;
	format cocaine_week best12. ;
	format cocaine_recode best12. ;
	format shs_hoursday best12. ;
	format number_smokers best12. ;
	format lifestyle_habits_complete best12. ;
	format complications_yn best12. ;
	format comp_anemia best12. ;
	format comp_anx_dep best12. ;
	format comp_bleeding best12. ;
	format comp_birth_defect best12. ;
	format comp_cervical_problem best12. ;
	format comp_gdm best12. ;
	format comp_htn best12. ;
	format comp_igr best12. ;
	format comp_pp best12. ;
	format comp_pe best12. ;
	format comp_prom best12. ;
	format comp_ptl best12. ;
	format comp_other best12. ;
	format pregnancy_complicati_v_1 best12. ;

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
	nutritional_suppleme_v_0
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
	pregnancy_complicati_v_1
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

/*run prefix macro*/
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

%addprefix(ti_q2_rep, T2_);
	/*rename study_id back to original*/
	data q2_pw.ti_q2_rep; set ti_q2_rep;
	rename t2_study_id=study_id; run;

proc sort data=q2_pw.ti_q2_2021128; by study_id; 
proc sort data=q2_pw.ti_q2_rep; by study_id; 

data q2_pw.q2_all; merge q2_pw.ti_q2_2021128 q2_pw.ti_q2_rep; by study_id; run;
