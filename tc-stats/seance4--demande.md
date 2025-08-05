# Lois de probabilité - Discrète

## Outil de calcul des probabilités dans un tableur

### Pour la loi binomiale 

Dans un nouveau fichier, nous allons créer un outil permettant de faire des calculs de probabilités à partir de la loi binomiale. Réaliser les étapes suivantes :

1. Ecrire en cellule `A1` un titre de type *Outil de calcul - Loi Binomiale*
2. En cellule `A3` et en dessous, écrire :
    - *Nombre de tentatives*
    - *Probabilité de réussite pour une tentative*
    - *Nombre de réussites*
3. En cellule `B3` et en dessous, écrire : *N*, *p*, *K*
4. En cellule `A7`, écrire *Probabilité d'avoir exactement K réussites sur N tentatives* et en `B7`, écrire *P(X = K)*
5. En cellule `A8`, écrire *Probabilité d'avoir au maximum K réussites sur N tentatives* et en  `B8`, écrire *P(X <= K)*
6. Ecrire les valeurs suivantes dans les cellules annoncées :
    - En `C3` : 25
    - En `C4` : 0,2
    - En `C5` : 5
7. Ecrire maintenant les formules suivantes dans les cellules indiquées :
    - En `C7` : `=LOI.BINOMIALE.N(C5;C3;C4;FAUX)`
        - Le premier paramètre (`C5` ici) donne le nombre de réussite
        - Le deuxième paramètre (`C3` pour nous) donne le nombre de tentative
        - Le troisième paramètre (dans notre cas `C4`) donne la probabilité de réussite pour une tentative
        - Le quatrième paramètre (ici `FAUX`) indique qu'on calcule *P(X = K)*
    - En `C8`, écrire la même formule avec `VRAI` en dernier paramètre (au lieu de `FAUX` donc)
        - Cela indique qu'on calcul maintenant *P(X <= K)*

> Vous devriez obtenir les résultats suivants : *P(X = K) = 0,1960* et *P(X <= K) = 0,6167*

Cela veut dire que, sur 25 tentatives avec 1 chance sur 5 de gagner (*p=0,2*), il y a une probabilité de 0,1960 de gagner exactement 5 fois. Et il y a une probabilité de 0,6167 d'avoir entre 0 et 5 réussites.

#### Premier exercice

Il est parfois nécessaire de calculer *P(X > K)* (terme à écrire en cellule `B9`). Ecrivez le calcul en cellule `C9` qui va vous permettre d'obtenir cette probabilité, à partir de celles calculées juste avant.

### Pour la loi de Poisson

1. Ecrire en cellule `F1` un titre de type *Outil de calcul - Loi de Poisson*
2. En cellule `F3` et `F4`, écrire :
    - *Espérance*
    - *Nombre de réussites*
3. En cellule `G3` et `G4`, écrire : *lambda* et *K*
4. En cellule `G7`, écrire *P(X = K)*
5. En cellule `G8`, écrire *P(X <= K)*
6. Ecrire les valeurs suivantes dans les cellules annoncées :
    - En `H3` : 2
    - En `H4` : 4
7. Ecrire maintenant les formules suivantes dans les cellules indiquées :
    - En `H7` : `=LOI.POISSON.N(H4;H3;FAUX)`
        - Le premier paramètre (`H4` ici) donne le nombre de réussite
        - Le deuxième paramètre (`43` pour nous) donne le nombre de tentative
        - Le troisième paramètre (ici `FAUX`) indique qu'on calcule *P(X = K)*
    - En `H8`, écrire la même formule avec `VRAI` en dernier paramètre (au lieu de `FAUX` donc)
        - Cela indique qu'on calcul maintenant *P(X <= K)*

> Vous devriez obtenir les résultats suivants : *P(X = K) = 0,0902* et *P(X <= K) = 0,9473*

Cela veut dire que, sur la base d'une espérance de 2, il y une probabilité de 0,0902 d'avoir exactement 4 et une probabilité de 0,9473 d'avoir entre 0 et 4.

## Exercices sur loi binomiale

A l'aide de l'outil ci-dessus, répondre aux questions ci-dessous. 

### De l'utilité des probabilités dans les choix stratégiques d'un étudiant

Un test comporte 10 questions, avec chacune 4 choix possibles et une seule réponse juste.

1. Combien y a t'il de grilles de réponses possibles ?
2. Quelle est la probabilité de répondre au hasard 6 fois correctement ? et d'avoir au moins 6 réponses correctes ?

### Prospection chanceuse ou efficiente

Supposons que nous avons un ensemble de 500 prospects, et on suppose qu'on a en général un taux de conversion de 20%. Nous avons 3 produits différents à vendre à ces prospects, le taux de conversion est supposé le même entre les 3. 

1. Que puis-je dire de la variable aléatoire modélisant le nombre de clients, après une campagne auprès de ces prospects ?
1. Suite à cette campagne, nous avons réussi à avoir 130 clients sur le produit 1, 110 clients sur le produit 2 et 80 clients sur le produit 3. Que peut-on dire de la performance de notre campagne pour chaque produit ?
1. Quelle est la probabilité qu'une personne achète les 3 produits ? Seulement 2 ? Seulement 1 ? Aucun ? 
1. Au final, combien de clients (quelque soit le produit) puis-je espérer avoir ?

## Exercices sur loi de Poisson

### Gestion d'un magasin

Dans un magasin, entre 10h et 11h, on observe que la probabilité qu'une personne se présente entre la minute *m* et la minute *m+1* est égale à 10%. On veut calculer la probabilité pour que *n* personnes viennent dans ce magasin entre 10h et 11h.

1. Définir une variable aléatoire adaptée. Combien de personnes peut on espérer dans l'heure considérée ?
1. Donner les probabilités qu'aucune personne ne vienne ? qu'une seule personne ? que 6 personnes viennent ?
1. Sachant qu'à partir de 10 personnes dans le magasin, je dois prévoir 1 personne en plus. Quelle est la probabilité pour qu'au moins 10 personnes se présentent au magasin entre 10h et 11h ?

### Centenaire

Si dans une population une personne sur cent est centenaire, quelle est la probabilité de trouver au moins une personne centenaire parmi 100 personnes choisies au hasard ? Et parmi 200 personnes ? Combien de personnes doit-on choisir au hasard pour être quasiment sûr de trouver un centenaire (avec probabilité de se tromper inférieur à 1%) ?
