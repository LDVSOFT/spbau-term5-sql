-- all about cures

CREATE TABLE Cure(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    internationalName TEXT
        NOT NULL,
    cureFormId INT
        CHECK (cureFormId >= 0),
    manufactorerId INT
        CHECK (manufactorerId >= 0),
    componentId INT
        CHECK (componentId >= 0),
    certificateId INT
        CHECK (certificateId >= 0)
);

CREATE TABLE CureForm(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

CREATE TABLE Manufactorer(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    name TEXT
        NOT NULL
);

CREATE TABLE Component(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    name TEXT
        NOT NULL,
    formula TEXT
        NOT NULL
);

CREATE TABLE Certificates(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    expires DATE
        NOT NULL,
    labId INT
        CHECK (id >= 0)
);

CREATE TABLE Lab(
    id INT
        CHECK (id >= 0)
        PRIMARY KEY,
    labName TEXT
        NOT NULL,
    boss TEXT
        NOT NULL
);

