-- Active: 1780305342176@@127.0.0.1@5432@School@public

-- =============================================
-- HOGESCHOOL DATABASE
-- =============================================

-- Maak de tabellen van de hogeschool aan.
-- Gebruik hiervoor onderstaande gegevens en de tabelrelaties.

-- =============================================
-- TABEL 1: Docenten
-- =============================================
-- Naam                 Type                            Lengte  Extra
-- Docent_id            Getal                           7       PRIMARY KEY
-- Voornaam             Alfanumeriek, variabele lengte  255     Verplicht
-- Achternaam           Alfanumeriek, variabele lengte  255     Verplicht
-- Woonplaats           Alfanumeriek, variabele lengte  15      Verplicht
-- Aanstellingsdatum    Datum                                   Verplicht

create table docenten (
    docent_id   numeric(7),
    voornaam    varchar(255)   not null,
    achternaam  varchar(255)   not null,
    woonplaats  varchar(15)    not null,
    Aanstellingsdatum   DATE    not null,

    constraint pk_docenten_docent_id primary key (docent_id)
);

-- =============================================
-- TABEL 2: Studenten
-- =============================================
-- Naam              Type                            Lengte  Extra
-- Student_id        Getal                           7       PRIMARY KEY
-- Voornaam          Alfanumeriek, variabele lengte  255     Verplicht
-- Achternaam        Alfanumeriek, variabele lengte  255     Verplicht
-- Geboortedatum     Datum                                   Optioneel

create table studenten (
    student_id  numeric(7),
    voornaam    varchar(255)   not null,
    achternaam  varchar(255)   not null,
    Geboortedatum   DATE,

    constraint pk_studenten_student_id primary key (student_id)
);

-- =============================================
-- TABEL 3: Specialisaties
-- =============================================
-- Naam                 Type                        Lengte  Extra
-- Specialisatie_id     Getal                       11      PRIMARY KEY
-- Code                 Alfanumeriek, vaste lengte  8       Verplicht en moet uniek zijn
-- Naam                 Alfanumeriek, vaste lengte  50      Optioneel

create table specialisaties (
    specialisatie_id    numeric(11),
    code    CHAR(8)    not null unique,
    naam    varchar(50),

    constraint pk_specialisaties_specialisatie_id primary key (specialisatie_id)
);

-- =============================================
-- TABEL 4: Cursussen
-- =============================================
-- Naam                 Type                            Lengte      Extra
-- Cursusnr             Getal                           11          PRIMARY KEY
-- Docent_id            Getal                           7           Verplicht, FOREIGN KEY naar docent_id in Docenten
-- Specialisatie_id     Getal                           11          Optioneel, FOREIGN KEY naar specialisatie_id in Specialisaties
-- Titel                Alfanumeriek, variabele lengte  50          Verplicht en moet uniek zijn
-- Studiepunten         Getal                           2           Verplicht
-- Bijkomende_kost      Getal                           4, 2 dec    Optioneel

create table cursussen (
    cursusnr    numeric(11),
    docent_id   numeric(7)   not null,
    specialisatie_id    numeric(11),
    Titel   varchar(50)    not null unique,
    Studiepunten    numeric(2)   not null,
    Bijkomende_kost numeric(4,2),

    constraint pk_cursussen_cursusnr primary key (cursusnr),
    constraint fk_cursussen_docent_id foreign key (docent_id)
        references docenten(docent_id),
    constraint fk_cursussen_specialisatie_id foreign key (specialisatie_id)
        references specialisaties(specialisatie_id)
);


-- =============================================
-- TABEL 5: Inschrijvingen
-- =============================================
-- Naam          Type    Lengte      Extra
-- Student_id    Getal   7           PRIMARY KEY, FOREIGN KEY naar student_id in Studenten
-- Cursusnr      Getal   11          PRIMARY KEY, FOREIGN KEY naar cursusnr in Cursussen
-- Kost_betaald  Getal   4, 2 dec    Verplicht

create table inschrijvingen (
    student_id  numeric(7)   not null,
    cursusnr    numeric(11)  not null,
    Kost_betaald    numeric(4,2) not null,

    constraint pk_inschrijvingen primary key (student_id, cursusnr),
    constraint fk_inschrijvingen_student_id foreign key (student_id)
        references studenten(student_id),
    constraint fk_inschrijvingen_cursus_nr foreign key (cursusnr)
        references cursussen(cursusnr)
);

-- =============================================
-- TABEL 6: Acienniteiten
-- =============================================
-- Naam   Type   Lengte      Extra
-- Jaar   Getal  2           PRIMARY KEY
-- Basis  Getal               Verplicht
-- Extra  Getal  8, 2 dec    Verplicht

create table acienniteiten (
    Jaar    numeric(2),
    Basis   numeric  not null,
    Extra   numeric(8,2) not null,

    constraint pk_acienniteiten primary key (jaar)
);
