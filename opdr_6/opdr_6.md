# Sql basis

### Database gegevens aanpassen
Maak gebruik van het sql-bestand idscan.sql en voer hierop onderstaande opdrachten uit.
Theorie kun je vinden op: https://www.edutorial.nl/dbq/introductie/

### Queries winkelketen
* Welke medewerkers (id, voornaam, achternaam)zijn er in dienst van de winkelketen.
SELECT 
    id,
    firstname,
    lastname
FROM persons;


* Hoeveel medewerkers hebben dezelfde functie (jobtitle)
SELECT 
    jobtitle,
    COUNT(*) AS aantal_medewerkers
FROM persons
GROUP BY jobtitle;


* Hoeveel medewerkers zijn professor of ingenieur (title = prof, ir of ing)
SELECT 
    COUNT(*) AS aantal
FROM persons
WHERE title IN ('prof', 'ir', 'ing');


* Overzicht van medewerkers (id, voornaam, tussenvoegsel, achternaam) per gebouw (buildingname, street en buildingnumber)
SELECT 
    p.id,
    p.firstname,
    p.lastname,
    b.buildingname,
    b.street,
    b.buildingnumber
FROM scans s
JOIN persons p ON s.person_id = p.id
JOIN buildings b ON s.building_id = b.id
GROUP BY p.id, p.firstname, p.lastname, b.buildingname, b.street, b.buildingnumber;


* Overzicht van medewerkers (id, voornaam, tussenvoegsel, achternaam) die op een *  * bepaalde datum in gebouw met id 1 waren (buildingname, 

SELECT 
    p.id,
    p.firstname,
    p.lastname,
    b.buildingname
FROM scans s
JOIN persons p ON s.person_id = p.id
JOIN buildings b ON s.building_id = b.id
WHERE s.building_id = 1
  AND s.scandate = '2023-09-13'
  AND s.in_out = 'in';



Medewerkers die op diezelfde datum vergeten zijn uit te checken
SELECT 
    p.id,
    p.firstname,
    p.lastname,
    b.buildingname
FROM scans s
JOIN persons p ON s.person_id = p.id
JOIN buildings b ON s.building_id = b.id
WHERE s.scandate = '2023-09-13'
  AND s.in_out = 'in'
  AND NOT EXISTS (
        SELECT 1
        FROM scans s2
        WHERE s2.person_id = s.person_id
          AND s2.scandate = s.scandate
          AND s2.in_out = 'out'
    );





* Overzicht van het aantal medewerker per gebouw op 13 september 2023.
SELECT 
    b.buildingname,
    COUNT(DISTINCT s.person_id) AS aantal_medewerkers
FROM scans s
JOIN buildings b ON s.building_id = b.id
WHERE s.scandate = '2023-09-13'
GROUP BY b.buildingname;


* Overzicht van medewerkers en het aantal uur dat ze op 15 september 2023 hebben gewerkt.
SELECT 
    p.id,
    p.firstname,
    p.lastname,
    SUM(
        TIMESTAMPDIFF(
            HOUR,
            CONCAT(s_in.scandate, ' ', s_in.scantime),
            CONCAT(s_out.scandate, ' ', s_out.scantime)
        )
    ) AS uren_gewerkt
FROM scans s_in
JOIN scans s_out 
    ON s_in.person_id = s_out.person_id
   AND s_in.scandate = s_out.scandate
   AND s_in.in_out = 'in'
   AND s_out.in_out = 'out'
JOIN persons p ON p.id = s_in.person_id
WHERE s_in.scandate = '2023-09-15'
GROUP BY p.id, p.firstname, p.lastname;


* Medewerker van de maand! (De medewerker die het meeste uren heeft gemaakt van iedereen in de maand september)
SELECT 
    p.id,
    p.firstname,
    p.lastname,
    SUM(
        TIMESTAMPDIFF(
            HOUR,
            CONCAT(s_in.scandate, ' ', s_in.scantime),
            CONCAT(s_out.scandate, ' ', s_out.scantime)
        )
    ) AS totaal_uren
FROM scans s_in
JOIN scans s_out 
    ON s_in.person_id = s_out.person_id
   AND s_in.scandate = s_out.scandate
   AND s_in.in_out = 'in'
   AND s_out.in_out = 'out'
JOIN persons p ON p.id = s_in.person_id
WHERE MONTH(s_in.scandate) = 9
  AND YEAR(s_in.scandate) = 2023
GROUP BY p.id, p.firstname, p.lastname
ORDER BY totaal_uren DESC
LIMIT 1;

Amy 174 uur