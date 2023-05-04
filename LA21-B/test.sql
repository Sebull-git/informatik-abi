DROP DATABASE LA21_B;
CREATE DATABASE LA21_B;
USE LA21_B;
CREATE TABLE Verleih(
    vid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    adresse VARCHAR(255)
);

CREATE TABLE Genre(
    gid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    bezeichnung VARCHAR(255)
);

CREATE TABLE Film(
    fid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    title VARCHAR(255),
    laenge INT,
    fsk INT,
    original_sprache VARCHAR(20),
    fk_vid INT,
    fk_gid INT,
    CONSTRAINT fk_vid
    FOREIGN KEY (fk_vid)
    REFERENCES Verleih (vid),
    CONSTRAINT fk_gid
    FOREIGN KEY (fk_gid)
    REFERENCES Genre (gid)
);

CREATE TABLE Schauspieler(
    sid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(255),
    vorname VARCHAR(255),
    gebDatum DATE
);

CREATE TABLE Trailer(
    tid INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    laenge INT,
    bezeichnung VARCHAR(255),
    sprache VARCHAR(20),
    fk_fid INT,
    CONSTRAINT fk_fid
    FOREIGN KEY (fk_fid)
    REFERENCES Film (fid)
);

CREATE TABLE spielt_in(
    film INT,
    schauspieler INT,
    PRIMARY KEY(film, schauspieler),
    CONSTRAINT fk_fid_spielt
    FOREIGN KEY (film)
    REFERENCES Film (fid),
    CONSTRAINT fk_sid_spielt
    FOREIGN KEY (schauspieler)
    REFERENCES Schauspieler (sid)
);
INSERT INTO Genre(bezeichnung) VALUES("Kinderfilem");
INSERT INTO Verleih(name, adresse) VALUES ("Sebastians Verein", "Haupstraße 29a 61273 Wehrheim");
INSERT INTO Film(title,laenge,fsk,original_sprache, fk_vid, fk_gid) VALUES("Alle lieben Sebastian",120,6, "Deutsch", 1,1);
INSERT INTO Film(title,laenge,fsk, original_sprache, fk_vid, fk_gid) VALUES("Kleiner armer Arsch", 90, 6, "Deutsch", 1,1);
INSERT INTO Verleih(name, adresse) VALUES("Logo Movie Production", "hollywood 1");