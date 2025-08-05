# Bases de données NoSQL

> Si vous souhaitez utiliser *Mongo* sur votre ordinateur, vous devez les instructions présentées dans [ce fichier](../info-mongo).

<!--
Planning prévu :
- Groupe 31 -> 
    - 02/11 : matin projet (travail SQL) car tempête + après-midi cours (Intro + Séance 2)
    - 03/11 : matin cours (séance 3)
    -
    - 16/11 : matin cours (suite séance 3 - séance 4 récap) + après-midi cours (suite séance 4)
    - 17/11 : matin cours SAE (séance 3)
    - 30/11 : matin cours SAE (-> évaluation NoSQL) + après-midi cours SAE (suite séance 3)
    - 14/12 : après-midi projet (application sur le sujet de la SAE)
    - 11/01 : matin cours (-> SAE suivi - commune avec 32) + après-midi projet (application sur le sujet de la SAE)
    - 12/01 : matin cours (Neo4j base)
    - 25/01 : journée projet (finalisation SAE)
- Groupe 32 ->
    - 21/09 : Projet toute la journée (suite maladie - travail SQL)
    - 19/10 : matin rien (car pb de train) et cours l'après-midi (Intro + Séance 2)
    - 20/10 : matin cours (Séance 3) + projet l'après-midi (réflexion passage SQL->NoSQL)
    - 03/11 : matin cours SAE (séance 3) + projet l'après-midi (suite du travail à faire du matin)
    -
    - 17/11 : projet le matin (application sur le sujet de la SAE)
    - 14/12 : matin cours SAE (-> séance 4) + après-midi cours NoSQL (évaluation NoSQL)
    - 11/01 : matin projet (-> SAE suivi - commune avec 31) + après-midi cours (Neo4j base)
    - 22/01 : matin projet (finalisation SAE)
%
A ORGANISER COMME SUIT :
- Séance 1 (3,5h) : NoSQL - Mongo
- Séance 2 (3,5h) : NoSQL - Mongo
- Séance 3 (3,5h) : NoSQL - Mongo
- Séance 4 (3,5h) : NoSQL - Mongo + évaluation
- Séance 5 (3h) : Migration
- Séance 6 (3h) : Migration
- Séance 7 (3h) : Migration
- Séance 8 (3,5h) : NoSQL - Neo4j
- Séance 9 (3,5h) : NoSQL - Néo4j + évaluation
-->

## Partie RESSOURCE : *Bases de données NoSQL*

- [Introduction au NoSQL](https://docs.google.com/presentation/d/e/2PACX-1vRi9gT1ZSwXgaDcRYQ4q-srOtJYtdT6hOlo0E6cYt5E9Vk11LJYusYaxa0FNWM95pyO9Jg9SZc9faWJ/pub?start=false&loop=false&delayms=3000)
- [Premiers pas avec Mongo](res-seance2)
- [Agrégats et plus encore](res-seance3)
- [Récapitulatif](res-seance4)

<!--
- Séance 1 : 
    - [Introduction au NoSQL]()
    - [De SQL vers NoSQL, et vice et versa]()
- Séance 2 :
    - [Introduction à MongoDB]()
    - [Premières interrogations avec Mongo]() : (count, distinct, ...)
- Séance 3 : 
    - [Interrogation avancée avec Mongo]() : (aggregate)
    - [Evaluation 1]()
- Séance 4 :
    - [Introduction à Neo4j]()
    - [Premières interrogations avec Neo4j]()
- Séance 5 : 
    - [Interrogation avancée avec Neo4j]()
    - [Evaluation 2]()
- Séance 6 :
    - [A partir de Python]()
    - [Evaluation 3]()
-->

<!--
- NoSQL :
    - MongoDB sûr (+ Neo4J ?)
    - 6 séances de 3,5 heures de TP :
        - CM sur le NoSQL en général (sur 3 heures ??)
        - TD de réflexion sur migration entre les deux (?)
        - CM sur MongoDB (2h) + évaluation (1h)
        - Interrogation d'une base directement dans MongoDB (count, distinct, find)
        - Interrogation (aggregate)
        - A partir de python
        - Manipulation complexe (import et export de données) (2h) + évaluation (1h)
-->


## Partie SAE : *Migration de données vers ou depuis un environnement NoSQL*

- [Séance 1 - Présentation et premières requêtes](sae-seance1)

- [Séance 2 - Réflexion sur le passage du modéle relationnel à un modèle à base de documents](sae-seance2)

- [Séance 3 - Passage SQL <-> NoSQL sous Python](sae-seance3)

<!--
- Séance 1 :
    - [Présentation de la base d'origine]()
    - [Requêtes à reproduire dans la nouvelle base]()
- Séance 2 :
    - [???]()
- Séance 3 : 
    - [Restitution du travail]()
-->

<!--
- SAE Migration
    - A priori : 9h de TP (3 séances de 3h) + 6h de suivi
        1. Présentation de la base originale + Recherche des requêtes sur la base d'origine
        2. Réponses aux questions
        3. Présentation du travail effectué
    - Quelle base ?
    - Idée générique : 
        - On a une base d'origine (SQL ou NoSQL)
        - On a une liste de requêtes dans la base d'origine
        - On doit migrer la base de données vers l'autre techno
        - On doit ré-écrire les requêtes avec la nouvelle base
-->
