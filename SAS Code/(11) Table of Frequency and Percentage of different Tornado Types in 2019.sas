/*Create frequency distribution table, with percentage, showing different tornado types in 2019.*/
ods _all_ close;
options printerpath='svg' nodate nonumber topmargin="0 cm" bottommargin="11 cm";
ods noproctitle; 
ods printer style=htmlblue file='/home/u49476764/sasuser.v94/outputs/Table of Frequency and Percentage of different Tornado Types in 2019.svg'; 
	proc freq data=work.tornadoes;
		title 'Table of Frequency and Percentage of different Tornado Types in 2019';
		table tor_f_scale / nocum;
	run;
ods printer close;