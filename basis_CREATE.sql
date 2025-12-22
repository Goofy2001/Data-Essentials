--oefeningen tabellen hogeschool
---DOCENTEN
CREATE TABLE Docenten (
    docent_id NUMBER(7,0),
    voornaam VARCHAR2(255) NOT NULL,
    achternaam VARCHAR2(255) NOT NULL,
    woonplaats VARCHAR2(15) NOT NULL,
    aanstellingsdatum DATE NOT NULL,
    CONSTRAINT pk_docenten_docent_id PRIMARY KEY (docent_id)
);
---STUDENTEN
CREATE TABLE studenten (
    student_id NUMBER(7,0),
    CONSTRAINT pk_studenten_student_id PRIMARY KEY (student_id),
    voornaam VARCHAR2(255) NOT NULL,
    achternaam VARCHAR2(255) NOT NULL,
    geboortedatum DATE
);
---SPECIALISATIES
CREATE TABLE specialisaties (
    specialisatie_id NUMBER(11,0),
    CONSTRAINT pk_specialisaties_specialisatie_id PRIMARY KEY (specialisatie_id),
    code CHAR(8) UNIQUE NOT NULL,
    naam VARCHAR(50)
);
---CURSUSSEN
CREATE TABLE cursussen (
    cursusnr NUMBER(11,0) ,
    CONSTRAINT pk_cursussen_cursusnr PRIMARY KEY (cursusnr),
    docent_id NUMBER(7,0) NOT NULL,
    CONSTRAINT fk_cursussen_docenten FOREIGN KEY (docent_id) REFERENCES docenten(docent_id), --verwijzing naar de primary key van docent_id in table docenten
    specialisatie_id NUMBER(11,0),
    CONSTRAINT fk_cursussen_specialisaties FOREIGN KEY (specialisatie_id) REFERENCES specialisaties(specialisatie_id),
    titel VARCHAR2(50) NOT NULL UNIQUE,
    studiepunten NUMBER(2) NOT NULL,
    bijkomende_kost NUMBER(4,2) 
);
---INSCHRIJVINGEN
CREATE TABLE inschrijvingen (
    student_id NUMBER(7,0),
    cursusnr NUMBER(11,0),
    kost_betaald NUMBER(4,2) NOT NULL,
    CONSTRAINT pk_inschrijvingen_student_id_cursusnr PRIMARY KEY (student_id, cursusnr),
    CONSTRAINT fk_inschrijvingen_studenten FOREIGN KEY (student_id) REFERENCES studenten (student_id),
    CONSTRAINT fk_inschrijvingen_cursussen FOREIGN KEY (cursusnr) REFERENCES cursussen (cursusnr)
);
---ANCIENNITEITEN
CREATE TABLE ancienniteiten (
    jaar NUMBER(2,0),
    basis NUMBER NOT NULL,
    extra NUMBER(8,2) NOT NULL,
    CONSTRAINT pk_ancienniteiten_jaar PRIMARY KEY (jaar)
)

--DROP TABLES
DROP TABLE ancienniteiten 
DROP TABLE inschrijvingen 
DROP TABLE cursussen 
DROP TABLE specialisaties
DROP TABLE studenten
DROP TABLE docenten