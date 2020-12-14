/*Inner join tornadoes and damage tables by event_id and episode_id. Save as new table 'tornado_damage'*/
proc sql;
	create table tornado_damage as
		select * 
		from work.tornadoes t, work.damage d
		where t.event_id = d.event_id and t.episode_id = d.episode_id;
quit;

/*Filter tornado_damage column by tor_f_scale = 'EF0' and tor_f_scale = 'EF1' and save as new table 'ef0ef1_damage'*/
proc sql;
	create table ef0ef1_damage as
		select *
		from work.tornado_damage
		where tor_f_scale = 'EF0' or tor_f_scale = 'EF1';
quit;

/*Run t-test of property damage given tornado severity and show QQ-plots. Save and edit SGE file and output as SVG.*/
ods _all_ close;
ods listing sge=on gpath='/home/u49476764/sasuser.v94/sgeplots';
ods select QQPlot;
ods graphics / imagename='qqplotsge';
	proc ttest data=work.ef0ef1_damage h0=0 alpha=0.01;
		var damage_property;
		class tor_f_scale;
	run;
	
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='QQplot of Property Damage given Tornado Severity';
	proc sgrender sge='/home/u49476764/sasuser.v94/sgeplots/qqplotedited.sge';
	run;

/*Run t-test of property damage given tornado severity and show distribution plots. Save and edit SGE file and output as SVG.*/
ods _all_ close;
ods listing sge=on gpath='/home/u49476764/sasuser.v94/sgeplots';
ods select SummaryPanel;
ods graphics / imagename='summarypanelsge';
	proc ttest data=work.ef0ef1_damage h0=0 alpha=0.01;
		var damage_property;
		class tor_f_scale;
	run;
	
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='Distribution of Property Damage by EF0_EF1 Tornadoes';
	proc sgrender sge='/home/u49476764/sasuser.v94/sgeplots/summarypaneledited.sge';
	run;

/*Run t-test of property damage given tornado severity and show results of t-test. Output as SVG.*/
ods _all_ close;
options printerpath='svg' nodate nonumber topmargin="0 cm" bottommargin="3 cm";
ods listing;
ods select Statistics ConfLimits TTests Equality;
ods printer style=htmlblue file='/home/u49476764/sasuser.v94/outputs/T-test of Property Damage given Tornado Severity.svg';
	proc ttest data=work.ef0ef1_damage h0=0 alpha=0.01;
		var damage_property;
		class tor_f_scale;
		title 'Two Independent Sample T-Test of Property Damage given Tornado Severity (EF0/EF1)';
	run;
ods printer close;