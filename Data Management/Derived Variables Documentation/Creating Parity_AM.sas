/* Edit the following line to reflect the full path to your CSV file */
libname parity "J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\Parity Calc"; run;

%let csv_file = 'J:\PM\TIDES_Data\RESEARCH\Output data for analyses\prenatal stress_NB\Parity Calc\TIDESI-ReportToCreateParity_DATA_NOHDRS_2021-01-27_0911.csv';

OPTIONS nofmterr;



data parity.am_calc; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best32. ;
	informat redcap_event_name $500. ;
	informat t2_q12 best32. ;
	informat t2_q12a best32. ;
	informat t2_q12b_1_outcome best32. ;
	informat t2_q12b_1_duration_wks_recode best32. ;
	informat t2_q12b_1_sex best32. ;
	informat t2_q12b_2_duration_wks_recode best32. ;
	informat t2_q12b_2_outcome best32. ;
	informat t2_q12b_2_sex best32. ;
	informat t2_q12b_3_duration_wks_recode best32. ;
	informat t2_q12b_3_outcome best32. ;
	informat t2_q12b_3_sex best32. ;
	informat t2_q12b_4_duration_wks_recode best32. ;
	informat t2_q12b_4_outcome best32. ;
	informat t2_q12b_4_sex best32. ;
	informat t2_q12b_5_duration_wks_recode best32. ;
	informat t2_q12b_5_outcome best32. ;
	informat t2_q12b_5_sex best32. ;
	informat t2_q12b_6_duration_wks_recode best32. ;
	informat t2_q12b_6_outcome best32. ;
	informat t2_q12b_6_sex best32. ;
	informat t2_q12b_7_duration_wks_recode best32. ;
	informat t2_q12b_7_outcome best32. ;
	informat t2_q12b_7_sex best32. ;
	informat t2_q12b_8_duration_wks_recode best32. ;
	informat t2_q12b_8_outcome best32. ;
	informat t2_q12b_8_sex best32. ;
	informat t2_q12b_9_duration_wks_recode best32. ;
	informat t2_q12b_9_outcome best32. ;
	informat t2_q12b_9_sex best32. ;
	informat t2_q12b_10_duration_wks_recode best32. ;
	informat t2_q12b_10_outcome best32. ;
	informat t2_q12b_10_sex best32. ;
	informat t2_q12b_11_duration_wks_recode best32. ;
	informat t2_q12b_11_outcome best32. ;
	informat t2_q12b_11_sex best32. ;

	format study_id best8. ;
	format redcap_event_name $500. ;
	format t2_q12 best12. ;
	format t2_q12a best8. ;
	format t2_q12b_1_outcome best12. ;
	format t2_q12b_1_duration_wks_recode best8. ;
	format t2_q12b_1_sex best12. ;
	format t2_q12b_2_duration_wks_recode best8. ;
	format t2_q12b_2_outcome best12. ;
	format t2_q12b_2_sex best12. ;
	format t2_q12b_3_duration_wks_recode best8. ;
	format t2_q12b_3_outcome best12. ;
	format t2_q12b_3_sex best12. ;
	format t2_q12b_4_duration_wks_recode best8. ;
	format t2_q12b_4_outcome best12. ;
	format t2_q12b_4_sex best12. ;
	format t2_q12b_5_duration_wks_recode best8. ;
	format t2_q12b_5_outcome best12. ;
	format t2_q12b_5_sex best12. ;
	format t2_q12b_6_duration_wks_recode best8. ;
	format t2_q12b_6_outcome best12. ;
	format t2_q12b_6_sex best12. ;
	format t2_q12b_7_duration_wks_recode best8. ;
	format t2_q12b_7_outcome best12. ;
	format t2_q12b_7_sex best12. ;
	format t2_q12b_8_duration_wks_recode best8. ;
	format t2_q12b_8_outcome best12. ;
	format t2_q12b_8_sex best12. ;
	format t2_q12b_9_duration_wks_recode best8. ;
	format t2_q12b_9_outcome best12. ;
	format t2_q12b_9_sex best12. ;
	format t2_q12b_10_duration_wks_recode best8. ;
	format t2_q12b_10_outcome best12. ;
	format t2_q12b_10_sex best12. ;
	format t2_q12b_11_duration_wks_recode best8. ;
	format t2_q12b_11_outcome best12. ;
	format t2_q12b_11_sex best12. ;

input
	study_id 
	redcap_event_name $
	t2_q12
	t2_q12a 
	t2_q12b_1_outcome
	t2_q12b_1_duration_wks_recode 
	t2_q12b_1_sex
	t2_q12b_2_duration_wks_recode 
	t2_q12b_2_outcome
	t2_q12b_2_sex
	t2_q12b_3_duration_wks_recode 
	t2_q12b_3_outcome
	t2_q12b_3_sex
	t2_q12b_4_duration_wks_recode 
	t2_q12b_4_outcome
	t2_q12b_4_sex
	t2_q12b_5_duration_wks_recode 
	t2_q12b_5_outcome
	t2_q12b_5_sex
	t2_q12b_6_duration_wks_recode 
	t2_q12b_6_outcome
	t2_q12b_6_sex
	t2_q12b_7_duration_wks_recode 
	t2_q12b_7_outcome
	t2_q12b_7_sex
	t2_q12b_8_duration_wks_recode 
	t2_q12b_8_outcome
	t2_q12b_8_sex
	t2_q12b_9_duration_wks_recode 
	t2_q12b_9_outcome
	t2_q12b_9_sex
	t2_q12b_10_duration_wks_recode 
	t2_q12b_10_outcome
	t2_q12b_10_sex
	t2_q12b_11_duration_wks_recode 
	t2_q12b_11_outcome
	t2_q12b_11_sex
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;


