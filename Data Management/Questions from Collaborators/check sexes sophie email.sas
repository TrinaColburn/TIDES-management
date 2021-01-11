libname births "J:\PM\TIDES_Data\TIDES I Data\LiveBirths\Live births"; run;

/*Copying a note I made for our team here:

compared "child_sex" to "childsex" from the tides_inventory --> looks like this cbcl sex variable is even more complete and differs slightly
    >>> 2 ppts are "M" in the inventory, and now "Female": '6083', '7163'
    >>> 1 ppt is "F" in the inventory, and now "Male": '8139'
    >>> 3 participants are "0" in the inventory, and now "Male": '6142', '6229', '7093'
    >>> 1 participant is "0" in the inventory, and now "Female": '6040'
We’re wondering if this is a gender identity thing? Can you confirm that this is intentional?*/



proc contents data=births.Livebirths_tidesonly_02202019 order=varnum; run;


data livebirths_tidesonly_work; set  births.Livebirths_tidesonly_02202019;
study_id=input(studyid,best8.);
run;

proc print data=livebirths_tidesonly_work;
var study_id LiveBirthGender;
where study_id=6083 or study_id=7163 or study_id=8139 or study_id=6142 or study_id=6229 or
	  study_id=7093 or study_id=6040;
run;

proc print data=cmd_srs.Tii_4_bascsrs_2019411_srsonly;
var study_id srs_sex;
where study_id=6083 or study_id=7163 or study_id=8139 or study_id=6142 or study_id=6229 or
	  study_id=7093 or study_id=6040;
run;





    >>> 2 ppts are "M" in the inventory, and now "Female": '6083', '7163'
    >>> 1 ppt is "F" in the inventory, and now "Male": '8139'
    >>> 3 participants are "0" in the inventory, and now "Male": '6142', '6229', '7093'
    >>> 1 participant is "0" in the inventory, and now "Female": '6040'
