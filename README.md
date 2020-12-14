<h1 align="center">An Analysis of 2019 Storm Events in the USA</h1>

<p align="center"><b>Author</b></p>
<a href="https://github.com/j-b-ferguson"><p align="center">Justin Ferguson GitHub</p></a>
<a href="https://www.linkedin.com/in/jf2749/"><p align="center">Justin Ferguson LinkedIn</p></a>
<a href="mailto:justin.benjamin.ferguson@gmail.com?subject=GitHub%20Enquiry"><p align="center">Contact</p></a>

<h2 align="center">Introduction</h2>
<p align="justify">
The analysis of data on past weather events is a vitally important process to understand, predict, and plan for future events. Of particular importance is to better understand the impact that storm events may have on property, crops, and human life. One such phenomenon unique to storm events is that of the tornado. They are known for their destructive prowess and come in many flavours.

This report will analyse and quantify the impact of storm events in 2019 in the USA by mainly focusing on tornadoes.
</p>

<h2 align="center">Methods</h2>

<p align="justify">
The analysis performed in this report was completed in SAS with data sets made available by the National Centers for Environmental Information https://www.ncdc.noaa.gov/. Six data sets were extracted and contained the following information, variables, and observations:

Descriptions – contains a narrative about weather event episodes: 2 variables, 10575 observations.

Detail – contains information such as weather event type, state, time, injuries, etc.: 19 variables, 67539 observations.

Damage – contains information about damage caused to property and crop by weather events: 4 variables, 67539 observations.

Fatalities – contains information about fatality type, date, sex, associated weather event, etc.: 7 variables, 577 observations.

Tornadoes – contains information about tornado type, dimensions, associated weather event, etc.: 9 variables, 1728 observations.

Locations – contains information about weather event locations, coordinates, range, etc.: 10 variables, 53215 observations.

[View Data Sets](https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/tree/main/Data%20Sets)
</p>

<p align="justify">
The data sets were read into SAS using a DATA step or with a library reference. Data types of selected variables were then defined as either datetime, character, or numeric, where required. Any necessary value recoding or data tidying was carried out with conditional statements and the PROC TRANSPOSE procedure. Tables were joined together with PROC SQL statements to enable the analysis of those variables of interest. Several outputs and plots have been produced to support the analysis thoroughout this report using either the PROC FREQ or PROC SGPLOT procedures. Other methods used to further the analysis include a statistical t-test using the PROC TTEST procedure at the 99% confidence level.
</p>

<h2 align="center">Results</h2>

<p align="justify">
Refer to figure 1 below. This figure summarises the types of fatality and locations of death in the USA in 2019 as a contingency table. There are two fatality types: the first is associated with direct exposure to the forces of the weather event, the so-called 'direct fatalities'. The other type is due to the indirect presence of the weather event. For example, an elevated stress level due to a weather event led to a heart attack. Hence, the heart attack is the direct cause of death, the weather event is the indirect cause. This type of death is classified as an 'indirect fatality'.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Contingency%20Table%20of%20Fatality%20Type%20by%20Fatality%20Location.svg">
</p>
<p align="center">Figure 1: A contingency table showing fatality type by fatality location in 2019.</p>

<p align="justify">
With this explanation aside, first consider the row totals, these statistics are related to the type of fatality. They show that weather events attributed to 415 direct and 162 indirect fatalities, or 72% and 28%, respectively. Most notably, deaths due to the direct forces of nature were significantly higher than indirect. The overall fatality statistic was 577.
</p>

<p align="justify">
Now consider the column totals in figure 1, these statistics are associated with the location of death. Most intuitively, being inside accounted for the least fatalities, only 8%. As expected, being outside had considerably more, with 29%. Positioning next to bodies of water appeared to be as dangerous with 22%. However, vehicle or equipment related deaths appeared to trump all others with 35%.
</p>

<p align="justify">
Lastly, consider the intersects of figure 1, these statistics provide information about the type of fatality and the location of death. Logically, being outside during a weather event had the most direct fatalities, owning 23% of the total and the most hazardous of all metrics. However, vehicle/equipment and water-based direct fatalities followed closely behind, with 22% and 19% respectively. Indirect fatalities were their deadliest when linked with a vehicle/equipment, accounting for 14% of the total metric and dwarfing all other locations of death.
</p>

