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
--oef 8
SELECT br.bestelnr, l.lev_naam, br.art_code, p.plantennaam, br.bestelprijs
FROM bestelregels br 
JOIN planten p ON br.art_code = p.art_code 
JOIN bestellingen b ON br.bestelnr = b.bestelnr 
JOIN leveranciers l ON b.lev_code = l.lev_code
WHERE bestelprijs > (
    SELECT MAX(off_prijs)
    FROM offertes o2
    WHERE br.art_code = o2.art_code 
);
--oef 9
SELECT p.plantennaam, p.art_code, br.bestelnr, br.aantal, br.bestelprijs, br.aantal * br.bestelprijs AS "Totale bedrag"
FROM planten p 
JOIN bestelregels br ON p.art_code = br.art_code
WHERE bestelnr IN (
    SELECT bestelnr 
    FROM bestellingen b1 
    JOIN leveranciers l ON b1.lev_code = l.lev_code
    WHERE l.lev_naam = 'Hovenier G.H.'
)
ORDER BY art_code;
--oef 10
SELECT plantennaam
FROM planten p 
WHERE p.art_code NOT IN (
    SELECT o.art_code 
    FROM offertes o
);
--oef 11
SELECT l.* 
FROM leveranciers l 
WHERE l.lev_code NOT IN (
    SELECT lev_code
    FROM bestellingen
);
--oef 12
SELECT l.*, p.plantennaam
FROM planten p
JOIN bestelregels br ON p.art_code = br.art_code 
JOIN bestellingen b ON br.bestelnr = b.bestelnr 
JOIN leveranciers l ON b.lev_code = l.lev_code
WHERE korting < (
    SELECT avg(korting)
    FROM leveranciers
)
ORDER BY l.lev_code;
--oef 13
SELECT DISTINCT lev_naam
FROM leveranciers l
JOIN bestellingen b ON l.lev_code = b.lev_code 
GROUP BY l.lev_naam 
HAVING COUNT(b.lev_code) >= 2;
--oef 14
SELECT DISTINCT br.art_code, p.plantennaam
FROM bestelregels br  
JOIN planten p ON p.art_code = br.art_code
JOIN bestellingen b ON br.bestelnr = b.bestelnr 
WHERE lev_code = 4 AND br.art_code IN (
    SELECT art_code
    FROM bestelregels br
    JOIN bestellingen b ON br.bestelnr = b.bestelnr 
    WHERE lev_code = 13
);
--oef 15
SELECT bestelnr, COUNT(DISTINCT art_code) "aantal artikels"
FROM bestelregels br 
GROUP BY bestelnr
HAVING COUNT(DISTINCT art_code) = (
    SELECT MIN(COUNT(DISTINCT art_code))
    FROM BESTELREGELS
    GROUP BY bestelnr
);
--oef 16
SELECT DISTINCT br.bestelnr
FROM bestelregels br 
WHERE bestelnr IN (
    SELECT br2.bestelnr
    FROM bestelregels br2
    GROUP BY br2.bestelnr 
    HAVING COUNT(DISTINCT br2.art_code) = (
        SELECT COUNT(DISTINCT p.plantennaam)
        FROM planten p
    )
);
--oef 17
SELECT DISTINCT bestelnr 
FROM bestellingen b1
WHERE NOT EXISTS (
    SELECT DISTINCT art_code
    FROM bestelregels br 
    WHERE bestelnr = 121 
        AND art_code NOT IN (
            SELECT art_code
            FROM bestelregels br2
            WHERE br2.bestelnr = b1.bestelnr
        )
);
