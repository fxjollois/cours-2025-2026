# Jointures et intégration

## Jointure

Pour les exemples, nous allons utiliser les fichiers obtenus suite à la séance 3 de la SAE, sur la base de données *Gymnases2000*, que vous pouvez télécharger et intégrer à Mongo (via Compass par exemple - dans la base `SAE`, si vous voulez reproduire directement les codes) :

- Collection [Gymnases](Gymnases.json)
- Collection [Sportifs](Sportifs.json)

### Basique

Même si le but des bases de données NoSQL, particulièrement celles orientées Document, est d'intégrer tous les éléments dans un même document, il est parfois nécessaire de faire des jointures entre documents de deux collections (voire de la même collection).

Comme indiqué dans le document de la SAE, la commande à indiquer pour réaliser une jointure est [`$lookup`](https://www.mongodb.com/docs/manual/reference/operator/aggregation/lookup/#mongodb-pipeline-pipe.-lookup), à placer dans un pipeline de la fonction `aggregate()`. Celle-ci va prendre plusieurs paramètres :

- `from`: permet d'identifier l'autre collection dans laquelle aller chercher les documents à joindre
- `localField` : indique quel champs dans les documents de la collection actuelle est à considérer pour la jointure
- `foreignField` : indique quel champts dans les documents de l'autre collection est à prendre pour la jointure
- `as` : donne le nom du champs dans lequel se trouvera le tableau des documents de la collection externe correspondent à la jointure dans le document initiale

Il faut donc noter que la jointure ici est d'une part une jointure externe gauche (*i.e.* tous les documents de la collection initiale sont gardés), et d'autre part se fait de base sur l'égalité entre deux champs.

Le code suivant permet donc d'intégrer les informations de l'entraîneur de la première séance, du premier gymnase.

```python
c = db.Gymnases.aggregate([
    { "$limit": 1 },
    { "$unwind": "$Seances" },
    { "$limit": 1 },
    { "$lookup": {
        "from": "Sportifs",
        "localField": "Seances.IdSportifEntraineur",
        "foreignField": "IdSportif",
        "as": "Entraineur"
    }}
])
list(c)
```

### Avec intégration de documents sans lien direct

Il est possible aussi d'intégrer des documents d'une autre collection, qui n'ont pas forcément de lien avec le document initial. Cela peut être utile pour rajouter la même information pour chaque document. Dans ce cas, nous n'utilisons pas les champs `localField` et `foreignField`, mais le champs suivant :

- `pipeline` : permet de définir un *pipeline* d'opérations (les mêmes que dans la fonction `aggregate()`, à exécuter pour sélectionner les documents - qu'il est donc possible de remodeler à notre guise).

Dans l'exemple ci-dessous, on intègre le TOP3 des sports le plus joués pour chauque gymnase.

```python
c = db.Gymnases.aggregate([
    { "$limit": 1 },
    { "$project": { "Seances": 0 }},
    { "$lookup": {
        "from": "Sportifs",
        "pipeline": [
            { "$unwind": "$Jouer" },
            { "$sortByCount": "$Jouer" },
            { "$limit": 3 }
        ],
        "as": "Sports"
    }}
])
list(c)
```

### Avec comparaison plus complexe

On peut intégrer dans ce pipeline des comparaisons à des champs du document initial. Pour cela, il faut créer des nouvelles variables, à l'aide du champs :

- `let` : permet de définir des variables à utiliser dans le pipeline, basées sur les valeurs des champs du document initial

On peut faire appel à ces variables en indiquant un double $ avant leur nom (qui commence obligatoirement par une minuscule) dans le pipeline (`"$$variable"`).

Le code ci-dessous est une autre façon de faire la jointure de départ, en cherchant l'égalité entre l'identifiant de l'entraîneur et l'identifiant du sportif.

```python
c = db.Gymnases.aggregate([
    { "$limit": 1 },
    { "$unwind": "$Seances" },
    { "$replaceRoot": { "newRoot": "$Seances" }},
    { "$lookup": {
        "from": "Sportifs",
        "let": { "id": "$IdSportifEntraineur" },
        "pipeline": [
            { "$match": { "$expr": { "$eq": [ "$IdSportif", "$$id" ] }}}
        ],
        "as": "Entraineur"
    }}
])
list(c)
```

**A NOTER** : l'opérateur ["$replaceRoot"](https://www.mongodb.com/docs/manual/reference/operator/aggregation/replaceRoot/) permet de redéfinir complétement le document, en indiquant le ou les champs à utiliser. Le paramètre `$mergeObjects` permet d'aller plus loin, intéressant pour homogénéiser les documents.   

## Création d'une nouvelle collection

Dans un pipeline, il est possible de créer une nouvelle collection avec les documents issus de celui-ci. Il faut utiliser l'opérateur [`"$out"`](https://www.mongodb.com/docs/manual/reference/operator/aggregation/out/#mongodb-pipeline-pipe.-out), comme ci-dessous :

```python
db.collection_initiale.aggregate([
    // plusieurs opérations
    "$out": "nouvelle_collection"
])
```

Sans précision autre, la collection est créée dans la même base de données. Il est possible de préciser une nouvelle base de données en indiquant deux champs : `db` et `coll`, comme ci-dessous :

```python
db.collection_initiale.aggregate([
    // plusieurs opérations
    "$out": { "db": "nouvelle_base", "coll": "nouvelle_collection" }
])
```

Dans les deux cas, si la collection existe déjà, celle-ci sera purement et simplement écrasée. L'opérateur [`$merge`](https://www.mongodb.com/docs/manual/reference/operator/aggregation/merge/#mongodb-pipeline-pipe.-merge) permet de palier à cela, en ajoutant     plus de possibilité encore.


## A FAIRE

On dispose de deux fichiers de requêtes SQL, correspondant à des demandes sur ces données. Traduire chacune des demandes en requêtes Mongo (aucune opération dans Python via `pandas` ou `python` de base) :

- [Requêtes 1](res-seance5-recap1)
- [Requêtes 2](res-seance5-recap2)

Au final, créer une nouvelle collection, à partir des données Gymnases, dans laquelle vous ajouterez pour chaque séance les informations suivantes :

- Nom et prénom de l'entraineur
- Listes des noms et prénoms des sportifs jouant le même sport que la séance



