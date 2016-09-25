-- all about drugs
DROP TABLE IF EXISTS DosageForm CASCADE;
CREATE TABLE DosageForm(
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
    dosageFormId INT
        NOT NULL
        REFERENCES DosageForm,
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
    id INT
        PRIMARY KEY,
    address TEXT
        NOT NULL,
    number INT
        NOT NULL
);

DROP TABLE IF EXISTS Distributor CASCADE;
CREATE TABLE Distributor (
    id INT
        PRIMARY KEY,
    address TEXT
        NOT NULL,
    bankAccountNumber TEXT
        NOT NULL,
    contactName TEXT
        NOT NULL,
    contactPhoneNumber TEXT
        NOT NULL
);

DROP TABLE IF EXISTS Delivery CASCADE;
CREATE TABLE Delivery (
    id INT
        PRIMARY KEY,
    warehouseId INT
        NOT NULL
        REFERENCES Warehouse,
    distributerId INT
        NOT NULL
        REFERENCES Distributor,
    deliveredAt TIMESTAMP
        NOT NULL,
    warehouseKeeper TEXT
        NOT NULL
);

DROP TABLE IF EXISTS DeliveryPart CASCADE;
CREATE TABLE DeliveryPart (
    deliveryId INT
        REFERENCES Delivery,
    drugId INT
        REFERENCES Drug,
    packageCount INT
        NOT NULL,
    packageWeight REAL
        NOT NULL,
    itemsPerPackage INT
        NOT NULL,
    itemPurchasePrice NUMERIC(9, 2)
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
    number INT
        NOT NULL
);

DROP TABLE IF EXISTS DrugsInDrugstore CASCADE;
CREATE TABLE DrugsInDrugstore (
    drugstoreId INT
        REFERENCES Drugstore,
    drugId INT
        REFERENCES Drug,
    price NUMERIC(9, 2)
        NOT NULL
        CHECK (price >= 0),
    packagesAmount INT
        NOT NULL
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
    taskDate DATE
        NOT NULL,
    drugId INT
        NOT NULL
        REFERENCES Drug,
    drugstoreId INT
        NOT NULL
        REFERENCES Drugstore,
    itemsAmount INT
        NOT NULL
        CHECK (itemsAmount >= 0),
    warehouseId INT
        NOT NULL
        REFERENCES Warehouse
);
