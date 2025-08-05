---
layout: slides
---

class: middle, center, inverse, title
# Extraction de connaissances à partir de données structurées et non structurées

## Séance 1 : Introduction à Python

---
## Introduction à Python

Langage de programmation en pleine croissance dans le domaine de la **Data Science** et du **Big Data**

### Eléments de base

- Utilisation en mode console : Langage scripté (comme R, bash, SQL...)
- Exécuter les commandes les unes après les autres
- Possible (et recommandé) d'écrire son script dans un fichier texte (souvent avec l'extension `.py`) et de l'exécuter via `execfile()`
- Aide d'une fonction avec la fonction `help()`
    - Eventuellement en paramètre une fonction ou une chaîne de caractère
    - Si pas de paramètre, aide interactive.

---
## Notebook

Module `jupyter` : travail avec des `notebooks`

- Documents contenant à la fois le code, les résultat et du texte
- D'abord installer le module dans python, avec la commande `pip3` dans un terminal de commande.
```bash
pip3 install jupyter
```

- Une fois le module installé, il est possible de lancer le serveur jupyter avec la commande suivante, à faire dans un terminale de commande.
```bash
jupyter notebook
```
- Appuyer sur `Ctrl` + `C` pour stopper le processus.

---
## Types de données

- Plusieurs types possibles pour les données
    - Exécuter les commandes dans une console pour voir le résultat
    - Commande `type(exp)` permet de connaître son type (variable ou valeur)

| type | valeur | type() | commentaires |
|-|-|-|-|
| entier	| `1`	| `int`	| 
| réel	| `1.234`	| `float` | 	
| chaîne de caractères	| `"un mot"`	| `str`	| on peut utiliser indifférement "" ou '' | 
| liste	| `[1, 2]`	| `list`	| chaque élément peut être différent des autres | 
| tuple	| `(1, 2)`	| `tuple`	| similaire à une liste mais constante| 
| dictionnaire	| `{"a": 1, "b": "deux"}`	| `dict`	| ensemble de valeurs quelconques nommées| 

---
## Types de données - compléments

- Tuples, lists et les dicts peuvent s'imbriquer les uns dans les autres. Voici quelques exemples d'imbrication :

```python
(1, (2, 3), [4, 5], {"a": 1, "b": "deux"})
[1, [2, 3], (4, 5), {"a": 1, "b": "deux"}]
{"a": 1, "b": "deux", "c": (5, 6), "d": [7, 8]}
```

- Passage d'un type à l'autre
    - Fonctions permettant de passer d'un type à l'autre (quand cela est possible) : `int()`, `float()`, `str()`, `tuple()` et `list()`
    - Rigoureux dans l'évaluation des expressions : pas de cast automatique

- Quelques valeurs préféfinies
    - Valeurs prédéfinies, telles que `True` (vrai), `False` (faux) et `None` (donnée absente)

---
## Création et suppression de variables

- Pas de mot-clé pour la définition d'une variable : définie/créée lors de sa première affectation
    - Si n'existe pas mais utilisation : message d'erreur apparaît
    - Possible de la supprimer via la fonction `del()`
- **Type dynamique**
    - Type dépend uniquement de la valeur de son affectation
    - Exemple simple de ce phénomène :
```python
a = 1
print(a) # -> 1
type(a)  # -> int
```
```python
a = "deux"
print(a) # -> "deux"
type(a)  # -> str
```
    - Variable `a` passée du type `int` au type `str` : **Attention** lors de l'écriture de ses programmes
    
---
## Affichage

- Fonction `print()` : afficher du texte et/ou le contenu des variables dans la console
    - Paramètre `sep`: caractère(s) séparant les champs (un espace `" "` par défaut)
    - Paramètre `end`: caractère de fin de ligne (retour à la ligne `"\n"` par défaut).

```python
a = 1.234
print("Bonjour")
print("a =", a)
print("a", a, sep = "=")
print("a=", end = "") # permet de ne pas revenir à la ligne 
print(a) # la valeur s'affiche donc à la suite de la ligne précédente 
```
    
---
## Opérateurs
Il existe bien évidemment tous les opérateurs classiques, tels que présentés ci-dessous.

| Type	| Opérateurs| 
| - | - | 
| Arithmétiques	| `+`, `-`, `*`, `/`, `//`, `%`, `**`|
| Comparaisons	| `>`, `>=`, `<`, `<=`, `==`, `!=`| 
| Booléens	| <code>&#124;</code>, `&`, `not()`| 
    
