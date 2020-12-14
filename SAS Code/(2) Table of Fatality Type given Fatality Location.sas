/*Output a contingency table of Fatality Type by Fatality Location as SVG*/
options printerpath='svg' nodate nonumber topmargin="0 cm" bottommargin="9 cm";
ods noproctitle; 
ods printer style=htmlblue file='/home/u49476764/sasuser.v94/outputs/Contingency Table of Fatality Type by Fatality Location.svg'; 
	proc freq data=work.ftly;
		title 'Contingency Table of Fatality Type by Fatality Location';
		table fatality_type*fatality_location_category / norow nocol;
	run;
ods printer close;