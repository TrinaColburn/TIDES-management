libname ti_echo "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
Data for PW and NYU\Nov 2019\TIDES I"; run;

libname _4_echo "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
Data for PW and NYU\Nov 2019\Age 4"; run;

/***Import previously sent data***/
/*Birth Exam*/
PROC IMPORT OUT= TI_ECHO.BIRTHEXAM_1014_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\birth exam_10.2014_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Birth Record Review*/
PROC IMPORT OUT= TI_ECHO.BRR_1216_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\birthrecordreview_12.2016_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Interim Q*/
PROC IMPORT OUT= TI_ECHO.InterimQ_1116_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\interim q_2016.11.03_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*One Year Exam*/
PROC IMPORT OUT= TI_ECHO.Y1_Exam
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\oneyearexam.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Q1*/
PROC IMPORT OUT= TI_ECHO.Q1_20150713_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\Q1_20150713_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Q2*/
PROC IMPORT OUT= TI_ECHO.Q2_20130823_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\Q2_20130823_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Q3*/
PROC IMPORT OUT= TI_ECHO.Q3_20141006_PWNYU
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\TIDES I\Q3_20141006_PWNYU.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;



/*Age 4 BASC SRS*/
PROC IMPORT OUT= _4_echo.TII_4_BASC_SRS_20181024
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\Age 4\TIDES II Age 4 BASC SRS_2018.10.24.csv" 
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*Age 4 PVQ*/
PROC IMPORT OUT= _4_echo.TII_4_PVQ_20180717
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\Age 4\TIDES II Age 4 Maternal Previsit Q_2018.07.17.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2;
RUN;

/*Age 4 In-Office*/
PROC IMPORT OUT= _4_echo.TII_4_InOffice_20180822
            DATAFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\
            Data for PW and NYU\Nov 2019\Age 4\TIDES II Age 4 In Office Visit_2018.08.22.csv"
            DBMS=CSV REPLACE;
     GETNAMES=YES;
     DATAROW=2; RUN;

/*=====================Import Complete==========================================*/


/***Proc compare macro***/
/*For studyid*/
%macro comp(old,new);
proc sort data=&old;
by studyid;
run;

proc sort data=&new;
by studyid;
run;

proc compare base=&new compare=&old nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5 listequalvar;
id studyid;
run;
%mend;
%comp(ti_echo.Birthexam_1014_pwnyu,ti_echo.birthexam_20191125);

/*For study_id*/
%macro co_mp(old,new);
proc sort data=&old;
by study_id;
run;

proc sort data=&new;
by study_id;
run;

proc compare base=&new compare=&old nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5 listequalvar;
id study_id;
run;
%mend;
%co_mp(ti_echo.Brr_1216_pwnyu_2, ti_echo.Brr_2019430);
%co_mp(ti_echo.Interimq_1116_pwnyu, ti_echo.Ti_interim_2019430);
%co_mp(ti_echo.Y1_exam, ti_echo.Oneyrexam_2019430);
%co_mp(ti_echo.Q1_20150713_pwnyu, ti_echo.Q1_20190514);
%co_mp(ti_echo.Q2_20130823_pwnyu, ti_echo.Q2_22119);
%co_mp(ti_echo.Q3_20141006_pwnyu, ti_echo.Q3_22119);
%co_mp(_4_echo.tii_4_basc_srs_20181024, _4_echo.tii_4_bascsrs_2019411);



/*Proc Compare Age 4 PVQ*/
proc sort data=_4_echo.tii_4_pvq_2019430;
by study_id;
run;

