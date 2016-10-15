SELECT DISTINCT
	D.internationalName,
	C.name
	FROM Drug D
	JOIN Component C ON C.id = D.componentId
	WHERE D.internationalName = ANY (
		SELECT
			D2.internationalName
			FROM Drug D2
			GROUP BY D2.internationalName
			HAVING COUNT(DISTINCT D2.componentId) > 1
	);
