OPTIONS REPLACE NUMBER=1 PAGENO=1 NODATE LS=108 PS=995 label=1 FORMDLIM ='-';

/* ================ TIDES Q1 data ================= */
%LET DST=071113; *050613 021513; *last run 042512, 012512;
LIBNAME OUTQDATA "J:\PM\TIDES\Data\Portal_Q Data\SAS data set\";
data ht(keep=studyid MomAge_Yrs MomBMI
 			Q2_HT_CM Q2_HT_FT Q2_HT_IN Q2_ht_in_recode
 			Q2_WT_KG Q2_WT_LBS Q2_wt_lbs_recode
 			Q3_WT_KG Q3_WT_LBS Q3_wt_lbs_recode);

set OUTQDATA.TIEDS_Q1_&DST;
* ------------ Edit Height;
if StudyID='6181' then do; 
    Q2_HT_FT=5;
    Q2_ht_in_Recode=sum(Q2_ht_ft*12,Q2_ht_in);
end;
if StudyID='6186' then do; 
    Q2_HT_FT=5;
    Q2_ht_in_Recode=sum(Q2_ht_ft*12,Q2_ht_in);
end;
if StudyID='8045' then do; 
    Q2_ht_cm=163;
    Q2_ht_in_Recode=round(Q2_ht_cm * 0.3937);
  end;
if StudyID='8102' then do; 
    Q2_ht_cm=172;
    Q2_ht_in_Recode=round(Q2_ht_cm * 0.3937);
  end;
if StudyID='9068' then do; 
    Q2_ht_cm=160;
    Q2_ht_in_Recode=round(Q2_ht_cm * 0.3937);
  end;
if StudyID='9202' then do; 
    Q2_ht_cm=168;
    Q2_ht_in_Recode=round(Q2_ht_cm * 0.3937);
  end;

/* BMI */
MomBMI=(Q2_wt_lbs_recode*0.45359237)/((Q2_ht_in_recode*0.0254)*(Q2_ht_in_recode*0.0254));
rename Age_Yrs=MomAge_Yrs;
proc sort data=ht; by studyid;
proc contents data=OUTQDATA.TIEDS_Q1_&DST;
run;

* ----------------- Check hight;
* ---------- Before;
/*proc sort data=OUTQDATA.TIEDS_Q1_&DST; by Q2_ht_in_recode;*/
proc print data=OUTQDATA.TIEDS_Q1_&DST n noobs width=min;
*where Q2_HT_FT >=6;
where StudyID in('6068','6181','6186','P7002','7060','8035','8045','8102','8198','8170','9068','9202','9030','9057');
var studyid Age_Yrs Q2_HT_CM Q2_HT_FT Q2_HT_IN Q2_ht_in_recode Q2_wt_lbs_recode Q2_WT_KG;
format Age_Yrs 8.1;
proc sort data=OUTQDATA.TIEDS_Q1_&DST; by studyid;
run;
* ----------- After;
/*proc sort data=ht; by Q2_ht_in_recode;*/
proc print data=ht n noobs width=min;
*where Q2_HT_FT >=6;
where StudyID in('6068','6181','6186','P7002','7060','8035','8045','8102','8198','8170','9068','9202','9030','9057');
var studyid MomAge_Yrs Q2_HT_CM Q2_HT_FT Q2_HT_IN Q2_ht_in_recode Q2_wt_lbs_recode Q2_WT_KG MomBMI;
format MomAge_Yrs 8.1;
proc sort data=ht; by studyid;
run;

proc corr data=ht;
var Q2_wt_lbs_recode Q2_ht_in_recode;
run;

ods trace off;
ods listing close;
* =================== Residual plots and Patial Residual Plots ============================ ;
* ------------------- Output to PDF file;
ods pdf style=seaside notoc
   file="J:\PM\TIDES\Data\Data cleaning\Q\Q1\T1Q maternal height, Possible Outliers, &sysdate..pdf" /* Output filename */
   compress=0   /* No compression */ 
   ;
ods graphics on;

title "T1Q, Maternal Height: Possible Outliers, &sysdate ";
proc reg data=ht plots(label) = (rstudentbyleverage cooksd);
id studyid;
*where StudyID ^in('6181','6186','P7002','9068','9202');*,'6068','7060','9030');
model Q2_wt_lbs_recode=Q2_ht_in_recode;
run;quit;

proc sort data=ht; by Q2_ht_in_recode;
proc print data=ht n noobs width=min;
where StudyID in('6068','6181','6186','P7002','7060','8035','8198','8170','9068','9202','9030','9057');
var studyid MomAge_Yrs Q2_HT_CM Q2_HT_FT Q2_HT_IN Q2_ht_in_recode Q2_wt_lbs_recode Q2_WT_KG;
format MomAge_Yrs 8.1;
proc sort data=ht; by studyid;
run;

ods listing;
ods graphics off;
ods pdf close;


* ----- Weight;
/*proc sort data=ht; by Q2_wt_lbs_recode;*/
proc print data=ht n noobs width=min;
title "==== T1Q, Maternal Height: Possible Outliers, &sysdate ==== ";
*where Q2_wt_lbs_recode>=280;
where MomBMI>35;
*where Q2_HT_FT >=6;
*where StudyID in('6068','6181','6186','P7002','7060','8035','8198','8170','9068','9202','9030','9057');
var studyid MomAge_Yrs Q2_HT_CM Q2_ht_in_recode Q2_WT_KG Q2_WT_LBS Q2_wt_lbs_recode MomBMI Q3_WT_KG Q3_WT_LBS Q3_wt_lbs_recode;
format MomAge_Yrs 8.1;
proc sort data=ht; by studyid;
run;


* StudyID in('6068','6181','6186','P7002','7060','8035','8198','8170','9068','9202','9030','9057');

* ---------------------- Confirmed by Center: True 'P7002','8035','8198','8170','9030','9057';

/*
'6181'  
  '7018'  
  '7060'  
  '7130'  
  '7193'  
  '7223'  
  '8045'  
  '8102'  
  '9029'  
  '9051'  
  '9068'  
  '9110'  
  '9173'  
  '9202'  
  'P7002' 
