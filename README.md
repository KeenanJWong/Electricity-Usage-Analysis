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

    

    

