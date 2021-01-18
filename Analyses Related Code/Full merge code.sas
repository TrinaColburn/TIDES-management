/*NB prenatal stress analysis*/

libname nb 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB'; run;

/*pull additional variables from T2, T3, and ROOST*/
	/*Q2*/
		data nb.q2_2020; set q2.Q2_2020;
		keep study_id t2_q26 t2_q27 t2_q28 t2_q29 t2_q30 t2_q31
		t2_q32 t2_q33 t2_q34 t2_q35 t2_q36 t2_q37 t2_q38 t2_q39 
		t2_q40 t2_q41 t2_q42 t2_q43 t2_q44 t2_q45 t2_q46 t2_q47
		t2_q48 t2_q49 t2_q50 t2_q51 t2_q52; run;
	/*Q3*/
		data nb.q3_2020; set q3.q3_2020;
		keep study_id t3_q32 t3_q33 t3_q34 t3_q35 t3_q36
		t3_q37_yn t3_q37_t1 t3_q37_t2 t3_q37_t3
		t3_q38_yn t3_q38_t1 t3_q38_t2 t3_q38_t3
		t3_q39_yn t3_q39_t1 t3_q39_t2 t3_q39_t3
		t3_q40_yn t3_q40_t1 t3_q40_t2 t3_q40_t3
		t3_q41_yn t3_q41_t1 t3_q41_t2 t3_q41_t3
		t3_q42_yn t3_q42_t1 t3_q42_t2 t3_q42_t3
		t3_q42_specify; run;

	/*Roost -- parity and gravidity only*/
		data nb.roost_paragrav; set roost.Tides_compwideanalysis_20201119;
		keep study_id studyid record_id parity gravidity; run;

		data nb.roost_paragrav; set nb.roost_paragrav;
		if study_id=. and record_id=. then delete; run;

		proc contents data=nb.roost_paragrav order=varnum; run;

		data nb.roost_paragrav; set nb.roost_paragrav;
		rename study_id=subject_id; run;

		data nb.roost_paragrav; set nb.roost_paragrav;
		child_id=subject_id+1; run;

		data nb.roost_paragrav; set nb.roost_paragrav;
		rename studyid=study_id;run;
/***********done*******************/

/*Import REDCap data*/
/*TIDES I data*/
	%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\TIDESI-PrenatalStressAnalys_DATA_NOHDRS_2020-12-23_1836.csv';

	OPTIONS nofmterr;

	data nb.ps; %let _EFIERR_ = 0;
	infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

		informat study_id best8. ;
		informat redcap_event_name $500. ;
		informat subject_id best8. ;
		informat child_id best8. ;
		informat momage_yrs best32. ;
		informat gestage_birth_wks best32. ;
		informat child_sex best32. ;
		informat child_dob yymmdd10. ;

	input
		study_id
		redcap_event_name $
		subject_id 
		child_id 
		momage_yrs
		gestage_birth_wks
		child_sex
		child_dob
	;
	if _ERROR_ then call symput('_EFIERR_',"1"); run;

/*Birthweight only*/
	%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\TIDESI-BRRCopy_DATA_NOHDRS_2020-12-23_1409.csv';
	OPTIONS nofmterr;

	data nb.bw; %let _EFIERR_ = 0;
	infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

		informat study_id best8. ;
		informat redcap_event_name $500. ;
		informat birthweight_kg best32. ;

	input
		study_id 
		redcap_event_name $
		birthweight_kg
	;
	if _ERROR_ then call symput('_EFIERR_',"1"); run;

/*Household income only*/
	%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\TIDESI-HouseholdIncome_DATA_NOHDRS_2020-12-23_1407.csv';
	OPTIONS nofmterr;
	data nb.hi; %let _EFIERR_ = 0;
	infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

		informat study_id best8. ;
		informat redcap_event_name $500. ;
		informat t1_q51 best32. ;

		/*format study_id $500. ;
		format redcap_event_name $500. ;
		format t1_q51 best12. ;*/

	input
		study_id 
		redcap_event_name $
		t1_q51
	;
	if _ERROR_ then call symput('_EFIERR_',"1");
	run;

