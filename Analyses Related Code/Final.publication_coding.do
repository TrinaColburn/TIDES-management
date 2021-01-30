***publication work***

*merging

use /*gestational age dataset*/ 

rename StudyID studyid

save "TIDES_gestage"

merge 1:1 studyid using "TIDES_gestage"

/*
    Result                           # of obs.
    -----------------------------------------
    not matched                           292
        from master                        14  (_merge==1)
        from using                        278  (_merge==2)

    matched                               691  (_merge==3)
    -----------------------------------------
*/

save TIDES_gestage_combined


****

*understanding gestational age variables

drop if gct_date_ga <2

sum gct_date_ga
/*
    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
 gct_date_ga |        692    188.7095    23.07016         47        271
*/

sum GestAge_U3

/*    Variable |        Obs        Mean    Std. Dev.       Min        Max
-------------+---------------------------------------------------------
  GestAge_U3 |        761    228.9343    21.30248        180        288 */ 


*correlation between T3 urine & GLT gestational age

corr gct_date_ga GestAge_U3

scatter gct_date_ga GestAge_U3


**********************************************************************************
***update ln transformation***

*******phthalate stats********
*generate log-transformed T1 phthalates 
gen T1_ln_miBP=ln(miBP_SGadj)
gen T1_ln_mEP=ln(mEP_SGadj)
gen T1_ln_mEOHP=ln(mEOHP_SGadj)
gen T1_ln_mEHP=ln(mEHP_SGadj)
gen T1_ln_mEHHP=ln(mEHHP_SGadj)
gen T1_ln_mECPP=ln(mECPP_SGadj)
gen T1_ln_mCPP=ln(mCPP_SGadj)
gen T1_ln_mCOP=ln(mCOP_SGadj)
gen T1_ln_mCNP=ln(mCNP_SGadj)
gen T1_ln_mBzP=ln(mBzP_SGadj)
gen T1_ln_mBP=ln(mBP_SGadj)
gen T1_ln_SumDEHP=ln(SumDEHP_SGadj)
gen T1_ln_MolarSumDEHP=ln(MolarSumDEHP_SGadj)

*generate log-transformed T3 phthalates 
gen T3_ln_miBP=ln(t3_mibp_sgx)
gen T3_ln_mEP=ln(t3_mep_sgx)
gen T3_ln_mEOHP=ln(t3_meohp_sgx)
gen T3_ln_mEHP=ln(t3_mehp_sgx)
gen T3_ln_mEHHP=ln(t3_mehhp_sgx)
gen T3_ln_mECPP=ln(t3_mecpp_sgx)
gen T3_ln_mCPP=ln(t3_mcpp_sgx)
gen T3_ln_mCOP=ln(t3_mcop_sgx)
gen T3_ln_mCNP=ln(t3_mcnp_sgx)
gen T3_ln_mBzP=ln(t3_mbzp_sgx)
gen T3_ln_mBP=ln(t3_mbp_sgx)
gen T3_ln_SumDEHP=ln(t3_sumDEHP_sgx)
gen T3_ln_MolarSumDEHP=ln(t3_molarsumDEHP_sgx)

*average phthalates

