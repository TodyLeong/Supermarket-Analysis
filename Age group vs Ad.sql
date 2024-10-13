SELECT 
    CASE
        WHEN m."Age" BETWEEN 20 AND 29 THEN '20-29'
        WHEN m."Age" BETWEEN 30 AND 39 THEN '30-39'
        WHEN m."Age" BETWEEN 40 AND 49 THEN '40-49'
        WHEN m."Age" BETWEEN 50 AND 59 THEN '50-59'
        WHEN m."Age" BETWEEN 60 AND 69 THEN '60-69'
        WHEN m."Age" BETWEEN 70 AND 79 THEN '70-79'
        WHEN m."Age" BETWEEN 80 AND 89 THEN '80-89'
        ELSE 'Out of range'
    END AS "Age_group",
    COUNT(*) AS "Total_Successful_Conversion"

FROM public."marketing_data" m
LEFT JOIN 
    public."ad_data" a ON m."ID" = a."ID"
GROUP BY 
     "Age_group"
ORDER by 
	"Age_group" ASC;
	
	
	
    SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Bulkmail",
    SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Twitter",
    SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Instagram",
    SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Facebook",
    SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Brochure"			
	
	