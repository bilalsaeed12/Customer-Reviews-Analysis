SELECT 
    ProductID,
	ProductName,
	Price,

	CASE 
	    WHEN Price < 50 THEN 'low'
		WHEN price BETWEEN 50 AND 200 THEN 'Medium'
		ELSE 'High'
	END AS PriceCategory
		
FROM dbo.products