---
## Eléments de langage

- Création d'objets
- Traitement conditionnel
- Traitement itératif
    - classique
    - sur les tuples, listes et dictionnaires
- Fonctions
- Utilisation de fichiers

> Exécuter les exemples vous mêmes pour mieux comprendre

---
## Création et manipulations d'objets - Chaînes

- Chaîne de caractère : quotes simples (`''`) ou doubles (`""`)
    - Par défaut, simples quotes
    - En présence d'une apostrophe dans la chaîne, déclarer avec des doubles quotes
- Longueur de la chaîne avec la fonction `len()`

```python
"bonjour"
'bonjour'
"aujourd'hui"
a = 'bonjour'
len(a)
```

---
## Création et manipulations d'objets - Chaînes

- Sous-chaînes : indexation en séquence python
- Premier caractère en position 0
- Séquence par défaut est par pas de 1 (par exemple, 1:5 renvoie les positions 1, 2, 3, 4, 5)
    - Sans le premier (ou le dernier), début (ou fin) de la chaîne
    - Paramètre à la séquence, permettant de jouer sur le pas entre les valeurs de la séquence
  
```python
a = 'bonjour'
a[1:5]
a[0:3]
a[:3]
a[3:len(a)]
a[3:]
a[::]
a[::-1]
a[::2]
a[1:5:2]
a[5:1:2]
```

---
## Création et manipulations d'objets - Chaînes

- Changement de casse : `upper()` ou `lower()`
- Mise en majuscule des premières lettres de chaque mot : `capitalize()`
- Recherche d'une sous-chaîne : `find()` - première occurence
- Remplacement d'une sous-chaîne : `replace()`
- Dénombrement de sous-chaînes : `count()`
- Découpage en sous-chaînes selon un caractère : `split()`

```python
a = 'bonjour'
a.upper()
a.capitalize()
a.find('j')
a.replace('jour', 'soir')
a.count('o')
a.split('j')
```

---
## Tuples

- Ensemble déclaré via des `()`
    - Composé de valeurs pas forcément de même type et éventuellement complexe (*i.e.* tuples, listes ou dictionnaires)
    - **Non modifiable** : constante.

```python
a = (3, 1, 9, 7)
print(a)
a[0]
```

- Possible d'utiliser les mêmes outils d'indexation en séquence vu pour les chaînes

    
---
## Listes

- Ensemble déclarée via des `[]`
    - Composé d'éléments pas forcément tous du même type et possiblement complexe (*i.e.* tuples, listes ou dictionnaires)
    - A la différence d'un tuple, une liste est modifiable
    
```python
a = [3, 1, 9, 7]
print(a)
len(a)
a[0]
a[1:3]
```

- Possible d'utiliser les mêmes outils d'indexation en séquence vu pour les chaînes

---
## Listes - Fonctions

- **Toutes ces fonctions modifient directement la liste**
- Inverser la liste : `reverse()`
- Tri de la liste : `sort()` (avec option `reverse=True` pour tri décroissant)
- Récupérer (et supprimer de la liste) le dernier élément : `pop()`
- Ajouter un élément à la fin : `append()`
- Insérer un élément dans la liste : `insert()` (position + valeur)
- Supprimer des valeurs passées: `remove()` (celles passées en paramètres)

```python
a = [3, 1, 9, 7]
a.reverse()
a.sort()
a.sort(reverse=True)
a.pop()
a.append(5)
a.insert(0, 6)
a.remove(7)
```

.footnote[.small[Afficher la liste `a` pour voir le résultat de la fonction]]

---
## Listes - Opérateurs

- Concaténation de deux listes : `+`
- Répétition d'une liste : `*`

```python
a = [3, 1, 9, 7]
a + [1, 2]
a * 2
```

- Mécanisme spécifique: *list comprehension* (fonctionnant aussi sur les chaînes et les tuples)
    - Récupérer les valeurs (ou un calcul sur chaque valeur) pour tous les éléments de la liste (ou certains si on applique un `if`)

```python
a = [3, 1, 9, 7]
[x**2 for x in a]
[x**2 for x in a if x >= 4]
[x**2 if x >= 4 else -x for x in a]
```

---
## Listes - Passage de référence

**Attention** : passage de référence lorsqu'on copie une liste

- Si modification d'une, alors modification de l'autre
```python
a = [1, 2, 3, 4]
b = a
a[0] = 5
b[1] = 9
print(a, b)
```

