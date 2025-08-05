# Rappels de probabilités


Nous allons continuer de travailler sur les données contenu dans le fichier `tips`, dont voici les versions initiales si besoin :

- [Format Excel](tips.xlsx)
- [Format Libre Office](tips.ods)

> Nota Bene : les noms des fonctions dans ce document sont valables dans **Excel**. Il est possible que certains soient différents dans les autres tableurs (me demander si cela ne fonctionne pas dans votre outil).

## Un peu de dénombrement

On a vu que les tableaux (croisés) dynamiques permettent de calculer automatiquement le nombre d'occurences de modalités d'une variable. Mais nous avons parfois justement besoin d'en dénombrer certaines.

### Compter le nombre de cellules avec une valeur 

- Dans une nouvelle feuille, écrire en `A1` *Exercices de dénombrement* (par exemple) 
- En cellule `A3`, écrire *Nombre de tables*
- En cellule `B3`, écrire la formule `NBVAL(tips!A:A)-1`
    - `NBVAL()` permet de compter le nombre de cellules avec une valeur quelconque (donc non vide)
    - Ici, il faut retirer un car la cellule `C1` ne doit pas être comptabilisée

### Compter avec une condition d'égalité

- En cellule `A4`, écrire *Avec fumeurs*
- En cellule `B4`, écrire `NB.SI(tips!D:D; "Yes")`
    - `NB.SI()` permet de compter le nombre de cellules avec une valeur respectant une condition (ici, égale à *Yes*)
    - Fonctionne aussi sur des valeurs numériques
    
### Compter avec une condition de comparaison

- En cellule `A5`, écrire *A plus 40$*
- En cellule `B5`, écrire `NB.SI(tips!A:A; ">40")`
    - Noter ici le formalisme `""` pour mettre une condition

### Compter avec plusieurs conditions

Ici, on compte le nombre de lignes qui respectent une ou plusieurs conditions

- En cellule `A6`, écrire *Avec fumeurs et à plus de 40$*
- En cellule `B6`, écrire `NB.SI.ENS(tips!D:D; "Yes"; tips!A:A; ">40")`
    - On teste à la fois si la colonne `D` est égale à *Yes* et si la colonne `A` est supérieure à 40
    

## Exercices

### Simple

1. Compter le nombre de tables avec un montant inférieur à 10$
1. Compter le nombre de tables avec un pourboire supérieur à 2$
1. Compter le nombre de tables avec un montant inférieur à 10$ et un pourboire supérieur à 2$

### Lien entre le nombre de convives et le sexe de la personne qui paie

1. Compter le nombre de tables à un ou deux convives, trois convives, et quatre ou plus (3 calculs donc)
1. Pour chaque cas ci-dessus, compter le nombre de fois où c'est une femme qui a payé
1. Calculer le pourcentage pour chaque cas, et comparer au pourcentage de femmes
  
> Que pouvons-nous dire ? Si différence il y a, choisir un graphique adapté pour la représenter
    
### Lien entre le moment de la journée et la présence de fumeurs

1. Compter le nombre de tables pour le midi et pour le soir séparemment
1. Pour chaque moment (midi ou soir), compter le nombre de tables avec fumeurs
1. Calculer le pourcentage de tables avec fumeurs pour chaque moment, et comparer au pourcentage de tables avec fumeurs globalement

> Existe-t'il une différence entre les moments ? Si différence il y a, choisir un graphique adapté pour la représenter

### Impact du jour de la semaine 

1. Pour chaque jour de la semaine, compter le nombre de tables avec un montant supérieur à 30$
1. Calculer les pourcentages et comparer au pourcentage de tables à plus de 30$ globalement

> Y-a-t'il un effet jour sur le montant ? Si effet il y a, choisir un graphique adapté pour le représenter

1. Faire de même pour les tables avec un pourboire supérieur à 7$

> Même question sur le pourboire ? Si effet il y a, choisir un graphique adapté pour le représenter

### Autres calculs à faire

1. On se demande si le sexe de la personne a un effet sur le fait de payer un pourboire de plus de 7$
1. Existe-t'il un lien entre le moment de la journée et le nombre de convives (en gardant les trois possibilités vues précédemment)



