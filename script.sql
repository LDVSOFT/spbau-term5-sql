-- sale

CREATE TABLE Drugstore(
    id     INT
        CHECK (id >= 0),
    adress TEXT
        NOT NULL,
    num    INT
        CHECK (num > 0),
    UNIQUE(id));

CREATE TABLE DrugsInDrugstore(
    id              INT
        CHECK (id >= 0),
    drugstoreId     INT
        CHECK (drugstoreId >= 0),
    cureId          INT
        CHECK (cureId >= 0),
    price           INT
        CHECK (price >= 0),
    packagesAmount  INT
        CHECK (packagesAmount >= 0), 
    UNIQUE(id));

CREATE TABLE Auto(
    id             INT
        CHECK (id >= 0), 
    num            INT
        CHECK (num >= 0), 
    inspectionDate DATE,
    UNIQUE(id));

CREATE TABLE AutoTask(
    id              INT
        CHECK (id >= 0),
    autoId          INT
        CHECK (id >= 0),
    taskDate        Date,
    cureId          INT
        CHECK (cureId >= 0),
    dragstoreId     INT
        CHECK (dragstoreId >= 0),
    packagesAmount  INT
        CHECK (packagesAmount >= 0),
    storageId       INT
        CHECK (storageID >= 0),
    UNIQUE(id));

CREATE TABLE Storage(
    id      INT
        CHECK (id >= 0),
    adress  TEXT
        NOT NULL,
    UNIQUE(id));
