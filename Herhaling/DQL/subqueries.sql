---Toon een lijst met de planten die even goedkoop of goedkoper zijn dan
-- de goedkoopste vaste plant. Vermeld naam, prijs en soort.
select plantennaam, soort, prijs
from planten
where prijs <= (
    select min(prijs)
    from planten
    where soort = 'vast'
);

--Toon een lijst met naam en prijs van de duurste boom (of bomen).
select plantennaam, prijs
from planten
where prijs = (
    select max(prijs)
    from planten
    where soort = 'boom'
)
and soort = 'boom';

--Toon een lijst met voor alle vaste planten de gunstigste offerteprijzen.
--Vermeld artikelcode, leverancierscode en offerteprijs.
select o.art_code, o.lev_code, o.off_prijs
from offertes o
join planten p on o.art_code = p.art_code
where o.off_prijs = (
    select min(off_prijs)
    from OFFERTES
    where art_code = o.art_code
)
and p.soort = 'vast';

--Toon een lijst met alle gegevens over de leveranciers waarbij bestellingen
-- werden geplaatst met een leveringsdatum vóór vandaag,
-- sorteer op leveranciersnaam. Los op met en zonder subquery.
select *
from leveranciers
where lev_code in (
    select lev_code
    from bestellingen
    where lev_datum < sysdate
);

--Welke planten zijn hoger dan de hoogste vaste plant
--en tevens goedkoper dan de gemiddelde prijs van alle planten?
select *
from planten
where hoogte = (
    select max(hoogte)
    from planten
    where soort = 'vast'
)
and prijs < (
    select avg(prijs)
    from planten
);

--Toon een lijst met de bestelnummers van de bestellingen waarbij
--een korting van minstens 5% werd toegekend.
select b.bestelnr
from bestellingen b
where exists (
    select 1
    from leveranciers l
    where l.lev_code = b.lev_code
        and l.korting >= 5
);

--Toon een lijst met artikelcode, leveranciersnaam en offerteprijs
--voor die planten waarvoor de offerteprijs in kwestie lager is dan
-- de gemiddelde offerteprijs voor die plant. Sorteer op artikelcode.
select o.art_code, l.lev_naam, o.off_prijs
from offertes o
join leveranciers l on o.lev_code = l.lev_code
where o.off_prijs < (
    select avg(off_prijs)
    from offertes
    where o.art_code = art_code
    group by art_code
)
order by o.art_code;


--Toon een lijst met planten die werden besteld aan een prijs
--die hoger is dan de maximum offerteprijs die nu voor die plant geldt.
--Vermeld bestelnummer, naam van de leverancier, artikelcode van de plant,
-- naam van de plant en bestelprijs.
select p.plantennaam,r.art_code, l.lev_naam, r.bestelnr
from bestelregels r
join bestellingen b on r.bestelnr = b.bestelnr
join leveranciers l on b.lev_code = l.lev_code
join planten p on p.art_code = r.art_code
where r.bestelprijs > (
    select max(o.off_prijs)
    from offertes o
    where o.art_code = r.art_code
    group by o.art_code
);


--Toon een lijst met de planten die besteld werden bij leverancier "Hovenier G.H.".
--Sorteer op artikelcode. Vermeld artikelcode, bestelnummer,
--aantal stuks, bestelprijs, en het totale bedrag.
select r.*, r.aantal * r.bestelprijs as bedrag
from bestelregels r
where exists (
    select 1
    from leveranciers l
    join bestellingen b on l.lev_code = b.lev_code
    where l.lev_naam = 'Hovenier G.H.'
    and r.bestelnr = b.bestelnr
)
order by r.art_code asc;

--Toon de planten waarvoor geen offerteprijs bestaat.
select p.*
from planten p
where not exists (
    select 1
    from offertes o
    where o.art_code = p.art_code
);

--Geef alle leveranciersgegevens van de leveranciers waarbij het plantencentrum niets in bestelling heeft.
select l.*
from leveranciers l
where not exists (
    select 1
    from BESTELLINGEN b
    where b.lev_code = l.lev_code
);
--Geef de leveranciersgegevens en de planten (plantennaam) die bij hem in bestelling staan van alle leveranciers die een kleinere korting geven dan de gemiddelde korting.
--Geef namen van leveranciers met minsten twee bestellingen
--Geef naam van artikelen die zowel bij leverancier 4 als bij leverancier 13 in bestelling staan.
--Op welke bestelling(en) staat het minst aantal verschillende artikelen. Geef bestelnr en dat kleinste aantal.
--Geef de bestellingen waar alle planten besteld worden.
--Geef de bestellingen waar minstens die artikelen werden besteld als op bestelling 121