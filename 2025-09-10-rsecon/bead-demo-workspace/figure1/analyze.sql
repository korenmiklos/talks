-- Analysis: GDP per capita vs Life Expectancy
-- Join the two datasets and create ASCII visualization

WITH joined_data AS (
    SELECT 
        l.Country,
        l.Year,
        l.Life_expectancy,
        g.GDP_per_capita_USD
    FROM 
        read_csv_auto('input/life-expectancy/life_expectancy.csv') l
    INNER JOIN 
        read_csv_auto('input/gdp-per-capita/gdp_per_capita.csv') g
    ON 
        l.Country = g.Country 
        AND l.Year = g.Year
    WHERE 
        l.Year = 2021  -- Focus on most recent complete year
    ORDER BY 
        g.GDP_per_capita_USD DESC
)
SELECT 
    printf('%-15s', Country) as Country,
    printf('$%8.0f', GDP_per_capita_USD) as "GDP/capita",
    printf('%5.1f', Life_expectancy) as "Life Exp",
    bar(Life_expectancy, 65, 85, 30) as "Life Expectancy (65-85 years)"
FROM joined_data;