/**************************************************/
/***********Q1 REDCap upload editing**************/
/**************************************************/


/*I. Separate repeated questions*/
/*remove imported variables*/

/*Q1*/
    data q1.q1_2020_sub; set q1.Q1_20190514;
    /*drop meds*/
        drop T1_Q6A
        T1_Q6A1_A_YN T1_Q6A1_A_SCRIPT T1_Q6A1_A_OTC T1_Q6A1_B_YN T1_Q6A1_B_SCRIPT T1_Q6A1_B_OTC
        T1_Q6A1_C_YN T1_Q6A1_C_SCRIPT T1_Q6A1_C_OTC T1_Q6A1_D_YN T1_Q6A1_D_SCRIPT T1_Q6A1_D_OTC
        T1_Q6A1_E_YN T1_Q6A1_E_SCRIPT T1_Q6A1_E_OTC T1_Q6A1_F_YN T1_Q6A1_F_SCRIPT T1_Q6A1_F_OTC
        T1_Q6A1_G_YN T1_Q6A1_G_SCRIPT T1_Q6A1_G_OTC T1_Q6A1_H_YN T1_Q6A1_H_SCRIPT T1_Q6A1_H_OTC
        T1_Q6A1_I_YN T1_Q6A1_I_SCRIPT T1_Q6A1_I_OTC T1_Q6A1_J_YN T1_Q6A1_J_SCRIPT T1_Q6A1_J_OTC
        T1_Q6A1_K_YN T1_Q6A1_K_SCRIPT T1_Q6A1_K_OTC T1_Q6A1_L_YN T1_Q6A1_L_SCRIPT T1_Q6A1_L_OTC
        T1_Q6A1_M_YN T1_Q6A1_M_SCRIPT T1_Q6A1_M_OTC T1_Q6A1_N_YN T1_Q6A1_N_SCRIPT T1_Q6A1_N_OTC
        T1_Q6A1_O_YN T1_Q6A1_O_SCRIPT T1_Q6A1_O_OTC
    /*drop supplements*/
        T1_Q6B T1_Q6B1 T1_Q6C t1_q6c_a_yn t1_q6c_a_form t1_q6c_b_yn t1_q6c_b_form
        t1_q6c_c_yn t1_q6c_c_form t1_q6c_d_yn t1_q6c_d_form t1_q6c_e_yn t1_q6c_e_form
        t1_q6c_f_yn t1_q6c_f_form t1_q6c_g_yn t1_q6c_g_form t1_q6c_h_yn t1_q6c_h_form
        t1_q6c_i_yn t1_q6c_i_form t1_q6c_j_yn t1_q6c_j_form t1_q6c_k_yn t1_q6c_k_form
		t1_q6c_l_yn t1_q6c_l_form t1_q6c_m_yn t1_q6c_m_form
    /*Drop diet*/
        T1_Q22 T1_Q23 T1_Q24 T1_Q25A T1_Q25B T1_Q25C
        T1_Q26A T1_Q26B T1_Q26C T1_Q26D T1_Q26E T1_Q26F
        T1_Q26G T1_Q26H T1_Q26I T1_Q27 T1_Q27A
    /*Drop drugs and alcohol*/
        T1_Q30A_YN T1_Q30A_DAY T1_Q30A_WEEK T1_Q30a_week_Recode T1_Q30B_YN T1_Q30B_DAY T1_Q30B_WEEK T1_Q30b_week_Recode
        T1_Q30C_YN T1_Q30C_DAY T1_Q30C_WEEK T1_Q30c_week_Recode T1_Q30D_YN T1_Q30D_DAY T1_Q30D_WEEK T1_Q30d_week_Recode
        T1_Q30E_YN T1_Q30E_DAY T1_Q30E_WEEK T1_Q30e_week_Recode T1_Q30F_YN T1_Q30F_DAY T1_Q30F_WEEK T1_Q30f_week_Recode
        T1_Q30G_YN T1_Q30G_DAY T1_Q30G_WEEK T1_Q30g_week_Recode T1_Q30H_YN T1_Q30H_DAY T1_Q30H_WEEK T1_Q30h_week_Recode
        T1_Q30I_YN T1_Q30I_DAY T1_Q30I_WEEK T1_Q30i_week_Recode T1_Q30J_YN T1_Q30J_DAY T1_Q30J_WEEK T1_Q30j_week_Recode
        T1_Q31 T1_Q32
		/*drop renamed day/week vars*/
        cigarettes_day cigarettes_week redwine_day redwine_week otherwine_day otherwine_week 
        beer_day beer_week liquor_day liquor_week coffee_day coffee_week tea_day tea_week 
        soda_day soda_week marijuana_day marijuana_week cocaine_day cocaine_week;
    run;



