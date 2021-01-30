***** Final Confounder Checking, Variables Workd, & Analysis****

use "Tides Q1 Q2 Q3 T1 T3 combined_drop Med_drop no GCT_var.dta"

tab sumGTT_cc

			/* sumGTT_cc |      Freq.     Percent        Cum.
			------------+-----------------------------------
					  0 |         66       45.83       45.83
					  1 |         20       13.89       59.72
					  2 |         14        9.72       69.44
					  3 |         10        6.94       76.39
					  4 |         34       23.61      100.00
			------------+-----------------------------------
				  Total |        144      100.00 */ 

tab IGTcat_cc

 /* IGTcat_cc |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        532       78.70       78.70
          1 |         66        9.76       88.46
          2 |         20        2.96       91.42
          3 |         58        8.58      100.00
------------+-----------------------------------
      Total |        676      100.00 */ 

*no flag on GCT (135 cutoff)=0
*failed GCT, normal on all GTT = 1
*1 exceedance on any = 2
*2 or more exceedance on any = 3

**creating diagnosis categories

*GDM based on cc classification
gen GDM_cc=. 
replace GDM_cc= 1 if IGTcat_cc ==3
replace GDM_cc=0 if IGTcat_cc !=3 


*failed GCT, normal on all GTT
gen failGCT_normGTT=.
replace failGCT_normGTT = 1 if IGTcat_cc ==1
replace failGCT_normGTT = 0 if IGTcat_cc !=1

******NEW CATEGORY BASED ON NOT FAILING OGTT, rather than NORMAL ON ALL***
*IGT_update
gen IGT_update=.
replace IGT_update = 1 if IGTcat_cc ==1 | IGTcat_cc ==2
replace IGT_update = 0 if IGTcat_cc !=1 & IGTcat_cc !=2

*normal
gen normal_glucose =. 
replace normal_glucose =1 if IGTcat_cc==0
replace normal_glucose =0 if IGTcat_cc!=0


**parity variable
*T2_Q12 = ever pregnant before this pregnancy 

tab T2_Q12

 /*       Ever |
   pregnant |
before this |
 pregnancy       |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        255       38.93       38.93
          1 |        400       61.07      100.00
------------+-----------------------------------
      Total |        655      100.00*/ 


*T2_Q12_B_ = outcomes of previous pregnancy 

replace parous =1 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==1 | T2_Q12B_2_OUTCOME ==1 | T2_Q12B_3_OUTCOME ==1 | T2_Q12B_4_OUTCOME ==1 | T2_Q12B_5_OUTCOME ==1 | T2_Q12B_6_OUTCOME ==1 | T2_Q12B_7_OUTCOME ==1 | T2_Q12B_8_OUTCOME ==1 | T2_Q12B_9_OUTCOME ==1 | T2_Q12B_10_OUTCOME ==1 | T2_Q12B_11_OUTCOME ==1 | T2_Q12B_12_OUTCOME ==1 | T2_Q12B_1_OUTCOME ==3 | T2_Q12B_2_OUTCOME ==3 | T2_Q12B_3_OUTCOME ==3 | T2_Q12B_4_OUTCOME ==3 | T2_Q12B_5_OUTCOME ==3 | T2_Q12B_6_OUTCOME ==3 | T2_Q12B_7_OUTCOME ==3 | T2_Q12B_8_OUTCOME ==3 | T2_Q12B_9_OUTCOME ==3 | T2_Q12B_10_OUTCOME ==3 | T2_Q12B_11_OUTCOME ==3 | T2_Q12B_12_OUTCOME ==3 | T2_Q12B_1_OUTCOME ==5 | T2_Q12B_2_OUTCOME ==5 | T2_Q12B_3_OUTCOME ==5 | T2_Q12B_4_OUTCOME ==5 | T2_Q12B_5_OUTCOME ==5 | T2_Q12B_6_OUTCOME ==5 | T2_Q12B_7_OUTCOME ==5 | T2_Q12B_8_OUTCOME ==5 | T2_Q12B_9_OUTCOME ==5 | T2_Q12B_10_OUTCOME ==5 | T2_Q12B_11_OUTCOME ==5 | T2_Q12B_12_OUTCOME ==5)
replace parous =0 if (T2_Q12 ==1 & T2_Q12B_1_OUTCOME !=1 & T2_Q12B_2_OUTCOME !=1 & T2_Q12B_3_OUTCOME !=1 & T2_Q12B_4_OUTCOME !=1 & T2_Q12B_5_OUTCOME !=1 & T2_Q12B_6_OUTCOME !=1 & T2_Q12B_7_OUTCOME !=1 & T2_Q12B_8_OUTCOME !=1 & T2_Q12B_9_OUTCOME !=1 & T2_Q12B_10_OUTCOME !=1 & T2_Q12B_11_OUTCOME !=1 & T2_Q12B_12_OUTCOME !=1 & T2_Q12B_1_OUTCOME !=3 & T2_Q12B_2_OUTCOME !=3 & T2_Q12B_3_OUTCOME !=3 & T2_Q12B_4_OUTCOME !=3 & T2_Q12B_5_OUTCOME !=3 & T2_Q12B_6_OUTCOME !=3 & T2_Q12B_7_OUTCOME !=3 & T2_Q12B_8_OUTCOME !=3 & T2_Q12B_9_OUTCOME !=3 & T2_Q12B_10_OUTCOME !=3 & T2_Q12B_11_OUTCOME !=3 & T2_Q12B_12_OUTCOME !=3 & T2_Q12B_1_OUTCOME !=5 & T2_Q12B_2_OUTCOME !=5 & T2_Q12B_3_OUTCOME !=5 & T2_Q12B_4_OUTCOME !=5 & T2_Q12B_5_OUTCOME !=5 & T2_Q12B_6_OUTCOME !=5 & T2_Q12B_7_OUTCOME !=5 & T2_Q12B_8_OUTCOME !=5 & T2_Q12B_9_OUTCOME !=5 & T2_Q12B_10_OUTCOME !=5 & T2_Q12B_11_OUTCOME !=5 & T2_Q12B_12_OUTCOME !=5) | T2_Q12 ==0

tab parous, m

***understanding separate preg outcome categories:
gen parity_cat=. 
*no prior pregnancy
replace parity_cat =0 if T2_Q12 ==1

*live birth
replace parity_cat =1 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==1 | T2_Q12B_2_OUTCOME ==1 | T2_Q12B_3_OUTCOME ==1 | T2_Q12B_4_OUTCOME ==1 | T2_Q12B_5_OUTCOME ==1 | T2_Q12B_6_OUTCOME ==1 | T2_Q12B_7_OUTCOME ==1 | T2_Q12B_8_OUTCOME ==1 | T2_Q12B_9_OUTCOME ==1 | T2_Q12B_10_OUTCOME ==1 | T2_Q12B_11_OUTCOME ==1 | T2_Q12B_12_OUTCOME ==1)
*ectopic 
replace parity_cat =2 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==2 | T2_Q12B_2_OUTCOME ==2 | T2_Q12B_3_OUTCOME ==2 | T2_Q12B_4_OUTCOME ==2 | T2_Q12B_5_OUTCOME ==2 | T2_Q12B_6_OUTCOME ==2 | T2_Q12B_7_OUTCOME ==2 | T2_Q12B_8_OUTCOME ==2 | T2_Q12B_9_OUTCOME ==2 | T2_Q12B_10_OUTCOME ==2 | T2_Q12B_11_OUTCOME ==2 | T2_Q12B_12_OUTCOME ==2)
*induced abortion
replace parity_cat =3 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==3 | T2_Q12B_2_OUTCOME ==3 | T2_Q12B_3_OUTCOME ==3 | T2_Q12B_4_OUTCOME ==3 | T2_Q12B_5_OUTCOME ==3 | T2_Q12B_6_OUTCOME ==3 | T2_Q12B_7_OUTCOME ==3 | T2_Q12B_8_OUTCOME ==3 | T2_Q12B_9_OUTCOME ==3 | T2_Q12B_10_OUTCOME ==3 | T2_Q12B_11_OUTCOME ==3 | T2_Q12B_12_OUTCOME ==3)
*miscarriage
replace parity_cat =4 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==4 | T2_Q12B_2_OUTCOME ==4 | T2_Q12B_3_OUTCOME ==4 | T2_Q12B_4_OUTCOME ==4 | T2_Q12B_5_OUTCOME ==4 | T2_Q12B_6_OUTCOME ==4 | T2_Q12B_7_OUTCOME ==4 | T2_Q12B_8_OUTCOME ==4 | T2_Q12B_9_OUTCOME ==4 | T2_Q12B_10_OUTCOME ==4 | T2_Q12B_11_OUTCOME ==4 | T2_Q12B_12_OUTCOME ==4)
*stillbirth
replace parity_cat =5 if T2_Q12 ==1 & (T2_Q12B_1_OUTCOME ==5 | T2_Q12B_2_OUTCOME ==5 | T2_Q12B_3_OUTCOME ==5 | T2_Q12B_4_OUTCOME ==5 | T2_Q12B_5_OUTCOME ==5 | T2_Q12B_6_OUTCOME ==5 | T2_Q12B_7_OUTCOME ==5 | T2_Q12B_8_OUTCOME ==5 | T2_Q12B_9_OUTCOME ==5 | T2_Q12B_10_OUTCOME ==5 | T2_Q12B_11_OUTCOME ==5 | T2_Q12B_12_OUTCOME ==5) 

