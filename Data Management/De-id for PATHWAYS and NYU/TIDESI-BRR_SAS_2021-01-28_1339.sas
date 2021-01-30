/* Edit the following line to reflect the full path to your CSV file */
libname brr "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Birth Record Review"; run;

%let brr_rc = 'J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Last Data Share to PATHWAYS and NYU\Birth Record Review\TIDESI-BRR_DATA_NOHDRS_2021-01-28_1339.csv';

OPTIONS nofmterr;


data brr.brr_2021128_rc; %let _EFIERR_ = 0;
infile &brr_rc  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat study_id best8. ;
	informat redcap_event_name $500. ;
	informat brr_date yymmdd10. ;
	informat brr_time time5. ;
	informat reviewer $500. ;
	informat date_of_delivery yymmdd10. ;
	informat time_of_delivery time5. ;
	informat babysex best32. ;
	informat birthweight_kg best32. ;
	informat labor_induction best32. ;
	informat length_of_labor $500. ;
	informat delivery best32. ;
	informat reason_nonvaginaldelivery $500. ;
	informat presentation_at_delivery best32. ;
	informat instruments best32. ;
	informat complications best32. ;
	informat pain_medication best32. ;
	informat antibiotics best32. ;
	informat apgar_score best32. ;
	informat neonatal_resuscitation best32. ;
	informat adverse_conditions best32. ;
	informat specify_adverse_conditions $500. ;
	informat pg2_reviewer $500. ;
	informat pg2_comments $5000. ;
	informat admission best32. ;
	informat abnormal_pe_findings best32. ;
	informat explain_findings $500. ;
	informat pg3_reviewer $500. ;
	informat pg3_comments $5000. ;
	informat comments $5000. ;
	informat record_review_complete best32. ;

input
	study_id 
	redcap_event_name $
	brr_date
	brr_time
	reviewer $
	date_of_delivery
	time_of_delivery
	babysex
	birthweight_kg
	labor_induction
	length_of_labor $
	delivery
	reason_nonvaginaldelivery $
	presentation_at_delivery
	instruments
	complications
	pain_medication
	antibiotics
	apgar_score
	neonatal_resuscitation
	adverse_conditions
	specify_adverse_conditions $
	pg2_reviewer $
	pg2_comments $
	admission
	abnormal_pe_findings
	explain_findings $
	pg3_reviewer $
	pg3_comments $
	comments $
	record_review_complete
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;