- Duppliquer la liste : `copy()`
```python
a = [1, 2, 3, 4]
b = a.copy()
a[0] = 5
b[1] = 9
print(a, b)
```
    
---
## Dictionnaires

- `dict` : listes nommées définies via des `{}`
    - ensemble de couples clé/valeur (ou champs/valeur)
    - éléments pas forcément tous du même type, et potentiellement complexe (*i.e* tuples, listes ou dictionnaires)

```python
a = { 
    "nom": "Jollois", 
    "prenom": "FX", 
    "langues": ["R", "Python", "SQL", "SAS"], 
    "labo": { "nom": "LIPADE", "lieu": "CUSP"}
}
print(a)
len(a)
```
    
---
## Dictionnaires - Accès aux éléments

- Utilisation de la clé pour accéder à la valeur

```python
a = { 
    "nom": "Jollois", 
    "prenom": "FX", 
    "langues": ["R", "Python", "SQL", "SAS"], 
    "labo": { "nom": "LIPADE", "lieu": "CUSP"}
}
a["nom"]
a["langues"]
a["langues"][0]
a["labo"]
a["labo"]["lieu"]
```

---
## Dictionnaires - Fonctions

- Récupérer la valeur d'une clé : `get()`
- Liste des clés : `keys()`
- Valeurs dans le même ordre que `keys()`: `values()`
- Récupérer le dernier item (en le supprimer du dictionnaire) : `popitem()`
- Récupérer un item (en le supprimant du dictionnaire aussi) : `pop()`

```python
a = { 
    "nom": "Jollois", 
    "prenom": "FX", 
    "langues": ["R", "Python", "SQL", "SAS"], 
    "labo": { "nom": "LIPADE", "lieu": "CUSP"}
}
a["type"] = "MCF"
a.get("nom")
a.keys()
a.values()
a.popitem()
a.pop("nom")
```

.footnote[.small[Afficher le dictionnaire `a` pour voir le résultat des deux dernières fonctions aussi]]

---
## Dictionnaires - Passage de référence

- Idem que pour les listes, **attention**
```python
a = { "nom": "Jollois", "prenom": "FX" }
b = a
b["prenom"] = "Xavier"
print(a, b)
print(a)
```

- Fonction `copy()` : copie indépendante de l'objet initial
```python
a = { "nom": "Jollois", "prenom": "FX" }
b = a.copy()
b["prenom"] = "FX"
print(a, b)
```

---
## Dictionnaires - *dict comprehension*

- Identique au mécanisme de *list comprehension* (avec `if` et `else` si besoin)
- Dans ce cas, utiliser deux variables : clé et sa valeur
```python
fruits = ["pommes", "bananes", "poires", "oranges"]
nombres = [5, 2, 10, 4]
{fruits[i]:nombres[i] for i in range(4)}
```

- Fonction `dict()` appliquée sur le résultat de `zip()` des deux listes :  même résultat.
```python
fruits = ["pommes", "bananes", "poires", "oranges"]
nombres = [5, 2, 10, 4]
dict(zip(fruits, nombres))
```    

---
## Traitement conditionnel - `if`

- Avec `if`, `else` et `elif`
- Indentation pour indiquer que les expressions sont dans le bloc
- Pas de `switch` ou `case`

```python
a = 3
if (a > 2):
    print("sup")
```

```python
if (a > 2):
    print("dans le IF")
    print("sup")
```

```python
if (a > 2):
    print("sup")
elif (a > 0):
    print("mid")
else:
    print("inf")
```
    
---
## Traitement itératif - `for`

- Boucle `for`
- Fonction `range()` pour avoir les valeurs entre 0 (par défaut) et la valeur passée en paramètre -1
    - Si deux paramètres : du premier paramètre au deuxième - 1
    - Si trois paramètres : définition du pas
- `i` persistant à la boucle (garde la dernière valeur)

```python
for i in range(5):
    print(i)

print("dernière valeur de i :", i)
```

| Exemple de `range()` | Valeurs prises |
|-|-|
| range(5) | 0, 1, 2, 3, 4 |
| range(5, 10) | 5, 6, 7, 8, 9 |
| range(5, 10, 2) | 5, 7, 9 |
| range(10, 5, -1) | 10, 9, 8, 7, 6 |

---
## Traitement itératif - `for`

- Possible d'utiliser une `list` ou un `tuple` 
    - Exemple : `for i in [4, 1, 10]` &#8594; 4, 1, 10
