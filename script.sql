-- all about drugs
DROP TABLE IF EXISTS DrugForm CASCADE;
CREATE TABLE DrugForm(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Manufacturer CASCADE;
CREATE TABLE Manufacturer(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Component CASCADE;
CREATE TABLE Component(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    formula TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Laboratory CASCADE;
CREATE TABLE Laboratory(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    managerLastName TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Certificate CASCADE;
CREATE TABLE Certificate(
    id INT
        PRIMARY KEY,
    expires DATE
        NOT NULL,
    laboratoryId INT
        NOT NULL
		REFERENCES Laboratory
);

DROP TABLE IF EXISTS Drug CASCADE;
CREATE TABLE Drug(
    id INT
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    internationalName TEXT
        NOT NULL,
    drugFormId INT
        NOT NULL
		REFERENCES DrugForm,
    manufacturerId INT
        NOT NULL
		REFERENCES Manufacturer,
    componentId INT
        NOT NULL
		REFERENCES Component,
    certificateId INT
        NOT NULL
		REFERENCES Certificate
);

-- all about delivery
DROP TABLE IF EXISTS Warehouse CASCADE;
CREATE TABLE Warehouse (
	Id INT
		PRIMARY KEY,
	Address TEXT
		NOT NULL
);

DROP TABLE IF EXISTS DistributorContact CASCADE;
CREATE TABLE DistributorContact (
    Id INT
        PRIMARY KEY,
    Name TEXT
        NOT NULL,
    PhoneNumber TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Distributor CASCADE;
CREATE TABLE Distributor (
    Id INT
        PRIMARY KEY,
    Address
        TEXT
        NOT NULL,
    BankAccountId INT
        NOT NULL,
    ContactId INT
        NOT NULL
        REFERENCES DistributorContact
);

DROP TABLE IF EXISTS Delivery CASCADE;
CREATE TABLE Delivery (
	Id INT
		PRIMARY KEY,
	WarehouseId INT
		NOT NULL
		REFERENCES Warehouse,
	DistributorId INT
		NOT NULL
		REFERENCES Distributor,
	DeliveryDate TIMESTAMP,
	WarehouseKeeper TEXT
);

DROP TABLE IF EXISTS DeliveryPart CASCADE;
CREATE TABLE DeliveryPart (
	DeliveryId INT,
	DrugId INT,
	DeliveryPackageCount INT
		NOT NULL,
	DeliveryPackageWeight REAL
		NOT NULL,
	ItemsPerPackage INT
		NOT NULL,
	PRIMARY KEY(DeliveryId, DrugId)
);

-- sale

DROP TABLE IF EXISTS Drugstore CASCADE;
CREATE TABLE Drugstore(
    id INT
		PRIMARY KEY,
    address TEXT
        NOT NULL,
    num INT
        CHECK (num > 0)
);

DROP TABLE IF EXISTS DrugsInDrugstore CASCADE;
CREATE TABLE DrugsInDrugstore (
    drugstoreId INT
        REFERENCES Drugstore,
    drugId INT
        REFERENCES Drug,
    price INT
	    NOT NULL
        CHECK (price >= 0),
    packagesAmount INT
        CHECK (packagesAmount >= 0), 
    PRIMARY KEY(drugstoreId, drugId)
);

DROP TABLE IF EXISTS Car CASCADE;
CREATE TABLE Car (
    id INT
        PRIMARY KEY,
    licensePlate TEXT
        NOT NULL,
    inspectionDate DATE
        NOT NULL
);


DROP TABLE IF EXISTS DeliveryTask CASCADE;
CREATE TABLE DeliveryTask (
    id INT
        PRIMARY KEY,
    carId INT
        NOT NULL
        REFERENCES Car,
    taskDate DATE,
    drugId INT
        NOT NULL
        REFERENCES Drug,
    drugstoreId INT
        NOT NULL
        REFERENCES Drugstore,
    packagesAmount INT
        CHECK (packagesAmount >= 0),
    WarehouseId INT
        NOT NULL
        REFERENCES Warehouse
);