***generating parity variable for analysis
gen parous_cat=.
replace parous_cat =0 if (parity_cat ==2 | parity_cat ==3 | parity_cat ==4) | T2_Q12==0
replace parous_cat =1 if parity_cat ==1 | parity_cat ==5 

*checking PCOS

tab T2_Q6G_YN 


  /*    PCOS, |
    yes/no       |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        594       92.96       92.96
          1 |         45        7.04      100.00
------------+-----------------------------------
      Total |        639      100.00 */ 

*how many cases of GDM also have PCOS? 
tab GDM_cc T2_Q6G_YN 
	  
	  
*checking MCNP & MCOP values
sum mCNP_SGadj if Sex==1
sum mCNP_SGadj if Sex==2
sum mCOP_SGadj if Sex==1
sum mCOP_SGadj if Sex==2

*checking Asian women in the population
tab raceth 
*checking outcomes by race
tab raceth GDM_cc
tab raceth failGCT_normGTT



*4-20-18 --- CREATING & CHECKING PARITY CAT

gen Parity_cat=.
replace Parity_cat=0 if parity==0
replace Parity_cat=1 if parity>=1 & parity!=. 

tab Parity_cat, missing
/*
 Parity_cat |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        367       52.06       52.06
          1 |        296       41.99       94.04
          . |         42        5.96      100.00
------------+-----------------------------------
      Total |        705      100.00*/ 

****
*****labels
label define racethL 1 "non-Hispanic White" 2 "non-Hispanic Black" 3 "non-Hispnic Asian" 4 "Hispanic" 5 "Other/Mixed"
label values raceth racethL

label define centerL 6 "UCSF" 7 "UMN" 8 "URMC" 9 "UW"
label values Center centerL

label define parousL 0 "nulliparous" 1 "parous" 
label values Parity_cat parousL
	  
	  
	  
****************************************************************************
****************LOG TRANSFORMING PHTHALATES FOR ANALYSIS********************
****************************************************************************

*******phthalate stats********
*generate log-transformed T1 phthalates 
gen T1_logmiBP=log10(miBP_SGadj)
gen T1_logmEP=log10(mEP_SGadj)
gen T1_logmEOHP=log10(mEOHP_SGadj)
gen T1_logmEHP=log10(mEHP_SGadj)
gen T1_logmEHHP=log10(mEHHP_SGadj)
gen T1_logmECPP=log10(mECPP_SGadj)
gen T1_logmCPP=log10(mCPP_SGadj)
gen T1_logmCOP=log10(mCOP_SGadj)
gen T1_logmCNP=log10(mCNP_SGadj)
gen T1_logmBzP=log10(mBzP_SGadj)
gen T1_logmBP=log10(mBP_SGadj)
gen T1_logSumDEHP=log10(SumDEHP_SGadj)
gen T1_logSumDEHP3=log10(SumDEHP3_SGadj)
gen T1_logMMP=log10(MMP_SGadj)
gen T1_logMHiNCH=log10(MHiNCH_SGadj)
gen T1_logMolarSumDEHP=log10(MolarSumDEHP_SGadj)

*generate log-transformed T3 phthalates 
gen T3_logmiBP=log10(t3_mibp_sgx)
gen T3_logmEP=log10(t3_mep_sgx)
gen T3_logmEOHP=log10(t3_meohp_sgx)
gen T3_logmEHP=log10(t3_mehp_sgx)
gen T3_logmEHHP=log10(t3_mehhp_sgx)
gen T3_logmECPP=log10(t3_mecpp_sgx)
gen T3_logmCPP=log10(t3_mcpp_sgx)
gen T3_logmCOP=log10(t3_mcop_sgx)
gen T3_logmCNP=log10(t3_mcnp_sgx)
gen T3_logmBzP=log10(t3_mbzp_sgx)
gen T3_logmBP=log10(t3_mbp_sgx)
gen T3_logSumDEHP=log10(t3_sumDEHP_sgx)
gen T3_logMolarSumDEHP=log10(t3_molarsumDEHP_sgx)

*generate average T1 & T3 values 
egen T1T3_mean_logmiBP = rowmean(T1_logmiBP T3_logmiBP)
egen T1T3_mean_logmEP = rowmean(T1_logmEP T3_logmEP)
egen T1T3_mean_logmEOHP = rowmean(T1_logmEOHP T3_logmEOHP)
egen T1T3_mean_logmEHP = rowmean(T1_logmEHP T3_logmEHP)
egen T1T3_mean_logmEHHP = rowmean(T1_logmEHHP T3_logmEHHP)
egen T1T3_mean_logmECPP = rowmean(T1_logmECPP T3_logmECPP)
egen T1T3_mean_logmCPP = rowmean(T1_logmCPP T3_logmCPP)
egen T1T3_mean_logmCOP = rowmean(T1_logmCOP T3_logmCOP)
egen T1T3_mean_logmCNP = rowmean(T1_logmCNP T3_logmCNP)
egen T1T3_mean_logmBzP = rowmean(T1_logmBzP T3_logmBzP)
egen T1T3_mean_logmBP = rowmean(T1_logmBP T3_logmBP)
egen T1T3_mean_logSumDEHP = rowmean(T1_logSumDEHP T3_logSumDEHP)
egen T1T3_mean_logMolarSumDEHP = rowmean(T1_logMolarSumDEHP T3_logMolarSumDEHP)

*should we take the log after taking the average?
***RE-DOING the MEAN VALUES w/o EGEN, which KEEPS MISSING VALUES!!! 
*4-11-18**

*mEP
gen T1T3_Mean_mEP=.  
replace T1T3_Mean_mEP=((t3_mep_sgx + mEP_SGadj)/2)
gen log_T1T3_mean_mEP = log10(T1T3_Mean_mEP)

*mEOHP
gen T1T3_Mean_mEOHP=.  
replace T1T3_Mean_mEOHP=((t3_meohp_sgx + mEOHP_SGadj)/2)
gen log_T1T3_Mean_mEOHP = log10(T1T3_Mean_mEOHP)

*MCNP
gen T1T3_Mean_mCNP=.  
replace T1T3_Mean_mCNP=((t3_mcnp_sgx + mCNP_SGadj)/2)
gen log_T1T3_mean_mCNP = log10(T1T3_Mean_mCNP)

*MCOP
gen T1T3_Mean_mCOP=.  
replace T1T3_Mean_mCOP=((t3_mcop_sgx + mCOP_SGadj)/2)
gen log_T1T3_mean_mCOP = log10(T1T3_Mean_mCOP)

*Mbzp
gen T1T3_Mean_mBzP=.  
replace T1T3_Mean_mBzP=((t3_mbzp_sgx + mBzP_SGadj)/2)
gen log_T1T3_mean_mBzP = log10(T1T3_Mean_mBzP)

*mBP
gen T1T3_Mean_mBP=.  
replace T1T3_Mean_mBP=((t3_mbp_sgx + mBP_SGadj)/2)
gen log_T1T3_mean_mBP = log10(T1T3_Mean_mBP)

*mEHP
gen T1T3_Mean_mEHP=.  
replace T1T3_Mean_mEHP=((t3_mehp_sgx + mEHP_SGadj)/2)
gen log_T1T3_Mean_mEHP = log10(T1T3_Mean_mEHP)

*mEHHP
gen T1T3_Mean_mEHHP=.  
replace T1T3_Mean_mEHHP=((t3_mehhp_sgx + mEHHP_SGadj)/2)
gen log_T1T3_Mean_mEHHP = log10(T1T3_Mean_mEHHP)

