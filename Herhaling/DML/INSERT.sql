-- =============================================
-- HOGESCHOOL DATABASE
-- =============================================

-- Vul de tabellen van de hogeschool met volgende data.
-- Noteer welke wel en niet lukken, en waarom wel/niet.

-- =============================================
-- TABEL 1: Docenten
-- =============================================
-- Docent_id  Voornaam  Achternaam   Woonplaats          Aanstellingsdatum
-- 1234567    Dominik   Schellen     Westende            01/11/2017
-- 1234555    Hans      Beenhakker   Leuven              08/12/2016
-- 1234527    Leena     Schmidt      Doische             05/01/2015
-- 3210007    Eman      Davids       Court-Saint-Etienne 07/08/2011

INSERT INTO docenten (docent_id, voornaam, achternaam, woonplaats, aanstellingsdatum) VALUES
    (1234567, 'Dominik', 'Schellen', 'Westende', '2017-11-01'),
    (1234555, 'Hans', 'Beenhakker', 'Leuven', '2016-12-08'),
    (1234527, 'Leena', 'Schmidt', 'Doische', '2015-01-05'),
    (3210007, 'Eman', 'Davids', 'Court-Saint', '2011-08-07');

-- =============================================
-- TABEL 2: Studenten
-- =============================================
-- Student_id  Voornaam  Achternaam     Geboortedatum
-- 1234567     Letitia   Dijksnam       31/03/1990
-- 1234513     Siegfried Willigenburg   19/11/1996
-- 1321012     David     Akkerman       01/11/1987

INSERT INTO studenten (student_id, voornaam, achternaam, geboortedatum) VALUES
    (1234567, 'Letitia', 'Dijksnam', '1990-03-31'),
    (1234513, 'Siegfried', 'Willigenburg', '1996-11-19'),
    (1321012, 'David', 'Akkerman', '1987-11-01');

-- =============================================
-- TABEL 3: Specialisaties
-- =============================================
-- Specialisatie_id  Code        Naam
-- 1                 BAMCTMAW    Mobile App and Web
-- 2                 BAMCTART    Art and Technology
-- 3                 BAICTBIT    Business IT
-- 4                 BAICTNWS    Networks and Security
-- 5                 BAICTSWE    Software Engineering

INSERT INTO specialisaties (specialisatie_id, code, naam) VALUES
    (1, 'BAMCTMAW', 'Mobile App and Web'),
    (2, 'BAMCTART', 'Art and Technology'),
    (3, 'BAICTBIT', 'Business IT'),
    (4, 'BAICTNWS', 'Networks and Security'),
    (5, 'BAICTSWE', 'Software Engineering');

-- =============================================
-- TABEL 4: Cursussen
-- =============================================
-- Cursusnr  Docent_id  Specialisatie_id  Titel                Studiepunten  Bijkomende_kost
-- 100       1234565    NULL              SQL                  3             NULL
-- 200       1234567    NULL              SQL                  3             NULL
-- 111       1234555    5                 Android              4             80.25
-- 123       1234567    4                 Networking           3             50
-- 321       1234555    2                 Design fundamentals  2             10.25

INSERT INTO cursussen (cursusnr, docent_id, specialisatie_id, titel, studiepunten, bijkomende_kost) VALUES
    (200, 1234567, NULL, 'PostgreSQL', 3, NULL),
    (111, 1234555, 5, 'Android', 4, 80.25),
    (123, 1234567, 4, 'Networking', 3, 50),
    (321, 1234555, 2, 'Design fundamentals', 2, 10.25);

-- =============================================
-- TABEL 5: Inschrijvingen
-- =============================================
-- Student_id  Cursusnr  Kost_betaald
-- 1234567     111       70
-- 1234513     123       100.50
-- 1234513     321       NULL

INSERT INTO inschrijvingen (student_id, cursusnr, kost_betaald) VALUES
    (1234567, 111, 70),
    (1234513, 123, 10.50),
    (1234513, 321, 0);

-- =============================================
-- TABEL 6: Acienniteiten
-- =============================================
-- Jaar  Basis  Extra
-- 1     1000   10.50
-- 2     1100   15.50
-- 3     1200   20.00

INSERT INTO acienniteiten (jaar, basis, extra) VALUES
    (1, 1000, 10),
    (2, 1100, 12),
    (3, 1200, 15);