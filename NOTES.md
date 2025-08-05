# Quelques notes pour 2025-2026

## M1 DCI : 

- REVOIR séance 3 !!!
- REVOIR les packages utilisés -> virer sklearn ???

## M1 AMSD/MLSD

- Système de base (user par exemple) à revoir
- SSH depuis la machine hôte !! IMPORTANT !!!
- GIT peut-être


## BUT2 TC Cherbourg 

- REVOIR séance 5 sur loi normale !!! Utilisez d'autres données
- Tout sur Excel
- TCD avec moyenne, écart-type et nombre en modifiant la structure pour séance 7 et 8
- ATTENTION séance 5 avec le +/- 2 écart-type pouvant être incompréhensible après pour les étudiants.
- Seance 6 : ne mettre que des écart-types

## INTECHMER

- données AirNormand pour le TP1 et le TP2 ?
- Commencer plus tôt

## BUT SD Paris

### Collecte de données

- Utiliser **webdriver.Edge** !!
- Tester le téléchargement de données climatiques mensuelles :
    - Source des données : https://meteo.data.gouv.fr/datasets/donnees-climatologiques-de-base-mensuelles/
    - Récupérer le contenu de ce fichier : https://www.data.gouv.fr/api/1/datasets/donnees-climatologiques-de-base-mensuelles/
        - on a une liste de tout ce qu'il a comme fichier
    - Chercher dans le champs `resources` les éléments du tableau pour lesquels `title` est égal à "MENS_departement_XX_periode_1950-2023"
        - en reamplacant XX par un numéro de département (mais on veut tous les départements)
    - Récupérer le lien de téléchargement (dans `latest`, mais on l'a aussi en `parquet`)

### Programmation web pour la visualisation

- streamlit
- shiny
- comparaison ? autre ?