*mEP
gen T1T3_Mean_mEP=.  
replace T1T3_Mean_mEP=((t3_mep_sgx + mEP_SGadj)/2)
gen ln_T1T3_mean_mEP = ln(T1T3_Mean_mEP)
*mEOHP
gen T1T3_Mean_mEOHP=.  
replace T1T3_Mean_mEOHP=((t3_meohp_sgx + mEOHP_SGadj)/2)
gen ln_T1T3_Mean_mEOHP = ln(T1T3_Mean_mEOHP)
*MCNP
gen T1T3_Mean_mCNP=.  
replace T1T3_Mean_mCNP=((t3_mcnp_sgx + mCNP_SGadj)/2)
gen ln_T1T3_mean_mCNP = ln(T1T3_Mean_mCNP)
*MCOP
gen T1T3_Mean_mCOP=.  
replace T1T3_Mean_mCOP=((t3_mcop_sgx + mCOP_SGadj)/2)
gen ln_T1T3_mean_mCOP = ln(T1T3_Mean_mCOP)
*Mbzp
gen T1T3_Mean_mBzP=.  
replace T1T3_Mean_mBzP=((t3_mbzp_sgx + mBzP_SGadj)/2)
gen ln_T1T3_mean_mBzP = ln(T1T3_Mean_mBzP)
*mBP
gen T1T3_Mean_mBP=.  
replace T1T3_Mean_mBP=((t3_mbp_sgx + mBP_SGadj)/2)
gen ln_T1T3_mean_mBP = ln(T1T3_Mean_mBP)
*mEHP
gen T1T3_Mean_mEHP=.  
replace T1T3_Mean_mEHP=((t3_mehp_sgx + mEHP_SGadj)/2)
gen ln_T1T3_Mean_mEHP = ln(T1T3_Mean_mEHP)
*mEHHP
gen T1T3_Mean_mEHHP=.  
replace T1T3_Mean_mEHHP=((t3_mehhp_sgx + mEHHP_SGadj)/2)
gen ln_T1T3_Mean_mEHHP = ln(T1T3_Mean_mEHHP)
*mECPP
gen T1T3_Mean_mECPP=.  
replace T1T3_Mean_mECPP=((t3_mecpp_sgx + mECPP_SGadj)/2)
gen ln_T1T3_Mean_mECPP = ln(T1T3_Mean_mECPP)
*mCPP
gen T1T3_Mean_mCPP=.  
replace T1T3_Mean_mCPP=((t3_mcpp_sgx + mCPP_SGadj)/2)
gen ln_T1T3_Mean_mCPP = ln(T1T3_Mean_mCPP)
*miBP
gen T1T3_Mean_miBP=.  
replace T1T3_Mean_miBP=((t3_mibp_sgx + miBP_SGadj)/2)
gen ln_T1T3_mean_miBP = ln(T1T3_Mean_miBP)
*DEHP
gen T1T3_Mean_DEHP=.  
replace T1T3_Mean_DEHP=((t3_molarsumDEHP_sgx + MolarSumDEHP_SGadj)/2)
gen ln_T1T3_mean_DEHP = ln(T1T3_Mean_DEHP)


sum ln_T1T3_mean_DEHP
sum ln_T1T3_mean_miBP
sum ln_T1T3_Mean_mCPP
sum ln_T1T3_Mean_mECPP
sum ln_T1T3_Mean_mEHHP
sum ln_T1T3_Mean_mEHP
sum ln_T1T3_mean_mBP
sum ln_T1T3_mean_mBzP
sum ln_T1T3_mean_mCOP
sum ln_T1T3_mean_mCNP
sum ln_T1T3_Mean_mEOHP
sum ln_T1T3_mean_mEP


********


*calculating IQR on ln-transformed phthalates

*T1
tabstat T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP, statistics (p25, p50, p75, iqr) columns (statistics)
*T1T3
tabstat ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP, statistics (iqr) columns (statistics)


*T1
tabstat T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP, statistics (mean, sd) columns (statistics)

*T1T3
tabstat ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP, statistics (mean, sd) columns (statistics)

****REDUCED MODEL****
**** using GCT_GA 

di "OR(95% CI's) for GDM associated with a 1-unit increase in log phthalate:"
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist GDM_cc {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}

*T1 T3 mean phthalates 
di "OR(95% CI's) for GDM associated with a 1-unit increase in log mean phthalate:"
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist GDM_cc {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}



***IGT***
*T1
di "OR(95% CI's) for IGT associated with a 1-unit increase in log phthalate:"
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist IGT_update {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}

*T1 T3 mean phthalates 
di "OR(95% CI's) for GDM associated with a 1-unit increase in log mean phthalate:"
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist IGT_update {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.3f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}



**GLT results
*T1 phthalates 
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.raceth https://urldefense.proofpoint.com/v2/url?u=http-3A__i.Center&d=DwIGAg&c=shNJtf5dKgNcPZ6Yh64b-A&r=6tNYuxg6fhZqe_5cnSkJt1p-Afy-wis0hxY-PF2xG80&m=88OKarXF34G5HHF1emNv_9CYJ1JCyn9U7EMFilG5XtQ&s=shs-drDBqs00wQJU7CO5ndFnRM9LqshTQ550hRZIxqE&e=  i.Parity_cat
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}



***MINIMAL MODEL***


di "OR(95% CI's) for GDM associated with a 1-unit increase in log phthalate:"
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist GDM_cc {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.3f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}

*T1 T3 mean phthalates 
di "OR(95% CI's) for GDM associated with a 1-unit increase in log mean phthalate:"
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist GDM_cc {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}


***IGT***

*T1
di "OR(95% CI's) for IGT associated with a 1-unit increase in log phthalate:"
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist IGT_update {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.3f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}

