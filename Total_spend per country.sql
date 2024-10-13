SELECT "Country",
		SUM("AmtLiq"+"AmtVege"+"AmtNonVeg"+"AmtPes"+"AmtChocolates"+"AmtComm") AS "Total_Sales"
FROM public.marketing_data
GROUP BY "Country"
ORDER BY "Total_Sales" DESC;


