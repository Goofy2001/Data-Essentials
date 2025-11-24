--oef 1
SELECT plantennaam, prijs, soort
FROM planten 
WHERE prijs <= (
    SELECT MIN(prijs) 
    FROM planten 
    WHERE soort = 'vast'
);
--oef 2
SELECT plantennaam, prijs
FROM PLANTEN
WHERE soort = 'boom'
AND prijs = (
    SELECT max(prijs)
    FROM planten
    WHERE soort = 'boom'
);
--oef 3
SELECT p.plantennaam, o.art_code, o.lev_code, o.off_prijs, p.prijs
FROM offertes o
JOIN planten p ON o.art_code = p.art_code
WHERE soort = 'vast' AND o.off_prijs = (
    SELECT MIN(o2.off_prijs) 
    FROM offertes o2 
    WHERE o.art_code = o2.art_code
);
--oef 4
---zonder subquery
SELECT DISTINCT l.*
FROM leveranciers l 
JOIN bestellingen b ON l.LEV_CODE = b.LEV_CODE
WHERE lev_datum < sysdate
ORDER BY lev_naam;
---met subquery
SELECT DISTINCT l.*
FROM leveranciers l 
WHERE lev_code IN (
    SELECT LEV_CODE
    FROM BESTELLINGEN
    WHERE lev_datum < sysdate
);
--oef 5
SELECT plantennaam
FROM planten
WHERE hoogte > (
    SELECT MAX(hoogte)
    FROM planten 
    WHERE soort = 'vast'
) AND prijs < (
    SELECT AVG(prijs)
    FROM planten
);
--oef 6
SELECT DISTINCT bestelnr 
FROM bestellingen b
WHERE b.lev_code IN (
    SELECT l.LEV_CODE
    FROM leveranciers l 
    WHERE l.korting >= 5
);
--oef 7
SELECT o.art_code, lev_naam, off_prijs 
FROM offertes o
JOIN leveranciers l ON o.lev_code = l.lev_code
WHERE o.off_prijs < (
    SELECT AVG(o2.off_prijs)
    FROM offertes o2 
    WHERE o.art_code = o2.art_code
);

