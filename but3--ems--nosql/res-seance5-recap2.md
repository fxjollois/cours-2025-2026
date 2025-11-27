# Requêtage complexe

## Simple

#### Quels sont les gymnases de ”Villetaneuse” ou de ”Sarcelles” qui ont une surface de plus de 400 m2 ?

```
SELECT *
    FROM Gymnases
    WHERE Surface > 400
    AND Ville IN ("VILLETANEUSE", "SARCELLES");
```

#### Quels sont les sportifs (nom et prénom) qui pratiquent du hand ball ?

```
SELECT Nom, Prenom
    FROM (Sportifs NATURAL JOIN Jouer) NATURAL JOIN Sports
    WHERE Libelle = "Hand ball";
```

#### Dans quels gymnases et quels jours y a-t'il des séances de hand ball ?

Ici, il est aussi possible d'utiliser les jointures naturelles.

```
SELECT DISTINCT NomGymnase, Ville, LOWER(Jour)
    FROM Gymnases, Seances, Sports
    WHERE Gymnases.IdGymnase = Seances.IdGymnase
    AND Seances.Idsport = Sports.IdSport
    AND Libelle = "Hand ball";
```

#### Dans quels gymnases peut-on jouer au hockey le mercredi après 15H ?

```
SELECT NomGymnase, Ville, Horaire
    FROM Gymnases, Seances, Sports
    WHERE Gymnases.IdGymnase = Seances.IdGymnase
    AND Seances.Idsport = Sports.IdSport
    AND Libelle = "Hockey"
    AND LOWER(Jour) = "mercredi"
    AND Horaire > 15
    ORDER BY 2, 1, 3;
```

#### Quels gymnases proposent des séances de basket ball ou de volley ball ?

```
SELECT DISTINCT NomGymnase, Ville
    FROM Gymnases, Seances, Sports
    WHERE Gymnases.IdGymnase = Seances.IdGymnase
    AND Seances.Idsport = Sports.IdSport
    AND Libelle IN ("Basket ball", "Volley ball");
```

#### Quels sont les entraîneurs qui sont aussi joueurs ?

Sans jointure, avec des sous-requêtes.

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE IdSportif IN (SELECT IdSportif FROM Jouer)
    AND IdSportif IN (SELECT IdSportifEntraineur FROM Entrainer);
```

Avec jointure

```
SELECT DISTINCT Nom, Prenom
    FROM Sportifs, Jouer, Entrainer
    WHERE Sportifs.IdSportif = Jouer.IdSportif
    AND Sportifs.IdSportif = Entrainer.IdSportifEntraineur;
```

#### Quels sont les sportifs qui sont des conseillers ?

Avec une sous-requête

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE IdSportif IN (SELECT IdSportifConseiller
                            FROM Sportifs);
```

En faisant la jointure entre `Sportifs` et `Sportifs`. Dans ce cas, il faut utiliser le renommage absolument.

```
SELECT DISTINCT S1.Nom, S1.Prenom
    FROM Sportifs S1, Sportifs S2
    WHERE S1.IdSportif = S2.IdSportifConseiller;
```

#### Pour le sportif ”Kervadec” quel est le nom de son conseiller ?

```
SELECT Nom, Prenom
    FROM Sportifs 
    WHERE IdSportif = (SELECT IdSportifConseiller
                            FROM Sportifs
                            WHERE Nom = "KERVADEC");
```

#### Quels entraineurs entrainent du hand ball et du basket ball ?

Entraîneur de Hand **ou** de Basket 

```
SELECT DISTINCT Nom, Prenom
    FROM Sportifs, Entrainer, Sports 
    WHERE Sportifs.IdSportif = Entrainer.IdSportifEntraineur
    AND Entrainer.IdSport = Sports.IdSport
    AND Libelle IN ("Hand ball", "Basket ball");
```

Entraîneur de Hand **et** de Basket 

```
SELECT DISTINCT Nom, Prenom
    FROM Sportifs
    WHERE IdSportif IN
        (SELECT IdSportifEntraineur
            FROM Entrainer NATURAL JOIN Sports 
            WHERE Libelle = "Hand ball")
    AND IdSportif IN
        (SELECT IdSportifEntraineur
            FROM Entrainer NATURAL JOIN Sports 
            WHERE Libelle = "Basket ball");
```

#### Quelle est la moyenne d’âge des sportives qui pratiquent du basket ball ?

```
SELECT AVG(Age)
    FROM Sportifs, Jouer, Sports 
    WHERE Sportifs.IdSportif = Jouer.IdSportif
    AND Jouer.IdSport = Sports.IdSport
    AND Libelle = "Basket ball"
    AND UPPER(Sexe) = "F";
```

## Moins simple

#### Quels sportifs (nom et prénom) ne pratiquent aucun sport ?

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE IdSportif NOT IN (SELECT IdSportif FROM Jouer);
```

#### Pour chaque sportif donner le nombre de sports qu'il arbitre

```
SELECT Nom, Prenom, COUNT(*) as "Nb Sports arbitrés"
    FROM Sportifs NATURAL JOIN Arbitrer
    GROUP BY Nom, Prenom;
```

#### Quels sont les gymnases ayant plus de 15 séances le mercredi ?

```
SELECT NomGymnase, Ville
    FROM Gymnases NATURAL JOIN Seances
    WHERE LOWER(Jour) = "mercredi"
    GROUP BY NomGymnase, Ville
    HAVING COUNT(*) >= 15;
