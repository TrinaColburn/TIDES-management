/*Retain for Bioassay data*/

proc sort data=redcapdata;
by study_id event;
run;

data newdata;
set redcapdata;
by study_id event;
retain t1a_sumdehp t1a_sumdehp3 t2a_sumdehp t2a_sumdehp3 t3a_sumdehp t3a_sumdehp3; 
						/* I think you need a new set of 6 variables to mirror the old ones – 
						I’ve just added an “a” to the first part of the names – you can always rename them back later */
	if first.study_id then do; 
   t1a_sumdehp=.;   t1a_sumdehp3=.;  t2a_sumdehp=.;   t2a_sumdehp3=.;  t3a_sumdehp=.;   t3a_sumdehp3=.;  
   					/* initialize to missing until you find their values for this subject */
end;
select(event);
      when(“first_tri”) do; 
			t1a_sumdehp=t1_sumdehp;
			t1a_sumdehp3=t1_sumdeph3;
       end;
                when(“second_tri”) do 
t2a_sumdehp=t2_sumdehp;
t2a_sumdehp3=t2_sumdeph3;
               end;
when(“third_tri”) do; 
t3a_sumdehp=t3_sumdehp;
t3a_sumdehp3=t3_sumdeph3;
               end;
end;
if last.study_id then output;
drop event t1_sumdehp t1_sumdehp3 t2_sumdehp t2_sumdehp3 t3_sumdehp t3_sumdehp3;
run;
