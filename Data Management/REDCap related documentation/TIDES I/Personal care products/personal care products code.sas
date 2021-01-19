/*Q1 personal care products*/

libname pcp "J:\PM\TIDES_Data\REDCap Master Database\TIDES I\Trimester Questionnaires\Personal Care Products"; run;

data pcp.q1_pcc_only; set q1.q1_2020_subv2;
keep study_id
T1_Q43A_1_DAYS T1_Q43A_1_FRAG
T1_Q43A_2_DAYS T1_Q43A_2_FRAG T1_Q43A_3_DAYS T1_Q43A_3_FRAG T1_Q43A_4_DAYS T1_Q43A_4_FRAG T1_Q43A_5_DAYS
T1_Q43A_5_FRAG T1_Q43B_1_DAYS T1_Q43B_1_FRAG T1_Q43B_2_DAYS T1_Q43B_2_FRAG T1_Q43B_3_DAYS T1_Q43B_3_FRAG
T1_Q43B_4_DAYS T1_Q43B_4_FRAG T1_Q43B_5_DAYS T1_Q43B_5_FRAG T1_Q43B_6_DAYS T1_Q43B_6_FRAG T1_Q43B_7_DAYS
T1_Q43B_7_FRAG T1_Q43B_8_DAYS T1_Q43B_8_FRAG T1_Q43B_9_DAYS T1_Q43B_9_FRAG T1_Q43B_10_DAYS T1_Q43B_10_FRAG
T1_Q43B_11_DAYS T1_Q43B_11_FRAG T1_Q43C_DAYS T1_Q43C_FRAG T1_Q43D_DAYS T1_Q43D_FRAG T1_Q43E_DAYS T1_Q43E_FRAG
T1_Q43F_DAYS T1_Q43F_FRAG T1_Q43G_DAYS T1_Q43G_FRAG T1_Q43H_DAYS T1_Q43H_FRAG T1_Q43I_DAYS T1_Q43I_FRAG
T1_Q43J_DAYS T1_Q43J_FRAG T1_Q43K_DAYS T1_Q43K_FRAG T1_Q43L_DAYS T1_Q43L_FRAG T1_Q44A T1_Q44B T1_Q44C T1_Q44D
T1_Q44E T1_Q44F T1_Q44G T1_Q44H T1_Q44I T1_Q44J T1_Q44K;
run;

proc contents data=pcp.q1_pcc_only order=varnum; run;
proc freq data=pcp.q1_pcc_only;
table T1_Q43A_1_DAYS -- T1_Q43L_FRAG; run;

/*figure out missing*/
proc print data=pcp.q1_pcc_only;
where T1_Q43A_1_DAYS=.; run;
/*n=10 missing, 7178, 8263, 9048, 9063, 9143, 9159, 9160, 9161, 9184, 9198*/

data pcp.q1_pcc_only_1; set pcp.q1_pcc_only;
if T1_Q43A_1_DAYS=. then delete; run;

/*Go personal care product by personal care product*/

/*T1_Q43A_1 - Eye makeup*/
	proc freq data=pcp.q1_pcc_only_1;
	table T1_Q43A_1_DAYS T1_Q43A_1_FRAG; run;

	proc freq data=pcp.q1_pcc_only_1;
	table T1_Q43A_1_FRAG; run;

	proc print data=pcp.q1_pcc_only_1 noobs;
	var study_id T1_Q43A_1_DAYS T1_Q43A_1_FRAG;
	where T1_Q43A_1_DAYS=0 and . < T1_Q43A_1_FRAG < 6; run;

	proc print data=pcp.q1_pcc_only_1 noobs;
	var study_id T1_Q43A_1_DAYS T1_Q43A_1_FRAG;
	where T1_Q43A_1_FRAG=6 or T1_Q43A_1_FRAG=.; run; /*spot check n=319*/

	/*okay, those with T1_Q43A_1_DAYS=0 and T1_Q43A_1_FRAG=6 or T1_Q43A_1_FRAG=. then
	leave T1_Q43A_1_FRAG=.*/
	proc print data=pcp.q1_pcc_only_1 noobs;
	var study_id T1_Q43A_1_DAYS T1_Q43A_1_FRAG;
	where T1_Q43A_1_DAYS=0 and (T1_Q43A_1_FRAG=6 or T1_Q43A_1_FRAG=.); run;
	/*n=318, 6230 has 7 and no f/u info*/

	data pcp.q1_pcc_only_2; set pcp.q1_pcc_only_1;
	if T1_Q43A_1_DAYS=0 and (T1_Q43A_1_FRAG=6 or T1_Q43A_1_FRAG=.) then T1_Q43A_1_FRAG=.; run;

	/*reorient*/
	proc freq data=pcp.q1_pcc_only_2;
	table T1_Q43A_1_DAYS T1_Q43A_1_FRAG; run;

	proc print data=pcp.q1_pcc_only_2 noobs;
	var study_id T1_Q43A_1_DAYS T1_Q43A_1_FRAG;
	where T1_Q43A_1_DAYS=0 and . < T1_Q43A_1_FRAG < 6; run;
	/*okay, let's do T1_Q43A_1_DAYS=., if T1_Q43A_1_DAYS=. and there's
	  T1_Q43A_1_FRAG info it's it's an unknown # of days per week but they know it's frag free/unsure*/

	data pcp.q1_pcc_only_3; set pcp.q1_pcc_only_2;
	if (T1_Q43A_1_DAYS=0 and . < T1_Q43A_1_FRAG < 6) then T1_Q43A_1_DAYS=.; run;
	/*reorient*/
	proc freq data=pcp.q1_pcc_only_3;
	table T1_Q43A_1_DAYS T1_Q43A_1_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=1*/
	data pcp.q1_pcc_only_3; set pcp.q1_pcc_only_3;
	if study_id=6230 then T1_Q43A_1_FRAG=-3; /*-3 is AM known missing code*/
	run;

	proc freq data=pcp.q1_pcc_only_3;
	table T1_Q43A_1_DAYS T1_Q43A_1_FRAG/missing;
	where T1_Q43A_1_DAYS ne 0; run;

	/*number of obs who reported any use of eye makeup is 569.
	all 569 are coded in T1_Q43A_1_FRAG. one reported use but skipped.
	37 did not specify number of days of use but were coded in T1_Q43A_1_FRAG*/

