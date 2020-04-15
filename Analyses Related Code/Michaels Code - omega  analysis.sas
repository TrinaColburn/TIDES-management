libname Q1 'J:\PM\TIDES_Data\Q1';

data work.tempQ1;
set Q1.tieds_q1_renamed_var_071113;
run;

libname Q2 'J:\PM\TIDES_Data\Q2';

data work.tempQ2;
set Q2.tieds_q2_renamed_var_082213;
run;

libname Q3 'J:\PM\TIDES_Data\Q3';

data work.tempQ3;
set Q3.tieds_q3_renamed_var_082713;
run;

proc sql;
create table work.q12 as
select *
from work.tempq1 as a
join work.tempq2 as b /*keep only the records in both list of girls born (work.girls) and (moms with complete U1/Q1/BE */
on a.StudyID =b.StudyID;
quit;

proc sql;
create table work.qall as
select *
from work.q12 as c
join work.tempq3 as d /*keep only the records in both list of girls born (work.girls) and (moms with complete U1/Q1/BE */
on c.StudyID =d.StudyID;
quit;

Data Qall;
  set work.Qall;
  if T1_Q6C_K_FORM > 0 then Omega3Sup = 1;
  if T1_Q6C_K_YN = 1 then Omega3Sup = 1;
  if T2_Q4C_K_FORM > 0 then Omega3Sup = 1;
  if T2_Q4C_K_YN = 1 then Omega3Sup = 1;
  if T3_Q5C_K_FORM > 0 then Omega3Sup = 1;
  if T3_Q5C_K_YN = 1 then Omega3Sup = 1;
  if Omega3Sup = . then Omega3Sup = 0;
run;

proc freq data=Qall;
table Omega3Sup;
run;

proc print data=Qall;
	var T1_Q26C T2_Q18C T3_Q17C Omega3Sup;
	run;

*Use the following to for more specific fish consumption values*;
Data Qall;
	Set work.Qall;
	if T1_Q26C >= 2 then Seafood = 1;
	if T2_Q18C >= 2 then Seafood = 1;
	if T3_Q17C >= 2 then Seafood = 1;
	if seafood = . then seafood = 0;
run;

proc freq data=Qall;
	table seafood;
run;

proc print data=Qall;
	var T1_Q26C T2_Q18C T3_Q17C Omega3Sup Seafood;
	run;

Data Qall;
	set work.Qall;
	SeaExp = Seafood + Omega3Sup;
run;

proc freq data=Qall;
	table SeaExp;
run;


proc print data=Qall;
	var T1_Q26C T2_Q18C T3_Q17C Omega3Sup Seafood SeaExp;
	run;

Libname AGD "J:\PM\TIDES_Data\AGD data";

data work.tempAGD;
set AGD.tides_agd_pct_040714;
run;

proc sql;
create table work.ALL as
select *
from work.Qall as e
join work.tempAGD as f 
on e.StudyID =f.StudyID;
quit;

proc print data=All;
	var T1_Q26C T2_Q18C T3_Q17C Omega3Sup Seafood SeaExp _ZWEI;
	run;

proc freq data=All;
	table _ZWEI;
run;

data all;
	set work.all;
	if _ZWEI >= -0.2 then BinZwei = 1;
	if _ZWEI < -0.2 then BinZwei = 0;
run;

proc print data=All;
	var T1_Q26C T2_Q18C T3_Q17C Omega3Sup Seafood SeaExp _ZWEI BinZwei;
	run;

proc freq data=All;
	Table BinZwei;
run;


proc freq data=All;
	table SeaExp*BinZwei/chisq;
run;

*End HEre*;

data all;
	set work.all;
	if _ZWFL >= -0.4 then BinZwfl = 1;
	if _ZWFL < -0.4 then BinZwfl = 0;
run;

proc freq data=All;
	table SeaExp*BinZwfl/chisq;
run;

proc contents data=all position;
run;

proc means data=all;
	var _ZLEN;
run;

data all;
	set work.all;
	if _ZLEN >= -0.4 then BinZlen = 1;
	if _ZLEN < -0.4 then BinZlen = 0;
run;

*This looks somewhat good*;
proc freq data=All;
	table SeaExp*BinZlen/chisq;
run;

