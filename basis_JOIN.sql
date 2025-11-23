--- Gebruik sql92, dit is moderner
--oef 1
SELECT b.BESTELNR, b.LEV_DATUM, l.LEV_NAAM
FROM bestellingen b
JOIN leveranciers l ON b.lev_code = l.lev_code
ORDER BY b.LEV_DATUM;
--oef 2
SELECT plantennaam, 'vaste plant' AS soort
FROM PLANTEN
WHERE soort = 'vast'
UNION
SELECT PLANTENNAAM, 'waterplant' AS SOORT
FROM PLANTEN
WHERE soort = 'water';
--oef 3
SELECT p.plantennaam, br.bestelprijs
FROM planten p
JOIN OFFERTES o ON p.ART_CODE = o.ART_CODE
JOIN bestelregels br ON p.ART_CODE = br.ART_CODE
WHERE o.OFF_PRIJS < br.BESTELPRIJS;
--oef 4
SELECT p.art_code, p.plantennaam, l.lev_naam, o.lev_tijd, o.off_prijs
FROM planten p
JOIN offertes o ON o.art_code = p.ART_CODE
JOIN leveranciers l ON l.LEV_CODE = o.LEV_CODE
ORDER BY plantennaam;
--oef 5
SELECT br.bestelnr, o.art_code, br.BESTELPRIJS - o.OFF_PRIJS AS verschil
FROM bestelregels br
JOIN offertes o ON br.art_code = o.art_code;
--oef 6
SELECT DISTINCT l.woonplaats
FROM leveranciers l
JOIN offertes o ON l.lev_code = o.lev_code
JOIN planten p ON o.art_code = p.art_code
WHERE soort = 'vast';
--oef 7
SELECT p.art_code, p.plantennaam, p.soort, l.lev_naam, l.woonplaats
FROM planten p 
JOIN offertes o ON p.ART_CODE = o.ART_CODE
JOIN LEVERANCIERS l ON o.LEV_CODE = l.LEV_CODE
WHERE l.woonplaats != 'Olen' AND p.kleur = 'rood'
ORDER BY soort DESC, plantennaam ASC;
--oef 8
SELECT b1.bestelnr
FROM BESTELLINGEN b1
JOIN BESTELLINGEN b2 ON b1.besteldatum = b2.lev_datum;
--oef 9
SELECT p.plantennaam, p.hoogte, ps.afstand
FROM planten p 
JOIN plantschema ps ON p.hoogte BETWEEN ps.hoogte1 AND ps.hoogte2
WHERE P.plantennaam IN ('Linde','Gouden Regen','Kruisdistel');
--oef 10
SELECT b.bestelnr, l.LEV_NAAM, b.lev_datum, 'Te laat' 
FROM bestellingen b 
JOIN leveranciers l ON b.lev_code = l.lev_code 
WHERE b.lev_datum < sysdate
UNION
SELECT b.bestelnr, l.LEV_NAAM, b.lev_datum, '' 
FROM bestellingen b 
JOIN leveranciers l ON b.lev_code = l.lev_code 
WHERE b.lev_datum >= sysdate OR b.lev_datum IS NULL 
ORDER BY bestelnr;
--oef 11
SELECT p.art_code, p.plantennaam, l.lev_code, 'Lisse' gemeente
FROM planten p 
JOIN offertes o ON p.art_code = o.art_code
JOIN leveranciers l ON o.lev_code = l.lev_code
WHERE woonplaats = 'Lisse' AND p.soort = 'boom'
UNION
SELECT p.art_code, p.plantennaam, l.lev_code, 'Andere Gemeente'
FROM planten p 
JOIN offertes o ON p.art_code = o.art_code
JOIN leveranciers l ON o.lev_code = l.lev_code
WHERE woonplaats != 'Lisse' AND p.soort = 'boom';
--oef 12
SELECT p2.plantennaam, p2.bloeibegin
FROM PLANTEN p1, planten p2
WHERE p2.bloeibegin > p1.bloeibegin 
AND p1.plantennaam = 'Begonia'
ORDER BY p2.bloeibegin;
--oef 13
SELECT p1.plantennaam, p2.plantennaam, p1.kleur
FROM planten p1
JOIN planten p2 ON p1.kleur = p2.KLEUR
WHERE p1.plantennaam != p2.plantennaam
AND p1.plantennaam < p2.plantennaam;