SELECT
	D.*,
	SUM(WhDP.itemPurchasePrice * WhDP.itemsPerPackage * WhDP.packageCount)
	FROM WarehouseDeliveryPart WhDP
		JOIN WarehouseDelivery WhD ON WhD.id = WhDP.deliveryId
		JOIN Distributor D ON D.id = WhD.distributorId
	GROUP BY D.id;
