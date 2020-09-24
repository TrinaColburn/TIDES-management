proc contents data=agd1yr.Agdy1_021719 order=varnum;
run;

data agd1yr.Agdy1_021719_deid; set agd1yr.Agdy1_021719;
drop examdate;
run;

data agdbirth.Agdbirth_tidesonly_02192019_deid; set agdbirth.Agdbirth_tidesonly_02192019_deid;
drop examdate;
run;

proc contents data=brr.Brr_tidesonly_02202019 order=varnum;
run;

data age4.Age4maternal; set Age4maternal; run;


data brr.Brr_tidesonly_22019_deid; set brr.Brr_tidesonly_02202019;
drop brr_date brr_time date_of_delivery time_of_delivery; run;

data gestage.gestages_02202019_deid; set gestage.gestages_02202019;
drop LiveBirthDOB TIDES_Women_LMP; run;
