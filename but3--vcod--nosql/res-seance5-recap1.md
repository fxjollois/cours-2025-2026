# Requêtage de base

## Requêtage simple

#### Simple

##### Lister le contenu de la table Seances

```
SELECT *
    FROM Seances;
```

##### Lister les sportifs par ordre croissant d'âge

```
SELECT *
    FROM Sportifs
    ORDER BY Age;
```

##### Lister les 5 gymnases les plus grands

```
SELECT *
    FROM Gymnases
    ORDER BY Surface DESC
    LIMIT 5;
```

#### Restriction

##### Lister les sportifs (nom et prénom) agés strictement de plus de 30 ans

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE AGE > 30;
```

##### Lister les gymnases de la ville de "Stains"

```
SELECT *
    FROM Gymnases
    WHERE UPPER(Ville) = "STAINS";
```

##### Lister les sportifs n'ayant pas de conseiller

```
SELECT Nom, Prenom
    FROM Sportifs
    WHERE IdSportifConseiller IS NULL;
```

#### Projection

##### Lister les sports pratiqués (uniquement le libellé de chaque sport)

```
SELECT Libelle
    FROM Sports;
```

##### Lister les différentes valeurs de Sexe possible

```
SELECT DISTINCT Sexe
    FROM Sportifs;
```

<hr>

## Calculs et fonctions

#### Calculs arithmétiques

##### Afficher en heure la durée de chaque séance (stockée en minute dans la table)

```
SELECT DISTINCT Duree,
        Duree / 60.0 AS "Durée heure"
    FROM Seances
    ORDER BY 1;
```

```
SELECT DISTINCT Duree,
        Duree / 60.0 AS "Durée heure",
        (Duree / 60) || "h" || 
            CASE
                WHEN (Duree % 60) < 10 THEN "0" || (Duree % 60)
                ELSE Duree % 60
            END AS "Durée heure mieux"
    FROM Seances
    ORDER BY 1;
```

##### Convertir la surface (en m2 dans la table) en pieds carrés (voir la définition) des gymnases de "Pierrefitte"

```
SELECT NomGymnase, Surface,
        ROUND(Surface / 0.09290304) AS "Surface pieds²"
    FROM Gymnases;
```

#### Fonctions sur chaînes de caractères

##### Concaténer le nom des sportifs avec la première lettre du prénom suivie d'un point, le tout en minuscules (par exemple "jollois f.")

```
SELECT Nom, Prenom,
        LOWER(Nom || " " || SUBSTR(Prenom, 1, 1) || ".")
    FROM Sportifs;
```

##### Afficher les gymnases situées sur une place (cf Adresse)

```
SELECT *
    FROM Gymnases
    WHERE INSTR(LOWER(Adresse), "place") > 0;
```

#### Fonctions sur les dates

##### Donner la date du jour

```
SELECT DATE("now") AS "Aujourd'hui",
    STRFTIME("%d/%m/%Y", "now") AS "Plus classique"
```

##### Donner le jour de la semaine du 1er janvier de l'année de naissance de chaque sportif

```
SELECT Age,
        2017 - Age AS "Année de naissance",
        (2017 - Age) || "-01-01" AS "1er janvier année naissance (char)",
        DATE((2017 - Age) || "-01-01") AS "1er janvier année naissance (date)",
        STRFTIME("%w", DATE((2017 - Age) || "-01-01")) AS "Jour semaine du 1er janvier année naissance"
    FROM Sportifs;
```
Plus simple

```
SELECT Age, 
        STRFTIME("%w", DATE("now"), "-" || Age || " year", "start of year") AS "Jour 1er janvier année naissance"
    FROM Sportifs;
```

#### Traitement conditionnel

##### Afficher une nouvelle variable nommée TitreCourtoisie, qui prendra "M." pour les hommes et "Mme" pour les femmes

```
SELECT Nom, Prenom, Sexe,
        CASE UPPER(Sexe)
            WHEN "M" THEN "M."
            WHEN "F" THEN "Mme"
        END AS TitreCourtoisie
    FROM Sportifs;
```

##### Afficher une nouvelle variable TypeGymnase, qui prendra comme valeur "petit" si la surface est inférieure strictement à 400 m2, "moyen" si elle est entre 400 et 550 m2, et "grand" si elle est strictement supérieure à 550 m2

```
SELECT *,
        CASE 
            WHEN Surface < 400 THEN "petit"
            WHEN Surface < 550 THEN "moyen"
            ELSE "grand"
        END AS TypeGymnase
    FROM Gymnases;
```

<hr>

## Agrégats

#### Dénombrements

##### Compter le nombre de sportifs

```
SELECT COUNT(*)
    FROM Sportifs;
