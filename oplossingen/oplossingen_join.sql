-- Oefening 1
-- SQL92-notatie
SELECT bestelnr, lev_naam, lev_datum
FROM bestellingen b 
JOIN leveranciers l ON (b.lev_code = l.lev_code)
ORDER BY lev_datum, bestelnr;

-- SQL1 notatie
SELECT bestelnr, lev_naam, lev_datum
FROM bestellingen b, leveranciers l 
WHERE b.lev_code = l.lev_code
ORDER BY lev_datum, bestelnr;


-- Oefening 2
SELECT plantennaam, 'vaste plant' AS soort
FROM planten
WHERE soort = 'vast'
UNION
SELECT plantennaam, 'waterplant'
FROM planten
WHERE soort = 'water';


-- Oefening 3
---- SQL92-notatie
SELECT p.plantennaam, b.bestelprijs
FROM offertes o 
JOIN planten p ON (p.art_code = o.art_code) 
JOIN bestelregels b ON (b.art_code = p.art_code)
WHERE o.off_prijs < b.bestelprijs;

---- SQL1-notatie
SELECT p.plantennaam, b.bestelprijs
FROM offertes o, planten p, bestelregels b
WHERE p.art_code = o.art_code
AND b.art_code = p.art_code
AND o.off_prijs < b.bestelprijs;

-- Oefening 4
---- SQL92-notatie
SELECT p.art_code, p.plantennaam, l.lev_naam, o.lev_tijd, o.off_prijs
FROM planten p 
JOIN offertes o ON (p.art_code = o.art_code) 
JOIN leveranciers l ON (o.lev_code = l.lev_code)
ORDER BY p.plantennaam;

---- SQL1-notatie
SELECT p.art_code, p.plantennaam, l.lev_naam, o.lev_tijd, o.off_prijs
FROM planten p, offertes o, leveranciers l
WHERE p.art_code = o.art_code
AND o.lev_code = l.lev_code
ORDER BY p.plantennaam;


-- Oefening 5
---- met dezelfde leveranciers
SELECT r.bestelnr, r.art_code, r.bestelprijs - o.off_prijs
FROM bestellingen b
JOIN bestelregels r ON (b.bestelnr = r.bestelnr)
JOIN offertes o ON (o.art_code = r.art_code)
WHERE b.lev_code = o.lev_code;

---- alle verschillen
SELECT r.bestelnr, r.art_code, r.bestelprijs - o.off_prijs
FROM bestellingen b
JOIN bestelregels r ON (b.bestelnr = r.bestelnr)
JOIN offertes o ON (o.art_code = r.art_code);


-- Oefening 6
---- SQL92-notatie
SELECT DISTINCT l.woonplaats
FROM offertes o
JOIN leveranciers l ON (o.lev_code = l.lev_code)
JOIN planten p ON (p.art_code = o.art_code)
WHERE p.soort = 'vast';

---- SQL1-notatie
SELECT DISTINCT l.woonplaats
FROM offertes o, leveranciers l, planten p
WHERE o.lev_code = l.lev_code
AND p.art_code = o.art_code
AND p.soort = 'vast';


-- Oefening 7
SELECT p.art_code, p.plantennaam, p.soort, l.lev_naam, l.woonplaats
FROM planten p
JOIN offertes o ON (o.art_code = p.art_code)
JOIN leveranciers l ON (l.lev_code = o.lev_code)
WHERE p.kleur = 'rood' AND l.woonplaats != 'Olen'
ORDER BY p.soort DESC, p.plantennaam ASC;


-- Oefening 8
SELECT b1.bestelnr
FROM bestellingen b1
JOIN bestellingen b2 ON (b1.besteldatum = b2.lev_datum)
WHERE b1.bestelnr != b2.bestelnr;

SELECT b1.bestelnr
FROM bestellingen b1 , bestellingen b2
WHERE b1.besteldatum = b2.lev_datum
AND b1.bestelnr != b2.bestelnr;

-- Oefening 9
SELECT p.plantennaam, p.hoogte, s.afstand
FROM planten p , plantschema s
WHERE p.hoogte BETWEEN s.hoogte1 AND s.hoogte2
AND p.plantennaam IN ('Linde', 'Gouden Regen', 'Kruisdistel');


-- Oefening 10
---- je kan de huidige datum opvragen d.m.v. SYSDATE
    SELECT b.bestelnr, l.lev_naam, b.lev_datum, 'Te laat'
    FROM bestellingen b
    JOIN leveranciers l ON (l.lev_code = b.lev_code)
    WHERE lev_datum < SYSDATE
UNION
    SELECT b.bestelnr, l.lev_naam, b.lev_datum, ' '
    FROM bestellingen b
    JOIN leveranciers l ON (l.lev_code = b.lev_code)
    WHERE lev_datum >= SYSDATE
       OR lev_datum IS NULL
ORDER BY bestelnr;


-- Oefening 11
    SELECT p.plantennaam, l.lev_code, 'Lisse' gemeente
    FROM planten p
    JOIN offertes o ON (o.art_code = p.art_code)
    JOIN leveranciers l ON (l.lev_code = o.lev_code)
    WHERE p.soort = 'boom' AND l.woonplaats = 'Lisse'
UNION
    SELECT p.plantennaam, l.lev_code, 'Andere gemeente'
    FROM planten p 
    JOIN offertes o ON (o.art_code = p.art_code)
    JOIN leveranciers l ON (l.lev_code = o.lev_code)
    WHERE p.soort = 'boom' AND l.woonplaats != 'Lisse'
ORDER BY plantennaam;

--Oefening 12
SELECT p2.plantennaam, p2.bloeibegin
FROM planten p1, planten p2
WHERE p2.bloeibegin > p1.bloeibegin
AND p1.plantennaam = 'Begonia';

--Oefening 13
SELECT p1.plantennaam, p2.plantennaam, p1.kleur
FROM planten p1, planten p2
WHERE p1.kleur = p2.kleur
AND p1.plantennaam <p2.plantennaam;