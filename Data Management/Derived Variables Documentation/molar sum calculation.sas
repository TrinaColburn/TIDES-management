libname horm "J:\PM\TIDES_Data\TIDES I Data\Hormones"; run;

data horm.t1; set hormones;
run;

data horm.prenatal_hormones; set horm.t1;
run;

libname phx "J:\PM\TIDES_Data\TIDES I Data\PhthalateData\Clean copies"; run;

data t3_phx_cdc; set phx.Newphthalates_20171013; run;

proc contents data=t3_phx_cdc order=varnum;
run;


/*Molar Sum Calculations*/
data t3_phx_cdc_1; set t3_phx_cdc;
rename studyid=study_id;
run;

data t3_phx_cdc_2; set t3_phx_cdc_1;
SumDEHP_3 =((t3_MEHP*(1/278.34348))+(t3_MEHHP*(1/294.34280))+(t3_MEOHP*(1/292.3286)))*100;
run;

data t3_phx_cdc_2; set t3_phx_cdc_2;
SumDEHP =((t3_MEHP*(1/278.34348))+(t3_MEHHP*(1/294.34280))+(t3_MEOHP*(1/292.3286))+(t3_MECPP*(1/308.3264)))*100;
run;

data t3_phx_cdc_2; set t3_phx_cdc_2;
SumDEHP_3_SGadj =((t3_MEHP_SGadj*(1/278.34348))+(t3_MEHHP_SGadj*(1/294.34280))+(t3_MEOHP_SGadj*(1/292.3286)))*100;
run;

data t3_phx_cdc_2; set t3_phx_cdc_2;
SumDEHP_SGadj =((t3_MEHP_SGadj*(1/278.34348))+(t3_MEHHP_SGadj*(1/294.34280))+(t3_MEOHP_SGadj*(1/292.3286))+(t3_MECPP_SGadj*(1/308.3264)))*100;
run;

data t3_phx_cdc_2; set t3_phx_cdc_2;
SumDBP=((t3_MiBP*(1/222.23716))+(t3_MBP*(1/222.23716)))*100;
run;

data t3_phx_cdc_2; set t3_phx_cdc_2;
SumDBP_SGadj=((t3_MiBP_SGadj*(1/222.23716))+(t3_MBP_SGadj*(1/222.23716)))*100;
run;


data phx.t3_phx_cdc_20190815; set t3_phx_cdc_2; run;

proc contents data=tmp1.t1phx_20190514 order=varnum;
run;
