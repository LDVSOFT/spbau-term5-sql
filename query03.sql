SELECT Drug.id,
       Drug.name,
       Drug.internationalName,
       Drug.dosageFormId,
       Drug.manufacturerId,
       Drug.componentId,
       Drug.certificateId,
       Drug.certificateExpires,
       Drug.certificateLaboratoryId
    FROM Drug
        LEFT JOIN DrugsInDrugstore AS Store ON Drug.id = Store.drugId AND Store.itemsCount > 0
    WHERE Store.drugId IS NULL;
