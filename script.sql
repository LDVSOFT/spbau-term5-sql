-- all about cures

CREATE TABLE Cure(
    id INT
        CHECK (id >= 0),
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
        CHECK (certificateId >= 0),
    UNIQUE(id)
);

CREATE TABLE CureForm(
    id INT
        CHECK (id >= 0),
    name TEXT
        NOT NULL,
    UNIQUE(id)
);

CREATE TABLE Manufactorer(
    id INT
        CHECK (id >= 0),
    name TEXT
        NOT NULL,
    UNIQUE(id)
);

CREATE TABLE Component(
    id INT
        CHECK (id >= 0),
    name TEXT
        NOT NULL,
    formula TEXT
        NOT NULL,
    UNIQUE(id)
);

CREATE TABLE Certificates(
    id INT
        CHECK (id >= 0),
    expires DATE
        NOT NULL,
    labId INT
        CHECK (id >= 0),
    UNIQUE(id)
);

CREATE TABLE Lab(
    id INT
        CHECK (id >= 0),
    labName TEXT
        NOT NULL,
    boss TEXT
        NOT NULL,
    UNIQUE(id)
);