*mECPP
gen T1T3_Mean_mECPP=.  
replace T1T3_Mean_mECPP=((t3_mecpp_sgx + mECPP_SGadj)/2)
gen log_T1T3_Mean_mECPP = log10(T1T3_Mean_mECPP)

*mCPP
gen T1T3_Mean_mCPP=.  
replace T1T3_Mean_mCPP=((t3_mcpp_sgx + mCPP_SGadj)/2)
gen log_T1T3_Mean_mCPP = log10(T1T3_Mean_mCPP)

*miBP
gen T1T3_Mean_miBP=.  
replace T1T3_Mean_miBP=((t3_mibp_sgx + miBP_SGadj)/2)
gen log_T1T3_mean_miBP = log10(T1T3_Mean_miBP)

*DEHP
gen T1T3_Mean_DEHP=.  
replace T1T3_Mean_DEHP=((t3_molarsumDEHP_sgx + MolarSumDEHP_SGadj)/2)
gen log_T1T3_mean_DEHP = log10(T1T3_Mean_DEHP)


*updated average phthalate values
sum log_T1T3_mean_DEHP
sum log_T1T3_mean_miBP
sum log_T1T3_Mean_mCPP
sum log_T1T3_Mean_mECPP
sum log_T1T3_Mean_mEHHP
sum log_T1T3_Mean_mEHP
sum log_T1T3_mean_mBP
sum log_T1T3_mean_mBzP
sum log_T1T3_mean_mCOP
sum log_T1T3_mean_mCNP
sum log_T1T3_Mean_mEOHP
sum log_T1T3_mean_mEP






*ALTERNATIVE generate average T1 & T3 values 
*mibp
gen T1T3_mean_logmiBP_gen =.
replace T1T3_mean_logmiBP_gen = avg(T1_logmiBP, T3_logmiBP)


egen T1T3_mean_logmEP = rowmean(T1_logmEP T3_logmEP)
egen T1T3_mean_logmEOHP = rowmean(T1_logmEOHP T3_logmEOHP)
egen T1T3_mean_logmEHP = rowmean(T1_logmEHP T3_logmEHP)
egen T1T3_mean_logmEHHP = rowmean(T1_logmEHHP T3_logmEHHP)
egen T1T3_mean_logmECPP = rowmean(T1_logmECPP T3_logmECPP)
egen T1T3_mean_logmCPP = rowmean(T1_logmCPP T3_logmCPP)
egen T1T3_mean_logmCOP = rowmean(T1_logmCOP T3_logmCOP)
egen T1T3_mean_logmCNP = rowmean(T1_logmCNP T3_logmCNP)
egen T1T3_mean_logmBzP = rowmean(T1_logmBzP T3_logmBzP)
egen T1T3_mean_logmBP = rowmean(T1_logmBP T3_logmBP)
egen T1T3_mean_logSumDEHP = rowmean(T1_logSumDEHP T3_logSumDEHP)
egen T1T3_mean_logMolarSumDEHP = rowmean(T1_logMolarSumDEHP T3_logMolarSumDEHP)

*generate phthalate categories
*HMW T1
gen HMW_T1 =.
replace HMW_T1 = log10(((mBzP_SGadj/256) + (mCPP_SGadj/252) + (mEHP_SGadj/278) + (mECPP_SGadj/308) + (mEHHP_SGadj/294) + (mEOHP_SGadj/292)*100))
sum HMW_T1

*HMW T1/T3 
gen HMW_T1T3_mean =.
gen HMW_T3 = log10(((t3_mbzp_sgx/256) + (t3_mcpp_sgx/252) + (t3_mehp_sgx/278) + (t3_mecpp_sgx/308) + (t3_mehhp_sgx/294) + (t3_meohp_sgx/292)*100))
replace HMW_T1T3_mean = ((HMW_T3+HMW_T1)/2)
sum HMW_T1T3_mean

*LMW T1
gen LMW_T1=.
replace LMW_T1 = log10(((mEP_SGadj/194) + (miBP_SGadj/222) + (mBP_SGadj/222)*100))
sum LMW_T1

*LMW T1/T3
gen LMW_T1T3_mean=.
gen LMW_T3= log10(((t3_mbzp_sgx/194) + (t3_mibp_sgx/222) + (t3_mbp_sgx/222)*100))
replace LMW_T1T3_mean = ((LMW_T3+LMW_T1)/2)
sum LMW_T1T3_mean

****************************************************************
***************CORRELATIONS************************************
*****************************************************************

************************************************************
***********T1 & T3 PHTHALATE CORRELATIONS*******************
************************************************************


codebook mBP_SGadj
codebook mBzP_SGadj
codebook miBP_SGadj
codebook mEP_SGadj
codebook mCNP_SGadj
codebook mCOP_SGadj
codebook mCPP_SGadj
codebook mEHP_SGadj
codebook mEHHP_SGadj
codebook mEOHP_SGadj
codebook mECPP_SGadj
codebook MolarSumDEHP_SGadj

sum mBP_SGadj
sum mBzP_SGadj
sum miBP_SGadj
sum mEP_SGadj
sum mCNP_SGadj
sum mCOP_SGadj
sum mCPP_SGadj
sum mEHP_SGadj
sum mEHHP_SGadj
sum mEOHP_SGadj
sum mECPP_SGadj
sum MolarSumDEHP_SGadj


codebook t3_mbp_sgx 
codebook t3_mbzp_sgx 
codebook t3_mibp_sgx 
codebook t3_mep_sgx 
codebook t3_mcnp_sgx
codebook t3_mcop_sgx 
codebook t3_mcpp_sgx 
codebook t3_mehp_sgx 
codebook t3_mehhp_sgx 
codebook t3_meohp_sgx 
codebook t3_mecpp_sgx 
codebook t3_molarsumDEHP_sgx

sum t3_mbp_sgx 
sum t3_mbzp_sgx 
sum t3_mibp_sgx 
sum t3_mep_sgx 
sum t3_mcnp_sgx
sum t3_mcop_sgx 
sum t3_mcpp_sgx 
sum t3_mehp_sgx 
sum t3_mehhp_sgx 
sum t3_meohp_sgx 
sum t3_mecpp_sgx 
sum t3_molarsumDEHP_sgx

**TABLES
tabstat mBP_SGadj mBzP_SGadj miBP_SGadj mEP_SGadj mCNP_SGadj mCOP_SGadj mCPP_SGadj mEHP_SGadj mEHHP_SGadj mEOHP_SGadj mECPP_SGadj MolarSumDEHP_SGadj, stat(n q mean sd) col(stat)
tabstat t3_mbp_sgx t3_mbzp_sgx t3_mibp_sgx t3_mep_sgx t3_mcnp_sgx t3_mcop_sgx t3_mcpp_sgx t3_mehp_sgx t3_mehhp_sgx t3_meohp_sgx t3_mecpp_sgx t3_molarsumDEHP_sgx, stat(n q mean sd) col(stat)    

tabstat mBP_SGadj mBzP_SGadj miBP_SGadj mEP_SGadj mCNP_SGadj mCOP_SGadj mCPP_SGadj mEHP_SGadj mEHHP_SGadj mEOHP_SGadj mECPP_SGadj MolarSumDEHP_SGadj, by(raceth) stat(mean sd median IQR) labelwidth(20) varwidth(10) long format(%4.2f)

svyset [w=T1_logmiBP], strata(raceth) vce(linearized)
svy: 
mean T1_logmiBP
ereturn display, eform(geo_mean)


*mibp
mean T1_logmiBP
ereturn display, eform(geo_mean)
*mep
mean T1_logmEP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)

mean T1_logmiBP
ereturn display, eform(geo_mean)





spearman t3_mbp_sgx mBP_SGadj
spearman t3_mbzp_sgx mBzP_SGadj
spearman t3_mibp_sgx miBP_SGadj
spearman t3_mep_sgx mEP_SGadj
spearman t3_mcnp_sgx mCNP_SGadj
spearman t3_mcop_sgx mCOP_SGadj
spearman t3_mcpp_sgx mCPP_SGadj
spearman t3_mehp_sgx mEHP_SGadj
spearman t3_mehhp_sgx mEHHP_SGadj
spearman t3_meohp_sgx mEOHP_SGadj
spearman t3_mecpp_sgx mECPP_SGadj
spearman t3_molarsumDEHP_sgx MolarSumDEHP_SGadj


tabulate mBP_LOD
tabulate mBzP_LOD
tabulate mCPP_LOD
tabulate mECPP_LOD
tabulate mEHHP_LOD
tabulate mEHP_LOD
tabulate mEOHP_LOD
tabulate mEP_LOD
tabulate miBP_LOD
tabulate mCNP_LOD

