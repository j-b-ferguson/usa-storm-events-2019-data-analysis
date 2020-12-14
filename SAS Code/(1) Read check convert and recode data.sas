/******************************************************************************************/
/*CREATE LIBRARY REFERENCES AND READ DATA*/
/******************************************************************************************/

/*Create librefs to read in descriptions and detail .sas7bdat files*/
libname desc '/home/u49476764/sasuser.v94/desc';
libname det '/home/u49476764/sasuser.v94/det';

/*Read into SAS damage.csv*/
data damage;
	informat EVENT_ID$6. EPISODE_ID$6. DAMAGE_PROPERTY 7.2 DAMAGE_PROPERTY_UNIT$1. DAMAGE_CROP 6.2 DAMAGE_CROP_UNIT$1.;
	infile '/home/u49476764/sasuser.v94/dam/DAMAGE.csv' delimiter=',' firstobs=2 dsd missover;
	input EVENT_ID EPISODE_ID DAMAGE_PROPERTY DAMAGE_PROPERTY_UNIT DAMAGE_CROP DAMAGE_CROP_UNIT;
	format EVENT_ID$6. EPISODE_ID$6. DAMAGE_PROPERTY 7.2 DAMAGE_PROPERTY_UNIT$1. DAMAGE_CROP 6.2 DAMAGE_CROP_UNIT$1.;
run;

/*Read into SAS fatalities.csv*/
data fatalities;
	informat FATALITY_ID$5. EVENT_ID$6. FATALITY_TYPE$1. FATALITY_DATE MMDDYY10. FATALITY_AGE 2. FATALITY_SEX$1. FATALITY_LOCATION$30.;
	infile '/home/u49476764/sasuser.v94/fat/FATALITIES.csv' delimiter=',' firstobs=2 dsd missover;
	input FATALITY_ID EVENT_ID FATALITY_TYPE FATALITY_DATE FATALITY_AGE FATALITY_SEX FATALITY_LOCATION;
	format FATALITY_ID$5. EVENT_ID$6. FATALITY_TYPE$1. FATALITY_DATE MMDDYY10. FATALITY_AGE 2. FATALITY_SEX$1. FATALITY_LOCATION$30.;
run;

/*Read into SAS tornadoes.txt*/
data tornadoes;
	informat EPISODE_ID$6. EVENT_ID$6. TOR_F_SCALE$3. TOR_LENGTH 6.2 TOR_WIDTH 7.2 TOR_OTHER_WFO$3. TOR_OTHER_CZ_STATE$2. TOR_OTHER_CZ_FIPS$3. TOR_OTHER_CZ_NAME$20.;
	infile '/home/u49476764/sasuser.v94/torn/Tornadoes.txt' delimiter='09'x firstobs=2 dsd missover;
	input EPISODE_ID EVENT_ID TOR_F_SCALE TOR_LENGTH TOR_WIDTH TOR_OTHER_WFO TOR_OTHER_CZ_STATE TOR_OTHER_CZ_FIPS TOR_OTHER_CZ_NAME;
	format EPISODE_ID$6. EVENT_ID$6. TOR_F_SCALE$3. TOR_LENGTH 6.2 TOR_WIDTH 7.2 TOR_OTHER_WFO$3. TOR_OTHER_CZ_STATE$2. TOR_OTHER_CZ_FIPS$3. TOR_OTHER_CZ_NAME$20.;
run;

/*Read into SAS locations.txt*/
data locations;
	informat EPISODE_ID$6. EVENT_ID$6. LOCATION_INDEX$1. RANGE 7.2 AZIMUTH$3. LOCATION$40. LATITUDE 8.4 LONGITUDE 9.4 LAT2 8. LON2 8.;
	infile '/home/u49476764/sasuser.v94/loc/locations.txt' delimiter=',' firstobs=2 dsd missover;
	input EPISODE_ID EVENT_ID LOCATION_INDEX RANGE AZIMUTH LOCATION LATITUDE LONGITUDE LAT2 LON2;
	format EPISODE_ID$6. EVENT_ID$6. LOCATION_INDEX$1. RANGE 7.2 AZIMUTH$3. LOCATION$40. LATITUDE 8.4 LONGITUDE 9.4 LAT2 8. LON2 8.;