/*Use Grace Lyden's code to create the parity=0 if q12=0*/
data parity.am_calc_1; set parity.am_calc;
if t2_q12=0 and t2_q12a=. then parity=0; run;

	proc freq data=parity.am_calc_1;
	table parity; run; /*expected 296, got 296*/

/****Amending Kate Christenbury/Kelly Ferguson NIEHS Code*****/
/**Created temporary variables parity1 through parity12 and summed
   to create final parity variable*/
/*will add duration condition for pregnancies greater than 24 weeks and any still births*/
/*Defintion of parity will include pregnancies that last 24 weeks or more*/

%macro parity(outcome, duration, par_num);
data parity.am_calc_1; set parity.am_calc_1;
if &outcome=1 or &duration>=24 then &par_num=1;
	else &par_num=0; run;
%mend;

%parity(	t2_q12b_1_outcome,	t2_q12b_1_duration_wks_recode,	parity1	);
%parity(	t2_q12b_2_outcome,	t2_q12b_2_duration_wks_recode,	parity2	);
%parity(	t2_q12b_3_outcome,	t2_q12b_3_duration_wks_recode,	parity3	);
%parity(	t2_q12b_4_outcome,	t2_q12b_4_duration_wks_recode,	parity4	);
%parity(	t2_q12b_5_outcome,	t2_q12b_5_duration_wks_recode,	parity5	);
%parity(	t2_q12b_6_outcome,	t2_q12b_6_duration_wks_recode,	parity6	);
%parity(	t2_q12b_7_outcome,	t2_q12b_7_duration_wks_recode,	parity7	);
%parity(	t2_q12b_8_outcome,	t2_q12b_8_duration_wks_recode,	parity8	);
%parity(	t2_q12b_9_outcome,	t2_q12b_9_duration_wks_recode,	parity9	);
%parity(	t2_q12b_10_outcome,	t2_q12b_10_duration_wks_recode,	parity10);
%parity(	t2_q12b_11_outcome,	t2_q12b_11_duration_wks_recode,	parity11);

proc freq data=parity.am_calc_1;
table parity1-parity11; run;

data parity.am_calc_1; set parity.am_calc_1;
if parity ne 0 then parity=parity1+parity2+parity3+parity4+parity5+parity6+
						   parity7+parity8+parity9+parity10+parity11; run;

/*adjust for missings*/
data parity.am_calc_1; set parity.am_calc_1;
if t2_q12=. and t2_q12a=. then parity=.; run;

data parity.am_calc_1; set parity.am_calc_1;
if t2_q12 ne 0 and t2_q12a=. then parity=.; run; /*account for 8148 who has no outcome data for 12b_1 -- 12b_11*/

proc freq data=parity.am_calc_1;
table parity; title; run; /*remember parity, not total number of previous pregnancies*/

/*compare with grace and kate*/
proc freq data=parity.Gl;
table parity; run;

proc freq data=parity.Tides_compwideanalysis_20210114;
table parity; run;

/*AM version has more, which is to be expected. First reason, 
outcomes were updated and 12/12a were reconciled. Second, the code above includes
pregnancy durations >=24 weeks, which Kate's does not. Grace's likely includes more 
complete information because she conditioned on breastfeeding data*/

/*Will import all three new DCC to make decision*/

/*calculate gravidity*/
/*will simply use 12a+1 since mom is currently pregnant with TIDES child,
  flag those with outcomes of 0*/


data parity.am_calc_2; set parity.am_calc_1;
gravidity=t2_q12a+1; run;

data parity.am_calc_2; set parity.am_calc_2;
if t2_q12=0 and t2_q12a=. then gravidity=1; run;

proc freq data=parity.am_calc_2;
table gravidity; title; run;

/*flag those with outcome=0 for any outcome var*/
data parity.am_calc_3; set parity.am_calc_2;
if t2_q12b_1_outcome=0 or t2_q12b_2_outcome=0 or
   t2_q12b_3_outcome=0 or t2_q12b_4_outcome=0 or
   t2_q12b_5_outcome=0 or t2_q12b_6_outcome=0 or
   t2_q12b_7_outcome=0 or t2_q12b_8_outcome=0 or
   t2_q12b_9_outcome=0 or t2_q12b_10_outcome=0 or
   t2_q12b_11_outcome=0 then gravidity_flag=1; run;


proc freq data=parity.am_calc_3;
table gravidity; run;

proc freq data=parity.am_calc_3;
table gravidity;
where gravidity_flag ne 1; run;

/*compare with kate*/
proc freq data=parity.Tides_compwideanalysis_20210114;
table gravidity; run; /*not sure why she has 0s, should be including TIDES 
						pregnancy. If +1 was added should be mostly the same*/

/*subset compwide*/
data parity.ROOST_select; set parity.Tides_compwideanalysis_20210114;
keep studyid parity gravidity; run;

data parity.am_calc_3; set parity.am_calc_3;
rename parity=parity_am;
rename gravidity=gravidity_am; run;

data parity.am_calc_GPonly; set parity.am_calc_3;
keep study_id parity_am gravidity_am; run;

proc sort data=parity.am_calc_3;
by study_id; run;

data parity.gl; set parity.gl;
rename parity=parity_GL; run;

proc sort data=parity.gl;
by study_id; run;

data parity.ROOST_select; set parity.ROOST_select;
rename studyid=study_id;
rename parity=parity_roost;
rename gravidity=gravidity_roost; run;

proc sort data=parity.ROOST_select;
by study_id; run;


data parity.merged; merge parity.am_calc_GPonly parity.gl parity.ROOST_select; by study_id; run;


data parity.merged;
 set parity.merged;
 if study_id=7047 then delete; run;

