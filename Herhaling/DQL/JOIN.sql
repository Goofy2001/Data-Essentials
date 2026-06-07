--Toon een lijst met voor alle bestellingen het bestelnummer,
--de naam van de leverancier, en de leveringsdatum.
--De lijst moet gesorteerd zijn op leveringsdatum (vroegste eerst),
--en bij gelijkheid op bestelnummer.
select b.bestelnr, l.lev_naam, b.lev_datum
from bestellingen b
join leveranciers l on b.lev_code = l.lev_code
order by b.lev_datum;

--Toon een lijst met de namen van alle vaste planten
--en de vermelding ‘vaste plant’,
--gevolgd door de namen van de waterplanten met vermelding ‘waterplant’
select plantennaam, 'vaste plant'
from planten
where soort = 'vast'
union
select plantennaam, 'waterplant'
from planten
where upper(soort) like '%WATER%';

--Toon een lijst met bestelde planten waarvoor er offertes zijn uitgebracht
-- die lager zijn dan de destijds gehanteerde bestelprijzen.
--Vermeld enkel de plantnaam en bestelprijs.
select unique(plantennaam), bestelprijs, off_prijs
from PLANTEN p
join bestelregels b on p.art_code = b.art_code
join offertes o on o.art_code = p.art_code
where bestelprijs > off_prijs;

--Geef een overzicht dat aangeeft welke planten bij welke leverancier
--kunnen besteld worden.
-- Toon hierbij de artikelcode, naam van de plant, naam van de leverancier,
-- levertijd en offerteprijs. Sorteer op plantnaam.
select p.plantennaam, p.art_code, l.lev_naam, o.lev_tijd, o.off_prijs
from planten p
join offertes o on p.art_code = o.art_code
join leveranciers l on o.lev_code = l.lev_code
order by plantennaam asc;

--Hoeveel verschillen de gehanteerde bestelprijzen
--met de huidige offerteprijzen bij dezelfde leverancier?
--Toon telkens bestelnummer, artikelcode en het positieve of negatieve verschil.
select b.bestelnr, o.art_code, r.bestelprijs - o.off_prijs as verschil
from bestellingen b
join bestelregels r on b.bestelnr = r.bestelnr
join offertes o on r.art_code = o.art_code
where b.lev_code = o.lev_code;

--In welke plaatsen wonen leveranciers die vaste planten aanbieden?
select unique(l.woonplaats)
from leveranciers l
join offertes o on o.lev_code = l.lev_code
join planten p on p.art_code = o.art_code
where p.soort = 'vast';

--Geef een overzicht van alle rode planten die kunnen geleverd worden
-- door leveranciers die niet in Olen gevestigd zijn.
--Toon hierbij de artikelcode, naam van de plant, soort,
--naam van de leverancier, gemeente.
--Sorteer op soort in dalende volgorde en daarbinnen in stijgende volgorde van plantennaam.
select p.art_code, p.plantennaam, p.soort, l.lev_naam, l.woonplaats
from leveranciers l
join offertes o on o.lev_code = l.lev_code
join planten p on p.art_code = o.art_code
where upper(p.kleur) like 'ROOD' and upper(l.woonplaats) not like 'OLEN'
order by soort desc, plantennaam asc;

--Zoek de bestellingen die een besteldatum hebben die gelijk is aan de leverdatum van één of meer andere bestellingen.

--Maak een lijst met plantnaam, hoogte en plantafstand voor de planten:
-- Linde, Gouden Regen en Kruisdistel.
-- Enkel de planten waarvoor de plantafstand is voorzien in de tabel Plantschema mogen getoond worden.
select *
from plantschema;

select *
from planten;

select p.plantennaam, p.hoogte, s.afstand
from planten p, plantschema s
where p.hoogte between s.hoogte1 and s.hoogte2
    and p.plantennaam in ('Linde','Gouden Regen', 'Kruisdistel');

--Stel dat we ervan uitgaan dat in de tabel Bestellingen enkel de bestellingen zijn opgenomen die nog niet zijn geleverd. Toon een overzicht waaruit blijkt welke bestellingen werden geplaatst en van welke de leveringsdatum werd overschreden. Toon bestelnummer, naam van de leverancier, en een kolom met de vermelding 'Te laat' ofwel geen vermelding naargelang wat toepasselijk is. Sorteer op bestelnummer.
--Toon een overzicht van de bomen en de plaats waar deze kunnen besteld worden (in Lisse of in een andere gemeente). Vermeld artikelcode, naam van de boom, leverancierscode en de vermelding Lisse of Andere gemeente naargelang het geval. Sorteer op naam.
--Toon alle planten die later beginnen te bloeien dan de Begonia. Geef naam en bloeibegin.
--Geef paren van planten die dezelfde kleur hebben.