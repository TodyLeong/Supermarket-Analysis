SELECT * FROM public.marketing_data


SELECT "Marital_Status",
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
GROUP BY "Marital_Status";