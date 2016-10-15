SELECT Drug.id, Drug.name, SUM(DrugsInDrugstore.itemsCount) 
    FROM Drug LEFT JOIN DrugsInDrugstore ON Drug.id = DrugsInDrugstore.drugId
    GROUP BY Drug.id;