proc sort data=_4_echo.tii_4_pvq_20180717;
by study_id;
run;
/*====Macro New vs. Old Variables=====*/
%macro pvq(new,old);
proc compare base=_4_echo.tii_4_pvq_2019430 compare=_4_echo.tii_4_pvq_20180717 nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5;
id study_id;
var &new;
with &old;
run;
%mend;
%pvq(tii_4_1, qc1);
%pvq(tii_4_2, qc2);
%pvq(tii_4_2a, qc2a);
%pvq(tii_4_dem_3_otherchild, qc3);
%pvq(tii_4_dem_3a_yr, qc3a_yr);
%pvq(tii_4_dem_3a_mo, qc3a_mo);
%pvq(tii_4_dem_3a_sex, qc3a_sex);
%pvq(tii_4_dem_3b_yr, qc3b_yr);
%pvq(tii_4_dem_3b_mo, qc3b_mo);
%pvq(tii_4_dem_3b_sex, qc3b_sex);
%pvq(tii_4_dem_3c_yr, qc3c_yr);
%pvq(tii_4_dem_3c_mo, qc3c_mo);
%pvq(tii_4_dem_3c_sex, qc3c_sex);
%pvq(tii_4_dem_3d_yr, qc3d_yr);
%pvq(tii_4_dem_3d_mo, qc3d_mo);
%pvq(tii_4_dem_3d_sex, qc3d_sex);
%pvq(tii_4_dem_3e_yr, qc3e_yr);
%pvq(tii_4_dem_3e_mo, qc3e_mo);
%pvq(tii_4_dem_3e_sex, qc3e_sex);
%pvq(tii_4_dem_4, qc4);
%pvq(tii_4_dem_4a1, qc4a1);
%pvq(tii_4_dem_4b1, qc4b1);
%pvq(tii_4_dem_4b2, qc4b2);
%pvq(tii_4_dem_4b3, qc4b3);
%pvq(tii_4_dem_4b3_other, qc4b3_other);
%pvq(tii_4_dem_4c1, qc4c1);
%pvq(tii_4_dem_4c2, qc4c2);
%pvq(tii_4_dem_4c3, qc4c3);
%pvq(tii_4_dem_4c3_other, qc4c3_other);
%pvq(tii_4_dem_4d1, qc4d1);
%pvq(tii_4_dem_4d2, qc4d2);
%pvq(tii_4_dem_4d3, qc4d3);
%pvq(tii_4_dem_4d3_other, qc4d3_other);
%pvq(tii_4_dem_5a1, qc5a1);
%pvq(tii_4_dem_5b1, qc5b1);
%pvq(tii_4_dem_5c1, qc5c1);
%pvq(tii_4_dem_5d1, qc5d1);
%pvq(tii_4_dem_5e1, qc5e1);
%pvq(tii_4_smoke_5a, qc5a2);
%pvq(tii_4_smoke_5b, qc5b2);
%pvq(tii_4_smoke_5c, qc5c2);
%pvq(tii_4_smoke_5d, qc5d2);
%pvq(tii_4_smoke_5e, qc5e2);
%pvq(tii_4_pmh_yn, qc6);
%pvq(tii_4_pmh, qc6y);
%pvq(tii_4_pmh_1a, qc6y1a);
%pvq(tii_4_pmh_1b, qc6y1b);
%pvq(tii_4_pmh_2a, qc6y2a);
%pvq(tii_4_pmh_2b, qc6y2b);
%pvq(tii_4_pmh_3a, qc6y3a);
%pvq(tii_4_pmh_3b, qc6y3b);
%pvq(tii_4_pmh_4a, qc6y4a);
%pvq(tii_4_pmh_4b, qc6y4b);
%pvq(tii_4_pmh_5a, qc6y5a);
%pvq(tii_4_pmh_5b, qc6y5b);
%pvq(tii_4_isaac_1, qc7);
%pvq(tii_4_isaac_2, qc7a);
%pvq(tii_4_isaac_3, qc7b);
%pvq(tii_4_isaac_4, qc7c);
%pvq(tii_4_isaac_5, qc7d);
%pvq(tii_4_isaac_6, qc8);
%pvq(tii_4_isaac_7, qc9);
%pvq(tii_4_isaac_8, qc10);
%pvq(tii_4_isaac_9, qc11);
%pvq(tii_4_isaac_10, qc12);
%pvq(tii_4_isaac_11, qc13);
%pvq(tii_4_isaac_12, qc13a);
%pvq(tii_4_isaac_13, qc13b);
%pvq(tii_4_isaac_14, qc13c);
%pvq(tii_4_isaac_15, qc13d);
%pvq(tii_4_isaac_16, qc13e);
%pvq(tii_4_isaac_17, qc14);
%pvq(tii_4_isaac_18, qc15);
%pvq(tii_4_isaac_19, qc16);
%pvq(tii_4_isaac_20, qc17);
%pvq(tii_4_sleep_1a, qs1a);
%pvq(tii_4_sleep_1b, qs1b);
%pvq(tii_4_sleep_2, qs2);
%pvq(tii_4_sleep_3, qs3);
%pvq(tii_4_sleep_4a, qs4a);
%pvq(tii_4_sleep_4b, qs4b);
%pvq(tii_4_sleep_4c, qs4c);
%pvq(tii_4_sleep_4d, qs4d);
%pvq(tii_4_sleep_4e, qs4e);
%pvq(tii_4_sleep_4f, qs4f);
%pvq(tii_4_psai_1a, p1a);
%pvq(tii_4_psai_1b, p1b);
%pvq(tii_4_psai_1c, p1c);
%pvq(tii_4_psai_1d, p1d);
%pvq(tii_4_psai_1e, p1e);
%pvq(tii_4_psai_1f, p1f);
%pvq(tii_4_psai_1g, p1g);
%pvq(tii_4_psai_2a, p2a);
%pvq(tii_4_psai_2b, p2b);
%pvq(tii_4_psai_2c, p2c);
%pvq(tii_4_psai_2d, p2d);
%pvq(tii_4_psai_2e, p2e);
%pvq(tii_4_psai_2f, p2f);
%pvq(tii_4_psai_2g, p2g);
%pvq(tii_4_psai_2h, p2h);
%pvq(tii_4_psai_2i, p2i);
%pvq(tii_4_psai_2j, p2j);
%pvq(tii_4_psai_2k, p2k);
%pvq(tii_4_psai_3a, p3a);
%pvq(tii_4_psai_3b, p3b);
%pvq(tii_4_psai_3c, p3c);
%pvq(tii_4_psai_3d, p3d);
%pvq(tii_4_psai_3e, p3e);
%pvq(tii_4_psai_3f, p3f);
%pvq(tii_4_psai_4a, p4a);
%pvq(tii_4_psai_4b, p4b);
%pvq(tii_4_psai_4c, p4c);
%pvq(tii_4_psai_4d, p4e);
%pvq(tii_4_mom_hlth, q1);
%pvq(tii_4_mom_marital, q2);
%pvq(tii_4_mom_edu, q3edu);
%pvq(tii_4_mom_ins, q4);
%pvq(tii_4_mom_employ, q5);
%pvq(tii_4_sle_1, q6a);
%pvq(tii_4_sle_2, q6b);
%pvq(tii_4_sle_3, q6c);
%pvq(tii_4_sle_4, q6d);
%pvq(tii_4_sle_5, q6e);
%pvq(tii_4_sle_6, q6f);
%pvq(tii_4_sle_7, q6g);
%pvq(tii_4_sle_8, q6h);
%pvq(tii_4_sle_9, q6i);
%pvq(tii_4_sle_10, q6j);
%pvq(tii_4_sle_11, q6k);
%pvq(tii_4_sle_12, q6l);
%pvq(tii_4_sle_13, q6m);
%pvq(tii_4_sle_14, q6n);
%pvq(tii_4_sle_15, q6o);
%pvq(tii_4_sle_16, q6p);
%pvq(tii_4_sle_17, q6q);
%pvq(tii_4_sle_18, q6r);
%pvq(tii_4_sle_19, q6s);
%pvq(tii_4_sle_20, q6t);
%pvq(tii_4_sle_21, q6u);
%pvq(tii_4_sle_22, q6v);
%pvq(tii_4_sle_23, q6w);
%pvq(tii_4_sle_24, q6x);
%pvq(tii_4_sle_25, q6y);
%pvq(tii_4_sle_26, q6z);
%pvq(tii_4_sle_other, q6oth);
%pvq(tii_4_cps_1, q7a);
%pvq(tii_4_cps_2, q7b);
%pvq(tii_4_cps_3, q7c);
%pvq(tii_4_cps_4, q7d);
%pvq(tii_4_cps_5, q7e);
%pvq(tii_4_cps_6, q7f);
%pvq(tii_4_cps_7, q7g);
%pvq(tii_4_cps_8, q7h);
%pvq(tii_4_cps_9, q7i);
%pvq(tii_4_cps_10, q7j);
%pvq(tii_4_phq9_1, q8a);
%pvq(tii_4_phq9_2, q8b);
%pvq(tii_4_phq9_3, q8c);
%pvq(tii_4_phq9_4, q8d);
%pvq(tii_4_phq9_5, q8e);
%pvq(tii_4_phq9_6, q8f);
%pvq(tii_4_phq9_7, q8g);
%pvq(tii_4_phq9_8, q8h);
%pvq(tii_4_phq9_9, q8i);
%pvq(tii_4_ss_1, q9a);
%pvq(tii_4_ss_2, q9b);
%pvq(tii_4_ss_3, q9c);
%pvq(tii_4_ss_4, q9d);
%pvq(tii_4_ss_5, q9e);
%pvq(tii_4_ss_6, q9f);
%pvq(tii_4_ss_7, q9g);
%pvq(tii_4_ss_8, q9h);
%pvq(tii_4_ss_9, q9i);
%pvq(tii_4_ss_10, q9j);
%pvq(tii_4_ss_11, q9k);
%pvq(tii_4_ss_12, q9l);
%pvq(tii_4_ss_13, q9m);
%pvq(tii_4_ss_14, q9n);
%pvq(tii_4_ss_15, q9o);
%pvq(tii_4_ss_16, q9p);
%pvq(tii_4_ss_17, q9q);
%pvq(tii_4_ss_18, q9r);
%pvq(tii_4_ss_19, q9s);
%pvq(tii_4_ss_20, q9t);
%pvq(tii_4_end, q10);
%pvq(tii_4_end_2, q11);


