-- Task: https://www.dropbox.com/sh/0k59gl5rvmg7w54/AAAuRJ2ia_v8V5T0CopBQxJma?dl=0&preview=%D0%A1%D0%A3%D0%91%D0%94+2016.+%D0%90%D0%A3+-+%D0%92%D0%B0%D1%80%D0%B8%D0%B0%D0%BD%D1%82+2.pdf

-- [REVIEW] Общее замечание ко всем запросам: сложно читать из-за активного
-- [REVIEW] использования JOIN с внутренним запросом. Запрос получается
-- [REVIEW] вывернутым наизнанку; читать приходится изнтри. Часто такую
-- [REVIEW] конструкции можно заменить на просто несколько JOIN с разными
-- [REVIEW] таблицами и WHERE.

--Query #1:
-- [REVIEW] Схема предполагает, что international_name уникален, что делает
-- [REVIEW] задание тривиальным. Поэтому предполагаем, что UNIQUE в схеме нет.
-- [REVIEW] Без замечаний, кроме общего.
SELECT SameDrugs.international_name, Ing.name
FROM Ingredient Ing 
JOIN (
  SELECT DISTINCT D1.international_name, D1.ingredient_id 
  FROM Drug D1
  JOIN Drug D2 
    ON  D1.international_name = D2.international_name 
    AND D1.ingredient_id != D2.ingredient_id  
) AS SameDrugs
  ON SameDrugs.ingredient_id = Ing.id;

--Query #2:
-- [REVIEW] Одна лаборатория может быть выведена несколько раз, если она
-- [REVIEW] выдала несколько сертификатов на aqua pura.
SELECT L.name
FROM Laboratory L
JOIN (
  SELECT C.laboratory_id
  FROM Certificate C
  JOIN (
    SELECT D.certificate_id
    FROM Drug D
    JOIN Ingredient I
      ON D.ingredient_id = I.id
      WHERE I.name = 'aqua pura'   
  ) AS AquaPura 
    ON C.id = AquaPura.certificate_id
) AS LaborotoriesId
  ON L.id = LaborotoriesId.laboratory_id;

--Query #3:
-- [REVIEW] Внутренний JOIN с таблицей Drug не нужен.
SELECT Drug.trade_name 
FROM Drug 
WHERE Drug.id NOT IN (
  SELECT Drug.id 
  FROM DrugSaleInfo
  JOIN Drug
    ON DrugSaleInfo.drug_id = Drug.id
  WHERE DrugSaleInfo.amount != 0
);

--Query #4:
-- [REVIEW] JOIN во внутреннем запросе с Pharmacies лишний. Можно просто
-- [REVIEW] использовать HAVING на подзапросе Drugs и не использовать
-- [REVIEW] JOIN для фильтрации результатов, а не объединения - это путает.
SELECT Drug.trade_name 
FROM Drug 
JOIN (
  (SELECT DrugSaleInfo.drug_id, COUNT(DISTINCT(DrugSaleInfo.pharmacy_id)) AS different_pharmacies_count 
  FROM DrugSaleInfo
  WHERE DrugSaleInfo.amount != 0
  GROUP BY DrugSaleInfo.drug_id) AS Drugs
  JOIN (
    SELECT COUNT(*) AS pharmacies_count
    FROM Pharmacy
  ) AS Pharmacies
    ON Drugs.different_pharmacies_count = Pharmacies.pharmacies_count
) AS DrugsId
  ON Drug.id = DrugsId.drug_id;

--Query #5:
-- [REVIEW] Не будет выведена информация по аптекам, в которых лекарств
-- [REVIEW] вообще нет. Кажется, было бы разумным тогда выводить NULL.
SELECT Pharmacy.id, MIN(DrugSaleInfo.price), MAX(DrugSaleInfo.price), AVG(DrugSaleInfo.price)
FROM Pharmacy
JOIN DrugSaleInfo
  ON DrugSaleInfo.pharmacy_id = Pharmacy.id AND DrugSaleInfo.amount != 0
GROUP BY Pharmacy.id;

--Query #6:
-- [REVIEW] Если какое-то лекарство отсутствует в таблице DrugSaleInfo,
-- [REVIEW] оно не будет выведено. Можно использовать LEFT JOIN и COALESCE.
SELECT Drug.trade_name, DrugsAmount.amount 
FROM Drug 
JOIN (
  SELECT DrugSaleInfo.drug_id, SUM(DrugSaleInfo.amount) AS amount
  FROM DrugSaleInfo
  GROUP BY DrugSaleInfo.drug_id
) AS DrugsAmount
  ON Drug.id = DrugsAmount.drug_id;