/*Age 4 all*/
	%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\TII4Master-NickisAnalysis_DATA_NOHDRS_2020-12-23_1813.csv';
		OPTIONS nofmterr;
		data nb.tii_4_; %let _EFIERR_ = 0;
		infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;
			informat child_id best32. ;
			informat study_id best32. ;
			informat subject_id best32. ;
			informat tii_4_child_dob yymmdd10. ;
			informat tii_4_date yymmdd10. ;
			informat tii_4_mom_edu best32. ;
			informat tii_4_cps_1 best32. ;
			informat tii_4_cps_2 best32. ;
			informat tii_4_cps_3 best32. ;
			informat tii_4_cps_4 best32. ;
			informat tii_4_cps_5 best32. ;
			informat tii_4_cps_6 best32. ;
			informat tii_4_cps_7 best32. ;
			informat tii_4_cps_8 best32. ;
			informat tii_4_cps_9 best32. ;
			informat tii_4_cps_10 best32. ;
			informat age4_pss_n best32. ;
			informat age4_pss_mean best32. ;
			informat age4_pss_sum $500. ;
			informat tii_4_phq9_1 best32. ;
			informat tii_4_phq9_2 best32. ;
			informat tii_4_phq9_3 best32. ;
			informat tii_4_phq9_4 best32. ;
			informat tii_4_phq9_5 best32. ;
			informat tii_4_phq9_6 best32. ;
			informat tii_4_phq9_7 best32. ;
			informat tii_4_phq9_8 best32. ;
			informat tii_4_phq9_9 best32. ;
			informat age4_phq_n best32. ;
			informat age4_phq_mean best32. ;
			informat age4_phq_sum best32. ;
			informat age4_phq_severity best32. ;
			informat basc_id $500. ;
			informat basc_date yymmdd10. ;
			informat basc_sex best32. ;
			informat basc_dob yymmdd10. ;
			informat basc_ext_raw best32. ;
			informat basc_ext_t best32. ;
			informat basc_ext_pct best32. ;
			informat basc_int_raw best32. ;
			informat basc_int_t best32. ;
			informat basc_int_pct best32. ;
			informat basc_bsi_raw best32. ;
			informat basc_bsi_t best32. ;
			informat basc_bsi_pct best32. ;
			informat basc_ads_raw best32. ;
			informat basc_ads_t best32. ;
			informat basc_ads_pct best32. ;
			informat basc_hyp_raw best32. ;
			informat basc_hyp_t best32. ;
			informat basc_hyp_pct best32. ;
			informat basc_agg_raw best32. ;
			informat basc_agg_t best32. ;
			informat basc_agg_pct best32. ;
			informat basc_anx_raw best32. ;
			informat basc_anx_t best32. ;
			informat basc_anx_pct best32. ;
			informat basc_dep_raw best32. ;
			informat basc_dep_t best32. ;
			informat basc_dep_pct best32. ;
			informat basc_som_raw best32. ;
			informat basc_som_t best32. ;
			informat basc_som_pct best32. ;
			informat basc_atp_raw best32. ;
			informat basc_atp_t best32. ;
			informat basc_atp_pct best32. ;
			informat basc_wth_raw best32. ;
			informat basc_wth_t best32. ;
			informat basc_wth_pct best32. ;
			informat basc_att_raw best32. ;
			informat basc_att_t best32. ;
			informat basc_att_pct best32. ;
			informat basc_adp_raw best32. ;
			informat basc_adp_t best32. ;
			informat basc_adp_pct best32. ;
			informat basc_soc_raw best32. ;
			informat basc_soc_t best32. ;
			informat basc_soc_pct best32. ;
			informat basc_act_raw best32. ;
			informat basc_act_t best32. ;
			informat basc_act_pct best32. ;
			informat basc_com_raw best32. ;
			informat basc_com_t best32. ;
			informat basc_com_pct best32. ;
			informat basc_complete best32. ;

		input
			child_id
			study_id
			subject_id
			tii_4_child_dob
			tii_4_date
			tii_4_mom_edu
			tii_4_cps_1
			tii_4_cps_2
			tii_4_cps_3
			tii_4_cps_4
			tii_4_cps_5
			tii_4_cps_6
			tii_4_cps_7
			tii_4_cps_8
			tii_4_cps_9
			tii_4_cps_10
			age4_pss_n
			age4_pss_mean
			age4_pss_sum $
			tii_4_phq9_1
			tii_4_phq9_2
			tii_4_phq9_3
			tii_4_phq9_4
			tii_4_phq9_5
			tii_4_phq9_6
			tii_4_phq9_7
			tii_4_phq9_8
			tii_4_phq9_9
			age4_phq_n
			age4_phq_mean
			age4_phq_sum
			age4_phq_severity
			basc_id $
			basc_date
			basc_sex
			basc_dob
			basc_ext_raw
			basc_ext_t
			basc_ext_pct
			basc_int_raw
			basc_int_t
			basc_int_pct
			basc_bsi_raw
			basc_bsi_t
			basc_bsi_pct
			basc_ads_raw
			basc_ads_t
			basc_ads_pct
			basc_hyp_raw
			basc_hyp_t
			basc_hyp_pct
			basc_agg_raw
			basc_agg_t
			basc_agg_pct
			basc_anx_raw
			basc_anx_t
			basc_anx_pct
			basc_dep_raw
			basc_dep_t
			basc_dep_pct
			basc_som_raw
			basc_som_t
			basc_som_pct
			basc_atp_raw
			basc_atp_t
			basc_atp_pct
			basc_wth_raw
			basc_wth_t
			basc_wth_pct
			basc_att_raw
			basc_att_t
			basc_att_pct
			basc_adp_raw
			basc_adp_t
			basc_adp_pct
			basc_soc_raw
			basc_soc_t
			basc_soc_pct
			basc_act_raw
			basc_act_t
			basc_act_pct
			basc_com_raw
			basc_com_t
			basc_com_pct
			basc_complete
		;
		if _ERROR_ then call symput('_EFIERR_',"1");
		run;


