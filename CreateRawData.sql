;WITH pivotdata AS (
	SELECT * FROM 
	(
		SELECT [time]
			  ,[column2]
			  ,[column3]
			  ,[Datetime]
			--  ,[use_kw]
			  ,[gen_kW]
			--  ,[House_overall_kW]
			  ,[Dishwasher_kW]
			  ,[Furnace_1_kW]
			  ,[Furnace_2_kW]
			  ,[Home_office_kW]
			  ,[Fridge_kW]
			  ,[Wine_cellar_kW]
			  ,[Garage_door_kW]
			  ,[Kitchen_12_kW]
			  ,[Kitchen_14_kW]
			  ,[Kitchen_38_kW]
			  ,[Barn_kW]
			  ,[Well_kW]
			  ,[Microwave_kW]
			  ,[Living_room_kW]
			  ,[Solar_kW]
			  ,[temperature]
			  ,[icon]
			  ,[humidity]
			  ,[visibility]
			  ,[summary]
			  ,[apparentTemperature]
			  ,[pressure]
			  ,[windSpeed]
			  ,[cloudCover]
			  ,[windBearing]
			  ,[precipIntensity]
			  ,[dewPoint]
			  ,[precipProbability]
		  FROM [ElectricityProject].[dbo].[ElectricityProjectKaggleRaw]
	  ) as RawData
	UNPIVOT(
		kW_Value for App IN (
		--  [use_kw]
		  [gen_kW]
		--  ,[House_overall_kW]
		  ,[Dishwasher_kW]
		  ,[Furnace_1_kW]
		  ,[Furnace_2_kW]
		  ,[Home_office_kW]
		  ,[Fridge_kW]
		  ,[Wine_cellar_kW]
		  ,[Garage_door_kW]
		  ,[Kitchen_12_kW]
		  ,[Kitchen_14_kW]
		  ,[Kitchen_38_kW]
		  ,[Barn_kW]
		  ,[Well_kW]
		  ,[Microwave_kW]
		  ,[Living_room_kW]
		  ,[Solar_kW]
		) 
	)AS piv1
),

dimAppRaw AS
	(
		SELECT DISTINCT App FROM pivotdata
	),

dimAppTable AS (
	SELECT *, App_SK = ROW_NUMBER() OVER (ORDER BY App) FROM dimAppRaw
)

---Create Electricity Raw Table---
SELECT 
	[time]
	,[column2]
	,[column3]
	,[Datetime]
	,App_SK
	,kW_Value
	,[temperature]
	,[icon]
	,[humidity]
	,[visibility]
	,[summary]
	,[apparentTemperature]
	,[pressure]
	,[windSpeed]
	,[cloudCover]
	,[windBearing]
	,[precipIntensity]
	,[dewPoint]
	,[precipProbability]
INTO dbo.ElectricityRaw
FROM pivotdata 
INNER JOIN dimAppTable 
	ON pivotdata.App = dimAppTable.App