/*T1_Q43A_2 - Lipstick*/
		proc freq data=pcp.q1_pcc_only_3;
		table T1_Q43A_2_DAYS T1_Q43A_2_FRAG; run;

		proc freq data=pcp.q1_pcc_only_3;
		table T1_Q43A_2_FRAG; run;

		proc print data=pcp.q1_pcc_only_3 noobs;
		var study_id T1_Q43A_2_DAYS T1_Q43A_2_FRAG;
		where T1_Q43A_2_DAYS=0 and . < T1_Q43A_2_FRAG < 6; run;
		/*okay, n=50 indicated 0 days per week, recode as missing*/

		proc print data=pcp.q1_pcc_only_3 noobs;
		var study_id T1_Q43A_2_DAYS T1_Q43A_2_FRAG;
		where T1_Q43A_2_FRAG=6 or T1_Q43A_2_FRAG=.; run;
		/*n=561 where T1_Q43A_2_FRAG=6 or T1_Q43A_2_FRAG=. and all but
		6110 and 6138 reported 0 days per week
		recode as 0/.*/

		proc print data=pcp.q1_pcc_only_3 noobs;
		var study_id T1_Q43A_2_DAYS T1_Q43A_2_FRAG;
		where T1_Q43A_2_DAYS=0 and (T1_Q43A_2_FRAG=6 or T1_Q43A_2_FRAG=.); run;
		/*n=559*/

		data pcp.q1_pcc_only_4; set pcp.q1_pcc_only_3;
		if T1_Q43A_2_DAYS=0 and (T1_Q43A_2_FRAG=6 or T1_Q43A_2_FRAG=.) then T1_Q43A_2_FRAG=.; run;

		/*rerun new freqs*/
		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_2_DAYS T1_Q43A_2_FRAG; run;

		/*fix if T1_Q43A_2_DAYS=. but T1_Q43A_2_FRAG has info*/
		/*it's it's an unknown # of days per week but they know it's frag free/unsure*/
		proc print data=pcp.q1_pcc_only_4 noobs;
		var study_id T1_Q43A_2_DAYS T1_Q43A_2_FRAG;
		where T1_Q43A_2_DAYS=0 and (. < T1_Q43A_2_FRAG < 6); run;

		data pcp.q1_pcc_only_4; set pcp.q1_pcc_only_4;
		if (T1_Q43A_2_DAYS=0 and (. < T1_Q43A_2_FRAG < 6))
		then T1_Q43A_2_DAYS=.; run;

		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_2_DAYS T1_Q43A_2_FRAG/missing; run;

		/*the ns 0/. combo should match, fix the n=1*/
		data pcp.q1_pcc_only_4; set pcp.q1_pcc_only_4;
		if study_id=6110 then T1_Q43A_2_FRAG=-3;
		if study_id=6138 then T1_Q43A_2_FRAG=-3; /*-3 is AM known missing code*/
		run;

		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_2_DAYS T1_Q43A_2_FRAG/missing; run;

		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_2_DAYS T1_Q43A_2_FRAG/missing;
		where T1_Q43A_2_DAYS ne 0; run;

