<h1 align="center">An Analysis of 2019 Storm Events in the USA</h1>

<a href="https://github.com/j-b-ferguson"><p align="center">Justin Ferguson GitHub</p></a>
<a href="https://www.linkedin.com/in/jf2749/"><p align="center">Justin Ferguson LinkedIn</p></a>
<a href="mailto:justin.benjamin.ferguson@gmail.com?subject=GitHub%20Enquiry"><p align="center">Contact</p></a>

<h2 align="center">Introduction</h2>
<p align="justify">
Analysis of data on past weather events is a vitally important process to understand, predict, and plan for future events. Of particular importance is to better understand the impact that storm events may have on property, crops, and human life. One such phenomenon unique to storm events is that of the tornado. They are known for their destructive prowess and come in many flavours.

This report will analyse and quantify the impact of storm events in 2019, in the USA, by focusing solely on tornadoes as a type of storm event.
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

<h2 align="center">Results</h2>

<p align="justify">
Refer to figure 1 below. This figure summarises the types of fatality and location of death in the USA in 2019 as a contingency table. There are two fatality types: the first is associated with direct exposure to the forces of the weather event, the so-called 'direct fatalities'. The other type is because of the indirect presence of the weather event. For example, an elevated stress level due to a weather event led to a heart attack. Hence, the heart attack is the direct cause of death, the weather event is the indirect cause. This type of death is classified as an 'indirect fatality'.
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Contingency%20Table%20of%20Fatality%20Type%20by%20Fatality%20Location.svg">
</p>
<p align="center">Figure 1: A contingency table showing fatality type by fatality location in 2019.</p>

<p align="justify">
With this explanation aside, first consider the row totals, these statistics are related to the type of fatality. They show that weather events attributed to 415 direct and 162 indirect fatalities, or 72 % and 28 %, respectively. Most notably, deaths due to the direct forces of nature were significantly higher than indirect causes. The overall fatality statistic was 577.
</p>

<p align="justify">
Now consider the column totals in figure 1, these statistics are associated with the location of death. Most intuitively, being inside accounted for the least fatalities, only 8 %. As expected, being outside had considerably more, with 29 %. Positioning next to bodies of water appeared to be similarly dangerous with 22 %. However, vehicle or equipment related deaths appeared to trump all others with 35 %.
</p>

<p align="justify">
Lastly, consider the intersects of figure 1, these statistics provide information about the type of fatality with the location of death. Logically, being outside during a weather event had the most direct fatalities, owning 23 % of total fatalities, the most hazardous of all metrics. However, vehicle equipment and water located direct fatalities followed closely behind, with 22 % and 19 % respectively. Indirect fatalities were their deadliest when associated with a vehicle or equipment, accounting for 14 % of the total metric, and dwarfing all other locations with respect to this fatality type.
</p>

<p align="justify">
Figure 2 shows the total direct and indirect injuries per month for weather events in 2019. Visual analysis suggests that weather events posed a greater risk to injury from January to July, and falls off considerably from August to December. To supplement this analysis, the chart shows that the highest direct and indirect injury count was May and February; the lowest injury count was in January and October, respectively.
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
Both plots show that the normality of samples has not been satisfied. Also, note that the variance of EF0 with respect to EF1 is much larger. Regardless of these violations of normality, the Central Limit Theorem allows the t-test to proceed because sample sizes are greater than 30.
</p>

<p align="justify">
As in figure 5 below, the <i>p</i>-value for the test of homogeneity of variance is <i>p</i> < .0001, so <i>H</i><sub> 0</sub> was rejected at the 99 % confidence level; and so, equal variances could not be assumed. Using the Satterthwaite (Welch) method for the two sample <i>t</i>-test found a statistically significant mean difference in property damage between tornado severity EF0 and EF1 of -$216,579, where <i>t</i> (df = 536.81) = -4.46, <i>p</i> <.0001 99 %[-$342,058 -$91,101].
</p>

<p align="center">
  <img width="75%" height="75%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/T-test%20of%20Property%20Damage%20given%20Tornado%20Severity.svg">  
</p>
<p align="center">Figure 5: A summary of the two independent sample t-test of property damage given <br> tornado type. Also shown is the test for equality of variances.</p>

<p align="justify">
Note that the difference in count between these tornadoes is only; EF0 - EF1: 644 - 531 = 113. Nevertheless, there is a clear statistically significant difference in the cost of property damage between the two types of tornadoes. One can assume that this difference is due to the variation in destructive power between these two types of tornado.
</p>

<p align="justify">
Figure 6 below shows the frequencies and percentages of different tornado types last year. Overall, there were a total of 1728 tornado occurrences, with only 2.77 % being either EF3 or EF4. Now observe figure 6 below, the total damage caused by tornadoes in 2019 far exceeds any other weather event classification. A large number of EF1 tornadoes last year, and tornadoes overall, in conjunction with the differences in damage caused by EF0 and EF1 types, such as maximums of $1.38M against $15M, as well as a mean difference of -$216,579, appear to account for the $3B in damage.
</p>

<a href="https://www.codecogs.com/eqnedit.php?latex=I_{\alpha}&space;=&space;\sum_{i}\frac{f_{\alpha}&plus;t_{\alpha}}{f_{i}&plus;t_{i}}." target="_blank"><img src="https://latex.codecogs.com/svg.latex?I_{\alpha}&space;=&space;\sum_{i}\frac{f_{\alpha}&plus;t_{\alpha}}{f_{i}&plus;t_{i}}." title="I_{\alpha} = \sum_{i}\frac{f_{\alpha}+t_{\alpha}}{f_{i}+t_{i}}." /></a>