/*II. Edit certain variable names*/
/*Question Medications*/
/*First Trimester*/
    data work.q1_REDCap_2020; set q1.q1_2020_sub;
      rename	t1_q6a1_a_yn	=	allergy_yn;
      rename	t1_q6a1_a_script	=	allergy_script;
      rename	t1_q6a1_a_otc	=	allergy_otc;
      rename	t1_q6a1_b_yn	=	arthritis_yn;
      rename	t1_q6a1_b_script	=	arthritis_script;
      rename	t1_q6a1_b_otc	=	arthritis_otc;
      rename	t1_q6a1_c_yn	=	asthma_yn;
      rename	t1_q6a1_c_script	=	asthma_script;
      rename	t1_q6a1_c_otc	=	asthma_otc;
      rename	t1_q6a1_d_yn	=	copd_yn;
      rename	t1_q6a1_d_script	=	copd_script;
      rename	t1_q6a1_d_otc	=	copd_otc;
      rename	t1_q6a1_e_yn	=	depression_yn;
      rename	t1_q6a1_e_script	=	depression_script;
      rename	t1_q6a1_e_otc	=	despression_otc;
      rename	t1_q6a1_f_yn	=	diabetes_yn;
      rename	t1_q6a1_f_script	=	diabetes_script;
      rename	t1_q6a1_f_otc	=	diabetes_otc;
      rename	t1_q6a1_g_yn	=	genital_yn;
      rename	t1_q6a1_g_script	=	genital_script;
      rename	t1_q6a1_g_otc	=	genital_otc;
      rename	t1_q6a1_h_yn	=	gi_yn;
      rename	t1_q6a1_h_script	=	gi_script;
      rename	t1_q6a1_h_otc	=	gi_otc;
      rename	t1_q6a1_i_yn	=	bloodpressure_yn;
      rename	t1_q6a1_i_script	=	bloodpressure_script;
      rename	t1_q6a1_i_otc	=	bloodpressure_otc;
      rename	t1_q6a1_j_yn	=	nausea_yn;
      rename	t1_q6a1_j_script	=	nausea_script;
      rename	t1_q6a1_j_otc	=	nausea_otc;
      rename	t1_q6a1_k_yn	=	pain_yn;
      rename	t1_q6a1_k_script	=	pain_script;
      rename	t1_q6a1_k_otc	=	pain_otc;
      rename	t1_q6a1_l_yn	=	respinfect_yn;
      rename	t1_q6a1_l_script	=	respinfect_script;
      rename	t1_q6a1_l_otc	=	respinfect_otc;
      rename	t1_q6a1_m_yn	=	thyroid_yn;
      rename	t1_q6a1_m_script	=	thyroid_script;
      rename	t1_q6a1_m_otc	=	thyroid_otc;
      rename	t1_q6a1_n_yn	=	urinary_yn;
      rename	t1_q6a1_n_script	=	urinary_script;
      rename	t1_q6a1_n_otc	=	urinary_otc;
      rename	t1_q6a1_o_yn	=	other_yn;
      rename	t1_q6a1_o_script	=	other_script;
      rename	t1_q6a1_o_otc	=	other_otc; run;



  data work.q1_REDCap_2020; set work.q1_REDCap_2020;
      rename T1_Q19_1=t1_q19_1___1;
      rename T1_Q19_2=t1_q19_2___1;
      rename T1_Q19_3=t1_q19_3___1;
      rename T1_Q19_4=t1_q19_4___1;
      rename T1_Q19_5=t1_q19_5___1;
      rename T1_Q19_6=t1_q19_6___1;
      rename T1_Q19_7=t1_q19_7___1;
      rename mombmi=t1_mombmi_derived; run;

