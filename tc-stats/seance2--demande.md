# Statistiques descriptives sur tableur - Bivarié

Nous allons continuer de travailler sur les données contenu dans le fichier `tips`, dont voici les versions initiales si besoin :

- [Format Excel](tips.xlsx)
- [Format Libre Office](tips.ods) (Téléchargement de [LibreOffice](https://fr.libreoffice.org/download/telecharger-libreoffice/))
- [Format Numbers](tips.numbers)

> Nota Bene : les noms des fonctions dans ce document sont valables dans **Libre Office**. Il est possible que certains soient différents dans les autres tableurs (me demander si cela ne fonctionne pas dans votre outil).

## Analyse du lien entre deux variables quantitatives

### Partie numérique

- Créer une nouvelle feuille (que vous nommerez `montant-tip` par exemple)
- En case `A1`, écrivez *Lien entre montant et pourboire* (et mettez en gras)
- En case `A3`, écrivez *Corrélation* et en case `A4` la formule suivante :
    - Excel : `=COEFFICIENT.CORRELATION(tips!A:A;tips!B:B)`
    - LibreOffice : `=COEFFICIENT.CORRELATION(tips.A:A;tips.B:B)`

### Création du nuage de points

- Excel :
    - Cliquez sur *Insertion* -> *Nuage de points*
    - Cliquez sur *Sélectionner des données*
    - Ecrivez `tips!A:B`
- LibreOffice :
    - Cliquez sur *Insertion* -> *Diagramme*
    - Choississez *XY (Dispersion)*
    - Dans la partie *Plage de données*, écrivez `tips.A:B` et choisir *Séries de données en colonnes*

> On obtient notre nuage de points

### A FAIRE

> Réaliser le nuage de points avec le nombre de convives à la table (`size`) en X et le montant payé en Y dans une nouvelle feuille


## Analyse du lien entre deux variables qualitatives

### Partie numérique

Nous pourrions faire comme précédemment, mais cela prendrait du temps et ne serait pas automatique (en cas d'ajout d'une modalité - un jour de la semaine par exemple). Nous allons utiliser une fonctionnalité très utile des tableurs, à savoir le *Tableau Croisé Dynamique* ou la *Table Dynamique* (dénomination différente selon le talbeur utilisé).

- Dans la feuille `tips`, sélectionnez les colonnes `A` à `G`
- Dans le menu, choississez *Insertion* -> *Table Dynamique*
- Cliquez sur *OK* (on va garder la sélection déjà faite)
- Glissez-déplacez `day` dans l'espace *Champs de ligne* et `sex` dans *Champs de colonnes*
- Dans le *Champs de données*, on peut choisir `total_bill` par exemple. Vous voyez que par défaut, l'opération associé est la *Somme*. 
- Pour avoir le nombre de valeurs, effectuez les opérations suivantes selon l'outil :
    - LibreOffice : Double-cliquez sur *Somme - total_bill* et sélectionnez *Nombre* (puis *OK*)
    - Excel : Cliquez sur *Somme - total_bill* et sélectionnez *Paramètres de valeurs*, puis choisissez *Nombre* (puis *OK*)
- Cliquez sur *OK*

> Dans une nouvelle feuille, nous avons maintenant la table de contingence entre le jour de la semaine et le sexe de la personne qui paie la note.

Dans ce tableau, on a même un filtre automatique sur chaque variable (en ligne et en colonne).

Renommez cette feuille en lui donnant le titre `jour-sexe` par exemple.

### Création des profils lignes

Si nous souhaitons avoir les profils lignes, nous pouvons changer le mode de calcul sur *total_bill*, en réalisant les opérations suivantes :

- Clic droit dans le tableau dynamique
- Dans *Champs de données*, double-cliquez sur *Compter - total_bill*
- Cliquer sur le + de *Valeur affichée*
- Choisissez *% de la ligne* et cliquez sur *OK*, puis *OK* encore

> On remarque qu'ainsi, en général (ligne du bas), la répartition est 1/3 des notes payées par des femmes et 2/3 payées par des hommes. Par contre, on remarque de grosses différences entre les jours de la semaine : la semaine, c'est 50-50, alors que le week-end (particulièrement le dimanche) c'est 3 fois sur 4 un homme qui paie.

### Création du diagramme en barres empilées

- Sélectionnez une des cellules du premier tableau créé (la table dynamique donc)
- Insérez un diagramme
- Choississez le diagramme en barres empilées (à 100%) indiqué tout à droite
- Cliquez sur *OK*

> Vous avez un diagramme en barres empilées à 100% permettant de bien comparer les jours de la semaine entre eux.

### A FAIRE

> Faire les profils colonnes

> Analyser le lien entre le jour de la semaine et l'heure (`time`) d'une part, et entre le sexe et la présence de fumeurs à la table d'autre part.

## Analyse du lien entre une variable qualitative et une variable quantitative

### Partie numérique

Si vous avez fait attention, la *table dynamique* nous laisse la possibilité de calculer une moyenne dans chaque cellule.

- Créez une *table dynamique* de la même façon que précédemment
- Glissez `day` dans *Champs de ligne* et `total_bill` dans *Champs de données*
- Double-cliquez sur *Somme - total_bill* et choisir *Moyenne*
- Cliquez sur *OK*

> On a les moyennes des montants payés par jour de la semaine.

Renommez la feuille en `jour-montant` par exemple.

### Partie graphique

Nous ne pouvons malheureusement pas faire de boîtes à moustaches. Toutefois, nous pouvons réaliser un diagramme en barres (plutôt horizontales) permettant de voir la différence entre les jours de la semaine.

- Sélectionnez une des cellules de la table dynamique et insérer un diagramme
- Choississez *Barre*
- Cliquez sur *Terminer*

> Ce graphique n'est pas correct statistiquement, mais permet tout de même de représenter la différence des moyennes entre les jours de la semaine

### A FAIRE

> Analyser le lien entre le sex et le pourboire d'une part, et entre le jour de la semaine et le nombre de convives

## Compléments

Regarder tous les liens possibles avec le montant d'une part, et avec le pourboire d'autre part.
