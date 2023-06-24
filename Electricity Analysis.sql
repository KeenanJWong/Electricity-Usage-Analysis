DROP TABLE IF EXISTS #Original
SELECT 
	[DateTime]
	,DATEADD(HOUR,DATEDIFF(HOUR, '2010-01-01T00:00:00',[Datetime]), '2010-01-01T00:00:00') AS DateTimeEvery1Hour
	,dA.App
	,[kW_Value]
    ,[temperature]
    ,[icon]
    ,[humidity]
    ,[visibility]
    ,[summary]
    ,[apparentTemperature]
    ,[pressure]
  --,[windSpeed]
    ,[cloudCover]
  --,[windBearing]
    ,[precipIntensity]
    ,[dewPoint]
    ,[precipProbability]
INTO #Original
FROM [ElectricityProject].[dbo].[ElectricityRaw] AS ER
INNER JOIN [ElectricityProject].[dbo].[dimApp] dA 
	ON ER.[App_SK] = dA.[App_SK]

;WITH Summary AS(
	SELECT 
		SumRank.DateTimeEvery1Hour
		,SumRank.App
		,SumRank.Summary
	FROM 
	(
		SELECT
			DateTimeEvery1Hour
			,App
			,Summary 
			,COUNT(Summary) AS cSum
			,cRank = RANK() OVER (PARTITION BY DateTimeEvery1Hour, App ORDER BY COUNT(Summary) DESC)
		FROM #Original
	GROUP BY 
		DateTimeEvery1Hour
		,App
		,Summary 
	) AS SumRank
	WHERE SumRank.cRank = 1
),

Icon AS (
	SELECT 
		iconRank.DateTimeEvery1Hour
		,iconRank.App
		,iconRank.icon

	FROM 
	(
		SELECT
			DateTimeEvery1Hour
			,App
			,icon
			,COUNT(icon) AS cicon
			,cRank = RANK() OVER (PARTITION BY DateTimeEvery1Hour, App ORDER BY COUNT(icon) DESC)
		FROM #Original

		GROUP BY 
			DateTimeEvery1Hour
			,App
			,icon
	) AS iconRank
	WHERE iconRank.cRank = 1
),

Averages AS
(
	SELECT 
		#Original.DateTimeEvery1Hour
		,AVG(temperature) AS Temp_avg
		,AVG(humidity) AS hum_avg
		,AVG(visibility) AS avg_vis
		,AVG(apparentTemperature) AS avg_apTemp
		,AVG(pressure) AS avg_Pressure
		,AVG(cloudCover) AS avg_cloudCover
		,AVG(precipIntensity) AS avg_precipIntensity
		,AVG(dewPoint) AS avg_dewpoint
		,AVG(precipProbability) AS avg_precipProb
	FROM #Original
	GROUP BY
	#Original.DateTimeEvery1Hour
)

SELECT 
	#Original.DateTimeEvery1Hour
	,#Original.App
	,MIN(kW_Value) AS kW_Value
	,Temp_avg
	,hum_avg
	,avg_vis
	,avg_apTemp
	,avg_Pressure
	,avg_cloudCover
	,avg_precipIntensity
	,avg_dewpoint
	,avg_precipProb
	,summary.summary
	,icon.icon
FROM #Original
LEFT JOIN Summary 
	ON #Original.DateTimeEvery1Hour = summary.DateTimeEvery1Hour 
		AND #Original.App = summary.App
LEFT JOIN Icon
	ON #Original.DateTimeEvery1Hour = Icon.DateTimeEvery1Hour 
		AND #Original.App = Icon.App
LEFT JOIN Averages
	ON #Original.DateTimeEvery1Hour = Averages.DateTimeEvery1Hour 

GROUP BY
#Original.DateTimeEvery1Hour
,#Original.App
	,Temp_avg
	,hum_avg
	,avg_vis
	,avg_apTemp
	,avg_Pressure
	,avg_cloudCover
	,avg_precipIntensity
	,avg_dewpoint
	,avg_precipProb
	,summary.summary
	,icon.icon

ORDER BY DateTimeEvery1Hour
