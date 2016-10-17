WITH DelDrugCost AS (
    SELECT WDP.deliveryId, WDP.drugId, 
    (WDP.packageCount*WDP.itemsPerPackage*WDP.itemPurchasePrice) AS cost 
    FROM WarehouseDeliveryPart AS WDP
),
DelSumCost AS (
    SELECT DDC.deliveryId, 
    SUM(DDC.cost) AS cost
    FROM DelDrugCost AS DDC
    GROUP BY DDC.deliveryId
    ORDER BY cost
) 
SELECT * FROM DelSumCost LIMIT 1 OFFSET (SELECT (COUNT(*)/2) FROM DelSumCost);