/*Proc Compare In-Office*/
proc sort data=_4_echo.tii_4_inoffice_20191126;
by study_id; run;

proc sort data=_4_echo.Tii_4_inoffice_20180822;
by study_id; run;

/*====Macro New vs. Old Variables=====*/
%macro inoffice(new,old);
proc compare base=_4_echo.Tii_4_inoffice_20190628 compare=_4_echo.Tii_4_inoffice_20180822 nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5;
id study_id;
var &new;
with &old;
run;
%mend;
%inoffice(tii_4_office_date, v1_inoffice_qdate);
%inoffice(data_date, v1date);
%inoffice(tii_4_data_sc, coordinator);
%inoffice(tii_4_data_ra, assistant);
%inoffice(tii_4_data_center, center);
%inoffice(tii_4_data_site, site);
%inoffice(tii_4_data_start_time, start_time);
%inoffice(tii_4_data_end_time, end_time);
%inoffice(office_1, mq1);
%inoffice(office_2, mq2);
%inoffice(office_2a, mq2a);
%inoffice(office_2b, mq2b);
%inoffice(office_2c, mq2c);
%inoffice(office_2d, mq2d);
%inoffice(office_2e, mq2e);
%inoffice(office_2e_oth, mq2e_oth);
%inoffice(office_3a, mq3a);
%inoffice(office_3b, mq3b);
%inoffice(office_3c, mq3c);
%inoffice(office_3d, mq3d);
%inoffice(office_3e, mq3e);
%inoffice(office_4a, mq4a);
%inoffice(office_4b, mq4b);
%inoffice(office_4c, mq4c);
%inoffice(office_4d, mq4d);
%inoffice(office_4e, mq4e);
%inoffice(office_4f, mq4f);
%inoffice(office_5a, mq5a);
%inoffice(office_5b, mq5b);
%inoffice(office_5c, mq5c);
%inoffice(office_6, mq6);
%inoffice(office_6a_1, mq6a);
%inoffice(office_6a_2, mq6a1);
%inoffice(office_6b_1, mq6b);
%inoffice(office_6b_2, mq6b1);
%inoffice(office_7_yn, mq6c);
%inoffice(office_7_sp, mq6cn);
%inoffice(office_7x_1, mq6c1a);
%inoffice(office_7x_2, mq6c1b);
%inoffice(office_7y_1, mq6c2a);
%inoffice(office_7y_2, mq6c2b);
%inoffice(office_7z_1, mq6c3a);
%inoffice(office_7z_2, mq6c3b);
%inoffice(office_8, mq7);
%inoffice(office_8a, mq7a);
%inoffice(data_ht1, ht1);
%inoffice(data_ht2, ht2);
%inoffice(data_ht3, ht3);
%inoffice(data_ht_comment, ht_comment);
%inoffice(data_wgt1, wgt1);
%inoffice(data_wgt2, wgt2);
%inoffice(data_wgt3, wgt3);
%inoffice(data_wgt_comment, wgt_comment);
%inoffice(data_wgt_scale, wgt_scale);
%inoffice(data_triskin1, triskin1);
%inoffice(data_triskin2, triskin2);
%inoffice(data_triskin3, triskin3);
%inoffice(data_triskin_comment, triskin_comment);
%inoffice(data_subskin1, subskin1);
%inoffice(data_subskin2, subskin2);
%inoffice(data_subskin3, subskin3);
%inoffice(data_subskin_comment, subskin_comment);
%inoffice(tii_4_data_dgtln_hand, dgtln_hand);
%inoffice(tii_4_data_dgtln1_2, dgtln1_2);
%inoffice(tii_4_data_dgtln1_4, dgtln1_4);
%inoffice(tii_4_data_dgtln2_2, dgtln2_2);
%inoffice(tii_4_data_dgtln2_4, dgtln2_4);
%inoffice(tii_4_data_dgtln3_2, dgtln3_2);
%inoffice(tii_4_data_dgtln3_4, dgtln3_4);
%inoffice(tii_4_data_dgtln_comment, dgtln_comment);
%inoffice(tii_4_data_bps1, bps1);
%inoffice(tii_4_data_bpd1, bpd1);
%inoffice(tii_4_data_pulse1, pulse1);
%inoffice(tii_4_data_bps2, bps2);
%inoffice(tii_4_data_bpd2, bpd2);
%inoffice(tii_4_data_pulse2, pulse2);
%inoffice(tii_4_data_bps3, bps3);
%inoffice(tii_4_data_bpd3, bpd3);
%inoffice(tii_4_data_pulse3, pulse3);
%inoffice(tii_4_data_bp_comment, bp_comment);
%inoffice(tii_4_data_drink, drink);
%inoffice(tii_4_data_usmp, usmp);
%inoffice(tii_4_data_utime, utime);
%inoffice(tii_4_data_sg1, sg1);
%inoffice(tii_4_data_sg2, sg2);
%inoffice(tii_4_data_freez_datetime, freez_datetime);
%inoffice(tii_4_data_freez_box, freez_box);
%inoffice(tii_4_data_usmp_comt, usmp_comt);
%inoffice(tii_4_data_notes, notes);