/*Smoking and Substance abuse*/
	/*Read-in first*/
	%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\TIDESI-SmokingEtOHSubstance_DATA_NOHDRS_2020-12-18_0837.csv';
	OPTIONS nofmterr;

		data nb.substance_use; %let _EFIERR_ = 0;
		infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;
			informat study_id best8. ;
			informat redcap_event_name $500. ;
			informat cigarettes_yn best32. ;
			informat cigarettes_recode best32. ;
			informat redwine_yn best32. ;
			informat redwine_recode best32. ;
			informat otherwine_yn best32. ;
			informat otherwine_recode best32. ;
			informat beer_yn best32. ;
			informat beer_recode best32. ;
			informat liquor_yn best32. ;
			informat liquor_recode best32. ;
			informat coffee_yn best32. ;
			informat coffee_recode best32. ;
			informat tea_yn best32. ;
			informat tea_recode best32. ;
			informat soda_yn best32. ;
			informat soda_recode best32. ;
			informat marijuana_yn best32. ;
			informat marijuana_recode best32. ;
			informat cocaine_yn best32. ;
			informat cocaine_recode best32. ;
			informat shs_hoursday best32. ;
			informat number_smokers best32. ;

		input
			study_id
			redcap_event_name $
			cigarettes_yn
			cigarettes_recode
			redwine_yn
			redwine_recode
			otherwine_yn
			otherwine_recode
			beer_yn
			beer_recode
			liquor_yn
			liquor_recode
			coffee_yn
			coffee_recode
			tea_yn
			tea_recode
			soda_yn
			soda_recode
			marijuana_yn
			marijuana_recode
			cocaine_yn
			cocaine_recode
			shs_hoursday
			number_smokers
		;
		if _ERROR_ then call symput('_EFIERR_',"1");
		run;

	/*Restructure repeated measures - simple (subset & prefix) method*/
		/*Subset by trimester observations*/
			data t1_Substance_use; set nb.Substance_use;
			if redcap_event_name="first_trimester_arm_1"; run;

			data t2_Substance_use; set nb.Substance_use;
			if redcap_event_name="second_trimester_arm_1"; run;

			data t3_Substance_use; set nb.Substance_use;
			if redcap_event_name="third_trimester_arm_1"; run;

		/*prefix with macro*/
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

			%addprefix(t1_Substance_use, T1_);
			%addprefix(t2_Substance_use, T2_);
			%addprefix(t3_Substance_use, T3_);

		data nb.t1_Substance_use_v2; set t1_Substance_use;
		drop t1_redcap_event_name;
		rename t1_study_id=study_id; run;

		data nb.t2_Substance_use_v2; set t2_Substance_use;
		drop t2_redcap_event_name;
		rename t2_study_id=study_id; run;

		data nb.t3_Substance_use_v2; set t3_Substance_use;
		drop t3_redcap_event_name;
		rename t3_study_id=study_id; run;

	/*Alternate (retain) method - not recommended unless for a few variables*/
		/*Restructure*/
			/*Many to one*/
			proc sort data=nb.substance_use; by study_id redcap_event_name; run;

			proc contents data=nb.substance_use out=subs_vars(keep=name VARNUM) order=varnum; run;

			proc sort data=subs_vars; by varnum; run;

			/*First, sort data*/
			proc sort data=nb.substance_use; 
			by study_id redcap_event_name; run;

			/*Next...reshape*/
			data nb.substance_use_1; /*New dataset*/
			set nb.substance_use; /*Old dataset*/
			by study_id;
				keep study_id
				/*create new variables by trimester based off old ones*/
					/*First trimester variables*/
					t1_cigarettes_yn	t1_cigarettes_recode	t1_redwine_yn	t1_redwine_recode	t1_otherwine_yn	t1_otherwine_recode	
					t1_beer_yn	t1_beer_recode	t1_liquor_yn	t1_liquor_recode	t1_coffee_yn	t1_coffee_recode	t1_tea_yn	t1_tea_recode	
					t1_soda_yn	t1_soda_recode	t1_marijuana_yn	t1_marijuana_recode	t1_cocaine_yn	t1_cocaine_recode	
					t1_shs_hoursday t1_number_smokers

					/*Second trimester variables*/
					t2_cigarettes_yn	t2_cigarettes_recode	t2_redwine_yn	t2_redwine_recode	t2_otherwine_yn	t2_otherwine_recode	
					t2_beer_yn	t2_beer_recode	t2_liquor_yn	t2_liquor_recode	t2_coffee_yn	t2_coffee_recode	t2_tea_yn	t2_tea_recode	
					t2_soda_yn	t2_soda_recode	t2_marijuana_yn	t2_marijuana_recode	t2_cocaine_yn	t2_cocaine_recode
					t2_shs_hoursday t2_number_smokers

					/*Third Trimester variables*/
					t3_cigarettes_yn	t3_cigarettes_recode	t3_redwine_yn	t3_redwine_recode	t3_otherwine_yn	
					t3_otherwine_recode	t3_beer_yn	t3_beer_recode	t3_liquor_yn	t3_liquor_recode	t3_coffee_yn	t3_coffee_recode	
					t3_tea_yn	t3_tea_recode	t3_soda_yn	t3_soda_recode	t3_marijuana_yn	t3_marijuana_recode	t3_cocaine_yn	t3_cocaine_recode 	
					t3_shs_hoursday t3_number_smokers; /*remember semi-colon*/

				retain /*keep the values (which are missing) of all the new variables*/
					/*First trimester variables*/
					t1_cigarettes_yn	t1_cigarettes_recode	t1_redwine_yn	t1_redwine_recode	t1_otherwine_yn	t1_otherwine_recode	
					t1_beer_yn	t1_beer_recode	t1_liquor_yn	t1_liquor_recode	t1_coffee_yn	t1_coffee_recode	t1_tea_yn	t1_tea_recode	
					t1_soda_yn	t1_soda_recode	t1_marijuana_yn	t1_marijuana_recode	t1_cocaine_yn	t1_cocaine_recode
					t1_shs_hoursday t1_number_smokers	

					/*Second trimester variables*/
					t2_cigarettes_yn	t2_cigarettes_recode	t2_redwine_yn	t2_redwine_recode	t2_otherwine_yn	t2_otherwine_recode	
					t2_beer_yn	t2_beer_recode	t2_liquor_yn	t2_liquor_recode	t2_coffee_yn	t2_coffee_recode	t2_tea_yn	t2_tea_recode	
					t2_soda_yn	t2_soda_recode	t2_marijuana_yn	t2_marijuana_recode	t2_cocaine_yn	t2_cocaine_recode
					t2_shs_hoursday t2_number_smokers	

					/*Third Trimester variables*/
					t3_cigarettes_yn	t3_cigarettes_recode	t3_redwine_yn	t3_redwine_recode	t3_otherwine_yn	
					t3_otherwine_recode	t3_beer_yn	t3_beer_recode	t3_liquor_yn	t3_liquor_recode	t3_coffee_yn	t3_coffee_recode	
					t3_tea_yn	t3_tea_recode	t3_soda_yn	t3_soda_recode	t3_marijuana_yn	t3_marijuana_recode	t3_cocaine_yn	t3_cocaine_recode
					t3_shs_hoursday t3_number_smokers;

				/*define array of twenty variables by trimester*/ 
				array one[20] t1_cigarettes_yn -- t1_cocaine_recode;
				array two[20] t2_cigarettes_yn -- t2_cocaine_recode;
				array three[20] t3_cigarettes_yn -- t3_cocaine_recode;

				/*Do-loop to set new dataset nb.substance_use_1 to all missing*/
				if first.study_id then do;
					do i=1 to 20;
					one(i)=.;
					two(i)=.;
					three(i)=.;
					end;
				end;

				/*Now fill in with data by event*/
				select(redcap_event_name);
						when("first_trimester_arm_1") do;
							t1_cigarettes_yn	=	cigarettes_yn	;
							t1_cigarettes_recode	=	cigarettes_recode	;
							t1_redwine_yn	=	redwine_yn	;
							t1_redwine_recode	=	redwine_recode	;
							t1_otherwine_yn	=	otherwine_yn	;
							t1_otherwine_recode	=	otherwine_recode	;
							t1_beer_yn	=	beer_yn	;
							t1_beer_recode	=	beer_recode	;
							t1_liquor_yn	=	liquor_yn	;
							t1_liquor_recode	=	liquor_recode	;
							t1_coffee_yn	=	coffee_yn	;
							t1_coffee_recode	=	coffee_recode	;
							t1_tea_yn	=	tea_yn	;
							t1_tea_recode	=	tea_recode	;
							t1_soda_yn	=	soda_yn	;
							t1_soda_recode	=	soda_recode	;
							t1_marijuana_yn	=	marijuana_yn	;
							t1_marijuana_recode	=	marijuana_recode	;
							t1_cocaine_yn	=	cocaine_yn	;
							t1_cocaine_recode	=	cocaine_recode	;
							t1_shs_hoursday	=	shs_hoursday	;
							t1_number_smokers	=	number_smokers	; 
						end;
						when("second_trimester_arm_1") do;
							t2_cigarettes_yn	=	cigarettes_yn	;
							t2_cigarettes_recode	=	cigarettes_recode	;
							t2_redwine_yn	=	redwine_yn	;
							t2_redwine_recode	=	redwine_recode	;
							t2_otherwine_yn	=	otherwine_yn	;
							t2_otherwine_recode	=	otherwine_recode	;
							t2_beer_yn	=	beer_yn	;
							t2_beer_recode	=	beer_recode	;
							t2_liquor_yn	=	liquor_yn	;
							t2_liquor_recode	=	liquor_recode	;
							t2_coffee_yn	=	coffee_yn	;
							t2_coffee_recode	=	coffee_recode	;
							t2_tea_yn	=	tea_yn	;
							t2_tea_recode	=	tea_recode	;
							t2_soda_yn	=	soda_yn	;
							t2_soda_recode	=	soda_recode	;
							t2_marijuana_yn	=	marijuana_yn	;
							t2_marijuana_recode	=	marijuana_recode	;
							t2_cocaine_yn	=	cocaine_yn	;
							t2_cocaine_recode	=	cocaine_recode	;
							t2_shs_hoursday	=	shs_hoursday	;
							t2_number_smokers	=	number_smokers	; 
						end;
						when ("third_trimester_arm_1") do;
							t3_cigarettes_yn	=	cigarettes_yn	;
							t3_cigarettes_recode	=	cigarettes_recode	;
							t3_redwine_yn	=	redwine_yn	;
							t3_redwine_recode	=	redwine_recode	;
							t3_otherwine_yn	=	otherwine_yn	;
							t3_otherwine_recode	=	otherwine_recode	;
							t3_beer_yn	=	beer_yn	;
							t3_beer_recode	=	beer_recode	;
							t3_liquor_yn	=	liquor_yn	;
							t3_liquor_recode	=	liquor_recode	;
							t3_coffee_yn	=	coffee_yn	;
							t3_coffee_recode	=	coffee_recode	;
							t3_tea_yn	=	tea_yn	;
							t3_tea_recode	=	tea_recode	;
							t3_soda_yn	=	soda_yn	;
							t3_soda_recode	=	soda_recode	;
							t3_marijuana_yn	=	marijuana_yn	;
							t3_marijuana_recode	=	marijuana_recode	;
							t3_cocaine_yn	=	cocaine_yn	;
							t3_cocaine_recode	=	cocaine_recode	;
							t3_shs_hoursday	=	shs_hoursday	;
							t3_number_smokers	=	number_smokers	; 
						end;
					end;
				if last.study_id then output; run;

					/*Same results for equal var*/
					proc compare base=nb.substance_use_1 compare=nb.T1_substance_use_v2 briefsummary; by study_id; run;
					proc compare base=nb.substance_use_1 compare=nb.T2_substance_use_v2 briefsummary; by study_id; run;
					proc compare base=nb.substance_use_1 compare=nb.T3_substance_use_v2 briefsummary; by study_id; run;


