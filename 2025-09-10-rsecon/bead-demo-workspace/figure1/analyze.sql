-- Simple ASCII visualization of GDP vs Life Expectancy relationship
-- Using bar function for visualization

WITH data AS (
    SELECT 
        'USA' as country, 69287.5 as gdp_pc, 76.3 as life_exp
    UNION ALL SELECT 'Germany', 50801.8, 81.3
    UNION ALL SELECT 'UK', 47334.4, 81.3
    UNION ALL SELECT 'China', 12556.3, 77.1
    UNION ALL SELECT 'World', 12236.6, 71.0
    UNION ALL SELECT 'India', 2256.6, 69.7
)
SELECT 
    printf('%-10s', country) as Country,
    printf('$%7.0f', gdp_pc) as "GDP/capita",
    printf('%4.1f', life_exp) as "Life Exp",
    bar(life_exp, 60, 85, 25) as "Life Expectancy Chart"
FROM data
ORDER BY gdp_pc DESC;