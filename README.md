# Analysis of 2019 Storm Events in USA

[Justin Ferguson GitHub](https://github.com/j-b-ferguson)

[Justin Ferguson LinkedIn](https://www.linkedin.com/in/jf2749/)

[Contact](mailto:justin.benjamin.ferguson@gmail.com?subject=GitHub%20Enquiry)

## Introduction
Analysis of data on past weather events is a vitally important method to help understand, predict, and plan for future events. Of particular importance is to better understand the impact that storm events may have on property, crops, and human life. One such phenomenon unique to storm events is that of the tornado. They are known for their destructive prowess and come in many flavours.

This report will analyse and quantify the impact of storm events in 2019, in the USA, by focusing solely on tornadoes as a type of storm event.

## Methods

The analysis performed in this report was completed in SAS with data sets made available by the National Centers for Environmental Information https://www.ncdc.noaa.gov/. Six data sets were extracted and contained the following information, variables, and observations:

Descriptions – contains a narrative about weather event episodes: 2 variables, 10575 observations.

Detail – contains information such as weather event type, state, time, injuries, etc.: 19 variables, 67539 observations.

Damage – contains information about damage caused to property and crop by weather events: 4 variables, 67539 observations.

Fatalities – contains information about fatality type, date, sex, associated weather event, etc.: 7 variables, 577 observations.

Tornadoes – contains information about tornado type, dimensions, associated weather event, etc.: 9 variables, 1728 observations.

Locations – contains information about weather event locations, coordinates, range, etc.: 10 variables, 53215 observations.

[View Data Sets](https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/tree/main/Data%20Sets)

## Results

Refer to figure 1 below. This figure summarises the types of fatality and location of death in the USA in 2019 as a contingency table. There are two fatality types: the first is associated with direct exposure to the forces of the weather event, the so-called 'direct fatalities'. The other type is because of the indirect presence of the weather event. For example, an elevated stress level due to a weather event led to a heart attack. Hence, the heart attack is the direct cause of death, the weather event is the indirect cause. This type of death is classified as an 'indirect fatality'.

<img src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Contingency%20Table%20of%20Fatality%20Type%20by%20Fatality%20Location.svg">
<p align="center">Figure 1: A contingency table showing fatality type by fatality location in 2019.</p>

With this explanation aside, first, consider the row totals, these statistics are related to the type of fatality. They show that weather events attributed to 415 direct and 162 indirect fatalities, or 72 % and 28 %, respectively. Most notably, deaths due to the direct forces of nature were significantly higher than indirect causes. The overall fatality statistic was 577.

Now consider the column totals in figure 1, these statistics are associated with the location of death. Most intuitively, being inside accounted for the least fatalities, only 8 %. As expected, being outside had considerably more, with 29 %. Positioning next to bodies of water appeared to be similarly dangerous with 22 %. However, vehicle or equipment related deaths appeared to trump all others with 35 %.

Lastly, consider the intersects of figure 1, these statistics provide information about the type of fatality with the location of death. Logically, being outside during a weather event had the most direct fatalities, owning 23 % of total fatalities, the most hazardous of all metrics. However, vehicle equipment and water located direct fatalities followed closely behind, with 22 % and 19 % respectively. Indirect fatalities were their deadliest when associated with a vehicle or equipment, accounting for 14 % of the total metric, and dwarfing all other locations with respect to this fatality type.

Figure 2 shows the total direct and indirect injuries per month for weather events in 2019. Visual analysis suggests that weather events posed a greater risk to injury from January to July, and falls off considerably from August to December. To supplement this analysis, the chart shows that the highest direct and indirect injury count was May and February; the lowest injury count was January and October, respectively.

<img src="https://github.com/j-b-ferguson/usa-storm-events-2019-analysis/blob/main/plots/Total%20Direct%20and%20Indirect%20Injuries%20per%20Month%20for%20Weather%20Events%20in%202019.svg" height="50%">
<p align="center">Figure 2: A clustered bar chart showing the total direct and indirect injuries per month for weather events in 2019.</p>
