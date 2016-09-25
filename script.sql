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
        NOT NULL
		REFERENCES CureForm,
    manufactorerId INT
        NOT NULL
		REFERENCES Manufactorer,
    componentId INT
        NOT NULL
		REFERENCES Component,
    certificateId INT
        NOT NULL
		REFERENCES Certificate
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

DROP TABLE IF EXISTS Certificate;
CREATE TABLE Certificate(
    id INT
        PRIMARY KEY,
    expires DATE
        NOT NULL,
    labId INT
        NOT NULL
		REFERENCES Lab
);

DROP TABLE IF EXISTS Lab;
CREATE TABLE Lab(
    id INT
        PRIMARY KEY,
    labName TEXT
        NOT NULL,
    boss TEXT
        NOT NULL
);

-- all about delivery

DROP TABLE IF EXISTS Delivery;
CREATE TABLE Delivery (
	Id INT
		PRIMARY KEY,
	WarehouseId INT
		NOT NULL
		REFERENCES Warehouse,
	DistributerId INT
		NOT NULL
		REFERENCES Distributer,
	DeliveryDate TIMESTAMP,
	WarehouseKeeper TEXT
);

DROP TABLE IF EXISTS DeliveryPart;
CREATE TABLE DeliveryPart (
	DeliveryId INT,
	CureId INT,
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

-- sale

DROP TABLE IF EXISTS Drugstore;
CREATE TABLE Drugstore(
    id INT
		PRIMARY KEY,
    adress TEXT
        NOT NULL,
    num INT
        CHECK (num > 0)
);

DROP TABLE IF EXISTS DrugsInDrugstore;
CREATE TABLE DrugsInDrugstore (
    drugstoreId INT
		REFERENCES Drugstore,
    cureId INT
		REFERENCES Cure,
    price INT
		NOT NULL
        CHECK (price >= 0),
    packagesAmount INT
        CHECK (packagesAmount >= 0), 
	PRIMARY KEY(drugstoreId, cureId)
);

DROP TABLE IF EXISTS Auto;
CREATE TABLE Auto (
    id INT
		PRIMARY KEY,
    num TEXT
        NOT NULL,
    inspectionDate DATE
		NOT NULL
);


DROP TABLE IF EXISTS AutoTask;
CREATE TABLE AutoTask (
    id              INT
        PRIMARY KEY,
    autoId          INT
        NOT NULL
                REFERENCES Auto,
    taskDate        Date,
    cureId          INT
        NOT NULL
                REFERENCES Cure,
    dragstoreId     INT
        NOT NULL
                REFERENCES Drugstore,
    packagesAmount  INT
        CHECK (packagesAmount >= 0),
    WarehouseId       INT
        NOT NULL
                REFERENCES Warehouse
);
