/*Create bar chart showing fatalities based upon event_type. Output as SVG.*/
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='Weather event fatalities in 2019';
	proc sgplot data=work.weather_impact;
		vbar event_type / response=fatalities;
		title 'Weather Event Fatalities in 2019';
		xaxis label='Weather Event Type';
		yaxis label='Fatality Count';
	run;