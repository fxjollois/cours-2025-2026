# Statistiques descriptives sur tableur - Univarié

Nous allons travailler sur les données contenu dans le fichier `tips`, dont vous devez télécharger une version selon votre logiciel :

- [Format Excel](tips.xlsx)
- [Format Libre Office](tips.ods) (Téléchargement de [LibreOffice](https://fr.libreoffice.org/download/telecharger-libreoffice/))

> Nota Bene : les noms des fonctions dans ce document sont valables dans **Libre Office**. Il est possible que certains soient différents dans les autres tableurs (me demander si cela ne fonctionne pas dans votre outil).

<!--
Différence entre Libre Office et Excel

- tips.A:A -> tips!A:A
- Etiquettes du 1er graphique :
    - clic sur l'axe des X puis clic-droit -> *Sélectionner des données*
    - dans *Etiquettes de l'axe horizontal*, cliquez sur *Modifiez*
    - Sélectionnez la plage `F5:F11`
    - cliquez sur *OK*
- Tableau croisé dynamique
    - Choix de la statistique 
        - cliquez sur *Somme de total_bill*
        - cliquez sur *Paramètres des champs de valeurs...*
        - choisissez *Nombre*
        - cliquez sur *OK*
    - Profils lignes
        - Refaire le même TCD
        - Dans une cellule du tableau, clic-droit et choisir *Afficher les valeurs* -> *% du total de la ligne*
-->

## Analyse d'une variable quantitative

### Préparation de la feuille

- Créer une nouvelle feuille (que vous nommerez `montant` par exemple)
- En case `A1`, écrivez *Montant de la table* (et mettez le en gras)
- En case `A3` et `A4`, écrivez *Moyenne* et *Ecart-type*
- En cas `A6` et en dessous, écrivez *Minimum*, *Q1*, *Médiane*, *Q3* et *Maximum*
- Enfin, dans la case `A12`, vous écrivez *%* et à droite (case `B12`) *Centile*. En case `A13` et en dessous, écrivez *1, 10, 90, 99*

### Ajout des calculs

- Dans la case `B3`, écrivez la formule suivante : `=MOYENNE(tips.a:a)`
    - notez qu'il est possible d'écrire en minuscule ou en majuscule les noms des fonctions
    - dans **Excel** ou **Google Sheets** : `=MOYENNE(tips!a:a)` (le `"."` est remplacé par un `"!"`)
- Pour l'écart-type, c'est la fonction `ECARTYPE.PEARSON()` qu'il faut utiliser (sur la même colonne)
- Pour minimum, maximum et médiane, il existe les fonction `MIN()`, `MAX()` et `MEDIANE()`
- Pour les quartiles, nous avons la fonction `QUARTILE()`, qui demande deux paramètres (séparés par un `";"`) :
    - la plage des données (ici `tips.A:A`) 
    - le type de quartile (0 : minimum, 1 : Q1, 2 : médiane, 3 : Q3, 4 : maximum)
- Pour les centiles, il existe la fonction `CENTILE()` qui prend 2 paramètres :
    - la plage des données (ici toujours `tips.A:A`)
    - la valeur du centile (entre 0 et 1). Nous allons donc écrire la formule suivante dans la cellule `B13`, qu'il faudra dupliquer sur les cellules en dessous donc
```
=CENTILE(tips.A:A;A13/100)
```

> Avec un peu de mise en page, nous avons un ensemble d'informations permettant déjà de mieux connaître la distribution du montant payé.

### Graphique

Il n'existe pas de fonction permettant de réaliser un histogramme directement dans les tableurs. Pour une variable quantitative, nous allons réaliser un diagramme en barres de la transformation en variable ordinale.

Pour réaliser cela, nous allons créer un tableau. Ecrivez en cellule `D3` à `F3` les mots suivants : *Seuil*, *Occurences*, *Etiquette*

#### Première étape

Pour faire notre tableau, nous devons réaliser une première étape de création des valeurs seuils. Nous allons choisir comme seuils, à placer dans le tableau en `D4` et en dessous, les valeurs *0, 10, 15, 20, 25, 30, 35 et ">35"*.

#### Deuxième étape

Pour calculer le nombre de valeurs entre 2 seuils, nous allons utiliser la fonction `FREQUENCE()`. Elle prend en première paramètre les données (toujours `tips.A:A`) et en deuxième paramètre, la liste des seuils. Ecrivez la formule suivante en cellule `E4` :

- LibreOffice : `=FREQUENCE(tips.A:A;D4:D11)`
- Excel ou Google Sheets : `=FREQUENCE(tips!A:A;D4:D11)`

Une fois cela fait, vous remarquerez que des valeurs se sont ajoutées sur les cellules en dessous. La valeur en `E4` est 0 car aucune valeur n'est inférieure à 0 dans les données. Ensuite, la valeur dans la cellule `E5` indique qu'il y a 17 valeurs entre 0 et 10. Et ainsi de suite. La somme des valeurs entre `E4` et `E11` est bien égale à 244 (*i.e.* le nombre de lignes du tableau).

#### Troisième étape

Nous allons créer automatiquement des étiquettes pour chaque modalité. Pour cela, écrivez en cellule `F5` la formule suivante :

```
=CONCAT("Entre ";D4;" et ";D5)
```

Une fois cela fait, dupliquez à l'aide de la souris cette formule aux cellules situées en dessous (clic droit maintenu sur le coin inférieur droit à la cellule et déplacer vers le bas). Vous pouvez éventuellement changez le texte de la dernière étiquette pour mettre seulement *">35"* par exemple.

#### Quatrième étape

Sélectionner les occurences (cellules `E5` à `E11`) et cliquer dans le menu *Insertion* -> *Diagramme* (ou sur l'icône dédiée). On va garder comme type de diagramme celui en *colonne*. 

> Nous avons la répartition des valeurs selon des intervalles dont nous avons choisi les seuils.

On peut améliorer ce graphique en modifiant les libellés des axes, en ajoutant un titre... N’hésitez pas à tester, en particulier ce qui est ci-dessous.

##### avec LibreOffice

Dans la partie *Séries de données*, après avoir cliquer dans la zone *Catégories*, cliquez sur l'icône à droite pour sélectionner la plage `F5:F11` (ou écrivez directement `F5:F11`). Puis cliquez sur *Terminer*.

##### avec Excel

Dans le menu *Conception de la carte*, cliquer sur *Sélectionner des données*. Puis, dans la partie *Etiquettes*, vous pouvez soit aller sélectionner les étiquettes directement, soit écrire `F5:F11`.

##### avec Google Sheets

Dans l'*éditeur graphique* (à droite), cliquer sur *Ajouter Axe X*, puis cliquer l'icône tableau à droite. Puis, vous pouvez soit aller sélectionner les étiquettes directement, soit écrire `F5:F11`.

### A FAIRE

> Reproduisez les mêmes opérations pour la variable `tip` (*pourboire*) dans une nouvelle feuille


## Analyse d'une variable qualitative

On va faire ici une première version *à la main*. Nous verrons plus tard comment faire autrement.

### Partie numérique

- Créer une nouvelle feuille (que vous nommerez `jour` par exemple)
- En case `A1`, écrivez *Jour de la semaine* (et mettez le en gras)
- En case `A3`, écrivez *Jour* et en `B3` *Nombre de tables*
- On connaît les modalités donc on va écrire directement *Thur*, *Fri*, *Sat* et *Sun* dans les cellules `A4` à `A7`.
- Dans la cellule `B4`, nous allons écrire la formule suivante qui calculer le nombre de fois qu'apparaît la valeur de la cellule `A4` dans la colonne `E` de la feuille `tips` :
```
=NB.SI(tips.E:E;A4)
```
- Dupliquer cette formule aux cellules en dessous
- Ecrivez dans la case `C3` le terme *Proportion*
- Dans la cellule `C4`, nous allons calculer la part de la cellule `B4` sur la somme des cellules `B4` à `B7`, en utilisant la formule suivante :
```
=B4/SOMME($B$4:$B$7)
```
    - Les `$` vont permettre de conserver les valeurs `B4` et `B7` de la formule lorsqu'on va la dupliquer aux cellules du dessous.
- Il est possible de  mettre au format pourcentage (en cliquant sur *%* dans le menu ou dans *Format* -> *Numérique* -> *Pourcentage*)

### Réalisation d'un diagramme en barres ou circulaire

De la même façon que précédemment, vous pouvez réaliser un diagramme en barres en sélectionnant soit la plage des occurences, soit celles de proportions.

> Réaliser les deux types de graphiques

### A FAIRE

> Reproduisez ces opérations pour les variables `sex` et `size` dans une nouvelle feuille à chaque fois

## Compléments

Compléter l'analyse à chaque variable non encore analysée.
