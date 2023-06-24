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
  THe query is set for a time range from 4/6/2022 (when the data first starts) to GETDATE(). THough the dataset is not live. THis is to demonstrate that if the data   
   was live, it will keep importing data for Power bi when refreshed.