*********************************************************************
*******************CRUDE ANALYSES ***********************************
**********************************************************************


**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP
logistic GDM_cc T1_logmEP
logistic GDM_cc T1_logmEOHP
logistic GDM_cc T1_logmEHP
logistic GDM_cc T1_logmEHHP
logistic GDM_cc T1_logmECPP
logistic GDM_cc T1_logmCPP
logistic GDM_cc T1_logmCOP 
logistic GDM_cc T1_logmCNP
logistic GDM_cc T1_logmBzP
logistic GDM_cc T1_logmBP
logistic GDM_cc T1_logSumDEHP
logistic GDM_cc T1_logMolarSumDEHP

*T1/T3 average phthalates 
logistic GDM_cc T1T3_mean_logmiBP
logistic GDM_cc T1T3_mean_logmEP
logistic GDM_cc T1T3_mean_logmEOHP
logistic GDM_cc T1T3_mean_logmEHP
logistic GDM_cc T1T3_mean_logmEHHP
logistic GDM_cc T1T3_mean_logmECPP
logistic GDM_cc T1T3_mean_logmCPP
logistic GDM_cc T1T3_mean_logmCOP 
logistic GDM_cc T1T3_mean_logmCNP 
logistic GDM_cc T1T3_mean_logmBzP
logistic GDM_cc T1T3_mean_logmBP
logistic GDM_cc T1T3_mean_logSumDEHP
logistic GDM_cc T1T3_mean_logMolarSumDEHP

*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP
logistic failGCT_normGTT T1_logmEP
logistic failGCT_normGTT T1_logmEOHP
logistic failGCT_normGTT T1_logmEHP
logistic failGCT_normGTT T1_logmEHHP
logistic failGCT_normGTT T1_logmECPP
logistic failGCT_normGTT T1_logmCPP 
logistic failGCT_normGTT T1_logmCOP 
logistic failGCT_normGTT T1_logmCNP 
logistic failGCT_normGTT T1_logmBzP
logistic failGCT_normGTT T1_logmBP
logistic failGCT_normGTT T1_logSumDEHP
logistic failGCT_normGTT T1_logMolarSumDEHP


*T1/T3 average 
logistic failGCT_normGTT T1T3_mean_logmiBP
logistic failGCT_normGTT T1T3_mean_logmEP
logistic failGCT_normGTT T1T3_mean_logmEOHP
logistic failGCT_normGTT T1T3_mean_logmEHP
logistic failGCT_normGTT T1T3_mean_logmEHHP
logistic failGCT_normGTT T1T3_mean_logmECPP
logistic failGCT_normGTT T1T3_mean_logmCPP
logistic failGCT_normGTT T1T3_mean_logmCOP
logistic failGCT_normGTT T1T3_mean_logmCNP
logistic failGCT_normGTT T1T3_mean_logmBzP
logistic failGCT_normGTT T1T3_mean_logmBP
logistic failGCT_normGTT T1T3_mean_logSumDEHP
logistic failGCT_normGTT T1T3_mean_logMolarSumDEHP


*IGT

*T1 phthalates 
logistic IGT T1_logmiBP
logistic IGT T1_logmEP
logistic IGT T1_logmEOHP
logistic IGT T1_logmEHP
logistic IGT T1_logmEHHP
logistic IGT T1_logmECPP
logistic IGT T1_logmCPP
logistic IGT T1_logmCOP if Sex ==1 
logistic IGT T1_logmCNP if Sex ==1
logistic IGT T1_logmBzP
logistic IGT T1_logmBP
logistic IGT T1_logSumDEHP
logistic IGT T1_logMolarSumDEHP

*T1/T3 average 
logistic IGT T1T3_mean_logmiBP
logistic IGT T1T3_mean_logmEP
logistic IGT T1T3_mean_logmEOHP
logistic IGT T1T3_mean_logmEHP
logistic IGT T1T3_mean_logmEHHP
logistic IGT T1T3_mean_logmECPP
logistic IGT T1T3_mean_logmCPP
logistic IGT T1T3_mean_logmCOP if Sex ==1
logistic IGT T1T3_mean_logmCNP if Sex ==1
logistic IGT T1T3_mean_logmBzP
logistic IGT T1T3_mean_logmBP
logistic IGT T1T3_mean_logSumDEHP
logistic IGT T1T3_mean_logMolarSumDEHP


*********************************************************************
*******************MINIMALLY ADJUSTED ***********************************
***************maternal age & BMI***************************
**********************************************************************


**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI
logistic GDM_cc T1_logmEP Age_Yrs MomBMI
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI 
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI 
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI
logistic GDM_cc T1_logmBP Age_Yrs MomBMI
logistic GDM_cc T1_logSumDEHP Age_Yrs MomBMI
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI

*T1/T3 average phthalates 
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI
logistic GDM_cc log_T1T3_mean_mCOP Age_Yrs MomBMI 
logistic GDM_cc log_T1T3_mean_mCNP Age_Yrs MomBMI 
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logSumDEHP Age_Yrs MomBMI
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI

*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmEP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmEOHP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmEHP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmEHHP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmECPP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmCPP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmCOP Age_Yrs MomBMI 
logistic failGCT_normGTT T1_logmCNP Age_Yrs MomBMI 
logistic failGCT_normGTT T1_logmBzP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logmBP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logSumDEHP Age_Yrs MomBMI
logistic failGCT_normGTT T1_logMolarSumDEHP Age_Yrs MomBMI


*T1/T3 average 
logistic failGCT_normGTT T1T3_mean_logmiBP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmEP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmEOHP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmEHP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmEHHP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmECPP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmCPP Age_Yrs MomBMI
logistic failGCT_normGTT log_T1T3_mean_mCOP Age_Yrs MomBMI 
logistic failGCT_normGTT log_T1T3_mean_mCNP Age_Yrs MomBMI 
logistic failGCT_normGTT T1T3_mean_logmBzP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logmBP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logSumDEHP Age_Yrs MomBMI
logistic failGCT_normGTT T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI


*IGT

*T1 phthalates 
logistic IGT T1_logmiBP Age_Yrs MomBMI
logistic IGT T1_logmEP Age_Yrs MomBMI
logistic IGT T1_logmEOHP Age_Yrs MomBMI
logistic IGT T1_logmEHP Age_Yrs MomBMI
logistic IGT T1_logmEHHP Age_Yrs MomBMI
logistic IGT T1_logmECPP Age_Yrs MomBMI
logistic IGT T1_logmCPP Age_Yrs MomBMI
logistic IGT T1_logmCOP Age_Yrs MomBMI if Sex ==1
logistic IGT T1_logmCNP Age_Yrs MomBMI if Sex ==1
logistic IGT T1_logmBzP Age_Yrs MomBMI
logistic IGT T1_logmBP Age_Yrs MomBMI
logistic IGT T1_logSumDEHP Age_Yrs MomBMI
logistic IGT T1_logMolarSumDEHP Age_Yrs MomBMI

*T1/T3 average 
logistic IGT T1T3_mean_logmiBP Age_Yrs MomBMI 
logistic IGT T1T3_mean_logmEP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmEOHP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmEHP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmEHHP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmECPP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmCPP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmCOP Age_Yrs MomBMI if Sex ==1
logistic IGT T1T3_mean_logmCNP Age_Yrs MomBMI if Sex ==1
logistic IGT T1T3_mean_logmBzP Age_Yrs MomBMI
logistic IGT T1T3_mean_logmBP Age_Yrs MomBMI
logistic IGT T1T3_mean_logSumDEHP Age_Yrs MomBMI 
logistic IGT T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI

*********************************************************************
*******************EXTENDED ADJUSTED ***********************************
******************************************
**********************************************************************


**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 

*T1/T3 average phthalates 
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 

*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 


*T1/T3 average 
logistic failGCT_normGTT T1T3_mean_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic failGCT_normGTT T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 


*IGT

*T1 phthalates 
logistic IGT T1_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 

*T1/T3 average 
logistic IGT T1T3_mean_logmiBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  
logistic IGT T1T3_mean_logmEP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmEOHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmEHHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmECPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmCPP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmCOP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmCNP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmBzP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logmBP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic IGT T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI i.raceth anysmoke i.ed_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 


*********************************************************************
*******************DATA-DRIVEN: ***********************************
******************************************
**********************************************************************


***GDM
*model building
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic GDM_cc T1_logmEP Age_Yrs MomBMI https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e= 
logistic GDM_cc T1_logmEP Age_Yrs MomBMI Sex

