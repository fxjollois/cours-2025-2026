# Premiers pas sur Mongo

## Présentation de MongoDB

> Base de données **NoSQL** de type *Document Store* (orienté document)

Objectifs :

- Gestion possible de gros volumes de données
- Facilité de déploiement et d'utilsiation
- Possibilité de faire de choses assez complexes

Plus d'informations sur [leur site](http://www.mongodb.com/)

### Modèle des données

Principe de base : les données sont des `documents`

- Stocké en *Binary JSON* (`BSON`)
- Documents similaires rassemblés dans des `collections`
    - plusieurs collections possibles dans une base de données
- Pas de schéma des documents définis en amont
	- contrairement à un BD relationnel ou NoSQL de type *Column Store*
- Les documents peuvent n'avoir aucun point commun entre eux
- Un document contient (généralement) l'ensemble des informations
	- pas (ou très peu) de jointure à faire idéalement
- BD respectant **CP** (dans le théorème *CAP*)
	- propriétés ACID au niveau d'un document

### Format `JSON`

- `JavaScript Object Notation`, créé en 2005
- Format léger d'échange de données structurées (**littéral**)
- Schéma des données non connu (contenu dans les données)
- Basé sur deux notions :
	- collection de couples clé/valeur
	- liste de valeurs ordonnées
- Structures possibles :
	- objet (couples clé/valeur) : `{ "nom": "jollois", "prenom": "fx" }`
	- tableau (collection de valeurs) : `[ 1, 5, 10]`
	- une valeur dans un objet ou dans un tableau peut être elle-même un littéral
- Deux types atomiques (`string` et `number`) et trois constantes (`true`, `false`, `null`)

