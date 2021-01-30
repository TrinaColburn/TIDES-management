
/*ROOST Final*/
libname roost "J:\PM\TIDES_Data\TIDES I Data\ROOST\Jan 2021"; run;
Options nofmterr; 

/*Subset for PATHWAYS/NYU*/
/*Keep only ROOST specific variables and variables derived from ROOST*/

	data roost.tides_roost; set roost.tides_compwideanalysis_20210114;
	keep studyid
	study_id
	record_id
	redcap_data_access_group
	abstract_init
	abstract_start
	bp_date_v1
	bp_date_v1_ga
	sbp_v1
	dbp_v1
	weight_kg_v1
	weight_lb_v1
	bp_date_v2
	bp_date_v2_ga
	sbp_v2
	dbp_v2
	weight_kg_v2
	weight_lb_v2
	bp_date_v3
	bp_date_v3_ga
	sbp_v3
	dbp_v3
	weight_kg_v3
	weight_lb_v3
	bp_notes
	comp_icd9_640
	comp_icd9_641
	comp_icd9_642
	comp_icd9_642_1
	comp_icd9_642_2
	comp_icd9_642_3
	comp_icd9_642_4
	comp_icd9_642_5
	comp_icd9_642_6
	comp_icd9_642_7
	comp_icd9_643
	comp_icd9_644
	comp_icd9_645
	comp_icd9_646
	comp_icd9_647
	comp_icd9_648
	comp_icd9_649
	comp_icd9_640_dt
	comp_icd9_640_dt_ga
	comp_icd9_641_dt
	comp_icd9_641_dt_ga
	comp_icd9_642_dt
	comp_icd9_642_dt_ga
	comp_icd9_642_1_dt
	comp_icd9_642_1_dt_ga
	comp_icd9_642_2_dt
	comp_icd9_642_2_dt_ga
	comp_icd9_642_3_dt
	comp_icd9_642_3_dt_ga
	comp_icd9_642_4_dt
	comp_icd9_642_4_dt_ga
	comp_icd9_642_5_dt
	comp_icd9_642_5_dt_ga
	comp_icd9_642_6_dt
	comp_icd9_642_6_dt_ga
	comp_icd9_642_7_dt
	comp_icd9_642_7_dt_ga
	comp_icd9_643_dt
	comp_icd9_643_dt_ga
	comp_icd9_644_dt
	comp_icd9_644_dt_ga
	comp_icd9_645_dt
	comp_icd9_645_dt_ga
	comp_icd9_646_dt
	comp_icd9_646_dt_ga
	comp_icd9_647_dt
	comp_icd9_647_dt_ga
	comp_icd9_648_dt
	comp_icd9_648_dt_ga
	comp_icd9_649_dt
	comp_icd9_649_dt_ga
	comp_icd10_o10
	comp_icd10_o11
	comp_icd10_o12
	comp_icd10_o13
	comp_icd10_o14
	comp_icd10_o15
	comp_icd10_o16
	comp_icd10_o20
	comp_icd10_o21
	comp_icd10_o22
	comp_icd10_o23
	comp_icd10_o24
	comp_icd10_o25
	comp_icd10_o32
	comp_icd10_o33
	comp_icd10_o36
	comp_icd10_o40
	comp_icd10_o41
	comp_icd10_o42
	comp_icd10_o43
	comp_icd10_o44
	comp_icd10_o45
	comp_icd10_o46
	comp_icd10_o47
	comp_icd10_o48
	comp_icd10_o10_dt
	comp_icd10_o10_dt_ga
	comp_icd10_o11_dt
	comp_icd10_o11_dt_ga
	comp_icd10_o12_dt
	comp_icd10_o12_dt_ga
	comp_icd10_o13_dt
	comp_icd10_o13_dt_ga
	comp_icd10_o14_dt
	comp_icd10_o14_dt_ga
	comp_icd10_o15_dt
	comp_icd10_o15_dt_ga
	comp_icd10_o16_dt
	comp_icd10_o16_dt_ga
	comp_icd10_o20_dt
	comp_icd10_o20_dt_ga
	comp_icd10_o21_dt
	comp_icd10_o21_dt_ga
	comp_icd10_o22_dt
	comp_icd10_o22_dt_ga
	comp_icd10_o23_dt
	comp_icd10_o23_dt_ga
	comp_icd10_o24_dt
	comp_icd10_o24_dt_ga
	comp_icd10_o25_dt
	comp_icd10_o25_dt_ga
	comp_icd10_o32_dt
	comp_icd10_o32_dt_ga
	comp_icd10_o33_dt
	comp_icd10_o33_dt_ga
	comp_icd10_o36_dt
	comp_icd10_o36_dt_ga
	comp_icd10_o40_dt
	comp_icd10_o40_dt_ga
	comp_icd10_o41_dt
	comp_icd10_o41_dt_ga
	comp_icd10_o42_dt
	comp_icd10_o42_dt_ga
	comp_icd10_o43_dt
	comp_icd10_o43_dt_ga
	comp_icd10_o44_dt
	comp_icd10_o44_dt_ga
	comp_icd10_o45_dt
	comp_icd10_o45_dt_ga
	comp_icd10_o46_dt
	comp_icd10_o46_dt_ga
	comp_icd10_o47_dt
	comp_icd10_o47_dt_ga
	comp_icd10_o48_dt
	comp_icd10_o48_dt_ga
	comp_notes
	chronic_pain
	endometriosis
	chronic_tension_headache
	migraine
	tmj_disorder
	lumbago
	vulvar_vestibulitis
	unspec_vulvodynia
	oth_vulvodynia
	fibromyalgia
	dysmenorrhea
	ibs
	interstitial_cystitis
	chronic_pain_notes
	us_crl_date
	us_crl_date_ga
	us_crl
	us_crl_notes
	us_1_date
	us_1_date_ga
	us_1_ad
	us_1_bpd
	us_1_hc
	us_1_ac
	us_1_fl
	us_1_ofd
	us_1_efw
	us_1_mat_weight
	us_1_mat_weight_lb
	us_1_cvl
	us_1_cvl_cm
	us_1_plac_pos
	us_1_uta_sbp
	us_1_uta_dbp
	us_1_uta_pi
	us_1_uma_sbp
	us_1_uma_dbp
	us_1_uma_pi
	us_1_notch
	us_1_notes
	us_2_date
	us_2_date_ga
	us_2_ad
	us_2_bpd
	us_2_hc
	us_2_ac
	us_2_fl
	us_2_ofd
	us_2_efw
	us_2_mat_weight
	us_2_mat_weight_lb
	us_2_cvl
	us_2_cvl_cm
	us_2_plac_pos
	us_2_uta_sbp
	us_2_uta_dbp
	us_2_uta_pi
	us_2_uma_sbp
	us_2_uma_dbp
	us_2_uma_pi
	us_2_notch
	us_2_notes
	us_3_date
	us_3_date_ga
	us_3_ad
	us_3_bpd
	us_3_hc
	us_3_ac
	us_3_fl
	us_3_ofd
	us_3_efw
	us_3_mat_weight
	us_3_mat_weight_lb
	us_3_cvl
	us_3_cvl_cm
	us_3_plac_pos
	us_3_uta_sbp
	us_3_uta_dbp
	us_3_uta_pi
	us_3_uma_sbp
	us_3_uma_dbp
	us_3_uma_pi
	us_3_notch
	us_3_notes
	us_4_date
	us_4_date_ga
	us_4_ad
	us_4_bpd
	us_4_hc
	us_4_ac
	us_4_fl
	us_4_ofd
	us_4_efw
	us_4_mat_weight
	us_4_mat_weight_lb
	us_4_cvl
	us_4_cvl_cm
	us_4_plac_pos
	us_4_uta_sbp
	us_4_uta_dbp
	us_4_uta_pi
	us_4_uma_sbp
	us_4_uma_dbp
	us_4_uma_pi
	us_4_notch
	us_4_notes
	us_5_date
	us_5_date_ga
	us_5_ad
	us_5_bpd
	us_5_hc
	us_5_ac
	us_5_fl
	us_5_ofd
	us_5_efw
	us_5_mat_weight
	us_5_mat_weight_lb
	us_5_cvl
	us_5_cvl_cm
	us_5_plac_pos
	us_5_uta_sbp
	us_5_uta_dbp
	us_5_uta_pi
	us_5_uma_sbp
	us_5_uma_dbp
	us_5_uma_pi
	us_5_notch
	us_5_notes
	us_6_date
	us_6_date_ga
	us_6_ad
	us_6_bpd
	us_6_hc
	us_6_ac
	us_6_fl
	us_6_ofd
	us_6_efw
	us_6_mat_weight
	us_6_mat_weight_lb
	us_6_cvl
	us_6_cvl_cm
	us_6_plac_pos
	us_6_uta_sbp
	us_6_uta_dbp
	us_6_uta_pi
	us_6_uma_sbp
	us_6_uma_dbp
	us_6_uma_pi
	us_6_notch
	us_6_notes
	us_7_date
	us_7_date_ga
	us_7_ad
	us_7_bpd
	us_7_hc
	us_7_ac
	us_7_fl
	us_7_ofd
	us_7_efw
	us_7_mat_weight
	us_7_mat_weight_lb
	us_7_cvl
	us_7_cvl_cm
	us_7_plac_pos
	us_7_uta_sbp
	us_7_uta_dbp
	us_7_uta_pi
	us_7_uma_sbp
	us_7_uma_dbp
	us_7_uma_pi
	us_7_notch
	us_7_notes
	us_8_date
	us_8_date_ga
	us_8_ad
	us_8_bpd
	us_8_hc
	us_8_ac
	us_8_fl
	us_8_ofd
	us_8_efw
	us_8_mat_weight
	us_8_mat_weight_lb
	us_8_cvl
	us_8_cvl_cm
	us_8_plac_pos
	us_8_uta_sbp
	us_8_uta_dbp
	us_8_uta_pi
	us_8_uma_sbp
	us_8_uma_dbp
	us_8_uma_pi
	us_8_notch
	us_8_notes
	us_9_date
	us_9_date_ga
	us_9_ad
	us_9_bpd
	us_9_hc
	us_9_ac
	us_9_fl
	us_9_ofd
	us_9_efw
	us_9_mat_weight
	us_9_mat_weight_lb
	us_9_cvl
	us_9_cvl_cm
	us_9_plac_pos
	us_9_uta_sbp
	us_9_uta_dbp
	us_9_uta_pi
	us_9_uma_sbp
	us_9_uma_dbp
	us_9_uma_pi
	us_9_notch
	us_9_notes
	us_10_date
	us_10_date_ga
	us_10_ad
	us_10_bpd
	us_10_hc
	us_10_ac
	us_10_fl
	us_10_ofd
	us_10_efw
	us_10_mat_weight
	us_10_mat_weight_lb
	us_10_cvl
	us_10_cvl_cm
	us_10_plac_pos
	us_10_uta_sbp
	us_10_uta_dbp
	us_10_uta_pi
	us_10_uma_sbp
	us_10_uma_dbp
	us_10_uma_pi
	us_10_notch
	us_10_notes
	prev_diab_yn
	prev_diab_type
	gdm
	gdm_diag_date
	gdm_diag_date_ga
	gct_date
	gct_date_ga
	gct_1hr_g
	gtt_date
	gtt_date_ga
	gtt_fg
	gtt_1hr_g
	gtt_2hr_g
	gtt_3hr_g
	gdb_notes
	pe_yn
	pe_diag_date
	pe_diag_date_ga
	pe_notes
	ptl_yn
	ptl_dt
	ptl_dt_ga
	ptl_icd9_6440
	ptl_icd9_6441
	ptl_icd9_6442
	ptl_icd9_6440_dt
	ptl_icd9_6440_dt_ga
	ptl_icd9_6441_dt
	ptl_icd9_6441_dt_ga
	ptl_icd9_6442_dt
	ptl_icd9_6442_dt_ga
	ptl_icd10_o470
	ptl_icd10_o471
	ptl_icd10_o479
	ptl_icd10_o600
	ptl_icd10_o601
	ptl_icd10_o602
	ptl_icd10_o470_dt
	ptl_icd10_o470_dt_ga
	ptl_icd10_o471_dt
	ptl_icd10_o471_dt_ga
	ptl_icd10_o479_dt
	ptl_icd10_o479_dt_ga
	ptl_icd10_o600_dt
	ptl_icd10_o600_dt_ga
	ptl_icd10_o601_dt
	ptl_icd10_o601_dt_ga
	ptl_icd10_o602_dt
	ptl_icd10_o602_dt_ga
	ptl_notes
	hosp_pres_sponlabor
	hosp_pres_prom
	hosp_pres_ftlstatus
	hosp_pres_vagbleed
	hosp_pres_pe
	hosp_pres_postdue
	hosp_pres_scheddel
	hosp_pres
	hosp_reason_other
	sched_del_mode
	del_aug
	del_ind
	del_comp_icd9_660
	del_comp_icd9_661
	del_comp_icd9_662
	del_comp_icd9_663
	del_comp_icd9_664
	del_comp_icd9_665
	del_comp_icd9_666
	del_comp_icd9_667
	del_comp_icd9_668
	del_comp_icd9_669
	del_comp_icd10_O61
	del_comp_icd10_O62
	del_comp_icd10_O63
	del_comp_icd10_O64
	del_comp_icd10_O65
	del_comp_icd10_O66
	del_comp_icd10_O67
	del_comp_icd10_O68
	del_comp_icd10_O69
	del_comp_icd10_O70
	del_comp_icd10_O71
	del_comp_icd10_O72
	del_comp_icd10_O73
	del_comp_icd10_O74
	del_comp_icd10_O75
	del_notes
	del_mode
	schedc_reas_pe
	schedc_reas_iugr
	schedc_reas_priorcsec
	schedc_reas_priormyomectomy
	schedc_reas_breech
	schedc_reas_othmtrnl
	schedc_reas_othftl
	unschedc_reas_arrdilation
	unschedc_reas_arrdescent
	unschedc_reas_plac_abrup
	unschedc_reas_pe
	unschedc_reas_iugr
	unschedc_reas_oth
	csect_notes
	del_dt_time
	hosp_dt_time
	hosp_dt_time_ga
	birth_hc
	birth_length
	birth_notes
	plac_weight
	plac_trim
	plac_path
	notes_plac
	abstract_end
	tides_prenatal_recor_v_0
	preterm_abs
	preeclampsia
	pe_icd
	spon_pt
	plac_del
	plac_pt
	spon_labor
	sponlabor_dt
	sponlabor_dt_ga
	PROM
	prom_dt
	prom_dt_ga
	spon_prom
	del_dt_time_ga
	censor_sp
	censor_prom
	weight_v1
	weight_v2
	weight_v3
	us_1_efw_final
	us_2_efw_final
	us_3_efw_final
	us_4_efw_final
	us_5_efw_final
	us_6_efw_final
	us_7_efw_final
	us_8_efw_final
	us_9_efw_final
	us_1_ga_weeks_final
	us_2_ga_weeks_final
	us_3_ga_weeks_final
	us_4_ga_weeks_final
	us_5_ga_weeks_final
	us_6_ga_weeks_final
	us_7_ga_weeks_final
	us_8_ga_weeks_final
	us_9_ga_weeks_final; run;

