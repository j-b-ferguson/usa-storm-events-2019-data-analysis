/*Inner join tables detail and ftly by event_id and subset. Save as new table ftly_det*/
proc sql;
	create table ftly_det as
		select state, event_type, d.event_id, d.episode_id, fatality_type
		from work.detail d, work.ftly f
		where d.event_id = f.event_id;
quit;

/*Left join ftly_det table onto detail table by episode_id and event_id. Subset table and mutate new column 'INJURIES'.*/
proc sql;
	create table ftly_det2 as
		select d.state, d.event_type, d.event_id, d.episode_id, sum(d.injuries_direct, d.injuries_indirect) as INJURIES, f.fatality_type
		from work.detail d left join work.ftly_det f
		on d.episode_id = f.episode_id and d.event_id = f.event_id;
quit;

/*Add new column 'FATALITIES' based upon recode case when statement. Drop 'fatality_type' column and group by
event_type. Save as new table 'ftly_det3'.*/
proc sql;
	create table ftly_det3 as
		select event_id, episode_id, state, event_type, injuries,
		       (case when fatality_type = 'D' then 1
			     when fatality_type = 'I' then 1
			     else 0
			     end) as FATALITIES
		from work.ftly_det2
		group by event_type;
quit;

/*Select only event_type from ftly_det3 and perform aggregations on injuries and fatalities columns. Rename
as 'Injuries' and 'Fatalities', respectfully. Save as new table ftly_det4*/
proc sql;
	create table ftly_det4 as
		select event_type, sum(injuries) as Injuries, sum(fatalities) as Fatalities
		from ftly_det3
		group by event_type;
quit;

/*Select all columns from ftly_det4 and mutate new column 'Impact_Coefficient'. Filter by Impact_Coefficient > 0.01
and order by Impact_Coefficient descending. Save as new table 'weather_impact'*/
proc sql;
	create table weather_impact as
		select *, round((Injuries + Fatalities) / (sum(injuries) + sum(fatalities)), 0.001) as Impact_Coefficient
		from work.ftly_det4
		having Impact_Coefficient >= 0.01
		order by Impact_Coefficient desc;
quit;
