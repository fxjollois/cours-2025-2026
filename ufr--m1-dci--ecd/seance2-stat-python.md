---
layout: slides
---

class: middle, center, inverse, title
# Extraction de connaissances à partir de données structurées et non structurées

## Séance 2 : Statistiques sous Python

---
## Modules utiles

- [`numpy`](https://numpy.org) : calcul scientifique
- [`scipy`](https://scipy.org) : extension de `numpy`
- [`matplotlib`](https://matplotlib.org) : visualisation
- [`pandas`](https://pandas.pydata.org) : manipulation de données
- [`seaborn`](https://seaborn.pydata.org) : visualisation statistique de données

.footnote[.small[La dernière ligne permettra de voir le résultat des graphiques dans le document.]]

```python
import matplotlib.pyplot
import scipy.stats
import numpy
import pandas
import seaborn

%matplotlib inline
```

---
## Données

- Données [`tips`](https://fxjollois.github.io/donnees/tips.csv) : informations [ici](https://www.rdocumentation.org/packages/reshape2/versions/1.4.2/topics/tips)

```python
tips = pandas.read_csv("https://fxjollois.github.io/donnees/tips.csv", header = 0, sep = ",")
```

| Fonction | Commentaire |
| :- | :- |
| `tips.head()`  | Premières lignes du tableau (5 par défaut) |
| `tips.shape`   | Nombre de lignes et de colonnes |
| `tips.count()` | Nombre de valeurs non nulles pour chaque colonne |
| `tips.info()`  | Combinaisons de plusieurs infos |
| `tips.columns` | Noms des colonnes |
| `list(tips)`   | Liste des noms de colonnes |

---
class: section

## Manipulation de données

Comment réaliser les opérations classiques en bases de données ? 

- Restriction
- Projection
- Tri et limitation des résultats
- Ajout de nouvelles variables (via des valeurs ou un calcul à partir des autres)
- Agrégats
- Modification de la forme du tableau de données
- Jointures (qui ne seront pas vues ici)
- Autres opérations, spécifiques à Python, pas vues ici

**Note Bene** : certaines fonctions renvoient un nouvel objet qu'il faudra donc stocker dans une variable (nouvelle ou la même). Par contre, d'autres fonctions modifient directement l'objet en question.


---
## Restriction

- Sélectionner un certain nombre de lignes de la table, selon une condition 
- Fonction `query()`
    - Paramètre : une chaîne de caractères contenant la condition à appliquer

```python
tips.query('total_bill > 48') # que les factures de plus de 48
tips.query('day.isin(("Sat", "Sun"))') # que les factures ayant eu lieu un samedi ou un dimanche
tips.query('size > 4 & sex == "Male"') # que les tables de plus de 4 convives et payées par un homme
```

Possibilité de faire référence à une variable avec `@`

```python
a = 48
tips.query("total_bill > @a") # idem première ligne ci-dessus
```

---
## Projection

- Sélectionner certaines colonnes de la tables
- Fonction `filter()` : 
    - Paramètre `items` : liste des noms à garder
    - Paramètre `axis` : axe à regarder (colonne ou ligne - colonne par défaut pour `DataFrame`)
    - Paramètre `like` : comparaison à une chaîne
    - Paramètre `regex` : utilisation d'[expressions régulières](https://fr.wikipedia.org/wiki/Expression_régulière)

```python
tips.filter(["sex", "total_bill"]) # que sex et total_bill donc
tips.filter(like = "ti") # que les variables ayant "ti" dans leur nom
tips.filter(regex="t.*i") # que les variables ayant la lettre "t" puis la lettre "i" (avec ou sans caractères entre)
```

Possibiltié de supprimer les doublons avec `drop_duplicates()`

```python
tips.filter(["sex", "smoker"]).drop_duplicates()
```

---
## Tri et limitation des résultats

- Tri : Fonction `sort_values()`
    - Paramètre : la ou les variables à utiliser 
    - Tri descendant : valeur du paramètre `ascending=False` (`True` par défaut)

```python
tips.sort_values(by = "total_bill") # Tri par total croissant
tips.sort_values(by = "total_bill", ascending = False) # Tri décroissant
tips.sort_values(by = ["smoker", "total_bill"], ascending = [True, False]) # Tri avec smoker croissant et total décroissant
```

- Limite aux premières (resp. dernières) lignes : Fonction `head()` (resp. `tail()`)
    - Paramètre indiquant la taille à afficher (5 par défaut)

```python
tips.head() # 5 premières lignes par défaut
tips.head(10) # 10 premières lignes
tips.tail(3) # 3 dernières lignes
```

---
## Ajout de nouvelles variables

- A partir de valeurs déjà connues
    - En en donnant autant que de lignes ou une seule (qui sera donc la même pour toutes les lignes)
    - `DataFrame` modifié directement
```python
tips['n_row'] = range(244)
tips['nouv'] = "nouvelle valeur"
```

- A partir d'un calcul basé sur les autres variables : Fonction `assign()`
    - Renvoie d'un `DataFrame` modifié (original non modifié)

```python
# attention ici, l.size ferait référence à la taille de l, car c'est un mot clé de python
tips.assign(per_person = lambda l: round(l.total_bill / l['size'], 2)) 
```

---
## Agrégat

- Calcul d'une statistique globale de base : Fonction `aggregate()` (ou `agg()`)
    - Dénombrement, somme, moyenne, minimum, maximum
    - Si un seul calcul : directement les fonctions associées

```python
tips.filter(["total_bill", "tip", "size"]).aggregate(["count", "mean"])
tips.filter(["total_bill", "tip", "size"]).mean()
```

- Pour le faire pour chaque modalité d'une variable : Fonction `groupby()`

```python
tips.filter(["sex", "total_bill", "tip", "size"]).groupby("sex").mean()
```

- Plusieurs variables possibles dans le regroupement
    - Calcul pour chaque couple de modalités de celles-ci

```python
tips.filter(["sex", "smoker", "total_bill", "tip", "size"]).groupby(["sex", "smoker"]).mean()
```

---
## Modification du format d'un data frame (reshaping)

- Tableaux souvent présentés sous la forme individus x variables
-  Parfois, utile (voire nécessaire) de modifier, via une *pseudo-rotation*, en un tableau avec 
    - Colonne (ou plusieurs) indiquant l'individu concerné
    - Colonne indiquant la variable
    - Colonne avec la valeur de celle-ci
- Fonction `melt()` 
    - Ici, utilisation du numéro de ligne `n_row` car pas d'identifiant unique par ligne

```python
tips2 = tips.melt(id_vars = "n_row")
```

- Opération inverse possible avec la fonction `pivot()`

```python
pandas.pivot(tips2, index = "n_row", columns = "variable", values = "value")
```

---
class: section

## Statistiques descriptives 

- Univarié
    - Quantitative
    - Qualitative
- Bivarié
    - Quanti - quanti
    - Quali - quali
    - Quali - quanti
    
> Représentations numériques et graphiques

---
## Quantitative

- Fonction `describe()` pour décrire toutes les variables quantitatives

```python
tips.describe()
tips.describe().round(2)
```

- Sur une seule variable 

```python
tips.total_bill.describe()
tips["total_bill"].describe()
tips.total_bill.mean()
tips.total_bill.std()
tips.total_bill.var()
tips.total_bill.min()
tips.total_bill.max()
tips.total_bill.median()
tips.total_bill.quantile([.01, .1, .9, .99])
```

- Test de normalité

```python
scipy.stats.normaltest(tips.total_bill)
scipy.stats.shapiro(tips.total_bill)
```

---
## Histogramme 

- `pandas` : Fonction `hist()` ou `plot()` avec `kind="hist"`

```python
tips.total_bill.hist()
tips.total_bill.hist(bins = 20)
tips.total_bill.plot(kind = "hist")
tips.total_bill.plot(kind = "hist", density = True)
tips.total_bill.plot(kind = "kde")

# A mettre ensemble pour avoir densité + histogramme sur le même graphique
tips.total_bill.plot(kind = "hist", density = True, color = "lightgrey")
tips.total_bill.plot(kind = "kde")
```

- `seaborn`: Fonction `hisplot()`

```python
seaborn.histplot(tips.total_bill)
seaborn.histplot(data = tips, x = "total_bill")
seaborn.histplot(data = tips, x = "total_bill", bins = 20)
seaborn.histplot(data = tips, x = "total_bill", bins = [0, 10, 25, 60], stat = "density")
seaborn.histplot(data = tips, x = "total_bill", kde = True)
```

---
## Boîtes à moustaches

- `pandas` : Fonction `boxplot()`

```python
tips.boxplot()
tips.boxplot(column = "total_bill")
tips.boxplot(column = "total_bill", grid = False)
```

- `seaborn` : Fonction `boxplot()`

```python
seaborn.boxplot(x = "total_bill", data = tips)
seaborn.boxplot(y = "total_bill", data = tips)
seaborn.boxplot(x = "total_bill", data = tips, whis = 3)
```

- Autres représentations via `seaborn`

```python
seaborn.pointplot(x = "total_bill", data = tips)
seaborn.violinplot(x = "total_bill", data = tips)
seaborn.stripplot(x = "total_bill", data = tips, jitter = True)
```

---
## Qualitative

- Plusieurs façons 
    - Table d'occurences (ou des effectifs)
    - Table des proportions 

```python
tips.sex.describe()
tips.sex.unique()
tips.sex.value_counts()
pandas.crosstab(tips.sex, "freq")
pandas.crosstab(tips.sex, "freq", normalize = True) # Proportion
```

- Test d'équi-probabilité

```python
t = pandas.crosstab(tips.sex, "freq", normalize=True)
scipy.stats.chisquare(t.freq)
```

- Test de comparaison à une distribution connue

```python
scipy.stats.chisquare(t.freq, (.2, .8))
```

---
## Diagramme en barres

- `pandas` : Fonction `bar()` ou type `"bar"` pour `plot()`
    - Calculs de proportions préférables parfois

```python
t = pandas.crosstab(tips.sex, "freq")
t.plot.bar()
t.plot(kind = "bar")

# En proportion
t = pandas.crosstab(tips.sex, "freq", normalize=True)
t.plot(kind = "bar")
# En pourcentage
(t * 100).plot(kind = "bar")
```

- `seaborn` : Fonctions `countplot()` ou `barplot()`

```python
seaborn.countplot(x = "sex", data = tips)

# En pourcentage
t = pandas.crosstab(tips.sex, "freq", normalize=True)
t = t.assign(sex = t.index, freq = 100 * t.freq)
seaborn.barplot(x = "sex", y = "freq", data = t)
```

---
## Diagramme circulaire

- `pandas` : Fonction `plot.pie()`

```python
t = pandas.crosstab(tips.sex, "freq")
t.plot.pie(subplots = True, figsize = (6, 6))
```

- Pas en `seaborn`

---
## Quantitative - quantitative

```python
tips.corr()
tips.total_bill.cov(tips.tip)
tips.total_bill.corr(tips.tip)
```

- Test de corrélation : Pearson

```python
scipy.stats.pearsonr(tips.total_bill, tips.tip)
```

- Test de corrélation : Kendall

```python
scipy.stats.kendalltau(tips.total_bill, tips.tip)
```

---
## Nuage de points

- `pandas` : Fonctions `plot.scatter()` et `scatter_matrix()`

```python
tips.plot.scatter("total_bill", "tip")
pandas.plotting.scatter_matrix(tips)
````

- `seaborn` : Fonctions `jointplot()`, `regplot()` (ou `lmplot()`) et `pairplot()`

```python
seaborn.jointplot(x = "total_bill", y = "tip", data = tips)
seaborn.jointplot(x = "total_bill", y = "tip", data = tips, kind = "reg")
seaborn.jointplot(x = "total_bill", y = "tip", data = tips, kind = "hex")
seaborn.jointplot(x = "total_bill", y = "tip", data = tips, kind = "kde")

seaborn.regplot(x = "total_bill", y = "tip", data = tips)
seaborn.regplot(x = "total_bill", y = "tip", data = tips, fit_reg = False)
seaborn.regplot(x = "total_bill", y = "tip", data = tips, scatter = False)

seaborn.pairplot(data = tips, vars = ["total_bill", "tip", "size"])
```

---
## Qualitative - qualitative

- Table de contingence

```python
pandas.crosstab(tips.sex, tips.smoker)
pandas.crosstab(tips.sex, tips.smoker, margins = True)
pandas.crosstab(tips.sex, tips.smoker, normalize = True)
```

- Profils lignes et profils colonnes

```python
pandas.crosstab(tips.sex, tips.smoker, normalize = "index")
pandas.crosstab(tips.sex, tips.smoker, normalize = "index", margins = True)

pandas.crosstab(tips.sex, tips.smoker, normalize = "columns")
pandas.crosstab(tips.sex, tips.smoker, normalize = "columns", margins = True)
```

- Test du chi2

```python
t = pandas.crosstab(tips.sex, tips.smoker)
scipy.stats.chi2_contingency(t)
```

---
## Diagramme en barres

- `pandas` 

```python
t = pandas.crosstab(tips.sex, tips.smoker)
t.plot.bar()

t = pandas.crosstab(tips.sex, tips.smoker, normalize=True)
t.plot.bar()

t = pandas.crosstab(tips.sex, tips.smoker, normalize="index")
t.plot.bar(stacked=True)

t = pandas.crosstab(tips.sex, tips.smoker)
t.plot.pie(subplots=True, figsize = (12, 6))
```

- `seaborn`

```python
seaborn.countplot(x = "sex", hue = "smoker", data = tips)

t = pandas.crosstab(tips.sex, tips.smoker, normalize = "columns")
t = t.assign(sex = t.index)
tm = pandas.melt(t, id_vars = "sex")
tm = tm.assign(value = 100 * tm.value)
seaborn.catplot(x = "sex", y = "value", col = "smoker", data = tm, kind = "bar")
```

---
## Qualitative - quantitative

- Calcul des moyennes par modalités

```python
tips.groupby("sex").mean()
tips.groupby("sex")["total_bill"].agg([numpy.mean, numpy.std, numpy.median, numpy.min, numpy.max])
```

- Test de Student (ou ANOVA)

```python
billFemale = tips.total_bill[tips.sex == "Female"]
billMale = tips.total_bill[tips.sex == "Male"]
scipy.stats.ttest_ind(billFemale, billMale)

billGrouped = [tips.total_bill[tips.sex == s] for s in list(tips.sex.unique())]
scipy.stats.f_oneway(*billGrouped)
```

---
## Représentations graphiques

- `pandas` :

```python
tips.hist(column = "total_bill", by = "sex")
tips.boxplot(by = "sex")
tips.boxplot(column = "total_bill", by = "sex") 
```

- `seaborn` :

```python
p = seaborn.FacetGrid(tips, row = "sex")
p.map(seaborn.distplot, "total_bill")

seaborn.catplot(x = "sex", y = "total_bill", data = tips, kind = "box")
seaborn.catplot(x = "sex", y = "total_bill", data = tips, kind = "point", join = False)
seaborn.catplot(x = "sex", y = "total_bill", data = tips, kind = "violin")
seaborn.catplot(x = "sex", y = "total_bill", data = tips, kind = "strip")
```

---
## Compléments sur `seaborn`

- Fonction `catplot()` permettant d'en faire plusieurs

```python
seaborn.catplot(y = "total_bill", data = tips, kind = "box")
seaborn.catplot(x = "total_bill", data = tips, kind = "point")
seaborn.catplot(x = "total_bill", data = tips, kind = "violin")
seaborn.catplot(x = "total_bill", data = tips, kind = "strip", jitter = True)
seaborn.catplot(x = "sex", data = tips, kind = "count")
seaborn.catplot(x = "sex", hue = "smoker", data = tips, kind = "count")
seaborn.catplot(x = "sex", col = "smoker", data = tips, kind = "count")
```

- Représentation de 3 variables quantitatives

```python
t = pandas.crosstab(pandas.cut(tips.total_bill, bins = 6),
                    tips["size"],
                    values = tips.tip, aggfunc = numpy.mean)
seaborn.heatmap(t)
```

- Représentation de 2 variables quantitatives avec 1 qualitative

```python
seaborn.lmplot(x = "total_bill", y = "tip", hue = "sex", col = "sex", data = tips)
```

---
## Compléments sur `seaborn`

- Représentation d' 1 variable quantitative et de 2 variables qualitatives

```python
p = seaborn.FacetGrid(tips, row = "sex", col = "smoker")
p.map(seaborn.histplot, "total_bill")

seaborn.catplot(x = "sex", y = "total_bill", hue = "smoker", data = tips, kind = "box")
seaborn.catplot(x = "sex", y = "total_bill", hue = "sex", col = "smoker", data = tips, 
                   kind = "point", join = False)
seaborn.catplot(x = "sex", y = "total_bill", hue = "smoker", data = tips, kind = "violin")

seaborn.catplot(x = "sex", y = "total_bill", hue = "smoker", col = "smoker", data = tips, 
                   kind = "strip", jitter = True)
```

- Représentation de 3 variables qualitatives

```python
seaborn.catplot(x = "sex", row = "smoker", col = "time", data = tips, kind = "count")

seaborn.catplot(x = "sex", hue = "smoker", col = "time", data = tips, kind = "count")

t = pandas.crosstab([tips.smoker, tips.time], tips.sex, normalize = "index")
t = t.reset_index().assign(smoker_time = lambda x: x.smoker + "_" + x.time).drop(columns = ["smoker", "time"])
tm = pandas.melt(t, id_vars = "smoker_time")
tm = tm.assign(value = 100 * tm.value)
seaborn.catplot(x = "smoker_time", y = "value", hue = "sex", data = tm, kind = "bar")
```

---
## Compléments sur `seaborn`

- Possibilité de personnaliser le graphique de différentes façons
- Accès via 
    - des paramètres de la fonction, 
    - l'objet renvoyé par la fonction utilisée pour créer le graphique, 
    - le module directement (changements pour les graphiques futurs aussi)
- Quelques exemples
    - `suptitle` dans `fig` : titre global
    - `set_axis_labels` : titre des axes
    - `palette` : choix d'une palette de couleurs
    - `size` et `aspect` : hauteur et ratio entre hauteur et largeur, pour chaque facette (une seule ici)

```python
seaborn.set_style("white")
p = seaborn.catplot(x = "size", y = "tip", hue = "sex", data = tips, kind = "box", palette = "Set2", height = 4, aspect = 2)
p.fig.suptitle("Taille et pourboire en fonction du sexe")
p.set_axis_labels("Nombre de convives", "Pourboire")
```

---
## Exercice 

### Données AirBnB - Paris

- Site [InsideAirBnB](http://insideairbnb.com/get-the-data) : logements proposés sur AirBnB
    - Snapshots sur une journée spécifique
    - Dans certaines villes du monde entier
    - Ensemble de variables expliquées sur [cette page](https://docs.google.com/spreadsheets/d/1iWCNJcSutYqpULSQHlNyGInUvHg2BoUGoNRIGa6Szc4/edit#gid=1938308660).
    
- Données sur Paris :
    - 6 septembre 2024
    - Fichier [listings.csv](https://data.insideairbnb.com/france/ile-de-france/paris/2024-09-06/visualisations/listings.csv) 

---
## Réaliser les étapes suivantes

- Récupérer les données dans un `DataFrame`
- Donner le nombre de logements total
- Lister les différentes valeurs que prend la variable `neighbourhood`
- Lister les différentes valeurs que prend la variable `room_type`
- Donner les 3 arrondissements avec le plus de logements
- Donner les 3 arrondissements pour lesquels le prix est le plus élevé
- Décrire les variables `price`, `number_of_reviews` et `reviews_per_month`
- Décrire les variables `room_type` et `neighboorhood`
- Décrire le lien entre `price` et `room_type`
- Décrire le lien entre `price` et `neighboorhood`
- Décrire le lien entre `room_type` et `neighboorhood`
- Représenter les logements dans un nuage de points, en mettant une couleur par `neighboorhood`
- Ajouter l'information sur `price` pour chaque point dans ce graphique