/*III. Change order to match order in REDCap*/
  data work.q1_REDCap_2020;
          format
          study_id
          subject_id
          center
          t1_site
          t1_q46_dob
          age_months
          age_yrs
          t1_q48_race
          t1_q47_ethnic
          t1_sysid
          t1_userid
          t1_qversion
          t1_qversionnumber
          t1_today_dt
          t1_paperdt
          t1_paperusername
          t1_time_stamp
          t1_time_started
          t1_time_started_raw
          t1_time_end_raw
          dropped
          t1_bypassed
          t1_pageno
          t1_last_page
          t1_page_0 t1_page_1 t1_page_2 t1_page_3 t1_page_4 t1_page_5
          t1_page_6 t1_page_7 t1_page_8 t1_page_9 t1_page_10 t1_page_11
          t1_complete
          t1_paperyn
          t1_q4
          t1_q5_lmp t1_q5_dk  t1_q5_ns t1_q1_wks t1_q1_days
          t1_q1_dk
          t1_q2_ht_cm  t1_q2_ht_ft t1_q2_ht_in t1_q2_wt_kg
          t1_q2_wt_lbs t1_q3_wt_lbs t1_q3_wt_kg
          t1_q1_wks_recode t1_q2_ht_in_recode t1_q2_wt_lbs_recode t1_q3_wt_lbs_recode
          t1_mombmi_derived
          t1_q6a
          t1_q6a1_a_yn t1_q6a1_a_otc t1_q6a1_a_script
          t1_q6a1_b_yn t1_q6a1_b_otc t1_q6a1_b_script
          t1_q6a1_c_yn t1_q6a1_c_otc t1_q6a1_c_script
          t1_q6a1_d_yn t1_q6a1_d_otc t1_q6a1_d_script
          t1_q6a1_e_yn t1_q6a1_e_otc t1_q6a1_e_script
          t1_q6a1_f_yn t1_q6a1_f_otc t1_q6a1_f_script
          t1_q6a1_g_yn t1_q6a1_g_otc t1_q6a1_g_script
          t1_q6a1_h_yn t1_q6a1_h_otc t1_q6a1_h_script
          t1_q6a1_i_yn t1_q6a1_i_otc t1_q6a1_i_script
          t1_q6a1_j_yn t1_q6a1_j_otc t1_q6a1_j_script
          t1_q6a1_k_yn t1_q6a1_k_otc t1_q6a1_k_script
          t1_q6a1_l_yn t1_q6a1_l_otc t1_q6a1_l_script
          t1_q6a1_m_yn t1_q6a1_m_otc t1_q6a1_m_script
          t1_q6a1_n_yn t1_q6a1_n_otc t1_q6a1_n_script
          t1_q6a1_o_yn t1_q6a1_o_otc t1_q6a1_o_script
          t1_q6b t1_q6b1
          t1_q6c
          t1_q6c_a_yn t1_q6c_a_form
          t1_q6c_b_yn t1_q6c_b_form
          t1_q6c_c_yn t1_q6c_c_form
          t1_q6c_d_yn t1_q6c_d_form
          t1_q6c_e_yn t1_q6c_e_form
          t1_q6c_f_yn t1_q6c_f_form
          t1_q6c_g_yn t1_q6c_g_form
          t1_q6c_h_yn t1_q6c_h_form
          t1_q6c_i_yn t1_q6c_i_form
          t1_q6c_j_yn t1_q6c_j_form
          t1_q6c_k_yn t1_q6c_k_form
          t1_q6c_l_yn t1_q6c_l_form
          t1_q6c_m_yn t1_q6c_m_form
          t1_q6d t1_q6e t1_q6f t1_q6g t1_q6h t1_q6i
          t1_q7
          t1_q8 t1_q8a t1_q8a1
          t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c t1_q9a1_d t1_q9a1_e t1_q9a1_f
          t1_q9b
          t1_q10 t1_q11
          t1_q12 t1_q12a_a t1_q12a_b t1_q12a_c t1_q12a_d t1_q12a_e t1_q12a_f t1_q12a_g t1_q12a_h t1_q12a_i
          t1_q13 t1_q14 t1_q15 t1_q16 t1_q17 t1_q18
          t1_q19_1___1 t1_q19_2___1 t1_q19_3___1 t1_q19_4___1 t1_q19_5___1 t1_q19_6___1 t1_q19_7___1
          t1_q20 t1_q21 t1_q22 t1_q23 t1_q24
          t1_q25a t1_q25b t1_q25c t1_q26a t1_q26b t1_q26c t1_q26d t1_q26e
          t1_q26f t1_q26g t1_q26h t1_q26i t1_q26i_outlier t1_q27 t1_q27_outlier
          t1_q27a t1_q27a_outlier t1_q28 t1_q28_outlier t1_q29
          t1_q30a_yn t1_q30a_day t1_q30a_week t1_q30a_week_recode
          t1_q30b_yn t1_q30b_day t1_q30b_week t1_q30b_week_recode
          t1_q30c_yn t1_q30c_day t1_q30c_week t1_q30c_week_recode
          t1_q30d_yn t1_q30d_day t1_q30d_week t1_q30d_week_recode
          t1_q30e_yn t1_q30e_day t1_q30e_week t1_q30e_week_recode
          t1_q30f_yn t1_q30f_day t1_q30f_week t1_q30f_week_recode
          t1_q30g_yn t1_q30g_day t1_q30g_week t1_q30g_week_recode
          t1_q30h_yn t1_q30h_day t1_q30h_week t1_q30h_week_recode
          t1_q30i_yn t1_q30i_day t1_q30i_week t1_q30i_week_recode
          t1_q30j_yn t1_q30j_day t1_q30j_week t1_q30j_week_recode
          t1_q31 t1_q32 t1_q33
          t1_q34 t1_q34a t1_q34b
            t1_q34c_a t1_q34c_b t1_q34c_c t1_q34c_d
          t1_q34d
            t1_q34d1_a t1_q34d1_b t1_q34d1_c t1_q34d1_d t1_q34d1_e
            t1_q34d1_f t1_q34d1_g t1_q34d1_h t1_q34d1_i t1_q34d1_j
          t1_q35 t1_q36 t1_q37 t1_q37a t1_q38
          t1_q39
          t1_q39a
            t1_q39a1_a t1_q39a1_b t1_q39a1_c t1_q39a1_d t1_q39a1_e
            t1_q39a1_f t1_q39a1_g t1_q39a1_h t1_q39a1_i
          t1_q39b
            t1_q39b1_a t1_q39b1_b t1_q39b1_c t1_q39b1_d
          t1_q39c
          t1_q40 t1_q41 t1_q42
          t1_q43a_1_frag  t1_q43a_1_days
          t1_q43a_2_frag  t1_q43a_2_days
          t1_q43a_3_frag  t1_q43a_3_days
          t1_q43a_4_frag  t1_q43a_4_days
          t1_q43a_5_frag  t1_q43a_5_days
          t1_q43b_1_frag  t1_q43b_1_days
          t1_q43b_2_frag  t1_q43b_2_days
          t1_q43b_3_frag  t1_q43b_3_days
          t1_q43b_4_frag  t1_q43b_4_days
          t1_q43b_5_frag  t1_q43b_5_days
          t1_q43b_6_frag  t1_q43b_6_days
          t1_q43b_7_frag  t1_q43b_7_days
          t1_q43b_8_frag  t1_q43b_8_days
          t1_q43b_9_frag  t1_q43b_9_days
          t1_q43b_10_frag t1_q43b_10_days
          t1_q43b_11_frag t1_q43b_11_days
          t1_q43c_frag    t1_q43c_days
          t1_q43d_frag    t1_q43d_days
          t1_q43e_frag    t1_q43e_days
          t1_q43f_frag    t1_q43f_days
          t1_q43g_frag    t1_q43g_days
          t1_q43h_frag    t1_q43h_days
          t1_q43i_frag    t1_q43i_days
          t1_q43j_frag    t1_q43j_days
          t1_q43k_frag    t1_q43k_days
          t1_q43l_frag    t1_q43l_days
          t1_q44a t1_q44b t1_q44c t1_q44d t1_q44e
          t1_q44f t1_q44g t1_q44h t1_q44i t1_q44j t1_q44k
          t1_q45  t1_q45a t1_q48a t1_q48b
          t1_q48c t1_q48d t1_q48e t1_q48f
          t1_q49  t1_q50  t1_q51  t1_q52  t1_q53
          studyid
          id_num
          _complete
