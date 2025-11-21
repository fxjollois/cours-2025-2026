# Bases de données NoSQL

> Si vous souhaitez utiliser *Mongo* sur votre ordinateur, vous devez les instructions présentées sur [cette page](../info-mongo).

<!--
- Pour chaque parcours :
    - Séance 1 (RES) : CM sur NoSQL / Big Data / MongoDB
    - Séance 1 (SAE) : CM de présentation de la base, du processus désiré, et du résultat attendu (+ rappel SQL + présentation interaction Python/SQL)
    - Séance 2 (RES) : TP Premier pas Mongo
    - Séance 3 (RES) : TP Agrégats
    - Séance 4 (RES) : Ajout d'une séance récp'
    - Séance 2 (SAE) : réflexion sur passage SQL -> NoSQL
    - Séance 5 (RES) : TP noté 1
    - Séance 3 (SAE) : NoSQL -> SQL
    - Séance 6 (RES) : TP Jointure + Importation données dans Mongo + Intégration dans un process dashboard
    - Séance 7 (RES) : TP noté 2
-->

## Partie RESSOURCE : *Bases de données NoSQL*

- [Séance 1 - Introduction au NoSQL](https://docs.google.com/presentation/d/e/2PACX-1vRi9gT1ZSwXgaDcRYQ4q-srOtJYtdT6hOlo0E6cYt5E9Vk11LJYusYaxa0FNWM95pyO9Jg9SZc9faWJ/pub?start=false&loop=false&delayms=3000)
- [Séance 2 - Premier pas avec MongoDB](res-seance2)
- [Séance 3 - Agrégats et plus encore](res-seance3)
- [Séance 4 - Récapitulatif](res-seance4)
- [Séance 5 - Jointures et intégration](res-seance5)
- [Séance 6 - TP noté]() sur Moodle

## Partie SAE : *Migration de données vers ou depuis un environnement NoSQL*

- [Séance 1 - Présentation et requêtes SQL initiales](sae-seance1)
    - Rendu à faire sur cet espace : <https://cloud.parisdescartes.fr/index.php/s/tDnBGWzez9ma2dt>
    - **Consignes** : 
        - **Deadline** : 26 octobre - 23h59
        - **2 ou 3 étudiants par groupe**
        - Fichier notebook python `.ipynb` avec 
            - toute cellule nécessaire pour le fonctionnement de votre notebook
            - une cellule par requête (en donnant le numéro de la requête), avec le code + le résultat
        - **LES NOMS de FAMILLE des étudiants dans le NOM du FICHIER !!!**

- [Séance 2 - Réflexion sur le passage du modéle relationnel à un modèle à base de documents](sae-seance2)
    - Rendu à faire sur cet espace : <https://cloud.parisdescartes.fr/index.php/s/oxp45JXJPX9beP3>
    - **Consignes** : 
        - **Deadline** : 26 octobre - 23h59
        - **Mêmes groupes que rendu précédent**
        - Fichier `PDF`
        - **LES NOMS de FAMILLE des étudiants dans le NOM du FICHIER !!!**

- [Séance 3 - Passage SQL <-> NoSQL sous Python](sae-seance3)

### RENDU FINAL

**DEADLINE** : **21 décembre 2025 - 23h59**

Espace de rendu : <https://cloud.parisdescartes.fr/index.php/s/etJdYfYD55dcPno>

> Vous devez déposer un **fichier ZIP**, avec les noms des étudiants dans le nom de fichier

**LIVRABLES ATTENDUS** :

- **Rapport** (court) présentant les choix faits (nombre de collections, organisation générale) et les difficultés rencontrées
    - **Les noms des étudiants doivent être indiqués dans le rapport !!** 
- **1 seul fichier migration** (au format `ipynb`) contenant le code permettant le passage de la BD SQL à la BD Mongo
    - Il doit être **automatisé** -> une exécution complète doit permettre de réaliser proprement la migration complète 
    - Les paramètres (nom du fichier de la BD d'origine, nom de la base de données cible) doivent être placés en début de code
    - Il doit y avoir le code + le résultat correspondant à chaque cellule
- **1 seul fichier requêtes** (au format `ipynb`) contenant le code permettant de répondre aux 10 questions vues dans la séance 1
    - Il doit y avoir le code + le résultat correspondant à chaque cellule
 