/*T1_Q43A_3 - Make-up (powder or liquid foundation)*/
		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_3_DAYS T1_Q43A_3_FRAG; run;

		proc freq data=pcp.q1_pcc_only_4;
		table T1_Q43A_3_FRAG; run;

		proc print data=pcp.q1_pcc_only_4 noobs;
		var study_id T1_Q43A_3_DAYS T1_Q43A_3_FRAG;
		where T1_Q43A_3_DAYS=0 and . < T1_Q43A_3_FRAG < 6; run; /*n=39*/

		proc print data=pcp.q1_pcc_only_4 noobs;
		var study_id T1_Q43A_3_DAYS T1_Q43A_3_FRAG;
		where T1_Q43A_3_FRAG=6 or T1_Q43A_3_FRAG=.; run;
		/*n ~412 where T1_Q43A_3_DAYS T1_Q43A_3_FRAG shold be 0/.
		 6110, 6213, 6230, 7147, 9196 indicated use but did not specify T1_Q43A_3_FRAG*/

		proc print data=pcp.q1_pcc_only_4 noobs;
		var study_id T1_Q43A_3_DAYS T1_Q43A_3_FRAG;
		where T1_Q43A_3_DAYS=0 and (T1_Q43A_3_FRAG=6 or T1_Q43A_3_FRAG=.); run;
		/*n=406 need to be recoded*/
			data pcp.q1_pcc_only_5; set pcp.q1_pcc_only_4;
			if T1_Q43A_3_DAYS=0 and (T1_Q43A_3_FRAG=6 or T1_Q43A_3_FRAG=.) then T1_Q43A_3_FRAG=.; run;

		/*reorient*/
		proc freq data=pcp.q1_pcc_only_5;
		table T1_Q43A_3_DAYS T1_Q43A_3_FRAG; run;

		proc print data=pcp.q1_pcc_only_5 noobs;
		var study_id T1_Q43A_3_DAYS T1_Q43A_3_FRAG;
		where T1_Q43A_3_DAYS=0 and . < T1_Q43A_3_FRAG < 6; run;

		/*if T1_Q43A_3_DAYS=. and there's T1_Q43A_3_FRAG info it's it's an unknown #
		of days per week but they know it's frag free/unsure*/
		data pcp.q1_pcc_only_5; set pcp.q1_pcc_only_5;
		if (T1_Q43A_3_DAYS=0 and . < T1_Q43A_3_FRAG < 6) then T1_Q43A_3_DAYS=.; run;

		proc freq data=pcp.q1_pcc_only_5;
		table T1_Q43A_3_DAYS T1_Q43A_3_FRAG/missing; run;

		/*the 0/. combo should match, fix the n=6*/
		data pcp.q1_pcc_only_6; set pcp.q1_pcc_only_5;
		if T1_Q43A_3_DAYS>=1 and T1_Q43A_3_FRAG=. then T1_Q43A_3_FRAG=-3; run;
			/*check*/
			proc freq data=pcp.q1_pcc_only_6;
			table T1_Q43A_3_DAYS T1_Q43A_3_FRAG/missing; run;
		/*now check those where T1_Q43A_3_DAYS ne 0*/
		proc freq data=pcp.q1_pcc_only_6;
		table T1_Q43A_3_DAYS T1_Q43A_3_FRAG/missing;
		where T1_Q43A_3_DAYS ne 0; run;

		/*number of obs who reported any use of lipstick is 481.
		all 481 are coded in T1_Q43A_3_FRAG. 6 reported days/week use but skipped.
		39 did not specify number of days of use but were coded in T1_Q43A_3_FRAG*/

/*T1_Q43A_4 - Nail polish*/
	/*Streamline process*/
	proc freq data=pcp.q1_pcc_only_6;
	table T1_Q43A_4_DAYS T1_Q43A_4_FRAG; run;

	proc print data=pcp.q1_pcc_only_6 noobs;
	var study_id T1_Q43A_4_DAYS T1_Q43A_4_FRAG;
	where T1_Q43A_4_DAYS=0 and (T1_Q43A_4_FRAG=6 or T1_Q43A_4_FRAG=.); run;
		/*set 0/. to n=598*/
		data pcp.q1_pcc_only_7; set pcp.q1_pcc_only_6;
		if T1_Q43A_4_DAYS=0 and (T1_Q43A_4_FRAG=6 or T1_Q43A_4_FRAG=.)
		then T1_Q43A_4_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_7;
	table T1_Q43A_4_DAYS T1_Q43A_4_FRAG; run;

	/*if T1_Q43A_4_DAYS=. and there's
	T1_Q43A_4_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_7 noobs;
	var study_id T1_Q43A_4_DAYS T1_Q43A_4_FRAG;
	where T1_Q43A_4_DAYS=0 and . < T1_Q43A_4_FRAG < 6; run;
		/*recode*/
		data pcp.q1_pcc_only_7; set pcp.q1_pcc_only_7;
		if (T1_Q43A_4_DAYS=0 and . < T1_Q43A_4_FRAG < 6) then T1_Q43A_4_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_7;
	table T1_Q43A_4_DAYS T1_Q43A_4_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=1*/
	data pcp.q1_pcc_only_7; set pcp.q1_pcc_only_7;
	if T1_Q43A_4_DAYS>=1 and T1_Q43A_4_FRAG=. then T1_Q43A_4_FRAG=-3; run;
		/*check*/
		proc freq data=pcp.q1_pcc_only_7;
		table T1_Q43A_4_DAYS T1_Q43A_4_FRAG/missing; run;

	/*final*/
	proc freq data=pcp.q1_pcc_only_7;
	table T1_Q43A_4_DAYS T1_Q43A_4_FRAG/missing;
	where T1_Q43A_4_DAYS ne 0; run;

