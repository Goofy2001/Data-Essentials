SELECT LEV_NAAM
FROM LEVERANCIERS
ORDER BY LEV_NAAM DESC;

SELECT PLANTENNAAM
FROM PLANTEN
WHERE SOORT LIKE 'vast'
ORDER BY PLANTENNAAM DESC;

SELECT LEV_NAAM, WOONPLAATS
FROM LEVERANCIERS;

select lev_naam, woonplaats
from leveranciers;

SELECT LEV_NAAM || 'is gevestigd in ' || WOONPLAATS AS LEVERANCIERSINFORMATIE
FROM LEVERANCIERS;

SELECT lev_code, lev_naam
FROM LEVERANCIERS
WHERE lev_naam LIKE '%o%' OR lev_naam LIKE 'O%';

SELECT lev_naam
FROM LEVERANCIERS
WHERE WOONPLAATS LIKE 'Aalsmeer' AND korting >= 5;

SELECT plantennaam, prijs
FROM PLANTEN
WHERE prijs < 5;

SELECT art_code, plantennaam, SOORT
FROM PLANTEN
where soort IN ('vast', 'boom')
ORDER BY plantennaam;

SELECT *
FROM PLANTEN
WHERE hoogte BETWEEN 100 AND 200;

SELECT *
FROM PLANTEN
WHERE soort LIKE 'water'
ORDER BY hoogte;

SELECT DISTINCT woonplaats
FROM LEVERANCIERS
ORDER BY WOONPLAATS;

SELECT DISTINCT kleur
FROM PLANTEN;

SELECT plantennaam
FROM PLANTEN
WHERE kleur LIKE 'rood' AND BLOEIBEGIN IS NOT NULL;

SELECT *
FROM PLANTEN
WHERE prijs > 12.5 AND soort != 'boom';

SELECT art_code, plantennaam
FROM PLANTEN
WHERE plantennaam LIKE '__n%';

SELECT plantennaam, bloeibegin, bloeieinde, bloeieinde - bloeibegin AS bloeiperiode
FROM PLANTEN
ORDER BY bloeiperiode;

SELECT art_code, plantennaam
FROM PLANTEN
WHERE soort LIKE '%jarig';

SELECT *
FROM PLANTEN
WHERE SOORT != 'kruid' AND plantennaam LIKE '%kruid%';

SELECT *
FROM PLANTEN
WHERE SOORT != 'kruid' AND plantennaam LIKE '_____';

SELECT *
FROM PLANTEN
WHERE SOORT != 'kruid' AND plantennaam LIKE '%_____%';