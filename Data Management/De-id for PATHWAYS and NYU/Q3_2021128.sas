libname q3_pw "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q3"; run;
/* Edit the following line to reflect the full path to your CSV file */
%let q3_nonrep = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q3\TIDESI-ThirdTrimesterQuesti_DATA_NOHDRS_2021-01-28_0848.csv';

OPTIONS nofmterr;

data q3_pw.q3_norepeat; %let _EFIERR_ = 0;
infile &q3_nonrep  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;
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
	informat t3_q1_days $500. ;
	informat t3_q1_wks $500. ;
	informat t3_q1_wks_recode $500. ;
	informat t3_q2_wt_kg $500. ;
	informat t3_q2_wt_lbs $500. ;
	informat t3_q2_wt_lbs_recode $500. ;
	informat t3_q3_height_cm $500. ;
	informat t3_q3_height_ft $500. ;
	informat t3_q3_height_in $500. ;
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
	t3_q1_days $
	t3_q1_wks $
	t3_q1_wks_recode $
	t3_q2_wt_kg $
	t3_q2_wt_lbs $
	t3_q2_wt_lbs_recode $
	t3_q3_height_cm $
	t3_q3_height_ft $
	t3_q3_height_in $
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
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;


/* Edit the following line to reflect the full path to your CSV file */
%let q3_rep = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Q3\TIDESI-ThirdTrimesterQuesti_DATA_NOHDRS_2021-01-28_0849.csv';

OPTIONS nofmterr;

data q3_repeat; %let _EFIERR_ = 0;
infile &q3_rep  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

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

%addprefix(q3_repeat, T3_);
	/*rename study_id back to original*/
	data q3_pw.q3_repeat; set q3_repeat;
	rename t3_study_id=study_id; run;

proc sort data=q3_pw.q3_norepeat; by study_id; run;
proc sort data=q3_pw.q3_repeat; by study_id; run;

data q3_pw.q3_all; merge q3_pw.q3_norepeat q3_pw.q3_repeat; by study_id; run;