/*Minor editing, e.g. remove redcap event name from REDCap data, 
					  add child_id to q2, q3, and roost,
					  create child age vars*/
		data nb.bw; set nb.bw; /*i know i'm overwriting here but it's one variable*/
		drop redcap_event_name; run;

		data nb.ps; set nb.ps;
		drop redcap_event_name; run;
		
		data nb.hi; set nb.hi;
		drop redcap_event_name; run;

		data nb.roost_paragrav; set nb.roost_paragrav;
		drop record_id subject_id child_id; run;

/*Sort all the data to be merged*/
		proc sort data=nb.ps; by study_id; run; /*TIDES I: id vars, maternal age, gest age, child sex,*/
		proc sort data=nb.bw; by study_id; run; /*BW only*/
		proc sort data=nb.hi; by study_id; run; /*Income only*/
		proc sort data=nb.T1_substance_use_v2; by study_id; run; /*Q1 substance use*/
		proc sort data=nb.roost_paragrav; by study_id; run; /*Parity and Gravidity temporary from ROOST*/
		proc sort data=nb.q2_2020; by study_id; run; /*Q2 Vars*/
		proc sort data=nb.T2_substance_use_v2; by study_id; run;/*Q2 substance use*/
		proc sort data=nb.q3_2020; by study_id; run;/*Q3 Vars -- SS and SLE*/
		proc sort data=nb.T3_substance_use_v2; by study_id; run;/*Q3 substance use*/
		proc sort data=nb.tii_4_; by study_id; run;/*Age 4 data*/
			

