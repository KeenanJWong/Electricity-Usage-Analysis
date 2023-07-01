# Electricity-Usage-Analysis
*Problem Statement
With rising energy prices currently happening, how do we know if we are using excessive energy? can we cut down on our power usage? I dont think we have a choice. 
We endeavour to create a dashboard which will trend your power usage and highlight any excessive power usage.
Hopefully with our dashboard you can reduce your power usage and si=ruvive this inflation of energy prices!!!

*Methodology
Using an electricity data spreadsheet from Kaggle.
Raw Data was imported into sql 
Two new tables were created using the raw data (see sql query)
  A dim App table (Note: This was an optional step only as the data was already mapped to an app. This was done to showcase joining in sql)
  A fact table
The joined table was manipulated in sql: For
  The timeseries data was incremental by 1 min?? which is a bit too esscessive for our use case. SO this was modified to become incremental by an hour.
THe joined table sql query was then imported into Power BI for visualisation.

*Analysis and Visualisation
Page 1 - Overview page
The intent of this page is to provide a high level overview of Power consumption over a period of time.
The main visual on this page 'Power Usage' visual trends the total power consumption against a cumulative average.
    As you can see, when the power usage is above the cumulative average - it is indicated with the red bars.
    This is to breakdown (by hours in a day) when your power consumption goes over the cumulative average
THe intent of the below visual, 'Weather vs Temperature', is to directly compare the weather and temperature conditions against the power usage.
    To see if there are any influencing factors (either weather/temperature) that could cause trends in Power usage.
    So the x axis breakdown is the same (by hour) and is aligned to the Power Usage trend.
    
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

      
    
    

    

