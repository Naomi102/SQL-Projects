SELECT *
FROM CovidDeaths
ORDER BY 3,4

SELECT *
FROM CovidVaccinations_2024$
ORDER BY 3,4

SELECT *, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CovidDeaths'

-------------------------------------------------------------------------------
--Get Total Deaths per continent in each year


SELECT DISTINCT(continent)
FROM CovidDeaths

SELECT DISTINCT(continent)
FROM CovidDeaths
WHERE continent <> '' AND continent IS NOT NULL

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date)
FROM CovidDeaths
WHERE continent <> ''
GROUP BY continent
ORDER BY Total_deaths DESC

SELECT continent,location, CONVERT(DATE, date) AS Date_Converted
FROM CovidDeaths

ALTER TABLE CovidDeaths
ALTER COLUMN date DATE

SELECT MIN(date) AS Earliest_Date, MAX(date) AS Latest_Date
FROM CovidDeaths

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date) AS Year_2020
FROM CovidDeaths
WHERE continent <> ''
	AND date LIKE '2020______'
GROUP BY continent
ORDER BY Total_deaths DESC

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date) AS Year_2021
FROM CovidDeaths
WHERE continent <> ''
	AND date LIKE '2021______'
GROUP BY continent
ORDER BY Total_deaths DESC

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date) AS Year_2022
FROM CovidDeaths
WHERE continent <> ''
	AND date LIKE '2022______'
GROUP BY continent
ORDER BY Total_deaths DESC

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date) AS Year_2023
FROM CovidDeaths
WHERE continent <> ''
	AND date LIKE '2023______'
GROUP BY continent
ORDER BY Total_deaths DESC

SELECT continent, SUM(total_deaths) AS Total_deaths, MIN(date) AS Year_2024
FROM CovidDeaths
WHERE continent <> ''
	AND date LIKE '2024______'
GROUP BY continent
ORDER BY Total_deaths DESC
-------------------------------------------------------------------------------
--Get Total Deaths per country in each year

SELECT DISTINCT(location)
FROM CovidDeaths

SELECT DISTINCT(location)
FROM CovidDeaths
WHERE location <> '' AND location IS NOT NULL

SELECT location, continent,total_deaths, date
FROM CovidDeaths
WHERE location <> 'World' 
	AND location NOT IN
		(
		SELECT continent
		FROM CovidDeaths
		)
ORDER BY total_deaths DESC
		

SELECT location, continent,total_deaths, date
FROM CovidDeaths
WHERE location <> 'World' 
	AND location NOT LIKE '%income%'
	AND location NOT LIKE '%europe%'
	AND location NOT IN
		(
		SELECT continent
		FROM CovidDeaths
		)
ORDER BY total_deaths DESC



SELECT location, continent,SUM(total_deaths) AS Total_Deaths
FROM CovidDeaths
WHERE location <> 'World' 
	AND location NOT LIKE '%income%'
	AND location NOT LIKE '%europe%'
	AND location NOT IN
		(
		SELECT continent
		FROM CovidDeaths
		)
GROUP BY location, continent
ORDER BY Total_Deaths DESC

SELECT location, continent,SUM(total_deaths) AS Total_Deaths, MIN(date) AS Year
FROM CovidDeaths
WHERE location <> 'World' 
	AND location NOT LIKE '%income%'
	AND location NOT LIKE '%europe%'
	AND location NOT IN
		(
		SELECT continent
		FROM CovidDeaths
		)
GROUP BY location, continent
ORDER BY Total_Deaths DESC


/*
This is not wrong except subquerries are very slow
hence I have opted for a CTE below.
This took over 46 minutes to run and had to terminate excecution

SELECT location, continent,SUM(total_deaths) AS Total_Deaths, MIN(date) AS Year
FROM CovidDeaths
WHERE location <> 'World' 
	AND location NOT LIKE '%income%'
	AND location NOT LIKE '%europe%'
	AND date LIKE '2020______'
	AND location NOT IN
		(
		SELECT continent 
		FROM CovidDeaths
		)
		
GROUP BY location, continent
ORDER BY Total_Deaths DESC*/