Validation possible du JSON sur [jsonlint.com/](http://jsonlint.com/)

#### Exemple de `JSON`

```json
{
    "address": {
        "building": "469",
        "coord": [
            -73.9617,
            40.6629
        ],
        "street": "Flatbush Avenue",
        "zipcode": "11225"
    },
    "borough": "Brooklyn",
    "cuisine": "Hamburgers",
    "grades": [
        {
            "date": "2014-12-30 01:00:00",
            "grade": "A",
            "score": 8
        },
        {
            "date": "2014-07-01 02:00:00",
            "grade": "B",
            "score": 23
        }
    ],
    "name": "Wendy'S",
    "restaurant_id": "30112340"
}
```

### Compléments

`BSON` : extension de `JSON`

- Quelques types supplémentaires (identifiant spécifique, binaire, date, ...)
- Distinction entier et réel

**Schéma dynamique**

- Documents variant très fortement entre eux, même dans une même collection
- On parle de **self-describing documents**
- Ajout très facile d'un nouvel élément pour un document, même si cet élément est inexistant pour les autres
- Pas de `ALTER TABLE` ou de redesign de la base

### Langage d'interrogation

- Pas de SQL (bien évidemment), ni de langage proche
- Définition d'un langage propre
    - `find()` : pour tout ce qui est restriction et projection
    - `aggregate()` : pour tout ce qui est calcul de variable, d'aggrégats et de manipulations diverses
    - ...
- Langage JavaScript dans la console, permettant plus que les accès aux données
	- définition de variables
	- boucles
	- ...


## Interaction entre Python et MongoDB

Utilisation du package [`pymongo`](https://docs.mongodb.com/drivers/pymongo/)

A l'IUT, Il faut l'installer via *Anaconda Prompt*, avec la ligne de commande suivante 

```bash
$ pip install pymongo[srv]
```

### Connexion à un serveur distant

- Utilisation d'une URI spécifique, avec login et passeword intégrés
- Si connexion serveur local (suite à installation selon [ces instructions](../infos-mongo)), pas besoin de mettre de paramètre à la fonction `pymongo.MongoClient()`


```python
import pymongo
URI = 'mongodb+srv://user:user@cluster0.ougec.mongodb.net/test'
client = pymongo.MongoClient(URI) # enlever le paramètre URI si connexion locale
db = client.test
```

## Exemples sur `restaurants`

Dans ce document, nous allons travailler sur une base des restaurants New-Yorkais.

Voici le premier document est présenté ci-dessous sur les plus de 25000 restaurants new-yorkais (base de test fournie par [Mongo](https://docs.mongodb.com/getting-started/shell/import-data/))

```json
{
        "_id" : ObjectId("58ac16d1a251358ee4ee87de"),
        "address" : {
                "building" : "469",
                "coord" : [
                        -73.961704,
                        40.662942
                ],
                "street" : "Flatbush Avenue",
                "zipcode" : "11225"
        },
        "borough" : "Brooklyn",
        "cuisine" : "Hamburgers",
        "grades" : [
                {
                        "date" : ISODate("2014-12-30T00:00:00Z"),
                        "grade" : "A",
                        "score" : 8
                },
                {
                        "date" : ISODate("2014-07-01T00:00:00Z"),
                        "grade" : "B",
                        "score" : 23
                },
                {
                        "date" : ISODate("2013-04-30T00:00:00Z"),
                        "grade" : "A",
                        "score" : 12
                },
                {
                        "date" : ISODate("2012-05-08T00:00:00Z"),
                        "grade" : "A",
                        "score" : 12
                }
        ],
        "name" : "Wendy'S",
        "restaurant_id" : "30112340"
}
```

### Document dans `python`

Les données `JSON` sont similaires à un dictionnaire `python`. Pour récupérer le premier document, nous utilisons la fonction `find()` de l'objet créé `m`.

```python
d = db.restaurants.find(limit = 1)
d
```

L'objet retourné est un **curseur**, et non le résultat. Nous avons celui-ci lorsque nous utilisons `d` dans une commande telle qu'une transformation en `list` par exemple. 

```python
list(d)
```

Une fois le résultat retourné (un seul élément ici), le curseur ne renvoie plus rien.

```python
list(d)
```



### Dénombrement

- Fonction `count_documents({})` pour dénombrer les documents
    - le paramètre `{}` est à mettre obligatoirement
    - nous verrons juste après à quoi il sert
- Fonction `estimated_document_count()`  pour estimer le nombre de documents, à utiliser de préférence en cas de multiples serveurs et de données massives

#### Tous les restaurants


```python
db.restaurants.count_documents({})
```

```python
db.restaurants.estimated_document_count()
```

#### Sélection de documents

Pour sélectionner les documents, nous allons utiliser le paramètre dans la fonction `count_documents()` (ainsi que dans les fonctions `distinct()` et `find()` que nous verrons plus tard).

- `{}` : tous les documents
- `{ "champs": valeur }` : documents ayant cette valeur pour ce champs
- `{ condition1, condition2 }` : documents remplissant la condition 1 **ET** la condition 2
- `"champs.sous_champs"` : permet d'accéder donc à un sous-champs d'un champs (que celui-ci soit un littéral ou un tableau)
- `{ "champs": { "$opérateur": expression }}` : utilisation d'opérateurs dans la recherche
    - `$in` : comparaison à un ensemble de valeurs
    - `$gt`, `$gte`, `$lt`, `$lte`, `$ne` : comparaison (resp. *greater than*, *greater than or equal*, *less than*, *less than or equal*, *not equal*)

#### Comptage de certains documents

- Restaurants de *Brooklyn*

```python
db.restaurants.count_documents({ "borough": "Brooklyn" })
```

- Restaurants de *Brooklyn* proposant de la cuisine française

```python
db.restaurants.count_documents({ "borough": "Brooklyn", "cuisine": "French" })
```

#### Comptage de certains documents (suite)

- Restaurants de *Brooklyn* proposant de la cuisine française ou italienne

```python
db.restaurants.count_documents({ "borough": "Brooklyn", "cuisine": { "$in": ["French", "Italian"]} })
```

- Idem mais écrit plus lisiblement

```python
db.restaurants.count_documents(
  { 
    "borough": "Brooklyn", 
    "cuisine": { "$in": ["French", "Italian"]}
  }
)
```

#### Comptage de certains documents (suite)

- Restaurants situés sur *Franklin Street*
    - Notez l'accès au champs `street` du champs `address`

```python
db.restaurants.count_documents(
  { 
    "address.street": "Franklin Street"
  }
)
```

- Restaurants ayant eu un score de 0

```python
db.restaurants.count_documents(
  { 
    "grades.score": 0
  }
)
```

#### Comptage de certains documents

- Restaurants ayant eu un score inférieur à 5

```python
db.restaurants.count_documents(
  { 
    "grades.score": { "$lte": 5 }
  }
)
```

### Valeurs distinctes

On peut aussi voir la liste des valeurs distinctes d'un attribut, avec la fonction `distinct()`.

- Quartier (`borough`), pour tous les restaurants

```python
db.restaurants.distinct(key = "borough")
```

#### Valeurs distinctes (suite)

- Cuisine pour les restaurants de *Brooklyn*

```python
db.restaurants.distinct(
  key = "cuisine",
  query = { "borough": "Brooklyn" }
)
```


#### Valeurs distinctes (suite)

- Grade des restaurants de *Brooklyn*

```python
db.restaurants.distinct(
  key = "grades.grade",
  query = { "borough": "Brooklyn" }
)
```

### Restriction et Projection

- Fonction `find()` pour réaliser les *restrictions* et *projections*
- Plusieurs paramètres : 
    - Restriction (quels documents prendre) : même format que précédemment
    - Projection (quels champs afficher)
    - `limit` pour n'avoir que les $n$ premiers documents
    - `sort` pour effectuer un tri des documents
- Renvoie un curseur, qu'il faut donc gérer pour avoir le résultat
- Transformation en `DataFrame` (du module `pandas`)
    - Format pas forcément idéal pour certains champs

#### Sélection de champs à afficher ou non

Dans la fonction `find()`, pour choisir les champs à afficher, le deuxième paramètre permet de faire une projection avec les critères suivants :

- sans précision, l'identifiant interne est toujours affiché (`_id`)
- `{ "champs": 1 }` : champs à afficher
- `{ "champs": 0 }` : champs à ne pas afficher
- Pas de mélange des 2 sauf pour l'identifiant interne à Mongo (`_id`)
    - `{ "_id": 0, "champs": 1, ...}`

#### Tri et limite

Toujours dans la fonction `find()`, il est possible de faire le tri des documents, avec le paramètre `sort` qui prend un tuple composé de 1 ou plusieurs tuples indiquant les critères de tri

- `( "champs", 1 )` : tri croissant
- `( "champs", -1 )` : tri décroissant
- plusieurs critères de tri possibles (dans les 2 sens)

Dans ces fonctions, on peut aussi limiter l'exploration à une partie, avec les paramètres suivant :

- `limit` : restreint le nombre de résultats fournis
- `skip` : ne considère pas les *n* premiers documents

#### Récupération des 5 premiers documents

Notez le contenu des colonnes `address` et `grades`.


```python
import pandas
pandas.DataFrame(list(db.restaurants.find(limit = 5)))
```


#### Récupération de documents (suite)

- Restaurants *Shake Shack* (uniquement les attributs `"street"` et `"borough"`)

```python
c = db.restaurants.find({ "name": "Shake Shack" }, { "address.street": 1, "borough": 1 })
pandas.DataFrame(list(c))
```


#### Récupération de documents (suite)

- Idem sans l'identifiant interne

```python
c = db.restaurants.find(
    { "name": "Shake Shack" }, 
    { "_id": 0, "address.street": 1, "borough": 1 }
)
pandas.DataFrame(list(c))
```


#### Récupération de documents (suite)

- 5 premiers restaurants du quartier *Queens*, avec une note A et un score supérieur à 50 (on affiche le nom et la rue du restaurant

```python
c = db.restaurants.find(
    {"borough": "Queens", "grades.score": { "$gte":  50}},
    {"_id": 0, "name": 1, "grades.score": 1, "address.street": 1},
    limit = 5
)
pandas.DataFrame(list(c))
```

#### Récupération de documents (suite)

- Restaurants *Shake Shack* dans différents quartiers (*Queens* et *Brooklyn*)

```python
c = db.restaurants.find(
    {"name": "Shake Shack", "borough": {"$in": ["Queens", "Brooklyn"]}}, 
    {"_id": 0, "address.street": 1, "borough": 1}
)
pandas.DataFrame(list(c))
```


#### Récupération de documents (suite)

- Restaurants du Queens ayant une note supérieure à 50, mais trié par ordre décroissant de noms de rue, et ordre croissant de noms de restaurants

```python
c = db.restaurants.find(
    {"borough": "Queens", "grades.score": { "$gt":  50}},
    {"_id": 0, "name": 1, "address.street": 1},
    sort = (("address.street", -1), ("name", 1))
)
pandas.DataFrame(list(c))
```




## A faire

1. Donner les styles de cuisine présent dans la collection
1. Donner tous les grades possibles dans la base
1. Compter le nombre de restaurants proposant de la cuisine fraçaise ("French")
1. Compter le nombre de restaurants situé sur la rue "Central Avenue"
1. Compter le nombre de restaurants ayant eu une note supérieure à 50
1. Lister tous les restaurants, en n'affichant que le nom, l'immeuble et la rue
1. Lister tous les restaurants nommés "Burger King" (nom et quartier uniquement)
1. Lister les restaurants situés sur les rues "Union Street" ou "Union Square"
1. Lister les restaurants situés au-dessus de la lattitude 40.90
1. Lister les restaurants ayant eu un score de 0 et un grade "A"

### Questions complémentaires

Nécessitent une recherche sur la toile pour compléter ce qu'on a déjà vu dans ce TP.

1. Lister les restaurants (nom et rue uniquement) situés sur une rue ayant le terme "Union" dans le nom
1. Lister les restaurants ayant eu une visite le 1er février 2014
1. Lister les restaurants situés entre les longitudes -74.2 et -74.1 et les lattitudes 40.1 et 40.2

