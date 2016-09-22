-- all about cures

DROP TABLE IF EXISTS Cure;
CREATE TABLE Cure(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    internationalName TEXT
        NOT NULL,
    cureFormId INT
        NOT NULL,
    manufactorerId INT
        NOT NULL,
    componentId INT
        NOT NULL,
    certificateId INT
        NOT NULL
);

DROP TABLE IF EXISTS CureForm;
CREATE TABLE CureForm(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Manufactorer;
CREATE TABLE Manufactorer(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Component;
CREATE TABLE Component(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    formula TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Certificates;
CREATE TABLE Certificates(
    id INT
        PRIMARY KEY,
    expires DATE
        NOT NULL,
    labId INT
        NOT NULL
);

DROP TABLE IF EXISTS Lab;
CREATE TABLE Lab(
    id INT
        PRIMARY KEY,
    labName TEXT
        NOT NULL,
    boss TEXT
        NOT NULL

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

