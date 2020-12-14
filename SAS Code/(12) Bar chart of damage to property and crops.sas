/*Carry out inner join of 'detail' and 'damage' tables on 'event_id' and 'episode_id'. Select 
only 'event_type' and aggregate 'damage_property' and 'damage_crop', grouping by 'event_type'. 
Format numeric in scientific notation and save as new table 'event_damage'.*/
proc sql;
	create table event_damage as
		select event_type, sum(damage_property) as damage_property format=E9., sum(damage_crop) as damage_crop format=E9.
		from work.detail a, work.damage b 
		where a.event_id = b.event_id and b.episode_id = b.episode_id
		group by event_type;
quit;

/*Select 'event_type' and aggregate together both 'damage_property' and 'damage_crop' in sum() 
function from 'event_damage' table. Order by 'total_damage' descending and save as new table 
'event_damagex'*/
proc sql;
	create table event_damagex as
		select event_type, sum(damage_property, damage_crop) as total_damage format=E9.
		from event_damage
		order by total_damage desc;
quit;

/*Create bar chart of total damage given weather events (top 10)in 2019. Output as svg.*/
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='Damage to Property and Crops by Weather Events in 2019';
	proc sgplot data=work.event_damagex (obs=10);
		title 'Damage to Property and Crops by Weather Events in 2019';
		vbar event_type / response=total_damage;
		yaxis label='Total Damage in USD';
		xaxis label='Weather Event Type';
	run;

