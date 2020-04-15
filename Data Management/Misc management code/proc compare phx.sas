data tmp2.T1phx754_081515_2; set tmp2.T1phx754_081515;
run;

data tmp2.T1phx754_081515_2; set tmp2.T1phx754_081515_2;
if StudyID="P6001" then StudyID="6001";
if StudyID="P6002" then StudyID="6002";
if StudyID="P6003" then StudyID="6003";
if StudyID="P6004" then StudyID="6004";
if StudyID="P7001" then StudyID="7001";
if StudyID="P7002" then StudyID="7002";
if StudyID="P8001" then StudyID="8001";
if StudyID="P8002" then StudyID="8002";
if StudyID="P8003" then StudyID="8003";
if StudyID="P9001" then StudyID="9001";
if StudyID="P9002" then StudyID="9002";
if StudyID="P9003" then StudyID="9003";
if StudyID="P9004" then StudyID="9004";
if StudyID="P9005" then StudyID="9005";
run;

data tmp2.T1phx754_081515_2; set tmp2.T1phx754_081515_2;
study_id = input(studyid, 8.); run;

proc sort data=tmp2.T1phx754_081515_2;
by study_id;
run;


proc compare base=tmp2.T1phx754_081515_2 compare=tmp2.T1phx_20190514;
id study_id;
title;
run;

proc contents data=tmp4.gestages_02202019 order=varnum;
run;