/*T1_Q43A_5 - blush*/
/*streamlined process*/
		proc freq data=pcp.q1_pcc_only_7;
		table T1_Q43A_5_DAYS T1_Q43A_5_FRAG; run;

		proc print data=pcp.q1_pcc_only_7 noobs;
		var study_id T1_Q43A_5_DAYS T1_Q43A_5_FRAG;
		where T1_Q43A_5_DAYS=0 and (T1_Q43A_5_FRAG=6 or T1_Q43A_5_FRAG=.); run;
			/*set 0/. to n=598*/
			data pcp.q1_pcc_only_8; set pcp.q1_pcc_only_7;
			if T1_Q43A_5_DAYS=0 and (T1_Q43A_5_FRAG=6 or T1_Q43A_5_FRAG=.)
			then T1_Q43A_5_FRAG=.; run;

		proc freq data=pcp.q1_pcc_only_8;
		table T1_Q43A_5_DAYS T1_Q43A_5_FRAG; run;

		/*if T1_Q43A_5_DAYS=. and there's
		T1_Q43A_5_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
		proc print data=pcp.q1_pcc_only_8 noobs;
		var study_id T1_Q43A_5_DAYS T1_Q43A_5_FRAG;
		where T1_Q43A_5_DAYS=0 and . < T1_Q43A_5_FRAG < 6; run;
			/*recode*/
			data pcp.q1_pcc_only_8; set pcp.q1_pcc_only_8;
			if (T1_Q43A_5_DAYS=0 and . < T1_Q43A_5_FRAG < 6) then T1_Q43A_5_DAYS=.; run;

		proc freq data=pcp.q1_pcc_only_8;
		table T1_Q43A_5_DAYS T1_Q43A_5_FRAG/missing; run;

		/*the 0/. combo should match, fix the n=1*/
		data pcp.q1_pcc_only_8; set pcp.q1_pcc_only_8;
		if T1_Q43A_5_DAYS>=1 and T1_Q43A_5_FRAG=. then T1_Q43A_5_FRAG=-3; run;
			/*check*/
			proc freq data=pcp.q1_pcc_only_8;
			table T1_Q43A_5_DAYS T1_Q43A_5_FRAG/missing; run;
			/*n=542 0 days per week and n=542 have T1_Q43A_5_FRAG*/

		/*final*/
		proc freq data=pcp.q1_pcc_only_8;
		table T1_Q43A_5_DAYS T1_Q43A_5_FRAG/missing;
		where T1_Q43A_5_DAYS ne 0; run;

		/*n=345 reported days per week use and have T1_Q43A_5_FRAG codes*/

/*T1_Q43B_1 - creme rinse conditioner*/
	proc freq data=pcp.q1_pcc_only_8;
	table T1_q43b_1_DAYS T1_q43b_1_FRAG; run;

	proc print data=pcp.q1_pcc_only_8 noobs;
	var study_id T1_q43b_1_DAYS T1_q43b_1_FRAG;
	where T1_q43b_1_DAYS=0 and (T1_q43b_1_FRAG=6 or T1_q43b_1_FRAG=.); run;
		/*set 0/. to n=183*/
		data pcp.q1_pcc_only_9; set pcp.q1_pcc_only_8;
		if T1_q43b_1_DAYS=0 and (T1_q43b_1_FRAG=6 or T1_q43b_1_FRAG=.)
		then T1_q43b_1_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_9;
	table T1_q43b_1_DAYS T1_q43b_1_FRAG; run;

			/*if T1_q43b_1_DAYS=. and there's
			T1_q43b_1_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
			proc print data=pcp.q1_pcc_only_9 noobs;
			var study_id T1_q43b_1_DAYS T1_q43b_1_FRAG;
			where T1_q43b_1_DAYS=0 and . < T1_q43b_1_FRAG < 6; run;
				/*recode*/
				data pcp.q1_pcc_only_9; set pcp.q1_pcc_only_9;
				if (T1_q43b_1_DAYS=0 and . < T1_q43b_1_FRAG < 6) then T1_q43b_1_DAYS=.; run;

			proc freq data=pcp.q1_pcc_only_9;
			table T1_q43b_1_DAYS T1_q43b_1_FRAG/missing; run;

			/*the 0/. combo should match*/
			data pcp.q1_pcc_only_9; set pcp.q1_pcc_only_9;
			if T1_q43b_1_DAYS>=1 and T1_q43b_1_FRAG=. then T1_q43b_1_FRAG=-3; run;
				/*check*/
				proc freq data=pcp.q1_pcc_only_9;
				table T1_q43b_1_DAYS T1_q43b_1_FRAG/missing; run;

			/*final*/
			proc freq data=pcp.q1_pcc_only_9;
			table T1_q43b_1_DAYS T1_q43b_1_FRAG/missing;
			where T1_q43b_1_DAYS ne 0; run;

/*T1_Q43B_2 - hair bleach*/
	proc freq data=pcp.q1_pcc_only_9;
	table T1_q43b_2_DAYS T1_q43b_2_FRAG; run;

	proc print data=pcp.q1_pcc_only_9 noobs;
	var study_id T1_q43b_2_DAYS T1_q43b_2_FRAG;
	where T1_q43b_2_DAYS=0 and (T1_q43b_2_FRAG=6 or T1_q43b_2_FRAG=.); run;
		/*set 0/. to n=598*/
		data pcp.q1_pcc_only_10; set pcp.q1_pcc_only_9;
		if T1_q43b_2_DAYS=0 and (T1_q43b_2_FRAG=6 or T1_q43b_2_FRAG=.)
		then T1_q43b_2_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_10;
	table T1_q43b_2_DAYS T1_q43b_2_FRAG; run;

	/*if T1_q43b_2_DAYS=. and there's
	T1_q43b_2_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_10 noobs;
	var study_id T1_q43b_2_DAYS T1_q43b_2_FRAG;
	where T1_q43b_2_DAYS=0 and . < T1_q43b_2_FRAG < 6; run;
			/*recode*/
			data pcp.q1_pcc_only_10; set pcp.q1_pcc_only_10;
			if (T1_q43b_2_DAYS=0 and . < T1_q43b_2_FRAG < 6) then T1_q43b_2_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_10;
	table T1_q43b_2_DAYS T1_q43b_2_FRAG/missing; run;

	/*final*/
	proc freq data=pcp.q1_pcc_only_10;
	table T1_q43b_2_DAYS T1_q43b_2_FRAG/missing;
	where T1_q43b_2_DAYS ne 0; run;

