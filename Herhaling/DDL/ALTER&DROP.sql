--Verwijder de tabel docenten. Waarom werkt dit niet?

drop table acienniteiten, cursussen, docenten, inschrijvingen, specialisaties, studenten;
--Welke stappen zou je moeten uitvoeren om dit wel te laten lukken? Niet uitvoeren, slechts redeneren.

--We willen bij inschrijvingen graag het aantal punten op 20 dat een student behaald op dit vak bijhouden.
 --Voeg een kolom "punten" toe.
alter table inschrijvingen
    add punten numeric(2);

--De hogeschool beseft zich plots dat een lengte van 15 wel erg kort is voor de Woonplaats van hun docenten.
--Na de nodige vergaderingen wordt beslist dit te verhogen naar 150. Pas de tabel aan.
alter table docenten
    alter column woonplaats type varchar(150);

--Wat gebeurt er als we de lengte van het veldje Achternaam in de tabel Studenten verkleinen naar 10 karakters
-- en er al studenten met een langere achternaam in staan?

--Voeg volgende wijzigingen toe in de tabel anciënniteiten:
--Verwijder de kolom extra
alter table acienniteiten
    drop column extra;
--Verander de naam van de kolom basis naar salaris
alter table acienniteiten
    rename column basis to salaris;
