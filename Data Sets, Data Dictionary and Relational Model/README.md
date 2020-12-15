<h1><p align="center">Data Dictionary and Relational Model</p></h1>

<p align="center">
  <img width="100%" height="100%" src="https://github.com/j-b-ferguson/usa-storm-events-2019-data-analysis/blob/main/Data%20Sets%2C%20Data%20Dictionary%20and%20Relational%20Model/Relational%20Model.png">
</p>

| Variable  | Description |
| ------------- | ------------- |
| EVENT_ID      | ID assigned by NWS for each individual storm event contained within a storm episode. |
| EPISODE_ID    | ID assigned by NWS to denote the storm episode - episodes may contain multiple events. |
| DAMAGE_PROPERTY | The estimated amount of damage to property incurred by the weather event. |
| DAMAGE_PROPERTY_UNIT | Multiplier unit of amount of damage to property incurred by the weather event e.g. $1M = $1,000,000. |
| DAMAGE_CROP | The estimated amount of damage to crops incurred by the weather event. |
| DAMAGE_CROP_UNIT | Multiplier unit of amount of damage to crops incurred by the weather event e.g. $1M = $1,000,000. |
| TOR_F_SCALE | Enhanced Fujita Scale describes the strength of the tornado based on the amount and type of damage caused by the tornado. The F-scale of damage will vary in the destruction area; therefore, the highest value of the F-scale is recorded for each event.<br><br>EF0 – Light Damage (40 – 72 mph)<br>EF1 – Moderate Damage (73 – 112 mph)<br>EF2 – Significant damage (113 – 157 mph)<br>EF3 – Severe Damage (158 – 206 mph)<br>EF4 – Devastating Damage (207 – 260 mph)<br>EF5 – Incredible Damage (261 – 318 mph) |
| TOR_LENGTH | Length of the tornado or tornado segment while on the ground (in miles to the tenth). |
| TOR_WIDTH | Width of the tornado or tornado segment while on the ground (in feet). |
| TOR_OTHER_WFO | Indicates the continuation of a tornado segment as it crossed from one National Weather Service Forecast Office to another. The subsequent WFO identifier is provided within this field. |
| TOR_OTHER_CZ_STATE | The two-character representation for the state name of the continuing tornado segment as it crossed from one county or zone to another. The subsequent 2-Letter State ID is provided within this field. |
| TOR_OTHER_CZ_FIPS | The FIPS number of the county entered by the continuing tornado segment as it crossed from one county to another. The subsequent FIPS number is provided within this field. |
| TOR_OTHER_CZ_NAME | The FIPS name of the county entered by the continuing tornado segment as it crossed from one county to another. The subsequent county or zone name is provided within this field in ALL CAPS. |
| EPISODE NARRATIVE | The episode narrative depicting the general nature and overall activity of the episode. The National Weather Service creates the narrative. |
| STATE | The state name where the event occurred. |
| STATE_FIPS | A unique number (State Federal Information Processing Standard) assigned to the county by the National Institute for Standards and Technology (NIST). |
| EVENT_TYPE | The chosen event name should be the one that most accurately describes the meteorological event leading to fatalities, injuries, damage, etc. |
| CZ_TYPE | Indicates whether the event happened in a (C) County/Parish, (Z) NWS Public Forecast Zone or (M) Marine. |
| CZ_FIPS | The county FIPS number is a unique number assigned to the county by the National Institute for Standards and Technology (NIST) or NWS Forecast Zone Number. |
| CZ_NAME | County/Parish, Zone or Marine Name assigned to the county FIPS number or NWS Forecast Zone. |
| WFO | The National Weather Service Forecast Office’s area of responsibility (County Warning Area) in which the event occurred. |
| CZ_TIMEZONE | Time Zone for the County/Parish, Zone or Marine Name. Eastern Standard Time (EST), Central Standard Time (CST), Mountain Standard Time (MST), etc. |
| BEGIN_DATE_TIME | MM/DD/YYYY hh:mm:ss (24 hour time usually in LST). |
| END_DATE_TIME | MM/DD/YYYY hh:mm:ss (24 hour time usually in LST). |
| SOURCE | The source reporting the weather event. |
| MAGNITUDE | The measured extent of the magnitude type ~ only used for wind speeds (in knots) and hail size (in inches to the hundredth). |
| MAGNITUDE_TYPE | EG = Wind Estimated Gust; ES = Estimated Sustained Wind; MS = Measured Sustained Wind; MG = Measured Wind Gust (no magnitude is included for instances of hail). |
| FLOOD_CAUSE | Reported or estimated cause of the flood. |
| CATEGORY | Unknown (During the time of downloading this particular file, NCDC has never seen anything provided within this field.) |
| INJURIES_DIRECT | The number of injuries directly caused by the weather event. |
| INJURIES_INDIRECT | The number of injuries indirectly caused by the weather event. |
| FATALITY_ID | ID assigned by NWS to denote the individual fatality that occurred). |
| FATALITY_TYPE | D = Direct Fatality; I = Indirect Fatality. |
| FATALITY_DATE | MM/DD/YYYY hh:mm (time is usually 00:00). |
| FATALITY_AGE | The age in years of the fatality (sometimes ‘null’ if unknown). |
| FATALITY_SEX | The gender of the fatality (sometimes ‘null’ if unknown). |
| FATALITY_LOCATION | BF Ball Field <br> BO Boating <br> BU Business <br> CA Camping <br> CH Church <br> EQ Heavy Equip/Construction <br> GF Golfing <br> IW In Water <br> LS Long Span Roof <br> MH Mobile/Trailer Home <br> OT Other/Unknown <br> OU Outside/Open Areas <br> PH Permanent Home <br> PS Permanent Structure <br> SC School <br> TE Telephone <br> UT Under Tree <br>VE Vehicle and/or Towed Trailer |
| LOCATION_INDEX | Number assigned by NWS to specific locations within the same Storm event. Each event’s sequentially increasing location index number will have a corresponding lat/lon point |
| RANGE | Distance (to the tenth of a mile) to the geographical center or primary post office of a particular village/city, providing that the reference point is documented in the Storm Data software location database table. |
| AZIMUTH | 16-point compass direction from the reference point is documented in the Storm Data software location database table of > 130,000 locations. |
| LOCATION | The name of city, town or village from which the range is calculated and the azimuth is determined. |
| LATITUDE | The latitude where the event occurred (Signed negative (-) if it’s in the southern hemisphere). |
| LONGITUDE | The longitude where the event occurred (Signed negative (-) if it’s in the western hemisphere). |
| LAT2 | Not used. |
| LON2 | Not used. |