**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

**GDM - race interaction term
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmiBP#i.raceth
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmEP#i.raceth
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmEOHP#i.raceth
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmEHP#i.raceth
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmEHHP#i.raceth
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmECPP#i.raceth
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmCPP#i.raceth
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmCOP#i.raceth
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmCNP#i.raceth
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmBzP#i.raceth
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmBP#i.raceth
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logMolarSumDEHP#i.raceth

*LR test
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmiBP#i.raceth
estimates store full
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmEP#i.raceth
estimates store full
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth i.Parity_cat c.T1_logmBP#i.raceth
estimates store full
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full



**GDM - race interaction term w/o parity
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth c.T1_logmiBP#i.raceth
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth c.T1_logmEP#i.raceth
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.raceth c.T1_logmEOHP#i.raceth
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.raceth c.T1_logmEHP#i.raceth
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.raceth c.T1_logmEHHP#i.raceth
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.raceth c.T1_logmECPP#i.raceth
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.raceth c.T1_logmCPP#i.raceth
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.raceth c.T1_logmCOP#i.raceth
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.raceth c.T1_logmCNP#i.raceth
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.raceth c.T1_logmBzP#i.raceth
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth c.T1_logmBP#i.raceth
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth c.T1_logMolarSumDEHP#i.raceth





**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat GWG_T1
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1


*T1/T3 average phthalates 
eststo: logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
eststo: logistic GDM_cc log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
estout, cells (b ci) *using T1T3gdm

*race interaction term
logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_miBP#i.raceth
logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_mEP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_Mean_mEOHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_Mean_mEHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_Mean_mEHHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_Mean_mECPP#i.raceth
logistic GDM_cc log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_Mean_mCPP#i.raceth
logistic GDM_cc log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_mCOP#i.raceth
logistic GDM_cc log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_mCNP#i.raceth
logistic GDM_cc log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_mBzP#i.raceth
logistic GDM_cc log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_mBP#i.raceth
logistic GDM_cc log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth Parity_cat c.log_T1T3_mean_DEHP#i.raceth

*race no parity
logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_miBP#i.raceth
logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mEP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mEOHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mEHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mEHHP#i.raceth
logistic GDM_cc log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mECPP#i.raceth
logistic GDM_cc log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mCPP#i.raceth
logistic GDM_cc log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mCOP#i.raceth
logistic GDM_cc log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mCNP#i.raceth
logistic GDM_cc log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mBzP#i.raceth
logistic GDM_cc log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mBP#i.raceth
logistic GDM_cc log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_DEHP#i.raceth


*LR test 
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth c.log_T1T3_Mean_mEOHP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth
lrtest full 

logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_miBP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth
lrtest full 


logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth c.log_T1T3_mean_mEP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth
lrtest full 

*LR test w/ parity 
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEOHP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_miBP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mEP#i.raceth
estimates store full
logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

*T1/T3 average phthalates 
logistic GDM_cc log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1
logistic GDM_cc log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parity GWG_T1

*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

*IGT_update 
logistic IGT_update T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat


*T1/T3 average 
 
logistic failGCT_normGTT log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
logistic failGCT_normGTT log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic failGCT_normGTT log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

*IGT_update 
logistic IGT_update log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
logistic IGT_update log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
logistic IGT_update log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat



*********************************************************************
*******************RACE STRATIFIED MODEL ***********************************
**********************************************************************


**GDM
*T1 phthalates 

*white 
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmEP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI parous_cat if raceth ==1 
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==1
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==1
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logmBP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==1

*NHB
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmEP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI parous_cat if raceth ==2 
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==2
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==2
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logmBP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==2

*asian
logistic GDM_cc T1_logmiBP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmEP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI i.Parity_cat if Sex ==1 & raceth ==3
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI i.Parity_cat if Sex ==1 & raceth ==3
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logmBP Age_Yrs MomBMI i.Parity_cat if raceth ==3
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI i.Parity_cat if raceth ==3

*hispanic

logistic GDM_cc T1_logmiBP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmEP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==4
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==4
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logmBP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==4

*other

logistic GDM_cc T1_logmiBP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmEP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmEHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmECPP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmCPP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==5
logistic GDM_cc T1_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==5
logistic GDM_cc T1_logmBzP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logmBP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==5


*T1/T3 average phthalates 
*white
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==1
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==1
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI parous_cat if raceth ==1
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==1

*black
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==2
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==2
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI parous_cat if raceth ==2
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==2

*asian
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==3
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==3
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI parous_cat if raceth ==3
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==3

*hispanic
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==4
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==4
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI parous_cat if raceth ==4
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==4

*other
logistic GDM_cc T1T3_mean_logmiBP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmEP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmEOHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmEHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmEHHP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmECPP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmCPP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmCOP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==5
logistic GDM_cc T1T3_mean_logmCNP Age_Yrs MomBMI parous_cat if Sex ==1 & raceth ==5
logistic GDM_cc T1T3_mean_logmBzP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logmBP Age_Yrs MomBMI parous_cat if raceth ==5
logistic GDM_cc T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI parous_cat if raceth ==5

*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic failGCT_normGTT T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic failGCT_normGTT T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat


*T1/T3 average 
logistic failGCT_normGTT T1T3_mean_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic failGCT_normGTT T1T3_mean_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic failGCT_normGTT T1T3_mean_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic failGCT_normGTT T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat

**IGT_update 
*T1 phthalates 
logistic IGT_update T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic IGT_update T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic IGT_update T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat

*T1/T3 average 
logistic IGT_update T1T3_mean_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic IGT_update T1T3_mean_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if Sex ==1
logistic IGT_update T1T3_mean_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat
logistic IGT_update T1T3_mean_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat 
logistic IGT_update T1T3_mean_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat

*********************************************************************
*******************CRUDE ANALYSES WIHTOUT PCOS ***********************************
**********************************************************************


**GDM
*T1 phthalates 
logistic GDM_cc T1_logmiBP
logistic GDM_cc T1_logmiBP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmEP
logistic GDM_cc T1_logmEP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmEOHP
logistic GDM_cc T1_logmEOHP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmEHP
logistic GDM_cc T1_logmEHP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmEHHP
logistic GDM_cc T1_logmEHHP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmECPP
logistic GDM_cc T1_logmECPP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmCPP
logistic GDM_cc T1_logmCPP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmCOP
logistic GDM_cc T1_logmCOP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmCNP
logistic GDM_cc T1_logmCNP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmBzP
logistic GDM_cc T1_logmBzP if T2_Q6G_YN ==0
logistic GDM_cc T1_logmBP
logistic GDM_cc T1_logmBP if T2_Q6G_YN ==0
logistic GDM_cc T1_logSumDEHP
logistic GDM_cc T1_logSumDEHP if T2_Q6G_YN ==0
logistic GDM_cc T1_logMolarSumDEHP
logistic GDM_cc T1_logMolarSumDEHP if T2_Q6G_YN ==0


*Failed GCT, normal GTT

*T1 phthalates 
logistic failGCT_normGTT T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0 
logistic failGCT_normGTT T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  parous_cat if T2_Q6G_YN ==0


*T1/T3 average 
 
logistic failGCT_normGTT log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0 
logistic failGCT_normGTT log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0 
logistic failGCT_normGTT log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0
logistic failGCT_normGTT log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  Parity_cat if T2_Q6G_YN ==0


*******************************************************************************

********CONTINOUS GCT ANALYSIS*************************
sum gct_1hr_g

***CRUDE
*T1 phthalates 
regress gct_1hr_g T1_logmiBP
regress gct_1hr_g T1_logmEP
regress gct_1hr_g T1_logmEOHP
regress gct_1hr_g T1_logmEHP
regress gct_1hr_g T1_logmEHHP
regress gct_1hr_g T1_logmECPP
regress gct_1hr_g T1_logmCPP
regress gct_1hr_g T1_logmCOP 
regress gct_1hr_g T1_logmCNP
regress gct_1hr_g T1_logmBzP
regress gct_1hr_g T1_logmBP
regress gct_1hr_g T1_logMolarSumDEHP

*mean T1/T3 phthalates
regress gct_1hr_g log_T1T3_mean_DEHP
regress gct_1hr_g log_T1T3_mean_miBP
regress gct_1hr_g log_T1T3_Mean_mCPP
regress gct_1hr_g log_T1T3_Mean_mECPP
regress gct_1hr_g log_T1T3_Mean_mEHHP
regress gct_1hr_g log_T1T3_Mean_mEHP
regress gct_1hr_g log_T1T3_mean_mBP
regress gct_1hr_g log_T1T3_mean_mBzP
regress gct_1hr_g log_T1T3_mean_mCOP
regress gct_1hr_g log_T1T3_mean_mCNP
regress gct_1hr_g log_T1T3_Mean_mEOHP
regress gct_1hr_g log_T1T3_mean_mEP