;
set work.q1_REDCap_2020; run;

proc contents data=q1.Q1_20190514 order=varnum; run;

/*III. Fix for T1_Q18
Recode 1 --> 0, 2 --> 1, 3 --> -3 (don't know)*/

data work.q1_REDCap_2020; set work.q1_REDCap_2020;
if T1_Q18=1 then T1_Q18_rc=0;
if T1_Q18=2 then T1_Q18_rc=1;
if T1_Q18=3 then T1_Q18_rc=-3; run;
      /*Check*/
      proc freq data=q1_REDCap_2020;
      tables t1_q18 /norow nocol nopercent nocum missing;
      run;

  /*Recode and rename*/
  data work.q1_REDCap_2020; set work.q1_REDCap_2020;
  drop t1_q18; run;

  data work.q1_REDCap_2020; set work.q1_REDCap_2020;
  rename T1_Q18_rc=t1_q18; run;

/*Recode for the Q19*/
proc freq data=q1_REDCap_2020;
tables
t1_q19_1___1
t1_q19_2___1
t1_q19_3___1
t1_q19_4___1
t1_q19_5___1
t1_q19_6___1
t1_q19_7___1
/norow nocol nopercent nocum missing;
run;

data work.q1_REDCap_2020; set work.q1_REDCap_2020;
if t1_q19_1___1 > 1 then t1_q19_1___1=1;
if t1_q19_2___1 > 1 then t1_q19_2___1=1;
if t1_q19_3___1 > 1 then t1_q19_3___1=1;
if t1_q19_4___1 > 1 then t1_q19_4___1=1;
if t1_q19_5___1 > 1 then t1_q19_5___1=1;
if t1_q19_6___1 > 1 then t1_q19_6___1=1;
if t1_q19_7___1 > 1 then t1_q19_7___1=1;
run;