options nofmterr;
/*drop ppt who didn't complete roost*/
	data roost.tides_roost_1; set roost.tides_roost;
	if study_id=. and record_id=. then delete;run; /*n=769*/

/*Use consent track list to create new deid variable*/
data  roost.tides_roost_pwnyu; set  roost.tides_roost_1;
	if studyid=9005 then newdeid=1;
	if studyid=9010 then newdeid=1;
	if studyid=9012 then newdeid=1;
	if studyid=9014 then newdeid=1;
	if studyid=9016 then newdeid=1;
	if studyid=9017 then newdeid=1;
	if studyid=9018 then newdeid=1;
	if studyid=9021 then newdeid=1;
	if studyid=9025 then newdeid=1;
	if studyid=9032 then newdeid=1;
	if studyid=9036 then newdeid=1;
	if studyid=9037 then newdeid=1;
	if studyid=9042 then newdeid=1;
	if studyid=9043 then newdeid=1;
	if studyid=9046 then newdeid=1;
	if studyid=9049 then newdeid=1;
	if studyid=9050 then newdeid=1;
	if studyid=9051 then newdeid=1;
	if studyid=9053 then newdeid=1;
	if studyid=9061 then newdeid=1;
	if studyid=9063 then newdeid=1;
	if studyid=9064 then newdeid=1;
	if studyid=9066 then newdeid=1;
	if studyid=9067 then newdeid=1;
	if studyid=9071 then newdeid=1;
	if studyid=9073 then newdeid=1;
	if studyid=9087 then newdeid=1;
	if studyid=9088 then newdeid=1;
	if studyid=9089 then newdeid=1;
	if studyid=9091 then newdeid=1;
	if studyid=9095 then newdeid=1;
	if studyid=9097 then newdeid=1;
	if studyid=9099 then newdeid=1;
	if studyid=9100 then newdeid=1;
	if studyid=9101 then newdeid=1;
	if studyid=9102 then newdeid=1;
	if studyid=9103 then newdeid=1;
	if studyid=9104 then newdeid=1;
	if studyid=9107 then newdeid=1;
	if studyid=9108 then newdeid=1;
	if studyid=9109 then newdeid=1;
	if studyid=9111 then newdeid=1;
	if studyid=9112 then newdeid=1;
	if studyid=9120 then newdeid=1;
	if studyid=9122 then newdeid=1;
	if studyid=9123 then newdeid=1;
	if studyid=9124 then newdeid=1;
	if studyid=9126 then newdeid=1;
	if studyid=9133 then newdeid=1;
	if studyid=9139 then newdeid=1;
	if studyid=9140 then newdeid=1;
	if studyid=9142 then newdeid=1;
	if studyid=9146 then newdeid=1;
	if studyid=9147 then newdeid=1;
	if studyid=9150 then newdeid=1;
	if studyid=9151 then newdeid=1;
	if studyid=9152 then newdeid=1;
	if studyid=9155 then newdeid=1;
	if studyid=9157 then newdeid=1;
	if studyid=9159 then newdeid=1;
	if studyid=9160 then newdeid=1;
	if studyid=9167 then newdeid=1;
	if studyid=9168 then newdeid=1;
	if studyid=9170 then newdeid=1;
	if studyid=9171 then newdeid=1;
	if studyid=9174 then newdeid=1;
	if studyid=9175 then newdeid=1;
	if studyid=9176 then newdeid=1;
	if studyid=9179 then newdeid=1;
	if studyid=9180 then newdeid=1;
	if studyid=9181 then newdeid=1;
	if studyid=9183 then newdeid=1;
	if studyid=9186 then newdeid=1;
	if studyid=9187 then newdeid=1;
	if studyid=9189 then newdeid=1;
	if studyid=9190 then newdeid=1;
	if studyid=9193 then newdeid=1;
	if studyid=9195 then newdeid=1;
	if studyid=9198 then newdeid=1;
	if studyid=9199 then newdeid=1;
	if studyid=9203 then newdeid=1;
	if studyid=9204 then newdeid=1;
	if studyid=9206 then newdeid=1;
	if studyid=9208 then newdeid=1;
	if studyid=9210 then newdeid=1;
	if studyid=9211 then newdeid=1; run;

