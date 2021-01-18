/* THIS CODE DEFINES VARIABLE RESPONSES */

proc format;
    value cnt 
	            6='UCSF'
				7='UMN'
				8='URMC'
				9='UW'
				0='ALL';

	value Q3 
				1 = "Excellent"
				2 = "Very Good"
				3 = "Good"
				4 = "Fair"
				5 = "Poor";

	value Q4a
				0 = "No"
				1 = "Yes";
	
	value Q4a1_a_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_a_script
				0 = "No"
				1 = "Yes";

	value Q4a1_a_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_b_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_b_script
				0 = "No"
				1 = "Yes";

	value Q4a1_b_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_c_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_c_script
				0 = "No"
				1 = "Yes";

	value Q4a1_c_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_d_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_d_script
				0 = "No"
				1 = "Yes";

	value Q4a1_d_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_e_yn
				0 = "No"
				1 = "Yes";
	value Q4a1_e_script
				0 = "No"
				1 = "Yes";
	value Q4a1_e_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_f_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_f_script
				0 = "No"
				1 = "Yes";

	value Q4a1_f_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_g_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_g_script
				0 = "No"
				1 = "Yes";

	value Q4a1_g_otc
				0 = "No"
				1 = "Yes";
	value Q4a1_h_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_h_script
				0 = "No"
				1 = "Yes";

	value Q4a1_h_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_i_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_i_script
				0 = "No"
				1 = "Yes";

	value Q4a1_i_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_j_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_j_script
				0 = "No"
				1 = "Yes";

	value Q4a1_j_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_k_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_k_script
				0 = "No"
				1 = "Yes";

	value Q4a1_k_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_l_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_l_script
				0 = "No"
				1 = "Yes";

	value Q4a1_l_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_m_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_m_script
				0 = "No"
				1 = "Yes";

	value Q4a1_m_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_n_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_n_script
				0 = "No"
				1 = "Yes";

	value Q4a1_n_otc
				0 = "No"
				1 = "Yes";

	value Q4a1_o_yn
				0 = "No"
				1 = "Yes";

	value Q4a1_o_script
				0 = "No"
				1 = "Yes";

	value Q4a1_o_otc
				0 = "No"
				1 = "Yes";

	value Q4b_supp
				0 = "No"
				1 = "Yes";

	value Q4b_supp_form
				1 = "Pill/Tab"
				2 = "Capsule"
				3 = "Liquid"
				4 = "Other";

	value Q4d_yn
				0 = "No"
				1 = "Yes";

	value Q6_disease
				0 = "No"
				1 = "Yes";
	value Q7
				0 = "No"
				1 = "Yes";

	value Q8
				0 = "No"
				1 = "Yes";

	value Q9
				1 = "Very regular w/o birth control pills"
				2 = "Very regular only with birth control pills"
				3 = "Somewhat regular"
				4 = "Very irregular"
				5 = "Didn't usually have bleeding periods";

	value Q9a
				1 = "< 27 days"
				2 = "27-29 days"
				3 = "30-31 days"
				4 = "> 31 days";

	value Q10
				0 = "No"
				1 = "Yes";


	value Q11
				0 = "No"
				1 = "Yes, I have"
				2 = "Yes, my partner has"
				3 = "Yes, we both have";

	value Q11a
				0 = "No"
				1 = "Yes";

	value Q11b
				1 = "Donor Egg"
				2 = "Artificial Insemination/IVF"
				3 = "Fallopian tube surgery"
				4 = "Med for endometriosis"
				5 = "GIFT/ZIFT"
				6 = "Other Surgery"
				7 = "Hormone Treatment"
				8 = "Other";

	value Q12
				0 = "No"
				1 = "Yes";

	value Q12b_outcome
				1 = "Live birth"
				2= "Ecotopic"
				3 = "Induced abortion"
				4 = "Miscarriage"
				5 = "Still birth";
	
	value Q12b_tx_nof
				0 = "No"
				1 = "Yes";

	value Q12b_tx_insemf
				0 = "No"
				1 = "Yes";

	value Q12b_tx_ovInductf
				0 = "No"
				1 = "Yes";

	value Q12b_tx_eggDonationf
				0 = "No"
				1 = "Yes";

	value Q12b_tx_otherf
				0 = "No"
				1 = "Yes";

	value Q12b_1_sexf
				1 = "Male"
				2 = "Female";

	value Q14
				0 = "No"
				1 = "Yes";

	value Q14a_1
				. = "No"
				1 = "Yes";

	value Q15
				1 = "Always"
				2 = "Usually"
				3 = "Sometimes"
				4 = "Rarely"
				5 = "Never";

	value Q20
				0 = "No"
				1 = "Yes";

	value Q23
				0 = "No"
				1 = "Yes";

	value Q23a
				0 = "No"
				1 = "Yes";

	value Q23jobs_ynf
				0 = "No"
				1 = "Yes";

	value Q23b1
				1 = "None"
				2 = "< 2 hours"
				3 = "2 - 4 hours"
				4 = "4 - 6 hours"
				5 = "> 6 hours / most of day";

	value Q23b2
				1 = "Food service worker"
				2 = "Food processing";
	
	value Q23b4
				1 = "Direct patient care"
				2 = "Office admin"
				3 = "Research"
				4 = "Executive/management"
				5 = "Technician"
				6 = "Support services"
				7 = "Sales"
				8 = "Animal care"
				9 = "Other";

	value Q23c
				1 = "Day shift"
				2 = "Early evening (6pm - midnight)"
				3 = "Night shift (midnight - 6pm)"
				4 = "Regular rotating shift"
				5 = "Varied/Other";

	value Q23d
				1 = "Very stressful"
				2 = "Somewhat stressful"
				3 = "Not too stressful"
				4 = "Not at all stressful";

	value Q23f
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never";

	value Q24
				1 = "None"
				2 = "One or less"
				3 = "Two or less"
				4 = "More than two";

	value Q25
				1 = "1 or fewer per day"
				2 = "2-5 per day"
				3 = "5-10 per day"
				4 = "More than 10 per day";

	value Q26thru43items
	            0 = "Don't know"
				1 = "Almost Always"
				2 = "Often"
				3 = "Sometimes"
				4 = "Rarely"
				5 = "Never";

	value Q44thru52items
	            0 = "Don't know"
				1 = "Strongly agree"
				2 = "Somewhat agree"
				3 = "Undecided"
				4 = "Somewhat disagree"
				5 = "Strongly disagree";

	value Q53
				0 = "No"
				1 = "Yes";

	value Q53a
	            . = "Missing"
				1 = "Got married"
				2 = "Now living as married"
				3 = "Now separated"
				4 = "Got divorced"
				5 = "Now widowed"
				6 = "Now single";

	value Q53b
				1 = "All of the time"
				2 = "Most of the time"
				3 = "Some of the time"
				4 = "Not at all";

	value Q54a
				1 = "Ultrasound"
				2 = "Last menstrual period"
				3 = "Don't know";

run;
