# Sql basis

### Database 
Maak gebruik van het sql-bestand reisbureau.sql en voer hierop onderstaande opdrachten uit.
Theorie kun je vinden op: https://www.edutorial.nl/dbq/introductie/

### Queries reisbureau
* Geef de namen van de klanten die in Rotterdam wonen
Wubben
Ruigrok
Pedersen
Jansen

* Geef de namen van de klanten die geen reis geboekt hebben.
Ruigrok
Brigman
Brouwer

* Hoeveel klanten komen er niet uit Rotterdam
13
SELECT COUNT(*) AS AantalNietRotterdam FROM klanten WHERE Plaats <> 'Rotterdam';


* Hoeveel reizen hebben als bestemming Afrika?
7
SELECT COUNT(*) AS AantalAfrika FROM bestemmingen WHERE Werelddeel = 'Afrika';


* Hoeveel moeten de klanten, die naar Azië gaan, in totaal betalen?
SELECT SUM(b.`Betaald bedrag`) AS TotaalAzie
FROM boekingen b
JOIN reizen r 
    ON b.Reisnummer = r.Reisnummer
JOIN bestemmingen d
    ON r.Bestemmingcode = d.Bestemmingcode
WHERE d.Werelddeel = 'Azië';
nul

* Geef de namen van de klanten die met kinderen op reis gaan.
SELECT k.Naam
FROM klanten k
JOIN boekingen b ON k.Klantnummer = b.Klantnummer
WHERE b.`Aantal kinderen` > 0;

Ramaker
Jansen
Slootweg
Wubben
Baggerman
Jansen
Jansen

* Hoeveel verschillende reizen kun je boeken bij dit reisbureau?
SELECT COUNT(*) AS AantalReizen
FROM reizen;
28

* Geef de naam en postcode van de klanten die in een postcode gebied wonen dat begint met een 9.
SELECT Naam, Postcode
FROM klanten
WHERE Postcode LIKE '9%';

Pieterman
9405 HC
Brouwer
9700 AS

* Groepeer de klanten op woonplaats. Geef de woonplaats en het aantal klanten per woonplaats.
SELECT Plaats, COUNT(*) AS AantalKlanten FROM klanten GROUP BY Plaats;



Abbenbroek
1
Assen
1
Dalfsen
1
Ermelo
1
Fijnaart
1
Gameren
1
Groningen
1
Rotterdam
4
Schiedam
2
Spijkenisse
1
Ulft
1
Vlaardingen
2
* Geef naam en datum van de klanten die voor de maand April een reis hebbben geboekt.

SELECT k.Naam, b.Boekdatum FROM klanten k JOIN boekingen b ON k.Klantnummer = b.Klantnummer WHERE MONTH(b.Boekdatum) = 4;


Pedersen
1999-04-02 00:00:00
Wubben
1999-04-03 00:00:00
Antes
1999-04-04 00:00:00
Baggerman
1999-04-05 00:00:00
Jansen
1999-04-05 00:00:00
Jansen
1999-04-05 00:00:00
Jansen
1999-04-06 00:00:00
Diepenhorst
1999-04-06 00:00:00


* Geef de namen van klanten, het werelddeel van de bestemming en het aantal dagen van de reis voor boekingen van minimaal 15 dagen.

SELECT k.Naam, d.Werelddeel, r.`Aantal dagen` FROM boekingen b JOIN klanten k ON b.Klantnummer = k.Klantnummer JOIN reizen r ON b.Reisnummer = r.Reisnummer JOIN bestemmingen d ON r.Bestemmingcode = d.Bestemmingcode WHERE r.`Aantal dagen` >= 15;



Brugman
Azie
23
Pieterman
Afrika
23
Jansen
Noord-Amerika
23
Pieterman
Azie
22
Pedersen
Zuid-Amerika
28
Antes
Azie
19
Jansen
Azie
22
Diepenhorst
Azie
22
