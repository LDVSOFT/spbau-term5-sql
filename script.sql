-- all about delivery

DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (
	Id INT
		PRIMARY KEY,
	WarehouseId INT
		NOT NULL,
		-- Foreign key to Warehouse
	DistributerId INT
		NOT NULL,
		-- Foreign key to Distributer
	DeliveryDate TIMESTAMP,
	WarehouseKeeper TEXT
);

DROP TABLE IF EXISTS DeliveryPart;
CREATE TABLE DeliveryPart (
	DeliveryId INT,
	CureId INT,
	SellFormId INT
		NOT NULL,
		-- Foreign Key to SellForm
	DeliveryPackageCount INT
		NOT NULL,
	DeliveryPackageWeight REAL
		NOT NULL,
	ItemsPerPackage INT
		NOT NULL,
	PRIMARY KEY(DeliveryId, CureId)
);

DROP TABLE IF EXISTS Warehouse;
CREATE TABLE Warehouse (
	Id INT
		PRIMARY KEY,
	Adress TEXT
		NOT NULL
);

