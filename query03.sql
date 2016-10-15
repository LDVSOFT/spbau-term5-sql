-- We must get drugs wich don't have records in DrugsInDrugstore table or have zero
-- amount of the drugs (because DrugsInDrugstore.itemsCount is NOT NULL CHECK >= 0).
-- That's why we use left join.

SELECT Drug.*
    FROM Drug
        LEFT JOIN DrugsInDrugstore AS Store ON Drug.id = Store.drugId AND Store.itemsCount > 0
    WHERE Store.drugId IS NULL;
