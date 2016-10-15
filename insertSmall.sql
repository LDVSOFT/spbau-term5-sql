INSERT INTO DosageForm(id, name)
    VALUES (0, 'Capsule'), 
           (1, 'Tablet'), 
           (2, 'Pastille'),
           (3, 'Elixir'), 
           (4, 'Emulsion');

INSERT INTO Manufacturer(id, name)
    VALUES (0, 'Тьмутарканский завод лекарственных препаратов'),
    (1, 'Esparma'),
    (2, 'Egis'), 
    (3, 'Valeant'), 
    (4, 'Bristol-Myers'), 
    (5, 'Polfa'), 
    (6, 'Woerwag Pharma'), 
    (7, 'Alpha Wassermann'), 
    (8, 'Belupo'),
    (9, 'Sanofi');

INSERT INTO Component(id, name, formula)
    VALUES (0, 'Acidum acetylsalicylicum', 'C9H8O4'),
    (1, 'aqua pura', 'O4'),
    (2, 'metamizolum natrium', 'C13H16N3O4SNa'),
    (3, 'paracetamolum', 'O3'),
    (4, 'coffeinum', 'O2'),
    (5, 'aluminii phosphas', 'AIO4P'),
    (6, 'ibuprophenum', 'C13H18O2'),
    (7, 'algeldratum', 'O1');

INSERT INTO Laboratory(id, name, managerLastName)
    VALUES (0, 'spbau', 'Alpherov'),
    (1, 'biocad', 'Dobrynin'),
    (2, 'tokeyLab', 'Li'),
    (3, 'UKLab', 'Smith'),
    (4, 'BestLab', 'Sklep');

INSERT INTO Drug(id, name, internationalName, dosageFormId, manufacturerId, componentId, certificateId, certificateExpires, certificateLaboratoryId)
    VALUES (0, 'Aspirin', 'Aspirin', 1, 5, 0, 0, '21/03/2007', 0), 
    (1, 'Spri', 'AquWoter', 3, 5, 1, 2, '28/04/2016', 1), 
    (2, 'strepsils', 'strepsils', 3, 2, 1, 3, '21/03/1996', 2),
    (3, 'analgin', 'analgin', 1, 5, 2, 4, '26/03/1996', 0), 
    (4, 'citramon', 'citramonP', 1, 4, 0, 5, '02/01/1997', 4), 
    (5, 'phosphalugel', 'phosphalugel', 3, 3, 4, 7, '04/11/1994', 3),
    (6, 'nurofen', 'nurofen', 1, 3, 6, 10, '18/03/1995', 4),
    (7, 'maalox', 'maalox', 4, 7, 7, 11, '01/09/2002', 4);
