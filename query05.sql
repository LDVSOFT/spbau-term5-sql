SELECT
	D.id, MIN(DID.price), AVG(DID.price), MAX(DID.price)
	FROM Drugstore D
	LEFT JOIN DrugsInDrugstore DID ON D.id = DID.drugstoreId;
