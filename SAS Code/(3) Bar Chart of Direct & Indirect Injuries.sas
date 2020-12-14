/*Subset the detail table and extract the month from the 'begin_date_time' variable. Save as a new table 'dtl'.*/
proc sql;
	create table work.dtl as 
		select episode_id, event_id, injuries_direct, injuries_indirect, datepart(begin_date_time) format monname. as MONTH
		from det.detail;
quit;

/*Transpose the variables 'injuries_direct' and 'injuries_indirect' from wide to long format and output as new table 'dtlx'.*/
proc transpose data=work.dtl name=INJURY_TYPE out=work.dtlx prefix=TOTALINJURIES; 
	by episode_id event_id month notsorted;
run;

/*Rename columns and values for presentation and save as new table 'dtlx2'*/
proc sql;
	create table work.dtlx2 as
	select episode_id, event_id, month, totalinjuries1 as TOTAL_INJURIES,
		(case when injury_type='INJURIES_DIRECT' then 'Direct'
			  when injury_type='INJURIES_INDIRECT' then 'Indirect'
			  else ''
			  end) as INJURY_TYPE
	from work.dtlx;
quit;

/*Create clustered bar chart showing Total Direct and Indirect Injuries per Month for Weather Events in 2019. Output as svg.*/
ods _all_ close;
ods noproctitle;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics on / reset=all outputfmt=svg imagename='Total Direct and Indirect Injuries per Month for Weather Events in 2019';
	proc sgplot data=work.dtlx2;
		vbar month / response=TOTAL_INJURIES group=INJURY_TYPE groupdisplay=cluster;
		keylegend / title='Injury Type';
		title 'Total Direct and Indirect Injuries per Month for Weather Events in 2019';
		xaxis label='Month';
		yaxis label='Weather Event Injury Count';
	run;