proc contents data=_4_echo.Tii_4_inoffice_20190628 order=varnum; run;

proc freq data=_4_echo.Tii_4_inoffice_20190628;
tables
tii_4_data_sc data_coordinator
tii_4_data_ra data_assistant
tii_4_data_center data_center
tii_4_data_site data_site
;
run;

proc freq data=_4_echo.Tii_4_bascsrs_2019411;
tables basc_sex; run;

/*drop unnecessary Age 4 in-office variables*/
data _4_echo.Tii_4_inoffice_20191126; set _4_echo.Tii_4_inoffice_20190628;
drop data_coordinator data_assistant data_center data_site
office_6a_3 office_6a_3_other office_6b_3 office_6b_3_other
office_6c_1 office_6c_2 office_6c_3 office_6c_3_other
office_7x_3
office_7x_3_other
office_7y_3
office_7y_3_other
office_7z_3
office_7z_3_other
inoffice_food_and_me_v_1
;
run;


/*restart - export new in-office from master
		  - export new in-office from old*/
/*format for easy proc compare*/
/*proc compare*/
/*rename*/


data age4.inoffice_20191126; set age4.Inoffice_20190628;
run;

/*proc compare betwen old and new*/
libname compare "J:\PM\TIDES_Data\TIDES II Age 4\In Office\Proc compare between old and new - delete post"; run;

