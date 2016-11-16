WITH
    DeliveryCount AS (
        SELECT
            DsDP.drugstoreId,
            DsD.warehouseId,
            COUNT(DISTINCT DsD.id) AS deliveryCount
            FROM DrugstoreDeliveryPart DsDP
                JOIN DrugstoreDelivery DsD ON DsD.id = DsDP.deliveryId
            GROUP BY 1, 2
    ),
    Tmp AS (
        SELECT
            Ds.number,
            Wh.number,
            DC.deliveryCount,
            RANK() OVER (PARTITION BY Ds.number ORDER BY DC.deliveryCount DESC)
        FROM DeliveryCount DC
            JOIN Drugstore Ds ON Ds.id = DC.drugstoreId
            JOIN Warehouse Wh ON Wh.id = DC.warehouseId
    )
SELECT
    *
    FROM TMP
    WHERE rank <= 2;
