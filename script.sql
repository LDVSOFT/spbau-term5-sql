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
        UNIQUE,
    certificateExpires DATE
        NOT NULL,
    certificateLaboratoryId INT
        NOT NULL
        REFERENCES Laboratory
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
        UNIQUE
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

DROP TABLE IF EXISTS WarehouseDelivery CASCADE;
CREATE TABLE WarehouseDelivery (
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

DROP TABLE IF EXISTS WarehouseDeliveryPart CASCADE;
CREATE TABLE WarehouseDeliveryPart (
    deliveryId INT
        REFERENCES WarehouseDelivery,
    drugId INT
        REFERENCES Drug,
    packageCount INT
        NOT NULL
        CHECK (packageCount >= 0),
    packageWeight REAL
        NOT NULL,
    itemsPerPackage INT
        NOT NULL
        CHECK (itemsPerPackage >= 0),
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
        UNIQUE
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
    itemsCount INT
        NOT NULL
        CHECK (itemsCount >= 0),
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

DROP TABLE IF EXISTS DrugstoreDelivery CASCADE;
CREATE TABLE DrugstoreDelivery (
    id INT
        PRIMARY KEY,
    carId INT
        NOT NULL
        REFERENCES Car,
    taskDate DATE
        NOT NULL,
    warehouseId INT
        NOT NULL
        REFERENCES Warehouse
);

DROP TABLE IF EXISTS DrugstoreDeliveryPart CASCADE;
CREATE TABLE DrugstoreDeliveryPart (
    deliveryId INT
        REFERENCES DrugstoreDelivery,
    drugId INT
        REFERENCES Drug,
    drugstoreId INT
        REFERENCES Drugstore,
    packagesCount INT
        NOT NULL
        CHECK (packagesCount >= 0),
    PRIMARY KEY (deliveryId, drugId, drugstoreId)
);