/*T1_Q43B_3 - hair dye*/
	proc freq data=pcp.q1_pcc_only_10;
	table T1_q43b_3_DAYS T1_q43b_3_FRAG; run;

	proc print data=pcp.q1_pcc_only_10 noobs;
	var study_id T1_q43b_3_DAYS T1_q43b_3_FRAG;
	where T1_q43b_3_DAYS=0 and (T1_q43b_3_FRAG=6 or T1_q43b_3_FRAG=.); run;
			/*set 0/. to n=598*/
			data pcp.q1_pcc_only_11; set pcp.q1_pcc_only_10;
			if T1_q43b_3_DAYS=0 and (T1_q43b_3_FRAG=6 or T1_q43b_3_FRAG=.)
			then T1_q43b_3_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_11;
	table T1_q43b_3_DAYS T1_q43b_3_FRAG; run;

	/*if T1_q43b_3_DAYS=. and there's
	T1_q43b_3_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_11 noobs;
	var study_id T1_q43b_3_DAYS T1_q43b_3_FRAG;
	where T1_q43b_3_DAYS=0 and . < T1_q43b_3_FRAG < 6; run;
			/*recode*/
			data pcp.q1_pcc_only_11; set pcp.q1_pcc_only_11;
			if (T1_q43b_3_DAYS=0 and . < T1_q43b_3_FRAG < 6) then T1_q43b_3_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_11;
	table T1_q43b_3_DAYS T1_q43b_3_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=1*/
	data pcp.q1_pcc_only_11; set pcp.q1_pcc_only_11;
	if T1_q43b_3_DAYS>=1 and T1_q43b_3_FRAG=. then T1_q43b_3_FRAG=-3; run;
			/*check*/
			proc freq data=pcp.q1_pcc_only_11;
			table T1_q43b_3_DAYS T1_q43b_3_FRAG/missing; run;
	/*final*/
	proc freq data=pcp.q1_pcc_only_11;
	table T1_q43b_3_DAYS T1_q43b_3_FRAG/missing;
	where T1_q43b_3_DAYS ne 0; run;

/*T1_Q43B_4 - hair gel*/
	proc freq data=pcp.q1_pcc_only_11;
	table T1_q43b_4_DAYS T1_q43b_4_FRAG; run;

	proc print data=pcp.q1_pcc_only_11 noobs;
	var study_id T1_q43b_4_DAYS T1_q43b_4_FRAG;
	where T1_q43b_4_DAYS=0 and (T1_q43b_4_FRAG=6 or T1_q43b_4_FRAG=.); run;
		/*set 0/.*/
		data pcp.q1_pcc_only_12; set pcp.q1_pcc_only_11;
		if T1_q43b_4_DAYS=0 and (T1_q43b_4_FRAG=6 or T1_q43b_4_FRAG=.)
		then T1_q43b_4_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_12;
	table T1_q43b_4_DAYS T1_q43b_4_FRAG; run;

	/*if T1_q43b_4_DAYS=. and there's
	T1_q43b_4_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_12 noobs;
	var study_id T1_q43b_4_DAYS T1_q43b_4_FRAG;
	where T1_q43b_4_DAYS=0 and . < T1_q43b_4_FRAG < 6; run;
		/*recode*/
		data pcp.q1_pcc_only_12; set pcp.q1_pcc_only_12;
		if (T1_q43b_4_DAYS=0 and . < T1_q43b_4_FRAG < 6) then T1_q43b_4_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_12;
	table T1_q43b_4_DAYS T1_q43b_4_FRAG/missing; run;

	/*the 0/. combo should match*/
	data pcp.q1_pcc_only_12; set pcp.q1_pcc_only_12;
	if T1_q43b_4_DAYS>=1 and T1_q43b_4_FRAG=. then T1_q43b_4_FRAG=-3; run;
		/*check*/
		proc freq data=pcp.q1_pcc_only_12;
		table T1_q43b_4_DAYS T1_q43b_4_FRAG/missing; run;

		/*final*/
		proc freq data=pcp.q1_pcc_only_12;
		table T1_q43b_4_DAYS T1_q43b_4_FRAG/missing;
		where T1_q43b_4_DAYS ne 0; run;

/*T1_Q43B_5 - hair mousse*/
	proc freq data=pcp.q1_pcc_only_12;
	table T1_q43b_5_DAYS T1_q43b_5_FRAG; run;

	proc print data=pcp.q1_pcc_only_12 noobs;
	var study_id T1_q43b_5_DAYS T1_q43b_5_FRAG;
	where T1_q43b_5_DAYS=0 and (T1_q43b_5_FRAG=6 or T1_q43b_5_FRAG=.); run;
		/*set 0/.*/
		data pcp.q1_pcc_only_13; set pcp.q1_pcc_only_12;
		if T1_q43b_5_DAYS=0 and (T1_q43b_5_FRAG=6 or T1_q43b_5_FRAG=.)
		then T1_q43b_5_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_13;
	table T1_q43b_5_DAYS T1_q43b_5_FRAG; run;

	/*if T1_q43b_5_DAYS=. and there's
	T1_q43b_5_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_13 noobs;
	var study_id T1_q43b_5_DAYS T1_q43b_5_FRAG;
	where T1_q43b_5_DAYS=0 and . < T1_q43b_5_FRAG < 6; run;
		/*recode*/
		data pcp.q1_pcc_only_13; set pcp.q1_pcc_only_13;
		if (T1_q43b_5_DAYS=0 and . < T1_q43b_5_FRAG < 6) then T1_q43b_5_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_13;
	table T1_q43b_5_DAYS T1_q43b_5_FRAG/missing; run;

		/*the 0/. combo should match, fix the n=1*/
		data pcp.q1_pcc_only_13; set pcp.q1_pcc_only_13;
		if T1_q43b_5_DAYS>=1 and T1_q43b_5_FRAG=. then T1_q43b_5_FRAG=-3; run;
			/*check*/
			proc freq data=pcp.q1_pcc_only_13;
			table T1_q43b_5_DAYS T1_q43b_5_FRAG/missing; run;
	/*final*/
	proc freq data=pcp.q1_pcc_only_13;
	table T1_q43b_5_DAYS T1_q43b_5_FRAG/missing;
	where T1_q43b_5_DAYS ne 0; run;

