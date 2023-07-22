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
_Overview page - 'Power Usage' and 'Weather vs Temperature' visuals_
* The intent is to provide a high level overview of power consumption over a period of time.
* The main visual is the 'Power Usage' graph which trends total power consumption against a cumulative average.
  * The red bars indicate when power usage for the hour is above the cumulative average.
* The visual below, 'Weather vs Temperature', is to compare weather and temperature conditions against power usage.
  * This is to see if either have influence on the power usage trend.
  * Therefore, the x-axis is aligned with the 'Power Usage' graph.

If we looked at the 'Power Usage' graph, between the 7th and 8th of May, we can see relatively small spikes of power usage above the cumulative average. <br/>
Though if you compare the frequency of the small spikes against the rest of the date-time period then the small spikes are probably insignificant.<br/>
These periods can be ignored or studied to understand the causes for reasonable power consumption. Either way, we need to be able to indicate when the net power consumption of the period outweighs the cumulative average first. <br/>
This is where the 'Power Offset' graph comes in. <br/>
<br/>

_Overview page - 'Power Offset' visuals_
* This graph works by taking the net power usage per day.
* When it is a positive offset (red bars), it indicates that the overall power consumption of the day is over the cumulative average.
* By selecting the red bars, the report can drill down to breakdown the power consumption for the day.

From our sample data, it can be seen that 4 out of the 6 sample dates are red (as shown below). <br/>
* Interestingly there doesn't seem to be a clear power consumption pattern in terms of hourly usage.
* There seems to be no correlation between power consumption and temperature/weather as intuitively thought.
  * E.g. Rainy/cold days doesn't equate to higher consumption.
* This, however, is only a sample period of 5 days so a longer date range, spanning different seasons, could potentially show more trends.

With no definite pattern from the overview page, perhaps we need more detail to understand our power consumption behaviour. <br/>
This is where the second page 'Above C.Average Breakdown' comes in. <br/>

_Above C.Average Breakdown_
* This page focuses on the hours during the selected datetime period where the power usage is above the cumulative average.


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

    


    
    

    