WITH CTE_Continents AS(
	SELECT	DISTINCT(continent)
	FROM CovidDeaths
)

SELECT location, SUM(total_deaths) AS Total_Deaths, MIN(date) AS Year
FROM CovidDeaths c
LEFT JOIN CTE_Continents ct
	ON c.location = ct.continent
WHERE ct.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2020%'
GROUP BY location
ORDER BY Total_Deaths DESC
;


--By end of 2020, America had the leading Covid Deaths in comparison to China
SELECT location, SUM(total_deaths) AS Total_Deaths, MAX(date) AS Date
FROM CovidDeaths
WHERE (location = 'United States' 
OR location = 'China')
AND date LIKE '2020%'
GROUP BY location

--Beggining of 2021, there were no Covid Cases in America (January 2021)
SELECT location, SUM(total_deaths) AS Total_Deaths, MAX(date) AS Date
FROM CovidDeaths
WHERE (location = 'United States' 
OR location = 'China')
AND date LIKE '2020-01___'
GROUP BY location


--Beggining of 2021, there were no Covid Cases in America (January 2021)
SELECT location, SUM(total_deaths) AS Total_Deaths, MAX(date) AS Date
FROM CovidDeaths
WHERE (location = 'United States' 
OR location = 'China')
AND date LIKE '2020-03___'
GROUP BY location


-------------------------------------------------------------------------------
--Death Rates per location
IF OBJECT_ID('tempdb..#Temp_Continets') IS NOT NULL
	DROP TABLE #Temp_Continets

SELECT DISTINCT(continent)
INTO #Temp_Continets
FROM CovidDeaths

--Death Rate in 2020
SELECT location, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate, MAX(date) AS Year 
FROM CovidDeaths c
LEFT JOIN #Temp_Continets t
	ON c.location = t.continent
WHERE t.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2020%'
GROUP BY location
ORDER BY Death_Rate DESC

--Death Rate in 2021
SELECT location, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate, MAX(date) AS Year 
FROM CovidDeaths c
LEFT JOIN #Temp_Continets t
	ON c.location = t.continent
WHERE t.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2021%'
GROUP BY location
ORDER BY Death_Rate DESC



--Death Rate in 2022
SELECT location, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate, MAX(date) AS Year 
FROM CovidDeaths c
LEFT JOIN #Temp_Continets t
	ON c.location = t.continent
WHERE t.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2022%'
GROUP BY location
ORDER BY Death_Rate DESC


--Death Rate in 2023
SELECT location, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate, MAX(date) AS Year 
FROM CovidDeaths c
LEFT JOIN #Temp_Continets t
	ON c.location = t.continent
WHERE t.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2023%'
GROUP BY location
ORDER BY Death_Rate DESC


--Death Rate in 2024
SELECT location, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate, MAX(date) AS Year 
FROM CovidDeaths c
LEFT JOIN #Temp_Continets t
	ON c.location = t.continent
WHERE t.continent IS NULL
AND location NOT LIKE '%income%'
AND location <> 'World'
AND location <> 'European Union'
AND date LIKE '2024%'
GROUP BY location
ORDER BY Death_Rate DESC


SELECT location, YEAR(date) AS Year, ROUND(SUM(total_deaths)/SUM(population)*100, 2) AS Death_Rate
FROM CovidDeaths
GROUP BY YEAR(date), location
ORDER BY Year ASC, Death_Rate DESC



-------------------------------------------------------------------------------

-- Shows Percentage of Population that has recieved at least one Covid Vaccine

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(TRY_CONVERT(FLOAT,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
--, (RollingPeopleVaccinated/population)*100
From CovidDeaths dea
Join CovidVaccinations_2024$ vac
	On dea.location = vac.location
	and dea.date = vac.date
where dea.continent is not null 
order by 2,3


SELECT *, DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'CovidVaccinations_2024$'
-------------------------------------------------------------------------------