data work.q1_REDCap_2020; set work.q1_REDCap_2020;
if t1_q6i=9 then t1_q6i=-3;
if t1_q7=9 then t1_q7=-3; run;

/*Finalize order*/
data work.q1_REDCap_2020_1;
format
study_id
subject_id
center
t1_site
t1_q46_dob
age_months
age_yrs
t1_q48_race
t1_q47_ethnic
t1_sysid
t1_userid
t1_qversion
t1_qversionnumber
t1_today_dt
t1_paperdt
t1_paperusername
t1_time_stamp
t1_time_started
t1_time_started_raw
t1_time_end_raw
dropped
t1_bypassed
t1_pageno
t1_last_page
t1_page_0
t1_page_1
t1_page_2
t1_page_3
t1_page_4
t1_page_5
t1_page_6
t1_page_7
t1_page_8
t1_page_9
t1_page_10
t1_page_11
t1_complete
t1_paperyn
t1_q4
t1_q5_lmp
t1_q5_dk
t1_q5_ns
t1_q1_wks
t1_q1_days
t1_q1_dk
t1_q2_ht_cm
t1_q2_ht_ft
t1_q2_ht_in
t1_q2_wt_kg
t1_q2_wt_lbs
t1_q3_wt_lbs
t1_q3_wt_kg
t1_q1_wks_recode
t1_q2_ht_in_recode
t1_q2_wt_lbs_recode
t1_q3_wt_lbs_recode
t1_mombmi_derived
t1_q6a
t1_q6a1_a_yn
t1_q6a1_a_otc
t1_q6a1_a_script
t1_q6a1_b_yn
t1_q6a1_b_otc
t1_q6a1_b_script
t1_q6a1_c_yn
t1_q6a1_c_otc
t1_q6a1_c_script
t1_q6a1_d_yn
t1_q6a1_d_otc
t1_q6a1_d_script
t1_q6a1_e_yn
t1_q6a1_e_otc
t1_q6a1_e_script
t1_q6a1_f_yn
t1_q6a1_f_otc
t1_q6a1_f_script
t1_q6a1_g_yn
t1_q6a1_g_otc
t1_q6a1_g_script
t1_q6a1_h_yn
t1_q6a1_h_otc
t1_q6a1_h_script
t1_q6a1_i_yn
t1_q6a1_i_otc
t1_q6a1_i_script
t1_q6a1_j_yn
t1_q6a1_j_otc
t1_q6a1_j_script
t1_q6a1_k_yn
t1_q6a1_k_otc
t1_q6a1_k_script
t1_q6a1_l_yn
t1_q6a1_l_otc
t1_q6a1_l_script
t1_q6a1_m_yn
t1_q6a1_m_otc
t1_q6a1_m_script
t1_q6a1_n_yn
t1_q6a1_n_script
t1_q6a1_n_otc
t1_q6a1_o_yn
t1_q6a1_o_otc
t1_q6a1_o_script
t1_q6b
t1_q6b1
t1_q6c
t1_q6c_a_yn
t1_q6c_a_form
t1_q6c_b_yn
t1_q6c_b_form
t1_q6c_c_yn
t1_q6c_c_form
t1_q6c_d_yn
t1_q6c_d_form
t1_q6c_e_yn
t1_q6c_e_form
t1_q6c_f_yn
t1_q6c_f_form
t1_q6c_g_yn
t1_q6c_g_form
t1_q6c_h_yn
t1_q6c_h_form
t1_q6c_i_yn
t1_q6c_i_form
t1_q6c_j_yn
t1_q6c_j_form
t1_q6c_k_yn
t1_q6c_k_form
t1_q6c_l_yn
t1_q6c_l_form
t1_q6c_m_yn
t1_q6c_m_form
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
t1_q22
t1_q23
t1_q24
t1_q25a
t1_q25b
t1_q25c
t1_q26a
t1_q26b
t1_q26c
t1_q26d
t1_q26e
t1_q26f
t1_q26g
t1_q26h
t1_q26i
t1_q26i_outlier
t1_q27
t1_q27_outlier
t1_q27a
t1_q27a_outlier
t1_q28
t1_q28_outlier
t1_q29
t1_q30a_yn
t1_q30a_day
t1_q30a_week
t1_q30a_week_recode
t1_q30b_yn
t1_q30b_day
t1_q30b_week
t1_q30b_week_recode
t1_q30c_yn
t1_q30c_day
t1_q30c_week
t1_q30c_week_recode
t1_q30d_yn
t1_q30d_day
t1_q30d_week
t1_q30d_week_recode
t1_q30e_yn
t1_q30e_day
t1_q30e_week
t1_q30e_week_recode
t1_q30f_yn
t1_q30f_day
t1_q30f_week
t1_q30f_week_recode
t1_q30g_yn
t1_q30g_day
t1_q30g_week
t1_q30g_week_recode
t1_q30h_yn
t1_q30h_day
t1_q30h_week
t1_q30h_week_recode
t1_q30i_yn
t1_q30i_day
t1_q30i_week
t1_q30i_week_recode
t1_q30j_yn
t1_q30j_day
t1_q30j_week
t1_q30j_week_recode
t1_q31
t1_q32
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
t1_q43l_frag
t1_q43l_days
t1_q44a
t1_q44b
t1_q44c
t1_q44d
t1_q44e
t1_q44f
t1_q44g
t1_q44h
t1_q44i
t1_q44j
t1_q44k
t1_q45
t1_q45a
t1_q48a
t1_q48b
t1_q48c
t1_q48d
t1_q48e
t1_q48f
t1_q49
t1_q50
t1_q51
t1_q52
t1_q53
studyid
id_num
_complete
;
set work.q1_REDCap_2020; run;