```

#### Dans quels gymnases et quels jours y a-t’il au moins 4 séances de volley ball dans la journée

```
SELECT NomGymnase, Ville, LOWER(Jour)
    FROM (Gymnases NATURAL JOIN Seances) NATURAL JOIN Sports
    WHERE Libelle = "Volley ball"
    GROUP BY NomGymnase, Ville, LOWER(Jour)
    HAVING COUNT(*) >= 4;
```

#### Pour chaque entraîneur de hand ball quel est le nombre de séances journalières qu’il assure ?

```
SELECT Nom, Prenom, LOWER(Jour),
        COUNT() AS "Nb sénces"
    FROM Sportifs, Seances, Sports
    WHERE Sportifs.IdSportif = Seances.IdSportifEntraineur
    AND Seances.IdSport = Sports.IdSport
    GROUP BY Nom, Prenom, LOWER(Jour);
```

#### Pour chaque gymnase de Montmorency : quel est le nombre de séances journalières de chaque sport proposé ?

```
SELECT NomGymnase, LOWER(Jour), Libelle, COUNT(*)
    FROM Gymnases, Seances, Sports
    WHERE Gymnases.IdGymnase = Seances.IdGymnase
    AND Seances.IdSport = Sports.Idsport
    AND Ville = "MONTMORENCY"
    GROUP BY NomGymnase, LOWER(Jour), Libelle;
```

#### Quel est le sport pour lequel les joueurs sont les plus jeunes ?

```
SELECT Libelle, ROUND(AVG(Age), 2)
    FROM Sports, Jouer, Sportifs
    WHERE Sports.IdSport = Jouer.IdSport
    AND Jouer.IdSportif = Sportifs.IdSportif
    GROUP BY Libelle
    ORDER BY 1
    LIMIT 1;
```

#### Quels gymnases n'ont pas de séances le dimanche ?

```
SELECT NomGymnase, Ville
    FROM Gymnases
    WHERE IdGymnase NOT IN (SELECT IdGymnase
                                FROM Seances
                                WHERE LOWER(Jour) = "dimanche");
```


## Complexe

#### Pour chaque gymnase de Stains donner par jour d’ouverture les horaires des premières et dernières séances

```
SELECT LOWER(Jour), MIN(Horaire), MAX(Horaire)
    FROM Gymnases NATURAL JOIN Seances
    WHERE Ville = "STAINS"
    GROUP BY LOWER(Jour);
```

#### Quels entraîneurs n’entraînent que du hand ball et/ou du basket ball, mais aucun autre sporrt ?

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE IdSportif IN 
        (SELECT IdSportifEntraineur
            FROM Entrainer NATURAL JOIN Sports
            WHERE  Libelle IN ("Hand ball", "Basket ball"))
    AND IdSportif NOT IN 
        (SELECT IdSportifEntraineur
            FROM Entrainer NATURAL JOIN Sports
            WHERE  Libelle NOT IN ("Hand ball", "Basket ball"));
```

#### Dans une même requête, donner pour chaque sportif (nom et prénom)

- le nombre de sports qu'il joue
- le nombre de sports qu'il arbitre
- le nombre de sports qu'il entraîne
- on doit avoir tous les sportifs, avec des 0 si besoin

```
SELECT Nom, Prenom, 
        CASE WHEN NbJ IS NULL THEN 0 ELSE NbJ END as "Joués", 
        CASE WHEN NbA IS NULL THEN 0 ELSE NbA END as "Arbitrés", 
        CASE WHEN NbE IS NULL THEN 0 ELSE NbE END as "Entrainés"
    FROM ((Sportifs S 
            LEFT OUTER JOIN 
                (SELECT IdSportif, COUNT(*) AS NbJ
                    FROM Jouer
                    GROUP BY IdSportif) J
                ON S.idSportif = J.IdSportif)
            LEFT OUTER JOIN 
                (SELECT IdSportif, COUNT(*) AS NbA
                    FROM Arbitrer
                    GROUP BY IdSportif) A
                ON S.idSportif = A.IdSportif)
            LEFT OUTER JOIN 
                (SELECT IdSportifEntraineur, COUNT(*) AS NbE
                    FROM Entrainer
                    GROUP BY IdSportifEntraineur) E
                ON S.idSportif = E.IdSportifEntraineur;
```

#### Quels sont les couples de sportifs (Identifiant et nom et prénom de chaque sportif) ayant le même âge et le même conseiller ?

```
SELECT S1.Nom, S1.Prenom, S2.Nom, S2.Prenom
    FROM Sportifs S1, Sportifs S2
    WHERE S1.IdSportifConseiller = S2.IdSportifConseiller
    AND S1.Age = S2.Age
    AND S1.IdSportif < S2.IdSportif;
```

#### Quels sont les plus grands gymnases de chaque ville ?

```
SELECT Ville, NomGymnase, Surface
    FROM Gymnases G
    WHERE NOT EXISTS
        (SELECT *
            FROM Gymnases
            WHERE Ville = G.Ville
            AND Surface > G.Surface)
    ORDER BY 1, 2;
```

#### Lister pour chaque gymnase et pour chaque jour, l'horaire de fin de la dernière séance

```
SELECT NomGymnase, Ville, LOWER(Jour), 
        REPLACE(REPLACE(MAX(Fin), ".5", "h3"), ".0", "h0") || 0 as Fin
    FROM Gymnases NATURAL JOIN
            (SELECT *,
                    CAST(ROUND(Horaire) * 60 + (Horaire * 10) % 10 * 10 + Duree as FLOAT) / 60 as Fin
                FROM Seances)
    GROUP BY NomGymnase, Ville
    ORDER BY 2, 1;
```