- En utilisant une chaîne de caractère, on peut naviguer dans celle-ci
    - Exemple : `for l in "Bonjour"` &#8594; "b", "o", "n", "j", "o", "u", "r"
- Mais en utilisant un groupe de chaîne (list ou tuple), on travaille sur les chaînes au complet.
    - Exemple : `for l in ("jour", "soir")` &#8594; "jour", "soir"
- Fonction `enumerate()` permet de récupérer à la fois les indices des valeurs et les valeurs
    - Exemple : `for i, x in enumerate([3, 1, 9, 4])`
        - `i` &#8594; : 0, 1, 2, 3
        - `x` &#8594; : 3, 1, 9, 4

---
## Traitement itératif - `for`

- Fonction `zip()` : travail sur plusieurs groupes de valeurs (ici deux listes)
    - Notez que cette fonction limite le résultat à la taille du plus petit groupe
    - Exemple : `for i, j in zip([3, 1, 9, 4], ["trois", "un", "neuf"])`
        - `i` &#8594; : 3, 1, 9
        - `j` &#8594; : "trois", "un", "neuf"
- Boucle sur un dictionnaire : prend les noms des champs
    - Exemple : `for i in { 0: "lundi", 1: "mardi", 6: "dimanche"}`
        - `i` &#8594; : 0, 1, 6

---
## Traitement itératif - `while`

- Boucle `while` : teste en début de boucle si une condition est toujours vérifiée
- A la fin, paramètre de test = première valeur à rendre la condition fausse
- Ici, `i += 1` raccourci pour `i = i + 1`

```python
i = 0
while i < 10:
    print(i)
    i += 1

print("Valeur de i :", i)
```    

---
## Fonctions

- Opérateur `def` pour la définir
- Procédure = fonction ne renvoyant rien
- Opérateur `return` indiquant le résultat à renvoyer 
- Bloc d'instructions défini selon l'indentation

```python
def pi():
    res = 3.141593
    return res

pi()
```

```python
def afficheBonjour():
    print("Bonjour")

afficheBonjour()
```

---
## Fonctions - Paramètres

- Possible de passer un paramètre à une fonction (ou plusieurs)
- Pas de type à définir
- Appel de la fonction sans valeur pour un paramètre défini = une erreur

```python
def afficheBonjour(nom):
    print("Bonjour", nom)

afficheBonjour("Jollois")
```


---
## Fonctions - Paramètres

- Si plusieurs paramètres, appel classique ou avec nommage des paramètres

```python
def afficheBonjour(nom, prenom):
    print("Bonjour", prenom, nom)

afficheBonjour("Jollois", "FX")
afficheBonjour(nom = "Jollois", prenom = "FX")
afficheBonjour(prenom = "FX", nom = "Jollois")
```

- Valeur par défaut pour un paramètre

```python
def afficheBonjour(nom, prenom = "?"):
    print("Bonjour", prenom, nom)

afficheBonjour("Jollois", "FX")
afficheBonjour("Jollois")
```

---
## Pureté d'une fonction

- Fonction dite pure si pas d'effet de bords lors de son appel
- `f1()` : variable locale `a` définie à partir du paramètre `a`, donc pas d'impact sur le `a` global &#8594; **pure**

```python
def f1(a):
    a = [b**2 for b in a]
    return a

a = list(range(5))
print(a, f1(a), a, sep = "\n")
```

- `f2()` : modification du paramètre `a` directement &#8594; **impure**

```python
def f2(a):
    for i in a:
        a[i] = a[i] ** 2
    return a

a = list(range(5))
print(a, f2(a), a, sep = "\n")
```
    
---
## Gestion des erreurs

- Usuel de gérer les erreurs d'exécution dans une fonction
- Opérateur `try`
    - premier bloc : code à exécuter normalement
    - bloc `except`: marche à suivre en cas d'erreur lors de l'exécution du bloc `try`
    - bloc `finally` : suite d'instructions à réaliser après la gestion de l'erreur (optionnel)

```python
def somme(v):
    try:
        res = sum(v)
    except:
        print("Erreur : somme impossible !")
        res = None
    finally:
        return res

a = somme([1, 3, 5])
print(a)
a = somme(["un", 3, 5])
print(a)
```
    
---
## Fonctions *high order* sur listes - `map()`

