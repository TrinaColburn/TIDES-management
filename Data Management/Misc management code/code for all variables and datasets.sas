ods trace on; ods trace off;

proc contents data=ti_echo._all_ order=varnum out=ti_variables (keep=MEMNAME name);
run;


PROC EXPORT DATA= WORK.ti_Variables
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\variable names to find dates.xlsx"
            DBMS=EXCEL REPLACE;
     		SHEET="ti variables";
RUN;

proc contents data=_4_echo._all_ order=varnum out=tii_4_variables (keep=MEMNAME name);
run;

PROC EXPORT DATA= WORK.tii_4_Variables
            OUTFILE= "J:\PM\TIDES_Data\Data Management\Data sharing history - NEED TO CLEAN\Data for PW and NYU\variable names to find dates.xlsx"
            DBMS=EXCEL REPLACE;
     		SHEET="Age 4 variables"; RUN;