proc freq data=roost.tides_roost_pwnyu;
table newdeid/missing; run;

/*Macro to set date variables to missing if ppt
needs to be de-identified*/
Options nofmterr; 
%macro deid(datevar);
data roost.tides_roost_pwnyu; set roost.tides_roost_pwnyu;
if newdeid=1 then &datevar=.; run;
%mend;
	%deid(bp_date_v1);
	%deid(bp_date_v2);
	%deid(bp_date_v3);
	%deid(comp_icd9_640_dt);
	%deid(comp_icd9_641_dt);
	%deid(comp_icd9_642_dt);
	%deid(comp_icd9_642_1_dt);
	%deid(comp_icd9_642_2_dt);
	%deid(comp_icd9_642_3_dt);
	%deid(comp_icd9_642_4_dt);
	%deid(comp_icd9_642_5_dt);
	%deid(comp_icd9_642_6_dt);
	%deid(comp_icd9_642_7_dt);
	%deid(comp_icd9_643_dt);
	%deid(comp_icd9_644_dt);
	%deid(comp_icd9_645_dt);
	%deid(comp_icd9_646_dt);
	%deid(comp_icd9_647_dt);
	%deid(comp_icd9_648_dt);
	%deid(comp_icd9_649_dt);
	%deid(comp_icd10_o10_dt);
	%deid(comp_icd10_o11_dt);
	%deid(comp_icd10_o12_dt);
	%deid(comp_icd10_o13_dt);
	%deid(comp_icd10_o14_dt);
	%deid(comp_icd10_o15_dt);
	%deid(comp_icd10_o16_dt);
	%deid(comp_icd10_o20_dt);
	%deid(comp_icd10_o21_dt);
	%deid(comp_icd10_o22_dt);
	%deid(comp_icd10_o23_dt);
	%deid(comp_icd10_o24_dt);
	%deid(comp_icd10_o25_dt);
	%deid(comp_icd10_o32_dt);
	%deid(comp_icd10_o33_dt);
	%deid(comp_icd10_o36_dt);
	%deid(comp_icd10_o40_dt);
	%deid(comp_icd10_o41_dt);
	%deid(comp_icd10_o42_dt);
	%deid(comp_icd10_o43_dt);
	%deid(comp_icd10_o44_dt);
	%deid(comp_icd10_o45_dt);
	%deid(comp_icd10_o46_dt);
	%deid(comp_icd10_o47_dt);
	%deid(comp_icd10_o48_dt);
	%deid(us_crl_date);
	%deid(us_1_date);
	%deid(us_2_date);
	%deid(us_3_date);
	%deid(us_4_date);
	%deid(us_5_date);
	%deid(us_6_date);
	%deid(us_7_date);
	%deid(us_8_date);
	%deid(us_9_date);
	%deid(us_10_date);
	%deid(gdm_diag_date);
	%deid(gct_date);
	%deid(gtt_date);
	%deid(pe_diag_date);
	%deid(ptl_dt);
	%deid(ptl_icd9_6440_dt);
	%deid(ptl_icd9_6441_dt);
	%deid(ptl_icd9_6442_dt);
	%deid(ptl_icd10_o470_dt);
	%deid(ptl_icd10_o471_dt);
	%deid(ptl_icd10_o479_dt);
	%deid(ptl_icd10_o600_dt);
	%deid(ptl_icd10_o601_dt);
	%deid(ptl_icd10_o602_dt);
	%deid(hosp_pres_postdue);
	%deid(del_dt_time);
	%deid(hosp_dt_time);
	%deid(prom_dt);
	%deid(sponlabor_dt);


