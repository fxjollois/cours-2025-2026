# Applications sur données réelles - TP 2 - Données LIMAT
### Traitement des données
####  INTECHMER - CT2 GEM/PVRM

Pour ce TP, vous devez rédiger un rapport en *Rmarkdown*, en commentant les résultats obtenus. 

## Données de l'enquête LIMAT

Les données utilisées sont issues de l'enquête LIMAT, sur les oiseaux d'eau, disponible ici [au format texte](https://fxjollois.github.io/cours-2025-2026/intechmer-2a-stat-desc/DataLIMAT.txt) (à importer avec `read_delim()` sans aucun paramètre). Vous pourrez trouver des informations complémentaires sur [cette page](https://data.ofb.fr/catalogue/Donnees-geographiques-OFB/fre/catalog.search#/metadata/7c1c53b6-add0-4cb5-8b5c-c3a6b71c0b03).

## Demandes

A partir des données présentes sur la page ci-dessus, répondre aux demandes suivantes :

- Importer les données 
- Ecrire un petit texte introductif, en indiquant la source des données
- Indiquer quelques éléments sur ces données 
    - Nombre total d'observation
    - Etendue des observations
    - Nombre d'observateurs
    - Nombre de départements
    - Nombre d'espèces 
- Donner le TOP10 des observateurs les plus présents
- Représenter le nombre d'observations par observateurs avec une boîte à moustaches
- Représenter sur une carte l'ensemble des observations
- Représenter, à l'aide d'un diagramme en barres, le nombre d'observations pour chaque espèce
    - Trier les espèces par ordre décroissant d'observations
- Représenter, à l'aide d'un diagramme circulaire, la part de chaque mode d'observations (`collection_mode`)
- Représenter le nombre d'oiseaux observés par observations, à l'aide d'un histogramme
- Représenter le nombre d'observations par heure, avec un diagramme en barres
- Représenter, pour chaque département :
    - le nombre d'observations (diagramme en barres)
    - le nombre total d'oiseaux observés (idem)
    - la part de chaque mode d'observations (diagramme en barres empilées)
- Représenter sur une carte l'ensemble des observations en colorant celle-ci en fonction du mode d'observations