/*T1_Q43B_6 - hair permanent*/
	proc freq data=pcp.q1_pcc_only_13;
	table T1_q43b_6_DAYS T1_q43b_6_FRAG; run;

		proc print data=pcp.q1_pcc_only_13 noobs;
		var study_id T1_q43b_6_DAYS T1_q43b_6_FRAG;
		where T1_q43b_6_DAYS=0 and (T1_q43b_6_FRAG=6 or T1_q43b_6_FRAG=.); run;
					/*set 0/.*/
					data pcp.q1_pcc_only_14; set pcp.q1_pcc_only_13;
					if T1_q43b_6_DAYS=0 and (T1_q43b_6_FRAG=6 or T1_q43b_6_FRAG=.)
					then T1_q43b_6_FRAG=.; run;

		proc freq data=pcp.q1_pcc_only_14;
		table T1_q43b_6_DAYS T1_q43b_6_FRAG; run;

		/*if T1_q43b_6_DAYS=. and there's
		T1_q43b_6_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
		proc print data=pcp.q1_pcc_only_14 noobs;
		var study_id T1_q43b_6_DAYS T1_q43b_6_FRAG;
		where T1_q43b_6_DAYS=0 and . < T1_q43b_6_FRAG < 6; run;
			/*recode*/
			data pcp.q1_pcc_only_14; set pcp.q1_pcc_only_14;
			if (T1_q43b_6_DAYS=0 and . < T1_q43b_6_FRAG < 6) then T1_q43b_6_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_14;
	table T1_q43b_6_DAYS T1_q43b_6_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=2*/
	data pcp.q1_pcc_only_14; set pcp.q1_pcc_only_14;
	if T1_q43b_6_DAYS>=1 and T1_q43b_6_FRAG=. then T1_q43b_6_FRAG=-3; run;
			/*check*/
			proc freq data=pcp.q1_pcc_only_14;
			table T1_q43b_6_DAYS T1_q43b_6_FRAG/missing; run;
	/*final*/
	proc freq data=pcp.q1_pcc_only_14;
	table T1_q43b_6_DAYS T1_q43b_6_FRAG/missing;
	where T1_q43b_6_DAYS ne 0; run;

/*T1_Q43B_7 - hair spray*/
	proc freq data=pcp.q1_pcc_only_14;
	table T1_q43b_7_DAYS T1_q43b_7_FRAG; run;

	proc print data=pcp.q1_pcc_only_14 noobs;
	var study_id T1_q43b_7_DAYS T1_q43b_7_FRAG;
	where T1_q43b_7_DAYS=0 and (T1_q43b_7_FRAG=6 or T1_q43b_7_FRAG=.); run;
		/*set 0/. to n=598*/
		data pcp.q1_pcc_only_15; set pcp.q1_pcc_only_14;
		if T1_q43b_7_DAYS=0 and (T1_q43b_7_FRAG=6 or T1_q43b_7_FRAG=.)
		then T1_q43b_7_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_15;
	table T1_q43b_7_DAYS T1_q43b_7_FRAG; run;

	/*if T1_q43b_7_DAYS=. and there's
	T1_q43b_7_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_15 noobs;
	var study_id T1_q43b_7_DAYS T1_q43b_7_FRAG;
	where T1_q43b_7_DAYS=0 and . < T1_q43b_7_FRAG < 6; run;
			/*recode*/
			data pcp.q1_pcc_only_15; set pcp.q1_pcc_only_15;
			if (T1_q43b_7_DAYS=0 and . < T1_q43b_7_FRAG < 6) then T1_q43b_7_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_15;
	table T1_q43b_7_DAYS T1_q43b_7_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=1*/
	data pcp.q1_pcc_only_15; set pcp.q1_pcc_only_15;
	if T1_q43b_7_DAYS>=1 and T1_q43b_7_FRAG=. then T1_q43b_7_FRAG=-3; run;
		/*check*/
		proc freq data=pcp.q1_pcc_only_15;
		table T1_q43b_7_DAYS T1_q43b_7_FRAG/missing; run;
	/*final*/
		proc freq data=pcp.q1_pcc_only_15;
		table T1_q43b_7_DAYS T1_q43b_7_FRAG/missing;
		where T1_q43b_7_DAYS ne 0; run;

