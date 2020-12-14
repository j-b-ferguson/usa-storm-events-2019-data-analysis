/*Create bar chart showing monthly variation in impact_coefficient. Output as SVG.*/
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='Weather Event Impact in 2019';
	proc sgplot data=work.weather_impact;
		vbar event_type / response=impact_coefficient;
		title 'Weather Event Impact in 2019';
		xaxis label='Weather Event Type';
		yaxis label='Impact Coefficient';
	run;
