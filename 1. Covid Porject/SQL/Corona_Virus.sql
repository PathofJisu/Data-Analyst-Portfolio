-- Coronavirus_ Death table
Select * from coronavirus_death;

-- Coronavirus_ Vaccination table
Select * from coronavius_Vaccination;

-- Select data (location, date, total_cases, new_cases, total_deaths, population)
Select location, date, total_cases, new_cases, total_deaths, population
FROM coronavirus_death
Order by location and date;

-- Shows percentages of death when peropls get covid in the United States
Select location, date, total_cases, total_deaths, ROUND((total_deaths/total_cases)*100,2) as Pecentage_Death
FROM coronavirus_death
Where location like '%united states%'
Order by location and date;

-- Shows percentages of getting covid when people get covid in the United States
Select location, date, total_cases, population, ROUND((total_cases/population)*100,2) as Pecentage_Infection
FROM coronavirus_death
Where location like '%united states%'
Order by location and date;

-- Shows the highest percentages of getting covid when people get covid in the World based on population number.
Select location, population, MAX(total_cases) as HighestInfection, ROUND(MAX((total_cases/population))*100,2) as Pecentage_Infection
FROM coronavirus_death
Group by location, population  
Order by Pecentage_Infection desc;

-- Shows the highest number of death in each countries
SELECT Location, MAX(Total_deaths+0) as TotalDeathCount
From coronavirus_death
GROUP BY Location
ORDER BY TotalDeathCount desc;

SELECT Location, MAX(cast(Total_deaths as signed)) as TotalDeathCount
From coronavirus_death
GROUP BY Location
ORDER BY TotalDeathCount desc;

-- Shows the highest number of death in continent
SELECT continent, MAX(Total_deaths+0) as TotalDeathCount
From coronavirus_death
Where continent is not null
GROUP BY continent
ORDER BY TotalDeathCount desc;

-- Shows the percentage of world's death
SELECT SUM(new_cases) as Total_cases, SUM(new_deaths +0) as Total_deaths, ROUND(SUM(new_deaths +0)/SUM(new_cases) * 100,2) as Percentage_Death
From coronavirus_death
Where continent is not null
ORDER BY location and date;

-- Shows total population vs vaccination
Select death.continent, death.location, death.date, death.population, Vaccination.new_vaccinations
From coronavirus_death death
Join coronavius_Vaccination Vaccination
	On death.location = Vaccination.location
    and death.date = Vaccination.date
Where death.continent is not null
ORDER BY date, population;
    
-- Shows total population vs vaccination on a rolling basis for countries
Select death.continent, death.location, death.date, death.population, Vaccination.new_vaccinations, 
SUM(Vaccination.new_vaccinations+0) OVER (Partition by death.Location ORDER BY death.location) as RollingPeopleVaccination
From coronavirus_death death
Join coronavius_Vaccination Vaccination
	On death.location = Vaccination.location
    and death.date = Vaccination.date
Where death.continent is not null
ORDER BY date, population;

-- Using Common table expression (CTE)
WITH Population_Vaccination (continent, location, date, population, new_vaccinations, RollingPeopleVaccination)
AS
(
Select death.continent, death.location, death.date, death.population, Vaccination.new_vaccinations, 
SUM(Vaccination.new_vaccinations+0) OVER (Partition by death.Location ORDER BY death.location, death.date) as RollingPeopleVaccination
From coronavirus_death death
Join coronavius_Vaccination Vaccination
	On death.location = Vaccination.location
    and death.date = Vaccination.date
Where death.continent is not null
)
select *, ROUND((RollingPeopleVaccination/population)*100,2) as RollingVaccination_Percentage 
from Population_Vaccination;

-- Temporary table
DROP TABLE IF EXISTS #Population_Vaccination;
CREATE TABLE a#Population_Vaccination
(
continent nvarchar(225),
location nvarchar(225),
date datetime,
population numeric,
new_vaccinations numeric,
RollingPeopleVaccination numeric
)
INSERT INTO a#Population_Vaccination
Select death.continent, death.location, death.date, death.population, Vaccination.new_vaccinations, 
SUM(Vaccination.new_vaccinations+0) OVER (Partition by death.Location ORDER BY death.location, death.date) as RollingPeopleVaccination
From coronavirus_death death
Join coronavius_Vaccination Vaccination
	On death.location = Vaccination.location
    and death.date = Vaccination.date
Where death.continent is not null;

select *, ROUND((RollingPeopleVaccination/population)*100,2) 
from a#Population_Vaccination
;

-- Create View to store data for later visulization
CREATE VIEW percent_pop_vaccinated_global as
SELECT death.continent, death.location, death.date, death.population, Vaccination.new_vaccinations, 
	SUM(Vaccination.new_vaccinations+0) OVER (Partition by death.location ORDER BY death.location, death.date ) AS RollingPeopleVaccination
	-- (rolling_people_vaccinated/population)*100
From coronavirus_death death
Join coronavius_Vaccination Vaccination
	On death.location = Vaccination.location
    and death.date = Vaccination.date
Where death.continent is not null;

SELECT *
FROM percent_pop_vaccinated_global;







