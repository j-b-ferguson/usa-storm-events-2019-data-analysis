/*Create bar chart of variation in fatalities given state. Output as svg.*/
ods _all_ close;
ods listing gpath='/home/u49476764/sasuser.v94/plots';
ods graphics / outputfmt=svg imagename='Weather Event Fatalities in States in 2019';
	proc sgplot data=work.state_impact;
		vbar state / response=fatalities;
		title 'Weather Event Fatalities in States in 2019';
		xaxis label='State';
		yaxis label='Fatality Count';
run;