- Appliquer une fonction sur chaque élément d'une liste (ou d'un tuple)
- Renvoie un objet de type `map`, transformable en liste avec la fonction `list()`
    - Une fois celle-ci appliqué, l'objet renvoyé par `map()` est vide.

```python
def carre(v):
    return v ** 2

carre(5)
a = [13, 7, 2, 9, 1, 10, 6, 3, 8]
b = map(carre, a)
print(list(b))
print(list(b))
```
    
---
## Fonctions *high order* sur listes - `filter()`

- Filtrer les valeurs de la liste, en fonction du résultat de la fonction passée en paramètre
- Renvoie un objet de type `filter`, transformable en liste avec la fonction `list()`
    - Idem, une fois appliqué, objet vide

```python
def pair(v):
    return v%2 == 0

pair(5)
pair(8)
a = [13, 7, 2, 9, 1, 10, 6, 3, 8]
b = filter(pair, a)
print(list(b))
```
    
---
## Fonctions *high order* sur listes - `reduce()`

- Réduire une liste en une seule valeur, en combinant 2 à 2 les valeurs de la liste
- Contenue dans le module `functools`, qu'on importe via la commande `import`
- Fonction à passer en paramètre doit donc prendre deux valeurs et renvoyer une valeur de même type
- Possibilité d'ajouter une valeur initiale

```python
def regroupement(v1, v2): 
    return str(v1) + ", " + str(v2)

regroupement(3, 10)
a = [13, 7, 2, 9, 1, 10, 6, 3, 8]
import functools
b = functools.reduce(regroupement, a)
print(b)
b = functools.reduce(regroupement, a, "Ma liste est égale à : ")
print(b)
```
    
---
## Fonction anonyme

- Courant de passer en paramètre une fonction simple
- Mécanisme évitant la déclaration de la fonction avant : fonction anonyme, avec l'opérateur `lambda`
- Contrainte forte : doit tenir sur une seule ligne

```python
a = [13, 7, 2, 9, 1, 10, 6, 3, 8]
b = map(lambda v: v ** 2, a)
print(list(b))
```

- Possible d'ajouter une condition `if` (avec `else` si besoin)

```python
a = [13, 7, 2, 9, 1, 10, 6, 3, 8]
b = map(lambda v: v **2 if v > 8 else -(v ** 2), a)
print(list(b))
```
    
---
## Fichiers

- Module `os`: routines dédiés à la gestion des fichiers

```python
import os
```

- Connaître le répertoire courant

```python
os.getcwd()
```

- Changer le répertoire courant

```python
os.chdir("lien/vers/nouveau/repertoire")
```

- Accès aux fichiers 
    - Adressage absolu : chemin complet du fichier
    - Adressage relatif : chemin par rapport à un répertoire
    
---
## Lecture d'un fichier

- Fonction `open()` en mode lecture seule par défaut
- Objet renvoyé contient une fonction de lecture de toutes les lignes en une fois : `readlines()`
- Fermeture de la connexion au fichier, avec la fonction `close()`

.footnote[.small[Fichier [Iris.txt](https://fxjollois.github.io/donnees/Iris.txt) à télécharger et à placer dans le bon répertoire]]

```python
fichier = open("Iris.txt")
lignesBrutes = fichier.readlines()
fichier.close()
```
    
---
## Exercice

Fichier [Iris.txt](https://fxjollois.github.io/donnees/Iris.txt) : 150 iris, répartis en 3 espèces et décrits par 4 variables

.small[
0. Télécharger le fichier et importer les lignes dans python comme ci-dessus
1. Visualiser les 5 premières lignes
1. A partir de la liste de chaînes obtenue, créer une liste de 151 listes
    - Chaque sous-liste contiendra les 5 informations présentes sur chaque ligne (séparées par des `";"`)
    - Supprimer les quotes (`"'"`) et le caractère de fin de ligne (`"\n"`)
1. Créer une fonction permettant de transformer une chaîne en réel
    - si cette chaîne n'est pas transformable, renvoyer la telle quelle
1. Créer une liste de 150 dictionnaires
    - Chaque dictionnaire sera un iris, avec des champs nommés
    - Noms des variables sont dans le premier élément de la liste précédemment créée
    - Idéalement à faire en une fois avec des list comprehension
1. Calculer pour chaque iris le rapport entre la surface d'un pétale et la surface d'un sépale
1. Créer une sous-liste ne contenant que les iris setosa
1. Calculer la moyenne de chaque variable
1. Calculer la moyenne de chaque variable pour chaque espèce
]