proc contents data=q1_REDCap_2020_1 order=varnum; run;

data work.q1_REDCap_2020_1; set work.q1_REDCap_2020_1;
format t1_q46_dob MMDDYY10. t1_today_dt MMDDYY10. t1_paperdt MMDDYY10.
t1_time_started hhmm.; run;

/*add to first_trimester_questionnaire to _complete*/
/*first successful import: 4/15/2020*/
/*re-imported 1/5/2021*/

/*1/24/2021  edit*/
/*fix q8/q8a and 9/9a*/
data  work.q1_REDCap_8_9; set work.q1_REDCap_2020;
keep study_id t1_q8 t1_q8a t1_q8a1
t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f
	  t1_q9b
t1_q10 t1_q11; run;

proc freq data=work.q1_REDCap_8_9;
table t1_q8 -- t1_q12; run; 

proc print data=work.q1_REDCap_8_9 noobs; 
var study_id t1_q8 t1_q8a t1_q8a1;
where t1_q8=0 and (t1_q8a > 0 or t1_q8a1=1); run;

	/*fix the n=1, 9002*/
	data work.q1_REDCap_8_9; set work.q1_REDCap_8_9;
	if study_id=9002 then t1_q8=1; run;
	
proc print data=work.q1_REDCap_8_9 noobs; 
var study_id t1_q8 t1_q8a t1_q8a1;
where t1_q8a=0 or t1_q8a=.; run;