data nb.stress_basc_analysis; merge nb.ps(in=a) /*ensures those with live births*/
				  					nb.bw nb.hi nb.T1_substance_use_v2 nb.roost_paragrav 
									nb.q2_2020 nb.T2_substance_use_v2 
									nb.q3_2020 nb.T3_substance_use_v2 
									nb.tii_4_; 
if a=1;
by study_id; run; /*n=807, +1 from twin*/

/*Edits and QC to the whole dataset*/
	proc contents data=nb.stress_basc_analysis order=varnum; run;


	data nb.stress_basc_analysis; set nb.stress_basc_analysis;
	format child_dob mmddyy10.;
	format tii_4_date  mmddyy10.;
	format tii_4_child_dob mmddyy.;
	format basc_date  mmddyy10.; 
	format basc_dob mmddyy10.; run; 

	data nb.stress_basc_analysis; set nb.stress_basc_analysis;
	drop tii_4_child_dob basc_dob basc_id; run;

data nb.stress_basc_analysis; set nb.stress_basc_analysis;
tii_4_childage_pvq=int(intck('MONTH', child_dob, tii_4_date)/12); /*Int/intck method apparently a bit more accurate than yrdif, will use this*/
	IF MONTH(CHILD_DOB)=MONTH(tii_4_date) THEN tii_4_childage_pvq= tii_4_childage_pvq - (day(child_dob)>day(tii_4_date)); run;