run;

/******************************************************************************************/
/*CHECK DATA FRAMES*/
/******************************************************************************************/

/*Check and data with proc print and types with proc contents*/
proc print data=desc.descriptions (obs = 3);
run;
proc contents data=desc.descriptions;
run;

/*Check and data with proc print and types with proc contents*/
proc print data=det.detail (obs = 100);
run;
proc contents data=det.detail;
run;

/******************************************************************************************/
/*DATA TYPE CONVERSIONS*/
/******************************************************************************************/

/*Change event_id and episode_id from numeric to categorical variables by creating 
intermediate columns 'var1' and 'var2', putting event_id and episode_id as numeric in 
these variables, then dropping event_id and episode_id, and finally renaming the 
intermediate variables as the variables of interest*/
data work.detail;
	set det.detail;
		var1 = put(event_id, 6.);
			drop event_id;
			rename var1 = EVENT_ID;
		var2 = put(episode_id, 6.);
			drop episode_id;
			rename var2 = EPISODE_ID;
run;

/******************************************************************************************/
/*RECODE VALUES*/
/******************************************************************************************/

/*Recode numeric columns damage_property and damage_crop_unit given the unit prefixes specified
in the damage_property_unit and damage_crop_unit columns. Drop damage_property_unit and 
damage_crop_unit columns after recode.*/
data damage;
	set work.damage;
		if damage_property_unit = 'K' then damage_property = damage_property*1E3;
			else if  damage_property_unit = 'M' then damage_property = damage_property*1E6;
			else if damage_property_unit = 'B' then damage_property = damage_property*1E9;
		if damage_crop_unit = 'K' then damage_crop = damage_crop*1E3;
			else if  damage_crop_unit = 'M' then damage_crop = damage_crop*1E6;
		format damage_property $E7. damage_crop $E7.;
		drop damage_property_unit damage_crop_unit;
run;

/*Add a new column 'FATALITY_LOCATION_CATEGORY' by recoding 'fatality location'
with a case statement. Save as a new table 'ftly'.*/
proc sql;
	create table ftly as
		select *,
		   (case when fatality_location = 'Ball Field' then 'Outdoor'
				 when fatality_location = 'Boating' then 'Water Related'
				 when fatality_location = 'Business' then 'Indoor'
				 when fatality_location = 'Camping' then 'Outdoor'
				 when fatality_location = 'Church' then 'Indoor'
				 when fatality_location = 'Heavy Equipment/Constru' then 'Vehicle Equip Related'
				 when fatality_location = 'Golfing' then 'Outdoor'
				 when fatality_location = 'In Water' then 'Water Related'
				 when fatality_location = 'Long Span Roof' then 'Outdoor'
				 when fatality_location = 'Mobile/Trailer Home' then 'Vehicle Equip Related'
				 when fatality_location = 'Other' then 'Other'
				 when fatality_location = 'Unknown' then 'Other'
				 when fatality_location = 'Outside/Open Areas' then 'Outdoor'
				 when fatality_location = 'Permanent Home' then 'Indoor'
				 when fatality_location = 'Permanent Structure' then 'Indoor'
				 when fatality_location = 'School' then 'Indoor'
				 when fatality_location = 'Telephone' then 'Indoor'
				 when fatality_location = 'Under Tree' then 'Outdoor'
				 when fatality_location = 'Vehicle/Towed Trailer' then 'Vehicle Equip Related'
				 else ''
				 end) as FATALITY_LOCATION_CATEGORY
		from work.fatalities;
quit;