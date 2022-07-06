
/* 

It's not that we humans only take debts to manage our necessities. A country may also take debt to manage its economy.
For example, infrastructure spending is one costly ingredient required for a country's citizens to lead comfortable lives.
The World Bank is the organization that provides debt to countries.

In this notebook, we are going to analyze international debt data collected by The World Bank.
The dataset contains information about the amount of debt (in USD) owed by developing countries across several categories.
We are going to find the answers to questions like:

What is the total amount of debt that is owed by the countries listed in the dataset?
Which country owns the maximum amount of debt and what does that amount look like?
What is the average amount of debt owed by countries across different debt indicators? 

*/



-- 1. The World Bank's International Debt Data
SELECT Top 10 * 
FROM Debt_data




-- 2. Finding the number of Distinct Countries
SELECT count(DISTINCT country_name)
FROM Debt_data;




-- 3. Finding out the distinct debt Indicators.
SELECT DISTINCT indicator_code AS distinct_debt_indicator
FROM Debt_data
ORDER BY distinct_debt_indicator



-- 4. How many debts are owed in total by different countries.
ALTER TABLE Debt_data
ALTER COLUMN debt float;


SELECT country_name, sum(debt) as Total_debt
FROM Debt_data
Group by country_name



--- 5. if we want to check total debt owned by different countries
SELECT ROUND(SUM(debt)/1000000,2) AS total_debt  --dividing by 1000000 so result can come in millions
FROM Debt_data;



-- 6.Country that owns the highest amount of debts
SELECT TOP 10 country_name, SUM(debt) as total_debt
FROM Debt_data 
GROUP BY country_name
ORDER BY total_debt DESC;



-- 7. Which Category is the most common one across countries.
SELECT indicator_code, COUNT(indicator_code) AS indicator_count
FROM Debt_data
GROUP BY indicator_code
ORDER BY indicator_count DESC;




-- 8. The Countries owe the most across categories
SELECT country_name, indicator_code, MAX(debt) as maximum_debt
FROM Debt_data
GROUP BY country_name, indicator_code
ORDER BY maximum_debt DESC;


