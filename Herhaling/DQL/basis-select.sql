-- Geef de namen van alle leveranciers in dalende volgorde.
select *
from leveranciers
order by lev_naam desc;
-- Geef de naam van alle vaste planten, in dalende volgorde.
select plantennaam
from PLANTEN
where soort Like 'vast';
-- Geef van alle leveranciers de naam en de woonplaats.
select lev_naam, woonplaats
from LEVERANCIERS;
-- Extra: probeer de uitvoer als zin te laten verschijnen: “Flora BV. is gevestigd in Aalsmeer”
select lev_naam || ' is gevestigd in ' || woonplaats as zin
from leveranciers;
-- Geef de leverancierscodes en de namen van leveranciers waarbij de letter ‘o’ voorkomt in de naam.
select lev_code, lev_naam
from leveranciers
where upper(lev_naam) like '%O%';
-- Geef alle namen van de leveranciers die in Aalsmeer wonen en die een korting geven van minstens 5%.
select lev_naam
from leveranciers
where korting >= 5 and woonplaats like 'Aalsmeer';
-- Geef de namen van alle vaste planten die minder kosten dan 5 EUR.
select plantennaam
from PLANTEN
where prijs < 5 and soort = 'vast';
-- Geef de artikelcode, naam en soort van alle vaste planten en van alle bomen. Rangeschik ze in dalende volgorde van plantnaam.
select art_code, plantennaam, soort
from PLANTEN
where soort like 'vast'
order by PLANTENNAAM desc;
-- Geef alle gegevens van de planten die een hoogte kunnen bereiken tussen 100 cm en 200 cm.
select *
from PLANTEN
where hoogte between 100 and 200;
-- Toon alle gegevens van de waterplanten, volgens dalende hoogte.
select *
from planten
where soort like 'water'
order by hoogte desc;
-- Toon de verschillende woonplaatsen (alfabetisch) van onze leveranciers.
select unique(woonplaats)
from LEVERANCIERS
order by woonplaats asc;
-- Toon een lijst met de verschillende kleuren die in het assortiment voorkomen.
select unique(kleur)
from planten
where kleur is not null;
-- Toon de verschillende plantensoorten met een rode kleur (in de bloei)
//
-- Toon alle gegevens over planten die meer dan 12.5 euro kosten. In het lijstje mogen geen bomen voorkomen.
select *
from PLANTEN
where prijs > 12.5 and soort != 'boom';
-- Toon artikelcode en plantnaam van planten waarvan de derde letter in de naam een 'n' is.
select art_code, plantennaam
from PLANTEN
where plantennaam like '__n%';
-- Geef voor de verschillende bomen een overzicht van het aantal maanden dat ze in bloei staan.
select plantennaam, bloeieinde - BLOEIBEGIN as bloeiperiode
from PLANTEN
where soort like 'boom';
-- Toon artikelcode en plantnaam van 1-jarige en 2-jarige planten.
select art_code, plantennaam
from planten
where soort like '_-jarig' and ( soort like '1%' or soort like '2%');
-- Toon alle gegevens van de planten met 'kruid' in de naam, maar zonder de planten die tot de groep kruiden behoren.
select *
from PLANTEN
where upper(plantennaam) like '%KRUID%' and soort != 'kruiden';
-- Toon de naam van de planten waarvan de naam uit precies 5 karakters bestaat.
select plantennaam
from planten
where plantennaam like '_____';
-- Herhaal voor de planten waarvan de naam uit minstens 5 karakters bestaat.
select plantennaam
from planten
where plantennaam like '%_____%';