/*Check if vars were deid'd for participants*/
proc freq data=roost.tides_roost_pwnyu;
table newdeid/missing; run;

%macro check(miss);
proc freq data=roost.tides_roost_pwnyu;
table &miss; where newdeid=1; run;
%mend;
%check(bp_date_v1);
%check(bp_date_v2);
%check(bp_date_v3);
%check(comp_icd9_640_dt);
%check(comp_icd9_641_dt);
%check(comp_icd9_642_dt);
%check(comp_icd9_642_1_dt);
%check(comp_icd9_642_2_dt);
%check(comp_icd9_642_3_dt);
%check(comp_icd9_642_4_dt);
%check(comp_icd9_642_5_dt);
%check(comp_icd9_642_6_dt);
%check(comp_icd9_642_7_dt);
%check(comp_icd9_643_dt);
%check(comp_icd9_644_dt);
%check(comp_icd9_645_dt);
%check(comp_icd9_646_dt);
%check(comp_icd9_647_dt);
%check(comp_icd9_648_dt);
%check(comp_icd9_649_dt);
%check(comp_icd10_o10_dt);
%check(comp_icd10_o11_dt);
%check(comp_icd10_o12_dt);
%check(comp_icd10_o13_dt);
%check(comp_icd10_o14_dt);
%check(comp_icd10_o15_dt);
%check(comp_icd10_o16_dt);
%check(comp_icd10_o20_dt);
%check(comp_icd10_o21_dt);
%check(comp_icd10_o22_dt);
%check(comp_icd10_o23_dt);
%check(comp_icd10_o24_dt);
%check(comp_icd10_o25_dt);
%check(comp_icd10_o32_dt);
%check(comp_icd10_o33_dt);
%check(comp_icd10_o36_dt);
%check(comp_icd10_o40_dt);
%check(comp_icd10_o41_dt);
%check(comp_icd10_o42_dt);
%check(comp_icd10_o43_dt);
%check(comp_icd10_o44_dt);
%check(comp_icd10_o45_dt);
%check(comp_icd10_o46_dt);
%check(comp_icd10_o47_dt);
%check(comp_icd10_o48_dt);
%check(us_crl_date);
%check(us_1_date);
%check(us_2_date);
%check(us_3_date);
%check(us_4_date);
%check(us_5_date);
%check(us_6_date);
%check(us_7_date);
%check(us_8_date);
%check(us_9_date);
%check(us_10_date);
%check(gdm_diag_date);
%check(gct_date);
%check(gtt_date);
%check(pe_diag_date);
%check(ptl_dt);
%check(ptl_icd9_6440_dt);
%check(ptl_icd9_6441_dt);
%check(ptl_icd9_6442_dt);
%check(ptl_icd10_o470_dt);
%check(ptl_icd10_o471_dt);
%check(ptl_icd10_o479_dt);
%check(ptl_icd10_o600_dt);
%check(ptl_icd10_o601_dt);
%check(ptl_icd10_o602_dt);
%check(hosp_pres_postdue);
%check(del_dt_time);
%check(hosp_dt_time);
%check(prom_dt);
%check(sponlabor_dt);
