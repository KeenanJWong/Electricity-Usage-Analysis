# Electricity Usage Analysis #

#### Problem Statement ####
With rising energy prices, many of us don't have a choice but to cut down on our power usage. However, a lot us do require some level of consumption to live reasonably comfortable lives. <br/>
As a result, we are left with the task of prioritising the power usage allowance of all our electrical appliances and reducing any excessive usage. Without proper understanding of our power consumption, making these necessary choices will be difficult. <br/>
This is where the 'Electricity Usage Analysis' dashboard comes in. This dashboard aims to elucidate your current energy consumption patterns and highlight opportunities to reduce excessive usage. <br/>
<br/>
<br/>
#### Methodology ####
Sample dataset was taken from Kaggle.
* This dataset contained time series power usage data for a variety of different applicances in 1 minute increments. <br/>

SSMS (T-SQL) was chosen as the prefered method to store and manipulate the data.
* The raw CSV file was imported into SSMS.
* Two tables were created from the raw data. SQL Query: [CreateRawData.sql](https://github.com/KeenanJWong/Electricity-Usage-Analysis/blob/main/CreateRawData.sql)
  1) A dimApp Table - A dimension table containing all household appliances.
      * Note: This was optional as the data was already mapped to appliance names. This was just done to showcase 'Joining' in SQL.
  2) A Fact table - Containing the recorded timeseries power usage data.
* By joining the above two tables, a resultant 'Electricity Analysis' table was created.
  * As timeseries data of 1 minute increments is excessive for this dashboard, the data in this table was aggregated to date-time hourly increments.
  * SQL query for this step: [Electricity Analysis.sql](https://github.com/KeenanJWong/Electricity-Usage-Analysis/blob/main/Electricity%20Analysis.sql)
* The final sql table was imported into Power BI for visualisation.
  * Power BI file: [Electricity Analysis.pbix](https://github.com/KeenanJWong/Electricity-Usage-Analysis/blob/main/Electricity%20Analysis.pbix) 
<br/>
<br/>

#### Visualisation and Analysis ####

'Electricity Usage Analysis' dashboard has two tabs: An Overview and 'Above C.Average Breakdown' page. <br/>
<br/>
# Overview page #
* The intent is to provide a high level overview of power consumption over a period of time.
* The main visual is the 'Power Usage' graph which trends total power consumption against a cumulative average.
  * The red bars indicate when power usage for the hour is above the cumulative average.
* The visual below, 'Weather vs Temperature', is to compare weather and temperature conditions against power usage.
  * This is to see if either have influence on the power usage trend.
  * Therefore, the x-axis is aligned with the 'Power Usage' graph. 





    
It is handy to be able to see at what hours of each day you go over the Cumulative average but does it really matter if you go over for only a few hours of the day?
What if you go over a few hours and then are below the cumulative average for the rest of the day/time period. Then the hours you go above probably doesn't have much impact.
This is where the 'Power Offset' graph comes in. This is probably the first one that really needs to be looked at and therefore is EMPHASIZED the most.
    This graph works by taking the net Power usage (per day). So when it is a positive offset (red) it indicates that more of hours of the time period you are over. 
    Vice Versa for green.
    By selecting the days that are red, it will filter down to that day where you can look at where you are using alot of power and also if there are any external 
     influecing factors, e.g. weather/temp that are affecting it.
    By selecting the days that are green, it will also filter and can look at internal/external influences that lead to lower power consumption.

From our sample data, it can be seen that 4 out of the 6 sample dates are in the red. (AS shown from our snipped of the 4/May - with the highest offset).
    Interestingly there doesnt seem to be a pattern when comparing those dates 
    ANd there doesn't seem to be a correlation with temperature/weather as one would think,e.g. rainy/cold days doesn't seem to mean higher consumption.
        In saying this, this is only a sample period of 5 consecutive days. Perhaps a longer date range that spans different seasons could show more trends.

With no definite pattern from the overview page - perhaps we need more detail to understand our power consumption behaviour.
    This is where the second page 'Above C.Average Breakdown' comes in.
    This page focuses on the hours during the selected datetime period where the power usage is above the cumulative average.

The 'Hours of day above cumulative average' lists the datetime hours by descending order of Power above the cumulative average
    Selecting the date will filter the below table 'Breakdown by app' and Above Cumulative Average Per app waterfall graph.
The 'Breakdown by app' seperates the power consumption by app and compares it against the cumulative average (For the app).
    This list is sorted by the power usage of each app descending but though it does show what is using the most power - that doesn't mean we are using the app   
    excessively.

This is where the Above Cumulative Average Per app waterfall graph comes in.
    As shown in the example with 8/May at 3am - Though the Furnace_2 and Home office rank first and second, respectively on power consumption
    If you look at the waterfall graph, it is actually the Wine cellar that uses more power than the cumulative average. 
    This tells us that though the WIne cellar isn't the greatest power consumer, at this hour we are using more that usual.

From this page, we can tell that typically Furnace_1 and Furnace_2 are the greatest power consumers for this household.
    Not only that, we can see that these two furnaces tend to be the appliances that consume extra during the datetime hours that hover abiove the cumulative average.
Perhaps this is the focus area to possibly look at decreasing power usage.

    


    
    

    