--Query #7:
-- [REVIEW] Есть довольно много общего кода между двумя запросами по разные
-- [REVIEW] стороны от UNION ALL. Фильтрация сделана внутри условия JOIN ON,
-- [REVIEW] она не имеет никакого отношения к самому JOIN - только ко всему
-- [REVIEW] запросу в целом. Кажется, что JOIN можно вынести во VIEW и это
-- [REVIEW] уменьшит код. А вместо VIEW лучше использовать WITH.
DROP VIEW IF EXISTS MinMaxPrice;
CREATE OR REPLACE VIEW MinMaxPrice AS 
SELECT DrugSaleInfo.drug_id, MIN(DrugSaleInfo.price) AS min_price, MAX(DrugSaleInfo.price) AS max_price
FROM DrugSaleInfo
GROUP BY DrugSaleInfo.drug_id;

SELECT MinMaxPrice.drug_id, DrugSaleInfo.pharmacy_id, MinMaxPrice.min_price AS price, 'min' AS minmax
FROM MinMaxPrice
JOIN DrugSaleInfo
  ON MinMaxPrice.drug_id = DrugSaleInfo.drug_id AND MinMaxPrice.min_price = DrugSaleInfo.price AND DrugSaleInfo.amount != 0
UNION ALL
SELECT MinMaxPrice.drug_id, DrugSaleInfo.pharmacy_id, MinMaxPrice.max_price AS price, 'max' AS minmax
FROM MinMaxPrice
JOIN DrugSaleInfo
  ON MinMaxPrice.drug_id = DrugSaleInfo.drug_id AND MinMaxPrice.max_price = DrugSaleInfo.price AND DrugSaleInfo.amount != 0;

--Query #8:
-- [REVIEW] Если у какого-то дистрибьютора мы не закупались, то он будет
-- [REVIEW] отсутствовать в результатах из-за использования JOIN.
SELECT Distributor.first_name, Distributor.last_name, DistributorSum.price_sum
FROM Distributor
JOIN (
  SELECT Delivery.distributor_id, SUM(DP.sale_package_count * DP.sale_package_price * DP.travel_package_count) AS price_sum
  FROM DeliveryPart DP
  JOIN Delivery
    ON DP.delivery_id = Delivery.id
  GROUP BY Delivery.distributor_id
) AS DistributorSum
  ON Distributor.id = DistributorSum.distributor_id;

--Query #9:
DROP VIEW IF EXISTS PharmacyWarehouseCount CASCADE;
CREATE OR REPLACE VIEW PharmacyWarehouseCount AS
  SELECT CarAssignmentCargo.target_pharmacy_id AS pharmacy_id, CarAssignment.warehouse_id, COUNT(DISTINCT(CarAssignmentCargo.car_assignment_id)) AS delivery_count
  FROM CarAssignmentCargo
  JOIN CarAssignment
    ON CarAssignmentCargo.car_assignment_id = CarAssignment.id
  GROUP BY CarAssignmentCargo.target_pharmacy_id, CarAssignment.warehouse_id;

DROP VIEW IF EXISTS MaxWarehouseCount CASCADE;
CREATE OR REPLACE VIEW MaxWarehouseCount AS
  SELECT PWC.pharmacy_id, PWC.warehouse_id, MAX(PWC.delivery_count) OVER (PARTITION BY PWC.pharmacy_id) AS max_count
  FROM PharmacyWarehouseCount PWC;

SELECT *
FROM MaxWarehouseCount
UNION ALL
SELECT PWC.pharmacy_id, PWC.warehouse_id, MAX(PWC.delivery_count) OVER (PARTITION BY PWC.pharmacy_id) AS max_count
FROM PharmacyWarehouseCount PWC
JOIN MaxWarehouseCount MWC
  ON PWC.pharmacy_id = MWC.pharmacy_id AND PWC.warehouse_id != MWC.warehouse_id;

--Query #10:
DROP VIEW IF EXISTS WarehouseDeliveries;
CREATE OR REPLACE VIEW WarehouseDeliveries AS
  SELECT Delivery.destination_id, DeliverySum.price_sum, ROW_NUMBER() OVER (ORDER BY Delivery.destination_id, DeliverySum.price_sum) AS row_num 
  FROM Delivery 
  JOIN (
    SELECT Delivery.id, SUM(DP.sale_package_count * DP.sale_package_price * DP.travel_package_count) AS price_sum
    FROM DeliveryPart DP
    JOIN Delivery
      ON DP.delivery_id = Delivery.id
    GROUP BY Delivery.id
  ) AS DeliverySum
    ON Delivery.id = DeliverySum.id;


SELECT WD.destination_id, AVG(WD.price_sum) AS median
FROM WarehouseDeliveries WD
JOIN (
  SELECT WarehouseDeliveries.destination_id, COUNT(WarehouseDeliveries.price_sum)
  FROM WarehouseDeliveries
  GROUP BY WarehouseDeliveries.destination_id
) AS DeliveriesCount 
  ON WD.destination_id = DeliveriesCount.destination_id AND WD.row_num * 2 >= DeliveriesCount.count AND WD.row_num * 2 <= DeliveriesCount.count + 2
GROUP BY WD.destination_id;