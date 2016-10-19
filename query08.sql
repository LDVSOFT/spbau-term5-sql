SELECT
	D.*,
	SUM(CASE WHEN WhD.id IS NOT NULL THEN WhDP.itemPurchasePrice * WhDP.itemsPerPackage * WhDP.packageCount ELSE 0 END)
	FROM WarehouseDeliveryPart WhDP
		JOIN WarehouseDelivery WhD ON WhD.id = WhDP.deliveryId
		RIGHT JOIN Distributor D ON D.id = WhD.distributorId
	GROUP BY D.id;
