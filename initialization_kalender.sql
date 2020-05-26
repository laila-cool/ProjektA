CREATE TABLE datum
(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
    
);

INSERT INTO datum ( name ) VALUES ("Freitag 1.5.2020");
INSERT INTO datum ( name ) VALUES ("Samstag 2.5.2020");
INSERT INTO datum ( name ) VALUES ("Sonntag 3.5.2020");
INSERT INTO datum ( name ) VALUES ("Montag 4.5.2020");
INSERT INTO datum ( name ) VALUES ("Dienstag 5.5.2020");
INSERT INTO datum ( name ) VALUES ("Mittwoch 6.5.2020");
INSERT INTO datum ( name ) VALUES ("Donnerstag 7.5.2020");
INSERT INTO datum ( name ) VALUES ("Freitag 8.5.2020");
INSERT INTO datum ( name ) VALUES ("Samstag 9.5.2020");
INSERT INTO datum ( name ) VALUES ("Sonntag 10.5.2020");
INSERT INTO datum ( name ) VALUES ("Montag 11.5.2020");
SELECT * FROM datum;

CREATE TABLE benutzer(
    id INTEGER PRIMARY KEY,
    benutzername TEXT NOT NULL,
    passwort TEXT NOT NULL
);

INSERT INTO benutzer (benutzername,passwort) VALUES ("ilaf","hallo");
INSERT INTO benutzer (benutzername,passwort) VALUES ("uemit","byebye");
SELECT * FROM benutzer; 

CREATE TABLE termine
(
    id INTEGER PRIMARY KEY,
    datum_id INTEGER,
    benutzer_id INTEGER,
    eintrag TEXT

);

INSERT INTO termine ( datum_id,benutzer_id,eintrag) VALUES (1,1,"Feiertag");
INSERT INTO termine ( datum_id,benutzer_id,eintrag) VALUES (1,2,"Feiertag");
INSERT INTO termine ( datum_id,benutzer_id,eintrag) VALUES (3,1,"Papier wird abgeholt");
INSERT INTO termine ( datum_id,benutzer_id,eintrag) VALUES (4,2,"Entspannen");
INSERT INTO termine ( datum_id,benutzer_id,eintrag) VALUES (5,1,"Fahrradtour");
SELECT * FROM termine;

SELECT termine.eintrag, datum.name, benutzer.benutzername
FROM benutzer, datum, termine
WHERE benutzer.id = termine.benutzer_id
AND datum.id = termine.datum_id;

SELECT termine.eintrag, datum.name, benutzer.benutzername
FROM benutzer, datum, termine
WHERE benutzer.id = termine.benutzer_id
AND datum.id = termine.datum_id
AND benutzer.benutzername = "ilaf";

