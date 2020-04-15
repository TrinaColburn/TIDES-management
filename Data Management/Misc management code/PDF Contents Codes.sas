/*Proc Contents Codes*/

/*Trimester Qs*/
ods pdf file='J:\PM\TIDES_Data\Q1\Supporting Documents\Q1 contents.pdf';
proc contents data=deid1.Q1_22119_deid order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\Q2\Supporting documents\Q2 contents.pdf';
proc contents data=deid1.Q2_22119_deid order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\Q3\Q3\Q3 contents.pdf';
proc contents data=deid1.Q3_22119_deid order=varnum;
run;
ods pdf close;

/*Birth Exam and Birth Record Review*/

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\AGD Birth contents.pdf';
proc contents data=deid1.Agdbirth_tidesonly_02192019_deid order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\AGD One Year contents.pdf';
proc contents data=deid1.Agdy1_021719_deid order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\Birth Exam contents.pdf';
proc contents data=deid1.Birthexam_tides_21919_deid order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\BRR contents.pdf';
proc contents data=deid1.Brr_tidesonly_22019_deid order=varnum;
run;
ods pdf close;

/*BPA and Phthalates*/
/*BPA*/
ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\BPA contents.pdf';
proc contents data=bpa.Bpat1phenols368_02202019 order=varnum;
run;
ods pdf close;

/*Phthalates*/
ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\T1phx contents.pdf';
proc contents data=phth.T1phx_02202019 order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\T2phx contents.pdf';
proc contents data=phth.T2phx02202019 order=varnum;
run;
ods pdf close;

ods pdf file='J:\PM\TIDES_Data\De-identified Datasets\TIDES I\Additional Information\T3phx contents.pdf';
proc contents data=phth.T3phx02202019 order=varnum;
run;
ods pdf close;