/*most are t1_q8=0 AND t1_q8a=0*/
/*confirm*/
	proc print data=work.q1_REDCap_8_9 noobs; 
	var study_id t1_q8 t1_q8a t1_q8a1;
	where t1_q8=0 AND t1_q8a=0; run;

	data work.q1_REDCap_89_1; set work.q1_REDCap_8_9;
	if t1_q8=0 AND t1_q8a=0 then t1_q8a=.; run;

proc freq data=work.q1_REDCap_89_1;
table t1_q8 -- t1_q8a1; run;

/*still n=30 with t1_q8a=0*/
	proc print data=work.q1_REDCap_89_1 noobs; 
	var study_id t1_q8 t1_q8a t1_q8a1;
	where t1_q8a=0; run;

	/*Get the t1_q8=. and t1_q8a=0*/
	data work.q1_REDCap_89_2; set work.q1_REDCap_89_1;
	if t1_q8=. and t1_q8a=0 then t1_q8a=.; run;

proc freq data=work.q1_REDCap_89_2;
table t1_q8 -- t1_q8a1; run;
	/*still n+1 with t1_q8a=0*/
	proc print data=work.q1_REDCap_89_2 noobs; 
	var study_id t1_q8 t1_q8a t1_q8a1;
	where t1_q8a=0; run; /*8148, set t1_q8a to missing*/

	data work.q1_REDCap_89_2; set work.q1_REDCap_89_2;
	if study_id=8148 then t1_q8a=.; run;

proc freq data=work.q1_REDCap_89_2;
table t1_q8 -- t1_q8a1/missing; run; /*n=723 for 0/. between t1_q8 and t1_q8a 
								       because of 8148*/

