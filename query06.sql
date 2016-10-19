SELECT Drug.id, Drug.name, COALESCE(SUM(DrugsInDrugstore.itemsCount), 0)
    FROM Drug LEFT JOIN DrugsInDrugstore ON Drug.id = DrugsInDrugstore.drugId
    GROUP BY Drug.id;