<p align="justify">
Figure 2 shows the total direct and indirect injuries per month for weather events in 2019. Visual analysis suggests that weather events pose a greater risk to injury from January to July, but then drops considerably between August and December. The greatest risk of direct and indirect injury occurs in May and February, respectively. The safest months are January and October.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Total%20Direct%20and%20Indirect%20Injuries%20per%20Month%20for%20Weather%20Events%20in%202019.svg">
</p>
<p align="center">Figure 2: A clustered bar chart showing the total direct and indirect injuries per month for <br> weather events in 2019.</p>

<p align="justify">
To better understand the impact of storm events last year, it is appropriate to consider the effect that extreme phenomena may have had on property damage and human life. In this context, a two independent samples t-test has been carried out to test for a statistically significant mean difference in the cost of property damage, between tornado severity types EF0 and EF1, given;
</p>

<p align="center">
Null Hypothesis: <i>H</i><sub> 0</sub> = 0,
<br>
Alternative Hypothesis: 
<i>H</i><sub> A</sub> &ne; 0,
<br>
Sample Size EF0: <i>N</i><sub> EF0</sub> = 644 > 30,
<br>
Sample Size EF1: <i>N</i><sub> EF1</sub> = 531 > 30,
<br>
Significance level: 
<i>&alpha;</i> = 0.01.

Consider figures 3 and 4 below showing kernels of each sample against a theoretical normal distribution and Q-Q plots to check the normality assumption.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Distribution%20of%20Property%20Damage%20by%20EF0_EF1%20Tornadoes.svg">
</p>
<p align="center">Figure 3: Distribution curves of the EF0 and EF1 kernels against the normal distribution <br> with actual data points for both types below.</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/QQplot%20of%20Property%20Damage%20given%20Tornado%20Severity.svg">
</p>
<p align="center">Figure 4: Q-Q plots show the distributions of tornado types plotted against theoretical <br> normal quantiles.</p>

<p align="justify">
Both plots show that the normality of samples has not been satisfied. Also, note that the variance of EF0 with respect to EF1 is much larger. Regardless of these violations of normality, the Central Limit Theorem ensures the t-test can proceed because both sample sizes are greater than 30.
</p>

<p align="justify">
As in figure 5 below, the <i>p</i>-value for the test of homogeneity of variance is <i>p</i> < .0001, so <i>H</i><sub> 0</sub> was rejected at the 99% confidence level and equal variances was not assumed. Using the Satterthwaite (Welch) method for a two samples <i>t</i>-test found a statistically significant mean difference in property damage between tornado severity EF0 and EF1 of -$216,579, where <i>t</i> (df = 536.81) = -4.46, <i>p</i> <.0001 99%[-$342,058 -$91,101]. In simplier terms, the average cost of property damage during a EF1 tornado event is significantly greater than an EF0 tornado event. The average difference in the cost of property damage between these two types is $216,579. This variation quantifies the differences in destructive power.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/T-test%20of%20Property%20Damage%20given%20Tornado%20Severity.svg">  
</p>
<p align="center">Figure 5: A summary of the two independent sample t-test of property damage given <br> tornado type. Also shown is the test for equality of variances.</p>

<p align="justify">
Figure 6 below shows the frequencies and percentages of different tornado types last year. Overall, there were a total of 1728 tornado occurrences, with 78% being EF0 or EF1. The difference in numbers between these types is only 113.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Table%20of%20Frequency%20and%20Percentage%20of%20different%20Tornado%20Types%20in%202019.svg">
</p>
<p align="center">Figure 6: A frequency distribution table with percentage of different tornado types in 2019.</p>

<p align="justify"> 
Now observe figure 7 below, the total damage caused by all tornadoes in 2019 far exceeds any other weather event classification with $3B in total damage. A crude method to gauge the contribution towards this total is to multiply the average cost of a single occurence (taken from figure 5) by the total number of occurences.
</p>

<p align="center">Mean<sub> EF0</sub> x <i>N</i><sub> EF0</sub>: $25,391 x 644 = $16.35M</p>
<p align="center">Mean<sub> EF1</sub> x <i>N</i><sub> EF1</sub>: $241,970 x 531 = $128.49M</p>

