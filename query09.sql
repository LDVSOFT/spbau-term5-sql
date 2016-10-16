WITH
	DeliveryCount AS (
		SELECT
			DsDP.drugstoreId,
			DsD.warehouseId,
			COUNT(DISTINCT DsD.id) AS deliveryCount
			FROM DrugstoreDeliveryPart DsDP
				JOIN DrugstoreDelivery DsD ON DsD.id = DsDP.deliveryId
			GROUP BY 1, 2
	)
SELECT
	Ds.number,
	Wh.number,
	DC.deliveryCount
	FROM DeliveryCount DC
		JOIN Drugstore Ds ON Ds.id = DC.drugstoreId
		JOIN Warehouse Wh ON Wh.id = DC.warehouseId
	WHERE
		Wh.id = ANY (
			SELECT DC2.warehouseId
				FROM DeliveryCount DC2
				WHERE DC2.drugstoreId = DC.drugstoreId
				ORDER BY DC2.deliveryCount DESC
				LIMIT 2
		);