*T1 T3 mean phthalates 
di "OR(95% CI's) for GDM associated with a 1-unit increase in log mean phthalate:"
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist IGT_update {
		qui logit  `Ovar' `Evar' Age_Yrs MomBMI
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.3f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N) %-10.2f _col (85) output[2,1]
	}
}



**GLT results
*T1 phthalates 
di _col(0) "Var name" _col(15) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist T1_ln_miBP T1_ln_mEP T1_ln_mEOHP T1_ln_mEHP T1_ln_mEHHP T1_ln_mECPP T1_ln_mCPP T1_ln_mCOP T1_ln_mCNP T1_ln_mBzP T1_ln_mBP T1_ln_MolarSumDEHP{
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI 
		matrix output = r(table)
		di "`: var label `Evar''" _col(15) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}

*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI 
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}


**asian 
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI gct_date_ga i.Parity_cat if raceth==3
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}
********************************************************
destring var1, replace

label define phthalatesl 1 "MIBP" 2 "MEP" 3 "MBP" 4 "MBZP" 5 "MCNP" 6 "MCOP" 7 "MCPP" 8 "MEHP" 9 "MEHHP" 10 "MEOHP" 11 "MECPP" 12 "DEHP"

label values MeanPhthalate phthalatesl
*GDM & MeanPhthalate - Reduced Model
serrbar OR SE MeanPhthalate, scale (1.96) sub("OR & 95% CI for GDM associated with 1 IQR increase in Pregnancy Average Phthalate") yline(1) yline(1) b2 (Pregnancy Average Phthalate) l1 (OR (95%CI)) ylab (0(0.5)2) xlab(1(1)12) xlabel (,valuelabel) 
*GDM & T1 Phthalate - Reduced Model
label values var1 phthalatesl
serrbar OR SE var1, scale (1.96) sub("OR & 95% CI for GDM associated with 1 IQR increase in T1 Phthalate") yline(1) yline(1) b2 (T1 Phthalate) l1 (OR (95%CI)) ylab (0(0.5)2) xlab(1(1)12) xlabel (,valuelabel)
*IGT & T1Phthalates - Reduced Model
label values var1 phthalatesl
serrbar var2 var3 var1, scale (1.96) sub("OR & 95% CI for IGT associated with 1 IQR increase in T1 Phthalate") yline(1) yline(1) b2 (T1 Phthalate) l1 (OR (95%CI)) ylab (0(0.5)2) xlab(1(1)12) xlabel (,valuelabel)
*IGT & MeanPhthalates - Reduced Model
label values var1 phthalatesl
serrbar var2 var3 var1, scale(1.96) sub("OR & 95% CI for IGT associated with 1 IQR increase in Pregnancy Average Phthalate") yline(1) yline(1) b2 (Pregnancy Average Phthalate) l1 (OR (95%CI)) ylab (0(0.5)2) xlab(1(1)12) xlabel (,valuelabel)

************
*T1T3
tabstat ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP, by (raceth) statistics(p25, p75)

**************************
***STRATIFICATION 
**GLT results

**WHITE
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI i.Parity_cat if raceth==1
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}

**black 
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI i.Parity_cat if raceth==2
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}

**asian 
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI i.Parity_cat if raceth==3
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}

**hispanic
*T1 T3 mean phthalates 
di _col(0) "Var name" _col(25) "coef" _col(30) "lower CI" _col(45) "upper CI" _col(60)"p-value" _col(75) "N"
foreach Evar of varlist ln_T1T3_mean_miBP ln_T1T3_mean_mEP ln_T1T3_Mean_mEOHP ln_T1T3_Mean_mEHP ln_T1T3_Mean_mEHHP ln_T1T3_Mean_mECPP ln_T1T3_Mean_mCPP ln_T1T3_mean_mCOP ln_T1T3_mean_mCNP ln_T1T3_mean_mBzP ln_T1T3_mean_mBP ln_T1T3_mean_DEHP {
	foreach Ovar of varlist gct_1hr_g {
		qui regress  `Ovar' `Evar' Age_Yrs MomBMI i.Parity_cat if raceth==4
		matrix output = r(table)
		di "`: var label `Evar''" _col(25) %-10.2f output[1,1] _col(30) %-10.2f output[5,1] _col(45) %-10.2f output[6,1] _col(60) %-10.2f output[4,1]  _col(75) e(N)
	}
}
