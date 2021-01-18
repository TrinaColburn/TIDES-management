/* THIS CODE DEFINES VARIABLE RESPONSES */

proc format;
    value cnt 
	            6='UCSF'
				7='UMN'
				8='URMC'
				9='UW'
				0='ALL';

	value Q4 
				1 = "Excellent"
				2 = "Very Good"
				3 = "Good"
				4 = "Fair"
				5 = "Poor";

	value Q5a
				2 = "No" * ---- ReEdited in 04/25/2017;
				1 = "Yes";
	
	value Q5a1_a_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_a_script
				0 = "No"
				1 = "Yes";

	value Q5a1_a_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_b_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_b_script
				0 = "No"
				1 = "Yes";

	value Q5a1_b_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_c_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_c_script
				0 = "No"
				1 = "Yes";

	value Q5a1_c_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_d_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_d_script
				0 = "No"
				1 = "Yes";

	value Q5a1_d_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_e_yn
				0 = "No"
				1 = "Yes";
	value Q5a1_e_script
				0 = "No"
				1 = "Yes";
	value Q5a1_e_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_f_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_f_script
				0 = "No"
				1 = "Yes";

	value Q5a1_f_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_g_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_g_script
				0 = "No"
				1 = "Yes";

	value Q5a1_g_otc
				0 = "No"
				1 = "Yes";
	value Q5a1_h_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_h_script
				0 = "No"
				1 = "Yes";

	value Q5a1_h_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_i_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_i_script
				0 = "No"
				1 = "Yes";

	value Q5a1_i_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_j_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_j_script
				0 = "No"
				1 = "Yes";

	value Q5a1_j_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_k_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_k_script
				0 = "No"
				1 = "Yes";

	value Q5a1_k_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_l_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_l_script
				0 = "No"
				1 = "Yes";

	value Q5a1_l_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_m_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_m_script
				0 = "No"
				1 = "Yes";

	value Q5a1_m_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_n_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_n_script
				0 = "No"
				1 = "Yes";

	value Q5a1_n_otc
				0 = "No"
				1 = "Yes";

	value Q5a1_o_yn
				0 = "No"
				1 = "Yes";

	value Q5a1_o_script
				0 = "No"
				1 = "Yes";

	value Q5a1_o_otc
				0 = "No"
				1 = "Yes";

	value Q5b
				2 = "No" * ---- ReEdited in 04/25/2017;
				1 = "Yes";

	value Q5b1
				1 = "Pill/Tab"
				2 = "Capsule"
				3 = "Liquid"
				4 = "Other";
   
	value Q5c_yn
				2 = "No" * ---- ReEdited in 04/25/2017;
				1 = "Yes";

	value Q5c_a_formthruQ5c_l_formitems 

				1 = "Pill/Tab"
				2 = "Capsule"
				3 = "Liquid"
				4 = "Other";

	value Q5d
				0 = "No"
				1 = "Yes";

	value Q5e
				0 = "No"
				1 = "Yes";

	value Q5f
				0 = "No"
				1 = "Yes";

	value Q5g
				0 = "No"
				1 = "Yes";
	value Q5h
				0 = "No"
				1 = "Yes";

	value Q5i
				0 = "No"
				1 = "Yes";
				9 = "Not sure";

	value Q5j
				0 = "No"
				1 = "Yes";
				9 = "Not sure";

	value Q5ja
				0 = "No"
				1 = "Yes";
				9 = "Not sure";

	value Q5ja1
				0 = "Less than one year"
				1 = "One to two years";
				2 = "More than two years"
				9 = "Not sure";

	value Q5jb
				0 = "Saline or silicone"
				1 = "Metal";
				2 = "Plastic"
				3 = "Other"
				9 = "Not sure";
	value Q5k
				0 = "No"
				1 = "Yes"
				9 = "Not sure/don't know";

	value Q7
                0 = "No"
                1 = "Yes";
         
	value Q8
			   
				0 = "Strongly agree"
				1 = "Somewhat agree"
				3 = "Undecided"
				4 = "Somewhat disagree"
				5 = "Strongly disagree";
				9 = "Don't know"

	value Q9
				0 = "Strongly agree"
				1 = "Somewhat agree"
				3 = "Undecided"
				4 = "Somewhat disagree"
				5 = "Strongly disagree";
				9 = "Don't know"

	value Q10
			    0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don't know";

	value Q11
			    0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don't know";


	value Q12
			    0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don't know";

	value Q13
				0 = "Eat most foods"
				1 = "Eat mostly vegetarian diet"
				2 = "A vegetarian"
				3 = "A vegan"
				4 = "Special diet"
				9 = "Don’t Know/ Not sure";

	value Q14
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q15
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q16
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q16a
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q16b
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q16c
				0 = "Always"
				1 = "Usually"
				2 = "Sometimes"
				3 = "Rarely"
				4 = "Never"
				9 = "Don’t Know";

	value Q19athruQ19jitems;

				2 = "No" * ---- ReEdited in 04/25/2017;
				1 = "Yes";

    value Q22
				0 = "No"
				1 = "Yes";

    value Q22b1
				0 = "None"
				1 = "< 2 hours"
				2 = "2 - 4 hours"
				3 = "4 - 6 hours"
				4 = "> 6 hours / most of day";

	value Q22b2
				0 = "Food service worker"
				1 = "Food processing";
	
	value Q22b4
				0 = "Direct patient care"
				1 = "Technician"
				2 = "Office admin"
				3 = "Support services"
				4 = "Research"
				5 = "Sales"
				6 = "Executive/management"
				7 = "Animal care"
				9 = "Other";

	value Q22b4a
				1 = "blood bags and infusion tubing"
				2 = "enteral nutrition feeding bags"
				3 = "intravenous medical bags"
				4 = "nasogastric tubes"
				5 = "peritoneal dialysis bags and tubing"
				6 = "tubing for CPB procedures"
				7 = "tubing for ECMO"
				8 = "tubing for hemodialysis"
				9 = "umbilical artery catheters"
				10 = "vinyl gloves";
	value Q22c
				0 = "Day shift"
				1 = "Early evening (6pm - midnight)"
				2 = "Night shift (midnight - 6pm)"
				3 = "Regular rotating shift"
				9 = "Varied/Other";

	value Q22d
				0 = "Very stressful"
				1 = "Somewhat stressful"
				2 = "Not too stressful"
				3 = "Not at all stressful";

	value Q22e
				0 = "No"
				1 = "Yes";

	value Q22e1
				0 = "No"
				1 = "Yes";

	value Q22f
				0 = "Usually"
				1 = "Sometimes"
				2 = "Rarely"
				3 = "Never";

	value Q23
				0 = "None"
				1 = "One or less"
				2 = "Two or less"
				3 = "More than two";

	value Q24
				0 = "1 or fewer per day"
				1 = "2-5 per day"
				2 = "5-10 per day"
				3 = "More than 10 per day";


	value Q25a
				0 = "No"
				1 = "Yes";

	value Q25b
				0 = "No"
				1 = "Yes";

	value Q25c
				0 = "No"
				1 = "Yes";

	value Q25d
				0 = "No"
				1 = "Yes";

	value Q25e
				0 = "No"
				1 = "Yes";

	value Q28
				
				0 = "Not hispanic or latino"
				1 = "Hispanic or latino";

	value Q29
     			0 =	"American Indian or Alaska Native"
     			1 = "Asian"
     			2 = "Black or African-American"
     			3 = "Native Hawaiian or Pacific Islander"
     			4 = "White"
     			9 = "Other";

	value Q30      
				0 = "8th grade or lower"
     			1 = "Some high school"
     			2 = "Graduated high school"
		     	3 = "Some college"
     			4 = "Graduated college"
    			5 = "Some graduate digree"
    			9 = "Don’t know ";

	value q31

				0 = "No"
				1 = "Yes";

	value q31a
	      		0 = "Got married"
     			1 = "Now living as married"
     			2 = "Now separated"
     			3 = "Got divorced"
     			4 = "Now widowed"
     			5 = "Now single";

	value q31b
			
   				0 = "All of the time"
     			1 = "Most of the time"
     			2 = "Some of the time"
     			3 = "Not at all";

	value q32

				0 = "No"
				1 = "Yes";
		
	value q33

				0 = "No"
				1 = "Yes";


	value Q34
	            
				0 = "Often"
				1 = "Sometimes"
				2 = "Rarely"
				3 = "Never"
                9 = "Don't know";

	value Q35
	            
				0 = "Often"
				1 = "Sometimes"
				2 = "Rarely"
				3 = "Never";

    value Q36
	            
				0 = "Often"
				1 = "Sometimes"
				2 = "Rarely"
				3 = "Never"
                9 = "Don't know";

run;