***MINIMALLY ADJUSTED

*T1 phthalates 
regress gct_1hr_g T1_logmiBP Age_Yrs MomBMI
regress gct_1hr_g T1_logmEP Age_Yrs MomBMI
regress gct_1hr_g T1_logmEOHP Age_Yrs MomBMI
regress gct_1hr_g T1_logmEHP Age_Yrs MomBMI
regress gct_1hr_g T1_logmEHHP Age_Yrs MomBMI
regress gct_1hr_g T1_logmECPP Age_Yrs MomBMI
regress gct_1hr_g T1_logmCPP Age_Yrs MomBMI
regress gct_1hr_g T1_logmCOP Age_Yrs MomBMI 
regress gct_1hr_g T1_logmCNP Age_Yrs MomBMI 
regress gct_1hr_g T1_logmBzP Age_Yrs MomBMI
regress gct_1hr_g T1_logmBP Age_Yrs MomBMI
regress gct_1hr_g T1_logSumDEHP Age_Yrs MomBMI
regress gct_1hr_g T1_logMolarSumDEHP Age_Yrs MomBMI

*T3 phthalates 
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI


****DATA DRIVEN ADJUSTMENT
*T1 phthalates 
regress gct_1hr_g T1_logmiBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat 
regress gct_1hr_g T1_logmBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logmBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g T1_logMolarSumDEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

*T3 phthalates 
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat


*white 
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.Parity_cat if raceth==1 
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.Parity_cat if raceth==1
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.Parity_cat if raceth==1


*asians 
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.Parity_cat if raceth==3 
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.Parity_cat if raceth==3 
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.Parity_cat if raceth==3
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.Parity_cat if raceth==3

****INTERACTION ***
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_DEHP#i.raceth 
estimates store full
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_miBP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mCPP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mECPP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEHHP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEHP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mBP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mBzP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mCOP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full


regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mCNP#i.raceth 
estimates store full
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEOHP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full


regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mEP#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full

*********************************************************************************
*********************************************************************************
********Creating phthalate quartiles*******************************

***T1 QUARTILES****
*mep
xtile T1__ln_mep_quart = T1_ln_mEP, nq(4)
tabulate T1_mep_quart, summarize (T1_ln_mEP)
label define QL 1 "Q1" 2 "Q2" 3 "Q3" 4 "Q4"
label values T1_mep_quart QL

*mBP
xtile T1_ln_mbp_quart = T1_ln_mBP, nq(4)
tabulate T1_ln_mbp_quart, summarize (T1_ln_mBP)
label values T1_ln_mbp_quart QL

*mibp
xtile T1_ln_mibp_quart = T1_ln_miBP, nq(4)
tabulate T1_ln_mibp_quart, summarize (T1_ln_miBP)
label values T1_ln_mibp_quart QL

*mEOHP
xtile T1_ln_meohp_quart = T1_ln_mEOHP, nq(4)
tabulate T1_ln_meohp_quart, summarize (T1_ln_mEOHP)
label values T1_ln_meohp_quart QL

*MCNP
xtile T1_ln_mcnp_quart = T1_ln_mCNP, nq(4)
tabulate T1_ln_mcnp_quart, summarize (T1_ln_mCNP)
label values T1_ln_mcnp_quart QL

*MCOP
xtile T1_ln_mcop_quart = T1_ln_mCOP, nq(4)
tabulate T1_ln_mcop_quart, summarize (T1_ln_mCOP)
label values T1_ln_mcop_quart QL

*Mbzp
xtile T1_ln_mbzp_quart = T1_ln_mBzP, nq(4)
tabulate T1_ln_mbzp_quart, summarize (T1_ln_mBzP)
label values T1_ln_mbzp_quart QL

*mEHP
xtile T1_ln_mehp_quart = T1_ln_mEHP, nq(4)
tabulate T1_ln_mehp_quart, summarize (T1_ln_mEHP)
label values T1_ln_mehp_quart QL

*mEHHP
xtile T1_ln_mehhp_quart = T1_ln_mEHHP, nq(4)
tabulate T1_ln_mehhp_quart, summarize (T1_ln_mEHHP)
label values T1_ln_mehhp_quart QL

*mECPP
xtile T1_ln_mecpp_quart = T1_ln_mECPP, nq(4)
tabulate T1_ln_mecpp_quart, summarize (T1_ln_mECPP)
label values T1_ln_mecpp_quart QL

*mCPP
xtile T1_ln_mcpp_quart = T1_ln_mCPP, nq(4)
tabulate T1_ln_mcpp_quart, summarize (T1_ln_mCPP)
label values T1_ln_mcpp_quart QL

*DEHP
xtile T1_ln_dehp_quart = T1_ln_MolarSumDEHP, nq(4)
tabulate T1_ln_dehp_quart, summarize (T1_ln_MolarSumDEHP)
label values T1_ln_dehp_quart QL


***T1/T3 QUARTILES****

*mep
xtile ln_T1T3_mep_quart = ln_T1T3_mean_mEP, nq(4)
tabulate ln_T1T3_mep_quart, summarize (ln_T1T3_mean_mEP)
label values ln_T1T3_mep_quart QL

*mBP
xtile ln_T1T3_mbp_quart = ln_T1T3_mean_mBP, nq(4)
tabulate ln_T1T3_mbp_quart, summarize (ln_T1T3_mean_mBP)
label values ln_T1T3_mbp_quart QL

*mibp
xtile ln_T1T3_mibp_quart = ln_T1T3_mean_miBP, nq(4)
tabulate ln_T1T3_mibp_quart, summarize (ln_T1T3_mean_miBP)
label values ln_T1T3_mibp_quart QL

*mEOHP
xtile ln_T1T3_meohp_quart = ln_T1T3_Mean_mEOHP, nq(4)
tabulate ln_T1T3_meohp_quart, summarize (ln_T1T3_Mean_mEOHP)
label values ln_T1T3_meohp_quart QL

*MCNP
xtile ln_T1T3_mcnp_quart = ln_T1T3_mean_mCNP, nq(4)
tabulate ln_T1T3_mcnp_quart, summarize (ln_T1T3_mean_mCNP)
label values ln_T1T3_mcnp_quart QL

*MCOP
xtile ln_T1T3_mcop_quart = ln_T1T3_mean_mCOP, nq(4)
tabulate ln_T1T3_mcop_quart, summarize (ln_T1T3_mean_mCOP)
label values ln_T1T3_mcop_quart QL

*Mbzp
xtile ln_T1T3_mbzp_quart = ln_T1T3_mean_mBzP, nq(4)
tabulate ln_T1T3_mbzp_quart, summarize (ln_T1T3_mean_mBzP)
label values ln_T1T3_mbzp_quart QL

*mEHP
xtile ln_T1T3_mehp_quart = ln_T1T3_Mean_mEHP, nq(4)
tabulate ln_T1T3_mehp_quart, summarize (ln_T1T3_Mean_mEHP)
label values ln_T1T3_mehp_quart QL

*mEHHP
xtile ln_T1T3_mehhp_quart = ln_T1T3_Mean_mEHHP, nq(4)
tabulate ln_T1T3_mehhp_quart, summarize (ln_T1T3_Mean_mEHHP)
label values ln_T1T3_mehhp_quart QL

*mECPP
xtile ln_T1T3_mecpp_quart = ln_T1T3_Mean_mECPP, nq(4)
tabulate ln_T1T3_mecpp_quart, summarize (ln_T1T3_Mean_mECPP)
label values ln_T1T3_mecpp_quart QL

*mCPP
xtile ln_T1T3_mcpp_quart = ln_T1T3_Mean_mCPP, nq(4)
tabulate ln_T1T3_mcpp_quart, summarize (ln_T1T3_Mean_mCPP)
label values ln_T1T3_mcpp_quart QL

*DEHP
xtile ln_T1T3_dehp_quart = ln_T1T3_mean_DEHP, nq(4)
tabulate ln_T1T3_dehp_quart, summarize (ln_T1T3_mean_DEHP)
label values ln_T1T3_dehp_quart QL

*********************************************************************************
*********************************************************************************
********Regression with quartiles*******************************

************
****GDM
***********
 
