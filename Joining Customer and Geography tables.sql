SELECT 
    c.CustomerID,
	C.CustomerName,
	c.Email,
	c.Gender,
	c.Age,
	Country,
	g.City
FROM
    dbo.customers c
LEFT JOIN 
    dbo.geography g
ON 
    c.GeographyID = g.GeographyID
	


