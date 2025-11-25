Sur SAKILA 

https://fxjollois.github.io/cours-2020-2021/lp-dm--bd/tp1.html

- Sauf demande exprimée dans la question, les opérations sont exclusivement à faire dans Mongo (uniquement récupération et affichage en python)
- Les résultats doivent être sauvegardés dans un dataframe pandas, nommé `resXX`, où `XX` est le numéro de la demande
- Lorsque c'est utile, choisissez un tri pertinent pour la demande
- Vous devez rendre un fichier Notebook (extension `.ipynb`) **avec votre nom de famille dans le nom de fichier** ET **dans la première cellule du fichier** (qui sera donc une cellule de texte)



Questions

1. Quels sont les actrices ayant comme prénom “Penelope” ?

2. Quels films ont le mot “dinosaur” dans leur titre ? (uniquement id, titre et année)

Pour chaque catégorie de film, donner le nombre de films (choisir un tri judicieux)
    On veut récupérer un tableau avec les noms de colonnes suivants : "Catégorie", "Nb films"

Quels sont les 10 prénoms d’acteur/actrice les plus utilisés ?

Quels sont les 20 clients le plus grand nombre de réservations ?  (uniquement id, nom, prénom et pays)

Combien y a t’il de réservations en moyenne par client ? (donner aussi le minimum et le maximum)

Quels sont les 10 acteurs ayant joué dans le plus de films ?
     Les noms des champs ayant des espaces, vous devez gérer la simplification du résultat dans Python

Des clients louent parfois plusieurs fois le même film. Donner le nom des clients et les films concernés, pour les clients ayant réservés plus de 3 fois le même film.
    On veut un data frame avec les colonnes "Client", "Film" et "Nb réservation", entièrement géré par Mongo  

Pour chaque pays, on veut connaître la durée moyenne de location, ainsi que la plus longue location. 
    La durée est à calculée en nombre de jours (un jour entamé est un jour compté).
    On veut un dataframe avec les colonnes suivantes : "Pays", "Durée moyenne", "Durée max".

Quels sont les 10 films les plus rentables (qui ont généré le plus gros montant de paiement) ?
    Attention à arrondir à 2 décimales les montants, car des soucis d'effet de bord (dû à Python) sont apparu lors de l'importation.






Calculer pour chaque location (rental) la durée en jours de celle-ci


Quels sont les 10 films dont on a le plus de copies en stock ?
Dans quels pays y a t’il des locations ?
Donner le montant total des paiements par pays

Quels sont les prix moyens de location par catégorie ?

Existe-t’il des clients ayant le même nom et le même prénom que des acteurs ? (si oui, lesquels)
Existe-t’il un pays (si oui le(s)quel(s)) pour lequel nous avons des clients, sans avoir de magasins ?


Combien de films avons-nous pour chaque nombre de copies de films ?

Existe-t’il (si oui le(s)quel(s)) un paiement pour lequel le numéro de client est différent du numéro de client de la location associée ?
Existe-t’il (si oui le(s)quel(s)) des clients qui ont commandé dans plusieurs magasins ?
Est-il possible qu’un film puisse être loué à des prix différents ? Si oui, explorez un la table pour essayer de comprendre pourquoi.

### De côté

Quels sont les films ayant le mot “scientist” dans leur description ?
Partant du principe que le prix de remplacement (replacement_cost) est une estimation du coût du film, et que pour chaque location, le bénéfice est de seulement 10% du prix, quels sont les 10 films les plus rentables ? les 10 les moins rentables ?


### Avec problème

Quels sont les 10 films les plus longs ?
Afficher pour chaque film son titre, son “âge”, sa durée en heures (de type “1h43”)
3. Quels sont les films dans lesquels ont joué au moins une actrice ayant comme prénom “Penelope” ? (jointure à prévoir entre Films et Actors)
