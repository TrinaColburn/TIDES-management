data Tii_4_srs_item_check; set tii_4_nd.Tii_4_srs_itemized_20190322;
ch_srs_16_1=ch_srs_16_1-1; ch_srs_16_2=ch_srs_16_2-1; ch_srs_16_3=4-ch_srs_16_3; ch_srs_16_4=ch_srs_16_4-1; ch_srs_16_5=ch_srs_16_5-1;
ch_srs_16_6=ch_srs_16_6-1; ch_srs_16_7=4-ch_srs_16_7; ch_srs_16_8=ch_srs_16_8-1; ch_srs_16_9=ch_srs_16_9-1; ch_srs_16_10=ch_srs_16_10-1;
ch_srs_16_11=4-ch_srs_16_11; ch_srs_16_12=4-ch_srs_16_12; ch_srs_16_13=ch_srs_16_13-1; ch_srs_16_14=ch_srs_16_14-1; ch_srs_16_15=4-ch_srs_16_15;
ch_srs_16_16=ch_srs_16_16-1; ch_srs_16_17=4-ch_srs_16_17; ch_srs_16_18=ch_srs_16_18-1; ch_srs_16_19=ch_srs_16_19-1; ch_srs_16_20=ch_srs_16_20-1;
ch_srs_16_21=4-ch_srs_16_21; ch_srs_16_22=4-ch_srs_16_22; ch_srs_16_23=ch_srs_16_23-1; ch_srs_16_24=ch_srs_16_24-1; ch_srs_16_25=ch_srs_16_25-1;
ch_srs_16_26=4-ch_srs_16_26; ch_srs_16_27=ch_srs_16_27-1; ch_srs_16_28=ch_srs_16_28-1; ch_srs_16_29=ch_srs_16_29-1; ch_srs_16_30=ch_srs_16_30-1;
ch_srs_16_31=ch_srs_16_31-1; ch_srs_16_32=4-ch_srs_16_32; ch_srs_16_33=ch_srs_16_33-1; ch_srs_16_34=ch_srs_16_34-1; ch_srs_16_35=ch_srs_16_35-1;
ch_srs_16_36=ch_srs_16_36-1; ch_srs_16_37=ch_srs_16_37-1; ch_srs_16_38=4-ch_srs_16_38; ch_srs_16_39=ch_srs_16_39-1; ch_srs_16_40=4-ch_srs_16_40;
ch_srs_16_41=ch_srs_16_41-1; ch_srs_16_42=ch_srs_16_42-1; ch_srs_16_43=4-ch_srs_16_43; ch_srs_16_44=ch_srs_16_44-1; ch_srs_16_45=4-ch_srs_16_45;
ch_srs_16_46=ch_srs_16_46-1; ch_srs_16_47=ch_srs_16_47-1; ch_srs_16_48=4-ch_srs_16_48; ch_srs_16_49=ch_srs_16_49-1; ch_srs_16_50=ch_srs_16_50-1;
ch_srs_16_51=ch_srs_16_51-1; ch_srs_16_52=4-ch_srs_16_52; ch_srs_16_53=ch_srs_16_53-1; ch_srs_16_54=ch_srs_16_54-1; ch_srs_16_55=4-ch_srs_16_55;
ch_srs_16_56=ch_srs_16_56-1; ch_srs_16_57=ch_srs_16_57-1; ch_srs_16_58=ch_srs_16_58-1; ch_srs_16_59=ch_srs_16_59-1; ch_srs_16_60=ch_srs_16_60-1;
ch_srs_16_61=ch_srs_16_61-1; ch_srs_16_62=ch_srs_16_62-1; ch_srs_16_63=ch_srs_16_63-1; ch_srs_16_64=ch_srs_16_64-1; ch_srs_16_65=ch_srs_16_65-1;
run;

proc compare base=tii_4_nd.Tii_4_srs_65_converted compare=Tii_4_srs_item_check; run;

data Tii_4_srs_item_check; set Tii_4_srs_item_check;
CH_SOC_AWA = ch_srs_16_2 + ch_srs_16_7 + ch_srs_16_25 + ch_srs_16_32 + ch_srs_16_45 + ch_srs_16_52 + ch_srs_16_54 + ch_srs_16_56;

CH_SOC_COG = ch_srs_16_5 + ch_srs_16_10 + ch_srs_16_15 + ch_srs_16_17 + ch_srs_16_30 + ch_srs_16_40 + 
			 ch_srs_16_42 + ch_srs_16_44 + ch_srs_16_48 + ch_srs_16_58 + ch_srs_16_59 + ch_srs_16_62;

CH_SOC_COM = ch_srs_16_12 + ch_srs_16_13 + ch_srs_16_16 + ch_srs_16_18 + ch_srs_16_19 + ch_srs_16_21 + ch_srs_16_22 + ch_srs_16_26 + 
			 ch_srs_16_33 + ch_srs_16_35 + ch_srs_16_36 + ch_srs_16_37 + ch_srs_16_38 + ch_srs_16_41 + ch_srs_16_46 + ch_srs_16_47 +
			 ch_srs_16_51 + ch_srs_16_53 + ch_srs_16_55 + ch_srs_16_57 + ch_srs_16_60 + ch_srs_16_61;
 			
CH_SOC_MOT = ch_srs_16_1 + ch_srs_16_3 + ch_srs_16_6 + ch_srs_16_9 + ch_srs_16_11 + ch_srs_16_23 + ch_srs_16_27 + ch_srs_16_34 + 
			 ch_srs_16_43 + ch_srs_16_64 + ch_srs_16_65;

CH_AUT_MAN = ch_srs_16_4 + ch_srs_16_8 + ch_srs_16_14 + ch_srs_16_20 + ch_srs_16_24 + ch_srs_16_28 + ch_srs_16_29 + ch_srs_16_31 + 
			 ch_srs_16_39 + ch_srs_16_49 + ch_srs_16_50 + ch_srs_16_63;
run;
 

proc sort data=tii_4_nd.Tii_4_bascsrs_2019411; by subject_Id; run;
proc sort data=Tii_4_srs_item_check; by subject_id; run;

proc compare base=tii_4_nd.Tii_4_bascsrs_2019411 compare=Tii_4_srs_item_check;
id subject_id;
var srs_raw_awr
rsrs_raw_cog
srs_raw_com
srs_raw_mot


; 
with CH_SOC_AWA  CH_SOC_COG CH_SOC_COM CH_SOC_MOT; run; 

proc univariate data=Tii_4_srs_item_check;
var CH_SOC_AWA  CH_SOC_COG CH_SOC_COM CH_SOC_MOT CH_AUT_MAN; run;

proc univariate data=tii_4_nd.Tii_4_bascsrs_2019411;
var CH_SOC_AWA  CH_SOC_COG CH_SOC_COM CH_SOC_MOT CH_AUT_MAN; run;