/*T1_Q43B_8 - hair straightener*/
	proc freq data=pcp.q1_pcc_only_15;
	table T1_q43b_8_DAYS T1_q43b_8_FRAG; run;

	proc print data=pcp.q1_pcc_only_15 noobs;
	var study_id T1_q43b_8_DAYS T1_q43b_8_FRAG;
	where T1_q43b_8_DAYS=0 and (T1_q43b_8_FRAG=6 or T1_q43b_8_FRAG=.); run;
		/*set 0/.*/
	data pcp.q1_pcc_only_16; set pcp.q1_pcc_only_15;
	if T1_q43b_8_DAYS=0 and (T1_q43b_8_FRAG=6 or T1_q43b_8_FRAG=.)
	then T1_q43b_8_FRAG=.; run;

	proc freq data=pcp.q1_pcc_only_16;
	table T1_q43b_8_DAYS T1_q43b_8_FRAG; run;

	/*if T1_q43b_8_DAYS=. and there's
	T1_q43b_8_FRAG info it's it's an unknown # of days per week but keep frag/free/unsure*/
	proc print data=pcp.q1_pcc_only_16 noobs;
	var study_id T1_q43b_8_DAYS T1_q43b_8_FRAG;
	where T1_q43b_8_DAYS=0 and . < T1_q43b_8_FRAG < 6; run;
		/*recode*/
		data pcp.q1_pcc_only_16; set pcp.q1_pcc_only_16;
		if (T1_q43b_8_DAYS=0 and . < T1_q43b_8_FRAG < 6) then T1_q43b_8_DAYS=.; run;

	proc freq data=pcp.q1_pcc_only_16;
	table T1_q43b_8_DAYS T1_q43b_8_FRAG/missing; run;

	/*the 0/. combo should match, fix the n=1*/
	data pcp.q1_pcc_only_16; set pcp.q1_pcc_only_16;
	if T1_q43b_8_DAYS>=1 and T1_q43b_8_FRAG=. then T1_q43b_8_FRAG=-3; run;
		/*check*/
		proc freq data=pcp.q1_pcc_only_16;
		table T1_q43b_8_DAYS T1_q43b_8_FRAG/missing; run;
	/*final*/
		proc freq data=pcp.q1_pcc_only_16;
		table T1_q43b_8_DAYS T1_q43b_8_FRAG/missing;
		where T1_q43b_8_DAYS ne 0; run;

data pcp.q1_pcc_only_17; set pcp.q1_pcc_only_16; run;

%macro pcp(day, frag);
proc freq data=pcp.q1_pcc_only_17;
table &day &frag; run;

		proc print data=pcp.q1_pcc_only_17 noobs;
		var study_id &day &frag;
		where &day=0 and (&frag=6 or &frag=.); run;
					/*set 0/. to n=598*/
					data pcp.q1_pcc_only_17; set pcp.q1_pcc_only_17;
					if &day=0 and (&frag=6 or &frag=.)
					then &frag=.; run;

		proc freq data=pcp.q1_pcc_only_17;
		table &day &frag; run;

		proc print data=pcp.q1_pcc_only_17 noobs;
		var study_id &day &frag;
		where &day=0 and . < &frag < 6; run;
						/*recode*/
						data pcp.q1_pcc_only_17; set pcp.q1_pcc_only_17;
						if (&day=0 and . < &frag < 6) then &day=.; run;

		proc freq data=pcp.q1_pcc_only_17;
		table &day &frag/missing; run;

		/*the 0/. combo should match, fix the n=1*/
		data pcp.q1_pcc_only_17; set pcp.q1_pcc_only_17;
		if &day>=1 and &frag=. then &frag=-3; run;
				/*check*/
				proc freq data=pcp.q1_pcc_only_17;
				table &day &frag/missing; run;

/*final*/
	proc freq data=pcp.q1_pcc_only_17;
	table &day &frag/missing;
	where &day ne 0; run;
%mend;

%pcp(	T1_Q43B_9_DAYS	,	T1_Q43B_9_FRAG	);
%pcp(	T1_Q43B_10_DAYS	,	T1_Q43B_10_FRAG	);
%pcp(	T1_Q43B_11_DAYS	,	T1_Q43B_11_FRAG	);
%pcp(	T1_Q43C_DAYS	,	T1_Q43C_FRAG	); /*outliers*/
%pcp(	T1_Q43D_DAYS	,	T1_Q43D_FRAG	);
%pcp(	T1_Q43E_DAYS	,	T1_Q43E_FRAG	); /*outliers*/
%pcp(	T1_Q43F_DAYS	,	T1_Q43F_FRAG	);
%pcp(	T1_Q43G_DAYS	,	T1_Q43G_FRAG	);
%pcp(	T1_Q43H_DAYS	,	T1_Q43H_FRAG	);
%pcp(	T1_Q43I_DAYS	,	T1_Q43I_FRAG	);
%pcp(	T1_Q43J_DAYS	,	T1_Q43J_FRAG	);
%pcp(	T1_Q43K_DAYS	,	T1_Q43K_FRAG	);

proc print data=pcp.q1_pcc_only_17;
var study_id T1_Q43D_DAYS T1_Q43D_FRAG;
where t1_Q43D_FRAG=6; run;

	data pcp.q1_pcc_only_18; set pcp.q1_pcc_only_17;
	if study_id=7229 then T1_Q43D_FRAG=-3; run;

proc print data=pcp.q1_pcc_only_18;
var study_id T1_Q43F_DAYS T1_Q43F_FRAG;
where t1_Q43F_FRAG=6; run;

	data pcp.q1_pcc_only_18; set pcp.q1_pcc_only_18;
	if study_id=6192 then T1_Q43F_FRAG=-3; run;

