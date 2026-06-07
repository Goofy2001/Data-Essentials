-- =============================================
-- HOGESCHOOL DATABASE - OPERATIES
-- =============================================

-- =============================================
-- 1. Verwijder docent 1234555
-- =============================================


delete from docenten where docent_id = 1234555;

-- =============================================
-- 2. Verwijder alle inschrijvingen van student 1234567
-- =============================================

delete from inschrijvingen where student_id = 1234567;

-- =============================================
-- 3. Voeg een kolom "punten" toe aan inschrijvingen
-- =============================================

alter table inschrijvingen
    add column punten   numeric(2);

-- =============================================
-- 4. Geef de student die de cursus "Android" volgt 10 punten
-- =============================================
update inschrijvingen
    set punten = 10
    where cursusnr = (
        select cursusnr
        from cursussen
        where titel = 'Andriod'
    )

-- =============================================
-- 5. Verhoog de lengte van woonplaats naar 150
-- =============================================

alter table docenten
    alter column woonplaats type varchar(150);

-- =============================================
-- 6. Verklein achternaam naar 10 karakters
-- =============================================
-- Dit zal mislukken als er al studenten zijn met een achternaam langer dan 10 tekens.
-- PostgreSQL gooit een foutmelding: "value too long for type character varying(10)"

alter table studenten
    alter column achternaam type varchar(10);

-- =============================================
-- 7. Voeg een nieuwe student toe en schrijf in voor 2 cursussen
-- =============================================

insert into studenten (student_id, voornaam, achternaam)
    values (01, 'Thibo', 'coudron');

select *
from cursussen;

insert into inschrijvingen (student_id, cursusnr, kost_betaald)
    values (01, )
-- =============================================
-- 8. Zet alle punten van de nieuwe student op 20 (1 query)
-- =============================================



-- =============================================
-- 9. Leena Schmidt neemt de vakken van Hans Beenhakker over
-- =============================================