<p align="justify"> 
The difference in accumulated damages is almost eight-fold. However, when compared with the total damage cost shown in figure 7, the combined sum of damages due to EF0 and EF1 tornadoes account for less than 1%. So, one can infer that the cost of damage between the types must rise exponentially. Therefore, EF2 and greater tornadoes must account for the majority of damages. One can assume that a major factor to judge a tornado season's overall severity is predominantly determined by the number of severe tornadoes (of at least type EF2 and greater).
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Damage%20to%20Property%20and%20Crops%20by%20Weather%20Events%20in%202019.svg">
</p>
<p align="center">Figure 7: A bar chart showing damage cost to property and crops caused by weather events in 2019.</p>

<p align="justify">
Another way to ascertain the effect that storm events had in 2019 is to measure the overall impact on human life. Consider figure 8 below, the impact coefficient has been created to measure the effect of such events and is defined as follows:
</p>

<p align="center">
<a href="https://www.codecogs.com/eqnedit.php?latex=I_{\alpha}&space;=&space;\sum_{i}\frac{f_{\alpha}&plus;t_{\alpha}}{f_{i}&plus;t_{i}}." target="_blank"><img src="https://latex.codecogs.com/svg.latex?I_{\alpha}&space;=&space;\sum_{i}\frac{f_{\alpha}&plus;t_{\alpha}}{f_{i}&plus;t_{i}}." title="I_{\alpha} = \sum_{i}\frac{f_{\alpha}+t_{\alpha}}{f_{i}+t_{i}}." /></a>
</p>

<p align="justify">
Where <i>I</i><sub>&alpha;</sub> is the impact coefficient, <i>f</i><sub>&alpha;</sub> are the total fatalities (direct and indirect), and <i>t</i><sub>&alpha;</sub> are the total injuries (direct and indirect) of any particular weather event type &alpha;. In the denominator, these variables are summed through <i>i</i> weather event types. Figure 8 reveals the overall impact on human life due to tornadoes last year was 0.6. This surpasses all other weather events overwhelmingly, as the remaining fall short of 0.1. Also below, figure 9 reveals an impact coefficient of approximately 0.5 in Alabama, this exceeds all other states. Therefore, one can infer that tornadoes had the highest impact on human life in the state of Alabama.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Weather%20Event%20Impact%20in%202019.svg">
</p>
<p align="center">Figure 8: A bar chart showing impact coefficient given weather event type.</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Weather%20Event%20Impact%20in%20States%20in%202019.svg">
</p>
<p align="center">Figure 9: A bar chart showing impact coefficient given state.</p>

<p align="justify">
Figure 10 below shows fatalities based upon the weather event classification. Rip currents produced the most fatalities and wildfires the least, approximately 60 and 5, respectively. Despite having the highest impact coefficient, tornadoes were not the deadliest.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Weather%20event%20fatalities%20in%202019.svg">
</p>
<p align="center">Figure 10: A bar chart showing fatalities given weather event type.</p>

<p align="justify">
A similar situation in figure 11, where Alabama did not have the largest count of mortalities, despite yielding the highest impact coefficient. Instead, the highest concentration of fatalities is in California with around 60.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Weather%20Event%20Fatalities%20in%20States%20in%202019.svg">
</p>
<p align="center">Figure 11: A bar chart showing fatalities given state.</p>

<h2 align="center">Conclusion</h2>

<p align="justify">
Weather events overall amassed 577 fatalities last year in the USA, with the majority not inside and due to direct exposure. A visual analysis revealed the months of greatest risk being from January to July. Of particular interest is the effect of storm events, as these categorise some of the most extreme phenomena, such as tornadoes.
</p>

<p align="justify">
Overall, there were a high number of tornadoes last year, with 78% being either EF0 or EF1. The difference in average damage cost for each occurence between these two tornado types was statistically significant being $216,579 with 99% confidence. This quantifies the difference in destructive power. Nevertheless the combined sum of damages due to EF0 and EF1 tornadoes account for less than 1% of the overall $3B of damage in 2019. This infers that the differences in damages caused by tornadoes between different categories is exponential as the overwhelming majority of damage caused was done by EF2 and greater. Moreover, one should infer that the degree of tornado season severity is predominantly determined by the count of severe tornadoes (of at least type EF2 and greater).
</p>

<p align="justify">
Despite not having the most fatalities with respect to other weather event types, tornadoes clearly had the most significant effect on human life over all other events last year in other metrics. This is prominently shown in terms of impact coefficients (and damages caused). Based upon the analysis, Alabama appears to have been the most severely affected.
</p>
