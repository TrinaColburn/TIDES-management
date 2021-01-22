/* Edit the following line to reflect the full path to your CSV file */
libname cbcl "J:\PM\TIDES_Data\TIDES II Age 6\Data to NYU for Cleaning\Round 3 CBCL"; run;

%let csv_file = 'J:\PM\TIDES_Data\TIDES II Age 6\Data to NYU for Cleaning\Round 3 CBCL\Age6PVQnewVariables-PVQCBCLDate_DATA_NOHDRS_2021-01-20_1312.csv';

OPTIONS nofmterr;


data cbcl.tii_6_cbcl; %let _EFIERR_ = 0;
infile &csv_file  delimiter = ',' MISSOVER DSD lrecl=32767 firstobs=1 ;

	informat child_id best8. ;
	informat study_id $500. ;
	informat subject_id $500. ;
	informat center best32. ;
	informat pvq_survey_timestamp $500. ;
	informat tii_6_pvq_date yymmdd10. ;
	informat cbcl_survey_timestamp $500. ;
	informat cbcl_1 best32. ;
	informat cbcl_2 best32. ;
	informat cbcl_3 best32. ;
	informat cbcl_4 best32. ;
	informat cbcl_5 best32. ;
	informat cbcl_6 best32. ;
	informat cbcl_7 best32. ;
	informat cbcl_8 best32. ;
	informat cbcl_9 best32. ;
	informat cbcl_10 best32. ;
	informat cbcl_11 best32. ;
	informat cbcl_12 best32. ;
	informat cbcl_13 best32. ;
	informat cbcl_14 best32. ;
	informat cbcl_15 best32. ;
	informat cbcl_16 best32. ;
	informat cbcl_17 best32. ;
	informat cbcl_18 best32. ;
	informat cbcl_19 best32. ;
	informat cbcl_20 best32. ;
	informat cbcl_21 best32. ;
	informat cbcl_22 best32. ;
	informat cbcl_23 best32. ;
	informat cbcl_24 best32. ;
	informat cbcl_25 best32. ;
	informat cbcl_26 best32. ;
	informat cbcl_27 best32. ;
	informat cbcl_28 best32. ;
	informat cbcl_29 best32. ;
	informat cbcl_30 best32. ;
	informat cbcl_31 best32. ;
	informat cbcl_32 best32. ;
	informat cbcl_33 best32. ;
	informat cbcl_34 best32. ;
	informat cbcl_35 best32. ;
	informat cbcl_36 best32. ;
	informat cbcl_37 best32. ;
	informat cbcl_38 best32. ;
	informat cbcl_39 best32. ;
	informat cbcl_40 best32. ;
	informat cbcl_41 best32. ;
	informat cbcl_42 best32. ;
	informat cbcl_43 best32. ;
	informat cbcl_44 best32. ;
	informat cbcl_45 best32. ;
	informat cbcl_46 best32. ;
	informat cbcl_47 best32. ;
	informat cbcl_48 best32. ;
	informat cbcl_49 best32. ;
	informat cbcl_50 best32. ;
	informat cbcl_51 best32. ;
	informat cbcl_52 best32. ;
	informat cbcl_53 best32. ;
	informat cbcl_54 best32. ;
	informat cbcl_55 best32. ;
	informat cbcl_56a best32. ;
	informat cbcl_56b best32. ;
	informat cbcl_56c best32. ;
	informat cbcl_56d best32. ;
	informat cbcl_56e best32. ;
	informat cbcl_56f best32. ;
	informat cbcl_56g best32. ;
	informat cbcl_57 best32. ;
	informat cbcl_58 best32. ;
	informat cbcl_59 best32. ;
	informat cbcl_60 best32. ;
	informat cbcl_61 best32. ;
	informat cbcl_62 best32. ;
	informat cbcl_63 best32. ;
	informat cbcl_64 best32. ;
	informat cbcl_65 best32. ;
	informat cbcl_66 best32. ;
	informat cbcl_67 best32. ;
	informat cbcl_68 best32. ;
	informat cbcl_69 best32. ;
	informat cbcl_70 best32. ;
	informat cbcl_71 best32. ;
	informat cbcl_72 best32. ;
	informat cbcl_73 best32. ;
	informat cbcl_74 best32. ;
	informat cbcl_75 best32. ;
	informat cbcl_76 best32. ;
	informat cbcl_77 best32. ;
	informat cbcl_78 best32. ;
	informat cbcl_79 best32. ;
	informat cbcl_80 best32. ;
	informat cbcl_81 best32. ;
	informat cbcl_82 best32. ;
	informat cbcl_83 best32. ;
	informat cbcl_84 best32. ;
	informat cbcl_85 best32. ;
	informat cbcl_86 best32. ;
	informat cbcl_87 best32. ;
	informat cbcl_88 best32. ;
	informat cbcl_89 best32. ;
	informat cbcl_90 best32. ;
	informat cbcl_91 best32. ;
	informat cbcl_92 best32. ;
	informat cbcl_93 best32. ;
	informat cbcl_94 best32. ;
	informat cbcl_95 best32. ;
	informat cbcl_96 best32. ;
	informat cbcl_97 best32. ;
	informat cbcl_98 best32. ;
	informat cbcl_99 best32. ;
	informat cbcl_100 best32. ;
	informat cbcl_101 best32. ;
	informat cbcl_102 best32. ;
	informat cbcl_103 best32. ;
	informat cbcl_104 best32. ;
	informat cbcl_105 best32. ;
	informat cbcl_106 best32. ;
	informat cbcl_107 best32. ;
	informat cbcl_108 best32. ;
	informat cbcl_109 best32. ;
	informat cbcl_110 best32. ;
	informat cbcl_111 best32. ;
	informat cbcl_112 best32. ;
	informat tii_6_cbcl_complete best32. ;

