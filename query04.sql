SELECT DrugsAvailability.drugId FROM (
  SELECT Drug.id as drugId, COUNT(*) as availableInCnt
  FROM Drug
  JOIN DrugsInDrugstore ON Drug.id = DrugsInDrugstore.drugId
  WHERE DrugsInDrugstore.itemsCount > 0
  GROUP BY Drug.id
) AS DrugsAvailability
WHERE availableInCnt = (SELECT COUNT(*) FROM Drugstore)
