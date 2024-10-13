SELECT * FROM public.marketing_data

SELECT * FROM public.ad_data

SELECT "Country",
		SUM("AmtLiq") AS "Total_AmtLiq",
		SUM("AmtVege") AS "Total_AmtVege",
		SUM("AmtNonVeg") AS "Total_AmtNonVeg",
		SUM("AmtPes") AS "Total_AmtPes",
		SUM("AmtChocolates") AS "Total_AmtChocolates",
		SUM("AmtComm") AS "Total_AmtComm"
FROM public.marketing_data
GROUP BY "Country";