proc sort data=compare.Inoffice_20191126;
by study_id;
run;

proc sort data=compare.Tii_4_inoffice_20190628;
by study_id;
run;

ods pdf file="J:\PM\TIDES_Data\TIDES II Age 4\In Office\Proc compare between old and new - delete post\output of compare.pdf";
proc compare base=compare.Tii_4_inoffice_20190628 compare=compare.Inoffice_20191126 nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5 listvar;
id study_id; run;
ods pdf close;

/*SAME*/
/*build off of 20191126 - less variables*/
data _4_echo.tii_4_inoffice_20191126; set age4.Inoffice_20191126; run;

%macro inoffice(new,old);
proc compare base=_4_echo.tii_4_inoffice_20191126 compare=_4_echo.Tii_4_inoffice_20180822 nodate briefsummary maxprint=1000 METHOD=PERCENT CRITERION=5;
id study_id;
var &new;
with &old;
run;
%mend;
%inoffice(tii_4_office_date, v1_inoffice_qdate);
%inoffice(data_date, v1date);
%inoffice(tii_4_data_sc, coordinator);
%inoffice(tii_4_data_ra, assistant);
%inoffice(tii_4_data_center, center);
%inoffice(tii_4_data_site, site);
%inoffice(tii_4_data_start_time, start_time);
%inoffice(tii_4_data_end_time, end_time);
%inoffice(office_1, mq1);
%inoffice(office_2, mq2);
%inoffice(office_2a, mq2a);
%inoffice(office_2b, mq2b);
%inoffice(office_2c, mq2c);
%inoffice(office_2d, mq2d);
%inoffice(office_2e, mq2e);
%inoffice(office_2e_oth, mq2e_oth);
%inoffice(office_3a, mq3a);
%inoffice(office_3b, mq3b);
%inoffice(office_3c, mq3c);
%inoffice(office_3d, mq3d);
%inoffice(office_3e, mq3e);
%inoffice(office_4a, mq4a);
%inoffice(office_4b, mq4b);
%inoffice(office_4c, mq4c);
%inoffice(office_4d, mq4d);
%inoffice(office_4e, mq4e);
%inoffice(office_4f, mq4f);
%inoffice(office_5a, mq5a);
%inoffice(office_5b, mq5b);
%inoffice(office_5c, mq5c);
%inoffice(office_6, mq6);
%inoffice(office_6a_1, mq6a);
%inoffice(office_6a_2, mq6a1);
%inoffice(office_6b_1, mq6b);
%inoffice(office_6b_2, mq6b1);
%inoffice(office_7_yn, mq6c);
%inoffice(office_7_sp, mq6cn);
%inoffice(office_7x_1, mq6c1a);
%inoffice(office_7x_2, mq6c1b);
%inoffice(office_7y_1, mq6c2a);
%inoffice(office_7y_2, mq6c2b);
%inoffice(office_7z_1, mq6c3a);
%inoffice(office_7z_2, mq6c3b);
%inoffice(office_8, mq7);
%inoffice(office_8a, mq7a);
%inoffice(data_ht1, ht1);
%inoffice(data_ht2, ht2);
%inoffice(data_ht3, ht3);
%inoffice(data_ht_comment, ht_comment);
%inoffice(data_wgt1, wgt1);
%inoffice(data_wgt2, wgt2);
%inoffice(data_wgt3, wgt3);
%inoffice(data_wgt_comment, wgt_comment);
%inoffice(data_wgt_scale, wgt_scale);
%inoffice(data_triskin1, triskin1);
%inoffice(data_triskin2, triskin2);
%inoffice(data_triskin3, triskin3);
%inoffice(data_triskin_comment, triskin_comment);
%inoffice(data_subskin1, subskin1);
%inoffice(data_subskin2, subskin2);
%inoffice(data_subskin3, subskin3);
%inoffice(data_subskin_comment, subskin_comment);
%inoffice(tii_4_data_dgtln_hand, dgtln_hand);
%inoffice(tii_4_data_dgtln1_2, dgtln1_2);
%inoffice(tii_4_data_dgtln1_4, dgtln1_4);
%inoffice(tii_4_data_dgtln2_2, dgtln2_2);
%inoffice(tii_4_data_dgtln2_4, dgtln2_4);
%inoffice(tii_4_data_dgtln3_2, dgtln3_2);
%inoffice(tii_4_data_dgtln3_4, dgtln3_4);
%inoffice(tii_4_data_dgtln_comment, dgtln_comment);
%inoffice(tii_4_data_bps1, bps1);
%inoffice(tii_4_data_bpd1, bpd1);
%inoffice(tii_4_data_pulse1, pulse1);
%inoffice(tii_4_data_bps2, bps2);
%inoffice(tii_4_data_bpd2, bpd2);
%inoffice(tii_4_data_pulse2, pulse2);
%inoffice(tii_4_data_bps3, bps3);
%inoffice(tii_4_data_bpd3, bpd3);
%inoffice(tii_4_data_pulse3, pulse3);
%inoffice(tii_4_data_bp_comment, bp_comment);
%inoffice(tii_4_data_drink, drink);
%inoffice(tii_4_data_usmp, usmp);
%inoffice(tii_4_data_utime, utime);
%inoffice(tii_4_data_sg1, sg1);
%inoffice(tii_4_data_sg2, sg2);
%inoffice(tii_4_data_freez_datetime, freez_datetime);
%inoffice(tii_4_data_freez_box, freez_box);
%inoffice(tii_4_data_usmp_comt, usmp_comt);
%inoffice(tii_4_data_notes, notes);
