--oef 1
SELECT MAX(hoogte) hoogte
FROM planten
WHERE soort = 'boom';
--oef 2
SELECT SUM(bestelprijs * aantal) som
FROM bestelregels 
WHERE art_code = '123';
--oef 3
SELECT SUM(aantal)
FROM bestelregels;
--oef 4
SELECT COUNT(DISTINCT art_code)
FROM bestelregels;
--oef 5
SELECT AVG(hoogte), SUM(hoogte)/COUNT(hoogte)
FROM planten;
--oef 6
SELECT soort, COUNT(plantennaam) aantal, ROUND(AVG(prijs),2) "gemiddelde verkoopprijs"
FROM PLANTEN
GROUP BY soort;
--oef 7
SELECT kleur, MIN(prijs)
FROM planten 
WHERE soort = 'vast'
GROUP BY kleur
ORDER BY MIN(prijs);
--oef 8
SELECT p.plantennaam, o.art_code, MIN(off_prijs), MAX(off_prijs)
FROM OFFERTES o
JOIN planten p ON o.art_code = p.art_code
GROUP BY o.art_code, p.plantennaam
ORDER BY p.plantennaam;
--oef 9
