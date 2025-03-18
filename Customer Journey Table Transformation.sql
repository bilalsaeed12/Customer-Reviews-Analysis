SELECT 
    JourneyID,
	CustomerID,
	ProductId,
	VisitDate,
	Stage,
	Action,
	COALESCE(Duration, avg_duration) as Duration
	
FROM
    (
	SELECT 
	    JourneyID,
		CustomerID,
		ProductID,
		VisitDate,
		UPPER(Stage) as Stage,
		Action,
		Duration,
		AVG(duration) over (partition by VisitDate) as  avg_duration,
		ROW_NUMBER() Over (
		Partition By CustomerID, ProductID, VisitDate, Stage, Action 
		Order BY JourneyID 
		) AS row_num
		
	FROM dbo.customer_journey
	) as subquery
where row_num = 1