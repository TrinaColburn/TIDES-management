libname agd "J:\PM\TIDES_Data\TIDES I Data\AGD data\AGD at Birth\2019430"; run;

proc contents data=agd.Agdbirth_tidesonly_2019430 order=varnum; run;

proc contents data=agd.Tides_residual_agd_053014 order=varnum; run;

data agd.Tides_residual_agd_102519; set c;
study_id=input(studyid,best8.);
run;

data agd.Tides_residual_agd_102519; 
format study_id studyid sex RSIDas_af RSIDap_ac;
set agd.Tides_residual_agd_102519; run;

proc contents data=agd.Tides_residual_agd_102519 order=varnum; run;


proc sort data=agd.Tides_residual_agd_102519;
by studyid;
run;

proc sort data=agd.Tides_residual_agd_053014;
by studyid;
run;

proc compare base=agd.Tides_residual_agd_102519 compare=agd.Tides_residual_agd_053014 nodate briefsummary maxprint=1000; 
id studyid;
run;



libname box "J:\PM\TIDES_Data\TIDES I Data\New Bulk upload to box"; run;



data KF_GT.Birthexam_tides_21919_deid; set KF_GT.Birthexam_tides_21919_deid;
study_id=input(studyid,best8.);
run;

data KF_GT.Oneyrexam22119_kf_v2; set KF_GT.Oneyrexam22119_kf;
study_id=input(studyid,best8.);
run;
