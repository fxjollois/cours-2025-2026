# TP récapitulatif

## Données AirBnB

Nous allons travailler sur des données AirBnB. Celles-ci sont stockées sur le serveur Mongo dans la collection `listingsAndReviews` de la base `sample_airbnb`.

```python
import pymongo
URI = 'mongodb+srv://user:user@cluster0.ougec.mongodb.net'
client = pymongo.MongoClient(URI) # enlever le paramètre URI si connexion locale
db = client.sample_airbnb
list(db.listingsAndReviews.find(limit = 1))
```

Elles sont aussi disponibles en téléchargement via [ce lien](https://cloud.parisdescartes.fr/index.php/s/bRYdarwyaHmBc34)

> [Aide sur les données](https://docs.atlas.mongodb.com/sample-data/sample-airbnb)

Une fois créée la connexion à la collection dans Python, répondre aux questions suivantes :

1. Lister les différentes types de logements possibles cf (`room_type`)
1. Lister les différents équipements possibles cf (`amenities`)
1. Donner le nombre de logements
1. Donner le nombre de logements de type "Entire home/apt"
1. Donner le nombre de logements proposant la "TV" et le "Wifi (cf `amenities`) 
1. Donner le nombre de logements n'ayant eu aucun avis
    - il existe les champs `number_of_reviews` et `reviews` (tableau des avis) - vérifiez qu'ils soient cohérents
1. Lister les informations du logement "10545725" (cf `_id`)
1. Lister le nom, la rue et le pays des logements dont le prix est supérieur à 10000
1. Donner le nombre de logements par type
1. Donner le nombre de logements par pays
1. On veut représenter graphiquement la distribution des prix, il nous faut donc récupérer uniquement les tarifs 
    - Un tarif apparraissant plusieurs fois dans la base doit être présent plusieurs fois dans cette liste
1. Calculer pour chaque type de logements (`room_type`) le prix (`price`)
1. On veut représenter la distribution du nombre d'avis. Il faut donc calculer pour chaque logement le nombre d'avis qu'il a eu (cf `reviews`)
1. Compter le nombre de logement pour chaque équipement possible
1. On souhaite connaître les 10 utilisateurs ayant fait le plus de commentaires

**ATTENTION** : il est demander de stocker le résultat dans une variable (de type `list` ou `DataFrame pandas` avant de l'afficher)