```

##### Compter le nombre de sportifs ayant un conseiller

```
SELECT COUNT(*)
    FROM Sportifs
    WHERE IdSportifConseiller IS NOT NULL;
```

##### Compter le nombre de villes distinctes

```
SELECT COUNT(DISTINCT Ville)
    FROM Gymnases;
```

#### Calculs statistiques simples

##### Calculer la surface moyenne des gymnases

```
SELECT ROUND(AVG(Surface), 2)
    FROM Gymnases;
```

##### Calculer l'âge moyen, l'âge minimum et l'âge maximum des sportifs

```
SELECT ROUND(AVG(Age), 1) AS "Age moyen",
        MIN(Age) AS "Age minimum",
        MAX(Age) AS "Age maximum"
    FROM Sportifs;
```

#### Agrégats selon attribut(s)

##### Calculer le nombre de sportifs par sexe, ainsi que l'âge moyen

```
SELECT UPPER(Sexe) AS Sexe,
        COUNT(*) AS "Nb Sportifs",
        ROUND(AVG(Age), 1) AS "Age moyen"
    FROM Sportifs
    GROUP BY UPPER(Sexe);
```

##### Calculer pour chaque ville la surface du plus petit et du plus grand gymnase

```
SELECT Ville,
        MIN(Surface) AS "Surface mini",
        MAX(surface) AS "Surface maxi"
    FROM Gymnases
    GROUP BY Ville;
```

#### Restriction sur agrégats

##### Lister les villes ayant plus de 5 gymnases, dans l'ordre décroissant du nombre de gymnases

```
SELECT Ville, COUNT(*) AS "Nb Gymnases"
    FROM Gymnases
    GROUP BY Ville
    HAVING COUNT(*) >= 5
    ORDER BY 2 DESC;
```

<hr>

## Exercices complémentaires


##### Lister les 5 sportifs masculins les plus âgés

```
SELECT *
    FROM Sportifs
    ORDER BY Age DESC
    LIMIT 5;
```

##### Lister les villes dans lesquelles il y a des gymnases d'au moins 500 m2

```
SELECT DISTINCT Ville
    FROM Gymnases
    WHERE Surface > 500;
```

##### Concaténer le nom des sportifs avec la première lettre du prénom suivie d'un point, en tenant compte des prénoms composés, suivi de l'année de naissance (par exemple "JOLLOIS F.-X. - 1977")

```
SELECT Nom, Prenom,
        UPPER(Nom || " " || SUBSTR(Prenom, 1, 1) ||
            CASE
                WHEN INSTR(Prenom, "-") THEN ".-" ||SUBSTR(Prenom, INSTR(Prenom, "-") + 1, 1)
                WHEN INSTR(Prenom, " ") THEN ".-" ||SUBSTR(Prenom, INSTR(Prenom, " ") + 1, 1)
                ELSE ""
            END || ". - " || (2017 - Age)) AS "NomPrenom"
    FROM Sportifs;
```

##### Lister les identifiants de sports ayant le plus de joueur

```
SELECT IdSport, COUNT(*) AS "Nb Joueurs"
    FROM Jouer
    GROUP BY IdSport
    ORDER BY 2 DESC;
```

##### Donner le nombre de sportifs pour la répartition "junior" (de 20 à 24 ans), "senior 1" (de 25 à 30), "senior 2" (de 31 à 45)

```
SELECT CASE
            WHEN Age <= 24 THEN "junior"
            WHEN Age <= 30 THEN "senior 1"
            WHEN Age <= 45 THEN "senior 2"
            ELSE "autre"
        END AS "Catégorie",
        COUNT(*) AS "Nb Sportifs"
    FROM Sportifs
    GROUP BY "Catégorie";
```

##### Sachant des les heures de début de séances sont stockées en réel, avec 19.3 pour "19h30" par exemple, calculer l'heure de fin de chaque séance

```
SELECT Horaire, Duree,
        CAST(FLOOR((ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) / 60) AS INTEGER) ||
        "h" ||
        CASE
            WHEN (ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) % 60 = 0 THEN "0" || CAST(ROUND((ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) % 60) AS INTEGER) 
            ELSE CAST(ROUND((ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) % 60) AS INTEGER)
        END AS Fin,
        ROUND(Horaire) AS "Partie heure de Horaire",
        (Horaire * 100) % 100 AS "Partie minute de Horaire",
        ROUND(Horaire) * 60 + (Horaire * 100) % 100 "Horaire en minutes",
        ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree "Fin en minutes",
        FLOOR((ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) / 60) AS "Partie heure de Fin", 
        ROUND((ROUND(Horaire) * 60 + (Horaire * 100) % 100 + Duree) % 60) AS "Partie minute de Fin"
    FROM Seances;
```