***T1 QUARTILES****
*LR test
constraint 1 T1_mep_quart Q2 = T1_mep_quart Q3 = T1_mep_quart Q4

*mep
logistic GDM_cc i.T1_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEP Quartiles (T1)") 
*mBP
logistic GDM_cc i.T1_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MBP Quartiles (T1)") 
*mibp
logistic GDM_cc i.T1_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MIBP Quartiles (T1)") 
*mEOHP
logistic GDM_cc i.T1_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEOHP Quartiles (T1)") 
*MCNP
logistic GDM_cc i.T1_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCNP Quartiles (T1)") 
*MCOP
logistic GDM_cc i.T1_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCOP Quartiles (T1)") 
*Mbzp
logistic GDM_cc i.T1_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MBZP Quartiles (T1)") 
*mEHP
logistic GDM_cc i.T1_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEHP Quartiles (T1)") 
*mEHHP
logistic GDM_cc i.T1_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEHHP Quartiles (T1)") 
*mECPP
logistic GDM_cc i.T1_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MECPP Quartiles (T1)") 
*mCPP
logistic GDM_cc i.T1_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCPP Quartiles (T1)") 
*DEHP
logistic GDM_cc i.T1_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("DEHP Quartiles (T1)") 

***T1/T3 QUARTILES****
*mep
logistic GDM_cc i.ln_T1T3_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mep_quart = 3.ln_T1T3_mep_quart = 4.ln_T1T3_mep_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI gct_date_ga 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEP Quartiles (T1T3 mean)") 
*mBP
logistic GDM_cc i.ln_T1T3_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mbp_quart = 3.ln_T1T3_mbp_quart = 4.ln_T1T3_mbp_quart
test 3.ln_T1T3_mbp_quart = 4.ln_T1T3_mbp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MBP Quartiles (T1T3 mean)")
*mibp
logistic GDM_cc i.ln_T1T3_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mibp_quart = 3.ln_T1T3_mibp_quart = 4.ln_T1T3_mibp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MIBP Quartiles (T1T3 mean)")
*mEOHP
logistic GDM_cc i.ln_T1T3_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_meohp_quart = 3.ln_T1T3_meohp_quart = 4.ln_T1T3_meohp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEOHP Quartiles (T1T3 mean)")
*MCNP
logistic GDM_cc i.ln_T1T3_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcnp_quart = 3.ln_T1T3_mcnp_quart = 4.ln_T1T3_mcnp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCNP Quartiles (T1T3 mean)")
*MCOP
logistic GDM_cc i.ln_T1T3_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcop_quart = 3.ln_T1T3_mcop_quart = 4.ln_T1T3_mcop_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCOP Quartiles (T1T3 mean)")
*Mbzp
logistic GDM_cc i.ln_T1T3_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mbzp_quart = 3.ln_T1T3_mbzp_quart = 4.ln_T1T3_mbzp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MBZP Quartiles (T1T3 mean)")
*mEHP
logistic GDM_cc i.ln_T1T3_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mehp_quart = 3.ln_T1T3_mehp_quart = 4.ln_T1T3_mehp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEHP Quartiles (T1T3 mean)")
*mEHHP
logistic GDM_cc i.ln_T1T3_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mehhp_quart = 3.ln_T1T3_mehhp_quart = 4.ln_T1T3_mehhp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MEHHP Quartiles (T1T3 mean)")
*mECPP
logistic GDM_cc i.ln_T1T3_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mecpp_quart = 3.ln_T1T3_mecpp_quart = 4.ln_T1T3_mecpp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MECPP Quartiles (T1T3 mean)")
*mCPP
logistic GDM_cc i.ln_T1T3_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcpp_quart = 3.ln_T1T3_mcpp_quart = 4.ln_T1T3_mcpp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("MCPP Quartiles (T1T3 mean)")
*DEHP
logistic GDM_cc i.ln_T1T3_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_dehp_quart = 3.ln_T1T3_dehp_quart = 4.ln_T1T3_dehp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of GDM") xtitle ("DEHP Quartiles (T1T3 mean)")

*******************
***IGT****
*******************


***T1 QUARTILES****
*mep
logistic failGCT_normGTT i.T1_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEP Quartiles (T1)")
*mBP
logistic failGCT_normGTT i.T1_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MBP Quartiles (T1)")
*mibp
logistic failGCT_normGTT i.T1_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MIBP Quartiles (T1)")
*mEOHP
logistic failGCT_normGTT i.T1_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEOHP Quartiles (T1)")
*MCNP
logistic failGCT_normGTT i.T1_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCNP Quartiles (T1)")
*MCOP
logistic failGCT_normGTT i.T1_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCOP Quartiles (T1)")
*Mbzp
logistic failGCT_normGTT i.T1_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MBZP Quartiles (T1)")
*mEHP
logistic failGCT_normGTT i.T1_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEHP Quartiles (T1)")
*mEHHP
logistic failGCT_normGTT i.T1_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEHHP Quartiles (T1)")
*mECPP
logistic failGCT_normGTT i.T1_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MECPP Quartiles (T1)")
*mCPP
logistic failGCT_normGTT i.T1_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCPP Quartiles (T1)")
*DEHP
logistic failGCT_normGTT i.T1_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("DEHP Quartiles (T1)")

***T1/T3 QUARTILES****
*mep
logistic IGT_update i.ln_T1T3_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mep_quart = 3.ln_T1T3_mep_quart = 4.ln_T1T3_mep_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEP Quartiles (T1T3 mean)")
*mBP
logistic IGT_update i.ln_T1T3_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mbp_quart = 3.ln_T1T3_mbp_quart = 4.ln_T1T3_mbp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MBP Quartiles (T1T3 mean)")
*mibp
logistic IGT_update i.ln_T1T3_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mibp_quart = 3.ln_T1T3_mibp_quart = 4.ln_T1T3_mibp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MIBP Quartiles (T1T3 mean)")
*mEOHP
logistic IGT_update i.ln_T1T3_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_meohp_quart = 3.ln_T1T3_meohp_quart = 4.ln_T1T3_meohp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEOHP Quartiles (T1T3 mean)")
*MCNP
logistic IGT_update i.ln_T1T3_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcnp_quart = 3.ln_T1T3_mcnp_quart = 4.ln_T1T3_mcnp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCNP Quartiles (T1T3 mean)")
*MCOP
logistic IGT_update i.ln_T1T3_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcop_quart = 3.ln_T1T3_mcop_quart = 4.ln_T1T3_mcop_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCOP Quartiles (T1T3 mean)")
*Mbzp
logistic IGT_update i.ln_T1T3_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mbzp_quart = 3.ln_T1T3_mbzp_quart = 4.ln_T1T3_mbzp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MBZP Quartiles (T1T3 mean)")
*mEHP
logistic IGT_update i.ln_T1T3_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mehp_quart = 3.ln_T1T3_mehp_quart = 4.ln_T1T3_mehp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEHP Quartiles (T1T3 mean)")
*mEHHP
logistic IGT_update i.ln_T1T3_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mehhp_quart = 3.ln_T1T3_mehhp_quart = 4.ln_T1T3_mehhp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MEHHP Quartiles (T1T3 mean)")
*mECPP
logistic IGT_update i.ln_T1T3_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mecpp_quart = 3.ln_T1T3_mecpp_quart = 4.ln_T1T3_mecpp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MECPP Quartiles (T1T3 mean)")
*mCPP
logistic IGT_update i.ln_T1T3_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_mcpp_quart = 3.ln_T1T3_mcpp_quart = 4.ln_T1T3_mcpp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("MCPP Quartiles (T1T3 mean)")
*DEHP
logistic IGT_update i.ln_T1T3_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat gct_date_ga
test 2.ln_T1T3_dehp_quart = 3.ln_T1T3_dehp_quart = 4.ln_T1T3_dehp_quart
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("OR of IGT") xtitle ("DEHP Quartiles (T1T3 mean)")


*******************
****CONTINUOUS GCT******
*******************


***T1 QUARTILES****
*mep
regress gct_1hr_g i.T1_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mBP
regress gct_1hr_g i.T1_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mibp
regress gct_1hr_g i.T1_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mEOHP
regress gct_1hr_g i.T1_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*MCNP
regress gct_1hr_g i.T1_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*MCOP
regress gct_1hr_g i.T1_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*Mbzp
regress gct_1hr_g i.T1_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mEHP
regress gct_1hr_g i.T1_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mEHHP
regress gct_1hr_g i.T1_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mECPP
regress gct_1hr_g i.T1_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mCPP
regress gct_1hr_g i.T1_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*DEHP
regress gct_1hr_g i.T1_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