proc freq data=work.q1_REDCap_89_2;
table t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f
	  t1_q9b; run;

	  proc print data=work.q1_REDCap_89_2 noobs;
	  var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f;
	  where t1_q9=0; run; /*create new code for t1_q9a_yn, -3 did not specify*/

	  proc print data=work.q1_REDCap_89_2 noobs;
	  var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f;
	  where t1_q9=0 and t1_q9a_yn=.; run; /*n=45*/

data work.q1_REDCap_89_3; set work.q1_REDCap_89_2;
if t1_q9=0 and t1_q9a_yn=. then t1_q9a_yn=-3; run; 

proc freq data=work.q1_REDCap_89_3;
table t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f
	  t1_q9b; run;

	  proc print data=work.q1_REDCap_89_3 noobs;
	  var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f;
	  where t1_q9=1 and t1_q9a_yn=0; run; /*there ppt should have skipped to 9b, set to missing*/

	  data work.q1_REDCap_89_4; set work.q1_REDCap_89_3;
	  if  t1_q9=1 and t1_q9a_yn=0 then t1_q9a_yn=.; run;

proc freq data=work.q1_REDCap_89_4;
table t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f
	  t1_q9b; run; /*still +1*/

	  proc print data=work.q1_REDCap_89_4 noobs;
	  var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f;
	  where t1_q9 ne 0 and t1_q9a_yn ne .; run;

	  proc print data=work.q1_REDCap_89_4 noobs;
	  where study_id=8169; run; /*it's one ppt, will change t1_q9=0 to honor that they filled out 
	  							t1_q9a_yn and t1_q9a1_a*/
	  data work.q1_REDCap_89_4; set work.q1_REDCap_89_4;
	  if study_id=8169 then t1_q9=0; run; 

	  /*check to make sure those who said yes to t1_q9a1_a -- t1_q9a1_f
	    is reflected in t1_q9a_yn*/

	  proc print data=work.q1_REDCap_89_4 noobs;
	  var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f;
	  where t1_q9a_yn=1 and (t1_q9a1_a=. and
							 t1_q9a1_b=. and
							 t1_q9a1_c=. and
							 t1_q9a1_d=. and
							 t1_q9a1_e=. and
							 t1_q9a1_f=.); run; /*no obs*/
/*9b*/
proc freq data=work.q1_REDCap_89_4;
table t1_q9 t1_q9a_yn t1_q9b; run;
/*unclear why there are n=606 for t1_q9 and 712 t1_q9b=0*/

proc print data=work.q1_REDCap_89_4 noobs;
var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f t1_q9b;
where t1_q9 ne 1 and t1_q9b=0; run;

	/*if t1_q9 -- t1_q9a1_f missing then t1_q9b should be missing*/ 
	data work.q1_REDCap_89_5; set work.q1_REDCap_89_4;
	if t1_q9=. and t1_q9a_yn=. and t1_q9b=0 then t1_q9b=.; run;

proc freq data=work.q1_REDCap_89_5;
table t1_q9 t1_q9a_yn t1_q9b; run;


proc print data=work.q1_REDCap_89_5 noobs;
var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f t1_q9b;
where t1_q9=0 and t1_q9b=0; run; /*will set to missing*/

data work.q1_REDCap_89_6; set work.q1_REDCap_89_5;
if t1_q9=0 and t1_q9b=0 then t1_q9b=.; run;

proc freq data=work.q1_REDCap_89_6;
table t1_q9 t1_q9a_yn t1_q9b; run;

proc print data=work.q1_REDCap_89_6 noobs;
var study_id t1_q9 t1_q9a_yn t1_q9a1_a t1_q9a1_b t1_q9a1_c 
	  t1_q9a1_d t1_q9a1_e t1_q9a1_f t1_q9b;
where t1_q9=0 and t1_q9b ne .; run;
/*there are n=73 ppt who said that this pregnancy was unplanned,
some said that they were using contraceptives, but still provided 
an answer to t1_q9b, some greater than 1*/

/*reimport this section*/

