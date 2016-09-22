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
);

