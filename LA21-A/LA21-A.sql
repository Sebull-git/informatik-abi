DROP DATABASE  mysql_training; 
CREATE DATABASE mysql_training;

USE mysql_training;

CREATE TABLE Filiale ( 
	filialnr INT PRIMARY KEY NOT NULL,
	adresse VARCHAR(120) NOT NULL
);

CREATE TABLE Fahrer(
	fahrernr INT PRIMARY KEY NOT NULL,
	handynr BIGINT, 
	vorname VARCHAR(120),
	nachname VARCHAR(120),
	fuehrerscheinklasse VARCHAR(255)
);

CREATE TABLE eMotoroller(
	versicherungskennzeichen VARCHAR(20),
	ladezeit INT,
	reichweite INT,
	motorollerID INT PRIMARY KEY NOT NULL
);

CREATE TABLE Kleinwagen(
	kennzeichen VARCHAR(20),
	naechsteHU DATETIME,
	kleinwagenID INT PRIMARY KEY NOT NULL
);

CREATE TABLE Fahrzeug(
	fahrzeugnr INT PRIMARY KEY NOT NULL,
	kmStand INT,
	motorollerID INT,
	kleinwagenID INT,
	CONSTRAINT fk_Motoroller
	FOREIGN KEY (motorollerID) 
	REFERENCES eMotoroller(motorollerID),
	CONSTRAINT fk_Kleinwagen
	FOREIGN KEY (kleinwagenID)
	REFERENCES Kleinwagen(kleinwagenID)
);

CREATE TABLE Lieferauftrag(
	bestellnr INT PRIMARY KEY NOT NULL,
	lieferadresse VARCHAR(255),
	start DATETIME,
	ende DATETIME,
	ausgeliefert DATETIME,
	FahrzeugID INT,
	FahrerID INT,
	CONSTRAINT fk_FahrzeugLiefern
	FOREIGN KEY (FahrzeugID)
	REFERENCES Fahrzeug (fahrzeugnr),
	CONSTRAINT fk_FahrerLiefern
	FOREIGN KEY (FahrerID)
	REFERENCES Fahrer (fahrernr)
);

CREATE TABLE faehrtFuer(
	FahrerID INT,
	FilialeID INT,
	Tag Date,
	CONSTRAINT fk_Fahrer
	FOREIGN KEY (FahrerID)
	REFERENCES Fahrer (fahrernr),
	CONSTRAINT fk_Filiale
	FOREIGN KEY (FilialeID)
	REFERENCES Filiale (filialnr)
);

INSERT INTO Fahrer VALUES(1,49123456, 'Sebastian','Weber','B');
INSERT INTO Fahrer VALUES(2,4987654,'Nikolas','Weber','B');
INSERT INTO Fahrer VALUES(3,456123, 'Finn','Schneider', 'B');

INSERT INTO Filiale VALUES(1,'Haupstraße 29a 61237 Wehrheim');

INSERT INTO Kleinwagen VALUES('HG RW 1983','2023-01-23 12:45:00' , 1);

INSERT INTO Fahrzeug VALUES (1,0, NULL, 1);

INSERT INTO Lieferauftrag VALUES(1, "Am Eberhart 12 Luisenburg", '2023-04-13 12:45:00','2023-04-13 14:45:00','2023-04-13 13:14:00', 1, 1);
-- Cooler Stuff

-- SELECT CONCAT(vorname, nachname) as Name FROM Fahrer, Lieferauftrag WHERE Lieferauftrag.FahrerID = Fahrer.fahrernr;


-- Aufgaben:
-- Formulieren Sie eine SQL-Anweisung, die die Bestellnummern und die Lieferdauer (Zeit
-- zwischen Start und Auslieferung) aller Lieferaufträge ermittelt, deren Lieferdauer mehr als 45
-- Minuten beträgt.

INSERT INTO Lieferauftrag VALUES(2, "Am Arsch der Welt 24", '2023-04-13 12:00:00', '2023-04-13 15:00:00', '2023-04-13 12:55:00',1,1);
SELECT bestellnr, TIMEDIFF(ausgeliefert,start) FROM Lieferauftrag WHERE TIMEDIFF(ausgeliefert,start) > '00:45:00';


--  Das Kennzeichen des Kleinwagens sowie Vor- und Nachname des Fahrers für die Auslieferung
-- der Bestellung mit der Nummer 4711 sollen ermittelt werden.
-- Geben Sie die entsprechende SQL-Anweisung an.

INSERT INTO Lieferauftrag VALUES(4711,"Gerade um die Ecke", '2023-04-13 11:00:00', '2023-04-13 14:00:00', '2023-04-13 11:15:00', 1,1);