proc print data=pcp.q1_pcc_only_18;
var study_id T1_Q43H_DAYS T1_Q43H_FRAG;
where t1_Q43H_FRAG=6; run;

	data pcp.q1_pcc_only_18; set pcp.q1_pcc_only_18;
	if study_id=6142 then T1_Q43H_FRAG=-3; run;

proc print data=pcp.q1_pcc_only_18;
var study_id T1_Q43J_DAYS T1_Q43J_FRAG;
where t1_Q43J_FRAG=6; run;

	data pcp.q1_pcc_only_18; set pcp.q1_pcc_only_18;
	if study_id=6183 then T1_Q43J_FRAG=-3; run;

proc print data=pcp.q1_pcc_only_18;
var study_id T1_Q43K_DAYS T1_Q43K_FRAG;
where t1_Q43K_FRAG=6; run;

	data pcp.q1_pcc_only_18; set pcp.q1_pcc_only_18;
	if study_id=6175 then T1_Q43K_FRAG=-3;
	if study_id=9155 then T1_Q43K_FRAG=-3; run;

/*check everything*/

%macro fin(day, frag);
/*check*/
	proc freq data=pcp.q1_pcc_only_18;
	table &day &frag/missing; run;
/*final*/
	proc freq data=pcp.q1_pcc_only_18;
	table &day &frag/missing;
	where &day ne 0; run;
%mend;

%fin(	T1_Q43A_1_DAYS	,	T1_Q43A_1_FRAG	);
%fin(	T1_Q43A_2_DAYS	,	T1_Q43A_2_FRAG	);
%fin(	T1_Q43A_3_DAYS	,	T1_Q43A_3_FRAG	);
%fin(	T1_Q43A_4_DAYS	,	T1_Q43A_4_FRAG	);
%fin(	T1_Q43A_5_DAYS	,	T1_Q43A_5_FRAG	);
%fin(	T1_Q43B_1_DAYS	,	T1_Q43B_1_FRAG	);
%fin(	T1_Q43B_2_DAYS	,	T1_Q43B_2_FRAG	);
%fin(	T1_Q43B_3_DAYS	,	T1_Q43B_3_FRAG	);
%fin(	T1_Q43B_4_DAYS	,	T1_Q43B_4_FRAG	);
%fin(	T1_Q43B_5_DAYS	,	T1_Q43B_5_FRAG	);
%fin(	T1_Q43B_6_DAYS	,	T1_Q43B_6_FRAG	);
%fin(	T1_Q43B_7_DAYS	,	T1_Q43B_7_FRAG	);
%fin(	T1_Q43B_8_DAYS	,	T1_Q43B_8_FRAG	);
%fin(	T1_Q43B_9_DAYS	,	T1_Q43B_9_FRAG	);
%fin(	T1_Q43B_10_DAYS	,	T1_Q43B_10_FRAG	);
%fin(	T1_Q43B_11_DAYS	,	T1_Q43B_11_FRAG	);
%fin(	T1_Q43C_DAYS	,	T1_Q43C_FRAG	);
%fin(	T1_Q43D_DAYS	,	T1_Q43D_FRAG	);
%fin(	T1_Q43E_DAYS	,	T1_Q43E_FRAG	);
%fin(	T1_Q43F_DAYS	,	T1_Q43F_FRAG	);
%fin(	T1_Q43G_DAYS	,	T1_Q43G_FRAG	);
%fin(	T1_Q43H_DAYS	,	T1_Q43H_FRAG	);
%fin(	T1_Q43I_DAYS	,	T1_Q43I_FRAG	);
%fin(	T1_Q43J_DAYS	,	T1_Q43J_FRAG	);
%fin(	T1_Q43K_DAYS	,	T1_Q43K_FRAG	);

proc freq data=pcp.q1_pcc_only_18;
table T1_Q44A T1_Q44B T1_Q44C T1_Q44D
T1_Q44E T1_Q44F T1_Q44G T1_Q44H T1_Q44I T1_Q44J T1_Q44K; run;

/*recode t1_q44J or make a new variable with best guess*/
proc contents data=pcp.q1_pcc_only_18 order=varnum; run;
data pcp.q1_pcc_only_19; set pcp.q1_pcc_only_18;
if T1_Q44J="12/30/1899"dt then T1_Q44J_recode=0;
if T1_Q44J="12/31/1899"dt then T1_Q44J_recode=1;
if T1_Q44J="01/01/1900"dt then T1_Q44J_recode=2;
if T1_Q44J="01/02/1900"dt then T1_Q44J_recode=3;
if T1_Q44J="01/03/1900"dt then T1_Q44J_recode=4;
if T1_Q44J="01/04/1900"dt then T1_Q44J_recode=5;
if T1_Q44J="01/05/1900"dt then T1_Q44J_recode=6;
if T1_Q44J="01/06/1900"dt then T1_Q44J_recode=7;
if T1_Q44J="01/07/1900"dt then T1_Q44J_recode=8;
if T1_Q44J="01/09/1900"dt then T1_Q44J_recode=10;
if T1_Q44J="01/13/1900"dt then T1_Q44J_recode=14; run;
/*will edit in excel*/

PROC EXPORT DATA= PCP.Q1_pcc_only_18
            OUTFILE= "J:\PM\TIDES_Data\REDCap Master Database\TIDES I\Tr
imester Questionnaires\Personal Care Products\pcp_import.csv"
            DBMS=CSV REPLACE;
     PUTNAMES=YES;
RUN;
