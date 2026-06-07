--Bepaal de hoogte van de hoogste boom.
select max(p.hoogte) as "maximale hoogte"
from planten p
where soort = 'boom';

--Bepaal het totale bedrag van de bestellingen voor de artikelcode ‘123’.
select sum(aantal*bestelprijs)
from bestelregels r
where r.art_code = 123;

--Bepaal het aantal artikelen in bestelling.
select sum(aantal)
from bestelregels;

--Bepaal het aantal verschillende artikelen in bestelling.
select count(unique(art_code))
from bestelregels;

--Is voor de tabel planten AVG(hoogte) hetzelfde als SUM(hoogte)/COUNT(hoogte)?
select avg(hoogte)
from PLANTEN;
select sum(hoogte)/count(hoogte)
from planten;
-- Zo ja, waarom? Ze neen, waarom niet?


--Toon per plantensoort het aantal planten en de gemiddelde verkoopprijs.
select soort, count(plantennaam), round(avg(prijs),2)
from PLANTEN
group by soort;

--Toon een overzicht met de verschillende kleuren voor vaste planten,
--en per kleur telkens de prijs van de goedkoopste plant (voor die kleur vaste planten).
-- De prijs van de goedkoopste vaste plant moet bovenaan in de lijst te vinden zijn.
select unique(kleur), min(prijs)
from planten
where kleur is not null and soort = 'vast'
group by kleur
order by min(prijs);

--Maak een overzicht met per artikelcode de laagste en hoogste offerteprijs.
select art_code, min(off_prijs), max(off_prijs)
from offertes
group by art_code;
--Uitbreiding: Toon ook de naam van de planten, sorteer alfabetisch
select p.plantennaam, o.art_code, min(o.off_prijs), max(o.off_prijs)
from offertes o
join planten p on p.ART_CODE = o.art_code
group by o.art_code, p.plantennaam
order by p.plantennaam desc;


--Wat is de gemiddelde prijs per plantensoort, voor soorten waarvan er minstens 5 planten in het assortiment zitten?


--Toon een lijst waaruit je kan afleiden of het waar is dat planten met korte leveringstijden in het algemeen een hogere gemiddelde offerteprijs hebben.
--Wat is de laagste prijs per plantensoort van de planten die in mei of juni bloeien?