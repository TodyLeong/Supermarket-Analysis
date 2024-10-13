SELECT 
    m."Marital_Status",
	CASE
        WHEN SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) THEN 'Bulkmail'
        WHEN SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) THEN 'Twitter'
        WHEN SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) THEN 'Instagram'
        WHEN SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) AND
             SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) >= 
             SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) THEN 'Facebook'
        ELSE 'Brochure'
END AS "Most_Effective_Ad",
		SUM(CASE WHEN a."Bulkmail_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Bulkmail",
		SUM(CASE WHEN a."Twitter_ad" THEN 1 ELSE 0 END) AS "Successful_Conversion_Twitter",
		SUM(CASE WHEN a."Instagram_ad" THEN 1 ELSE 0 END) "Successful_Conversion_Instagram",
		SUM(CASE WHEN a."Facebook_ad" THEN 1 ELSE 0 END) "Successful_Conversion_Facebook",
		SUM(CASE WHEN a."Brochure_ad" THEN 1 ELSE 0 END) "Successful_Conversion_Brochure"		
FROM 
    public."ad_data" a
LEFT JOIN 
    public."marketing_data" m ON a."ID" = m."ID"
WHERE
    m."Marital_Status" IS NOT NULL
GROUP BY 
    m."Marital_Status";
	