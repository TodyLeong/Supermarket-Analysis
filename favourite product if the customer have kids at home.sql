SELECT * FROM public.marketing_data


SELECT
	CASE 
		WHEN "Kidhome" = 0 and "Teenhome" = 0 then 'No kids'
		ELSE 'kids'
	END AS kids_at_home,
		SUM("AmtLiq") AS "Total_AmtLiq",
		SUM("AmtVege") AS "Total_AmtVege",
		SUM("AmtNonVeg") AS "Total_AmtNonVeg",
		SUM("AmtPes") AS "Total_AmtPes",
		SUM("AmtChocolates") AS "Total_AmtChocolates",
		SUM("AmtComm") AS "Total_AmtComm",
		
	CASE GREATEST(
		SUM("AmtLiq"), 
		SUM("AmtVege"), 
		SUM("AmtNonVeg"),
		SUM("AmtPes"),
		SUM("AmtChocolates"), 
		SUM("AmtComm")
)
		WHEN SUM("AmtLiq") THEN 'Alcoholic beverages'
		WHEN SUM("AmtVege") THEN 'Vegetables'
		WHEN SUM("AmtNonVeg") THEN 'Meat Items'
		WHEN SUM("AmtPes") THEN 'Fish Products'
		WHEN SUM("AmtChocolates") THEN 'Chocolates'
		WHEN SUM("AmtComm") THEN 'Commodities'
	END AS "Popular_Product"
FROM public.marketing_data
GROUP BY kids_at_home;
