WITH MinMaxPrice AS (
    SELECT name, MAX(price) AS mxPrice, MIN(price) AS mnPrice
    FROM Drug JOIN DrugsInDrugstore AS DnD ON Drug.id = DnD.drugId
    GROUP BY name
)
SELECT Drug.name, 
       Drugstore.number AS drugStoreNumber,
       DnD.price, 
       CASE WHEN DnD.price = MNXP.mxPrice AND DnD.price = MNXP.mnPrice THEN 'min=max'
            WHEN DnD.price = MNXP.mxPrice THEN 'max'
            WHEN DnD.price = MNXP.mnPrice THEN 'min' END AS indicator
    FROM Drug 
        JOIN DrugsInDrugstore AS DnD ON Drug.id = DnD.drugId
        JOIN Drugstore ON DnD.drugstoreId = Drugstore.id
        JOIN MinMaxPrice AS MNXP ON 
            Drug.name = MNXP.name;
     