data nb.stress_basc_analysis; set nb.stress_basc_analysis;
tii_4_childage_basc=int(intck('MONTH', child_dob, basc_date)/12);
	IF MONTH(CHILD_DOB)=MONTH(basc_date) THEN tii_4_childage_pvq= tii_4_childage_pvq - (day(child_dob)>day(basc_date)); run;

	/*check frequencies*/
	proc freq data=nb.stress_basc_analysis;
	table tii_4_childage_pvq tii_4_childage_basc; run;
	/*makes sense-ish, one child 6*/

/*Housekeeping for twin and ppt who withdrew*/
	/*twins*/
	proc print data=nb.stress_basc_analysis;
	var study_id child_id basc_ext_raw -- basc_hyp_pct;
	where study_id=7074; run; /*verify in redcap nd different, which it is*/
	/*7047 withdrew, so drop*/
	data nb.stress_basc_analysis; set nb.stress_basc_analysis;
	if study_id=7047 then delete; run;

/*drop percentiles*/
data nb.stress_basc_analysis; set nb.stress_basc_analysis;
drop basc_ext_pct
basc_int_pct
basc_bsi_pct
basc_ads_pct
basc_hyp_pct
basc_agg_pct
basc_anx_pct
basc_dep_pct
basc_som_pct
basc_atp_pct
basc_wth_pct
basc_att_pct
basc_adp_pct
basc_soc_pct
basc_act_pct
basc_com_pct basc_complete; run;

proc contents data=nb.stress_basc_analysis order=varnum; run;


/*export code*/
PROC EXPORT DATA= NB.Stress_basc_analysis 
            OUTFILE= "J:\PM\TIDES_Data\RESEARCH\Output data for analyses
\prenatal stress_NB\prenatal stress_basc.csv" 
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;