***T1/T3 QUARTILES****
*mep
regress gct_1hr_g i.T1T3_mep_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mBP
regress gct_1hr_g i.T1T3_mbp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mibp
regress gct_1hr_g i.T1T3_mibp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat

*mEOHP
regress gct_1hr_g i.T1T3_meohp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*MCNP
regress gct_1hr_g i.T1T3_mcnp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*MCOP
regress gct_1hr_g i.T1T3_mcop_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*Mbzp
regress gct_1hr_g i.T1T3_mbzp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mEHP
regress gct_1hr_g i.T1T3_mehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mEHHP
regress gct_1hr_g i.T1T3_mehhp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mECPP
regress gct_1hr_g i.T1T3_mecpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*mCPP
regress gct_1hr_g i.T1T3_mcpp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
*DEHP
regress gct_1hr_g i.T1T3_dehp_quart Age_Yrs MomBMI i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
coefplot, vertical eform drop (_cons Age_Yrs MomBMI 2.raceth 3.raceth 4.raceth 5.raceth 1.Parity_cat https://urldefense.proofpoint.com/v2/url?u=http-3A__7.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=ySNvbGEhP48HlN3GZsIurSOdQwqEwCG_VMb9Accw8RA&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__8.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=udeVO5t2_lbKgT2rmaM-DrNH08grGmDyL6qIiONhJdU&e=  https://urldefense.proofpoint.com/v2/url?u=http-3A__9.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=7iFEZdalgehrBPgJ8CpzyQvhnizAIsItYBVB_D5XhvY&e= ) yline(1, lpattern(dash)) ytitle ("Beta for GLT") xtitle ("DEHP Quartiles (T1T3 mean)")

********************************************************************************
******* race dropping?


tab studyid miBP_SGadj if GDM_cc==1 & raceth==3

/*

        StudyID: |
   used to |
     merge |
     TIDES |                       SG adjusted phthalate
     data        |  6.641935   8.142308    9.24375   12.11176      12.47   29.45789 |     Total
-----------+------------------------------------------------------------------+----------
      6001 |         1          0          0          0          0          0 |         1 
      6013 |         0          0          0          1          0          0 |         1 
      6176 |         0          0          0          0          1          0 |         1 
      7030 |         0          0          0          0          0          1 |         1 
      9021 |         0          1          0          0          0          0 |         1 
      9086 |         0          0          1          0          0          0 |         1 
-----------+------------------------------------------------------------------+----------
     Total |         1          1          1          1          1          1 |         6 */
	 

drop if studyid == "7030"

logistic GDM_cc T1_logmiBP Age_Yrs MomBMI parity if raceth==3

/*Logistic regression                             Number of obs     =         34
                                                LR chi2(4)        =       8.94
                                                Prob > chi2       =     0.0627
Log likelihood = -9.7299005                     Pseudo R2         =     0.3147

------------------------------------------------------------------------------
      GDM_cc | Odds Ratio   Std. Err.      z    P>|z|     [95% Conf. Interval]
-------------+----------------------------------------------------------------
  T1_logmiBP |   47.59644   103.0567     1.78   0.074      .683183     3315.98
     Age_Yrs |   1.182029   .2059559     0.96   0.337     .8400702    1.663187
      MomBMI |   1.322555   .2398816     1.54   0.123     .9268828    1.887132
      parity |   3.062616   4.031931     0.85   0.395     .2319994     40.4295
       _cons |   1.56e-08   1.29e-07    -2.17   0.030     1.38e-15    .1773038
------------------------------------------------------------------------------ */ 



***********
******
***TABLE 1
************

tab GDM_cc, missing

/*

     GDM_cc |      Freq.     Percent        Cum.
------------+-----------------------------------
          0 |        645       91.49       91.49
          1 |         60        8.51      100.00
------------+-----------------------------------
      Total |        705      100.00*/



tab raceth GDM_cc, row missing
/*
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

                   |        GDM_cc
            raceth |         0          1 |     Total
-------------------+----------------------+----------
non-Hispanic White |       437         31 |       468 
                   |     93.38       6.62 |    100.00 
-------------------+----------------------+----------
non-Hispanic Black |        72          9 |        81 
                   |     88.89      11.11 |    100.00 
-------------------+----------------------+----------
 non-Hispnic Asian |        32          6 |        38 
                   |     84.21      15.79 |    100.00 
-------------------+----------------------+----------
          Hispanic |        46          9 |        55 
                   |     83.64      16.36 |    100.00 
-------------------+----------------------+----------
       Other/Mixed |        44          5 |        49 
                   |     89.80      10.20 |    100.00 
-------------------+----------------------+----------
                 . |        14          0 |        14 
                   |    100.00       0.00 |    100.00 
-------------------+----------------------+----------
             Total |       645         60 |       705 
                   |     91.49       8.51 |    100.00 

*/ 
. 



. tab raceth failGCT_normGTT, row missing

/*
+----------------+
| Key            |
|----------------|
|   frequency    |
| row percentage |
+----------------+

                   |    failGCT_normGTT
            raceth |         0          1 |     Total
-------------------+----------------------+----------
non-Hispanic White |       421         47 |       468 
                   |     89.96      10.04 |    100.00 
-------------------+----------------------+----------
non-Hispanic Black |        75          6 |        81 
                   |     92.59       7.41 |    100.00 
-------------------+----------------------+----------
 non-Hispnic Asian |        34          4 |        38 
                   |     89.47      10.53 |    100.00 
-------------------+----------------------+----------
          Hispanic |        51          4 |        55 
                   |     92.73       7.27 |    100.00 
-------------------+----------------------+----------
       Other/Mixed |        44          5 |        49 
                   |     89.80      10.20 |    100.00 
-------------------+----------------------+----------
                 . |        11          3 |        14 
                   |     78.57      21.43 |    100.00 
-------------------+----------------------+----------
             Total |       636         69 |       705 
                   |     90.21       9.79 |    100.00 */ 



				   
tab raceth IGT_update, row missing

/*
                   |      IGT_update
            raceth |         0          1 |     Total
-------------------+----------------------+----------
non-Hispanic White |       406         62 |       468 
                   |     86.75      13.25 |    100.00 
-------------------+----------------------+----------
non-Hispanic Black |        73          8 |        81 
                   |     90.12       9.88 |    100.00 
-------------------+----------------------+----------
 non-Hispnic Asian |        32          6 |        38 
                   |     84.21      15.79 |    100.00 
-------------------+----------------------+----------
          Hispanic |        50          5 |        55 
                   |     90.91       9.09 |    100.00 
-------------------+----------------------+----------
       Other/Mixed |        43          6 |        49 
                   |     87.76      12.24 |    100.00 
-------------------+----------------------+----------
                 . |        11          3 |        14 
                   |     78.57      21.43 |    100.00 
-------------------+----------------------+----------
             Total |       615         90 |       705 
                   |     87.23      12.77 |    100.00 */ 

				   
*******INTERACTION w/ BMI ALSO ***
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_DEHP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_DEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full 

regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_miBP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_miBP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mCPP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mCPP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mECPP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mECPP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full 

regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEHHP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEHHP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full

regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEHP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEHP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full

regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mBP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mBP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full

regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mBzP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mBzP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full

regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mCOP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mCOP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full


regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mCNP#i.raceth c.MomBMI#i.raceth 
estimates store full
regress gct_1hr_g log_T1T3_mean_mCNP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full

regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_Mean_mEOHP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_Mean_mEOHP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full


regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat c.log_T1T3_mean_mEP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g log_T1T3_mean_mEP Age_Yrs MomBMI i.raceth i.Parity_cat c.MomBMI#i.raceth
lrtest full


*****
**centering & new interaction regression

gen centered_log_MIBP=.
replace centered_log_MIBP = (log_T1T3_mean_miBP+0.290177)
tab centered_log_MIBP


regress gct_1hr_g centered_log_MIBP Age_Yrs MomBMI i.raceth i.Parity_cat c.centered_log_MIBP#i.raceth c.MomBMI#i.raceth
estimates store full
regress gct_1hr_g centered_log_MIBP Age_Yrs MomBMI i.raceth i.Parity_cat
lrtest full 

**********************
******evaluation of gestational age

*gct
tab gct_date_ga 
*several unlikely values - need to check with Audrey on this. 

corr gct_date_ga

*GTT
tab gtt_date_ga

sum gtt_date_ga
/*
    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
 gtt_date_ga |        130    198.0154      25.033         70        263 */ 
 
 corr gct_date_ga 
