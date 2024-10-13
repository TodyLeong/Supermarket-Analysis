SELECT 
    CASE
        WHEN "Age" BETWEEN 20 AND 29 THEN '20-29'
        WHEN "Age" BETWEEN 30 AND 39 THEN '30-39'
        WHEN "Age" BETWEEN 40 AND 49 THEN '40-49'
        WHEN "Age" BETWEEN 50 AND 59 THEN '50-59'
        WHEN "Age" BETWEEN 60 AND 69 THEN '60-69'
        WHEN "Age" BETWEEN 70 AND 79 THEN '70-79'
        WHEN "Age" BETWEEN 80 AND 89 THEN '80-89'
        ELSE 'Out of range'
    END AS "Age_group",
	
SUM("AmtLiq"+"AmtVege"+"AmtNonVeg"+"AmtPes"+"AmtChocolates"+"AmtComm") AS "Total_Spend"

FROM public.marketing_data
GROUP BY "Age_group"
ORDER BY "Total_Spend" ASC;