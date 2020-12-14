/*Select 'state' variable from ftly_det3 table and perform aggregations onto injuries and fatalities. Rename as
'Injuries' and 'Fatalities'. Group by state and save as table 'state_injfat'*/
proc sql;
	create table state_injfat as
		select state, sum(injuries) as Injuries, sum(fatalities) as Fatalities
		from work.ftly_det3
		group by state;
quit;

/*Select all columns from state_injfat and mutate new column 'Impact_Coefficient'. Filter by impact_coefficient > 0.01
and order by Impact_Coefficient descending. Save as a new table state_impact.*/
proc sql;
	create table state_impact as
		select *, round((Injuries + Fatalities) / (sum(Injuries) + sum(Fatalities)), 0.001) as Impact_Coefficient
		from work.state_injfat
		having impact_coefficient > 0.01
		order by Impact_Coefficient desc;
quit;