input
	child_id 
	study_id $
	subject_id $
	center
	pvq_survey_timestamp $
	tii_6_pvq_date
	cbcl_survey_timestamp $
	cbcl_1
	cbcl_2
	cbcl_3
	cbcl_4
	cbcl_5
	cbcl_6
	cbcl_7
	cbcl_8
	cbcl_9
	cbcl_10
	cbcl_11
	cbcl_12
	cbcl_13
	cbcl_14
	cbcl_15
	cbcl_16
	cbcl_17
	cbcl_18
	cbcl_19
	cbcl_20
	cbcl_21
	cbcl_22
	cbcl_23
	cbcl_24
	cbcl_25
	cbcl_26
	cbcl_27
	cbcl_28
	cbcl_29
	cbcl_30
	cbcl_31
	cbcl_32
	cbcl_33
	cbcl_34
	cbcl_35
	cbcl_36
	cbcl_37
	cbcl_38
	cbcl_39
	cbcl_40
	cbcl_41
	cbcl_42
	cbcl_43
	cbcl_44
	cbcl_45
	cbcl_46
	cbcl_47
	cbcl_48
	cbcl_49
	cbcl_50
	cbcl_51
	cbcl_52
	cbcl_53
	cbcl_54
	cbcl_55
	cbcl_56a
	cbcl_56b
	cbcl_56c
	cbcl_56d
	cbcl_56e
	cbcl_56f
	cbcl_56g
	cbcl_57
	cbcl_58
	cbcl_59
	cbcl_60
	cbcl_61
	cbcl_62
	cbcl_63
	cbcl_64
	cbcl_65
	cbcl_66
	cbcl_67
	cbcl_68
	cbcl_69
	cbcl_70
	cbcl_71
	cbcl_72
	cbcl_73
	cbcl_74
	cbcl_75
	cbcl_76
	cbcl_77
	cbcl_78
	cbcl_79
	cbcl_80
	cbcl_81
	cbcl_82
	cbcl_83
	cbcl_84
	cbcl_85
	cbcl_86
	cbcl_87
	cbcl_88
	cbcl_89
	cbcl_90
	cbcl_91
	cbcl_92
	cbcl_93
	cbcl_94
	cbcl_95
	cbcl_96
	cbcl_97
	cbcl_98
	cbcl_99
	cbcl_100
	cbcl_101
	cbcl_102
	cbcl_103
	cbcl_104
	cbcl_105
	cbcl_106
	cbcl_107
	cbcl_108
	cbcl_109
	cbcl_110
	cbcl_111
	cbcl_112
	tii_6_cbcl_complete
;
if _ERROR_ then call symput('_EFIERR_',"1");
run;

data cbcl.tii_6_cbcl_1; set cbcl.tii_6_cbcl;
format tii_6_pvq_date date9. ; run;

proc print data=cbcl.tii_6_cbcl_1 noobs; 
var child_id 	pvq_survey_timestamp tii_6_pvq_date	cbcl_survey_timestamp ;
where tii_6_pvq_date=.; run;

data cbcl.tii_6_cbcl_1; set cbcl.tii_6_cbcl_1;
if child_id=60502 then tii_6_pvq_date='15SEP2018'd;
if child_id=61042 then tii_6_pvq_date='27APR2018'd;
if child_id=61352 then tii_6_pvq_date='14AUG2018'd;
if child_id=61752 then tii_6_pvq_date='16FEB2019'd;
if child_id=70632 then tii_6_pvq_date='28MAR2018'd;
if child_id=80292 then tii_6_pvq_date='08FEB2018'd;
if child_id=80662 then tii_6_pvq_date='06MAY2018'd;
if child_id=81322 then tii_6_pvq_date='22MAR2018'd;
if child_id=81732 then tii_6_pvq_date='14AUG2018'd;
if child_id=81792 then tii_6_pvq_date='05AUG2019'd; run;

data cbcl.tii_6_cbcl_1; set cbcl.tii_6_cbcl_1;
format tii_6_pvq_date mmddyy10. ; run;

proc print data=cbcl.tii_6_cbcl_1;
where tii_6_pvq_date=.; run;

proc freq data=cbcl.tii_6_cbcl_1;
table tii_6_pvq_date/missing; run;

proc sort data=cbcl.tii_6_cbcl_1; by study_id; run;
proc sort data=cbcl.child_dob; by study_id; by study_id; run;

data cbcl.cbcl_dob; merge cbcl.tii_6_cbcl_1(in=a) cbcl.child_dob(in=b); by study_id; if a=1; run;

proc print data=cbcl.cbcl_dob;
var child_id study_id subject_id;
where child_id=.; run;

data cbcl.cbcl_dob; set cbcl.cbcl_dob;
if study_id="6040" then child_id=60402;
if study_id="6142" then child_id=61422;
if study_id="7093" then child_id=70932; run;

data cbcl.cbcl_dob; set cbcl.cbcl_dob;
format child_dob mmddyy10.; run;

proc print data=cbcl.cbcl_dob;
where child_dob=. or tii_6_pvq_date=.; run;

data cbcl.cbcl_dob_age; set cbcl.cbcl_dob;
tii_6_childage_cbcl=int(intck('MONTH', child_dob, tii_6_pvq_date)/12); 
IF MONTH(CHILD_DOB)=MONTH(tii_6_pvq_date) THEN tii_6_pvq_date= tii_6_pvq_date - (day(child_dob)>day(tii_6_pvq_date)); run;

proc freq data=cbcl.cbcl_dob_age;
table tii_6_childage_cbcl; run;
