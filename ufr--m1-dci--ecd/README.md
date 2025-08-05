# Extraction de connaissances à partir de données structurées et non structurées

### M1 Informatique - Parcours DCI (Données, Connaissances, Intelligence)

1. [Introduction à Python](seance1-intro-python)
    - [correction](seance1-correction.html)

2. [Manipulation et Visualisation de données](seance2-stat-python)
    - [correction](seance2-correction.html)

3. [Représentation multidimensionnelle via l'ACP](seance3-acp.html)
    - [sous `python`](seance3-acp-python.html)
    - [correction `Wine`](seance3-correction-wine.html)
    - [correction `WGI`](seance3-correction-wgi.html)

4. [Représentation multidimensionnelle via l'AFC](seance4-afc.html)
    - [sous `python`](seance4-afc-python.html)
    - [correction](seance4-afc-correction.html)

5. [Application sur données réelles](seance5-donnees-reelles-1.html)
    - [correction `pendigits`](seance5-correctionA.html)
    - [correction `hadCRUT5`](seance5-correctionB.html)

6. [TP noté 1](seance6-tpnote1.html)

7. [Classification avec CAH et k-means](seance7-classif.html)
    - [sous `python`](seance7-classif-python.html)
    - [correction](seance7-correction.html)
    
8. [Application sur données réelles](seance8-donnees-reelles.html)
    - [correction](seance8-correction.html)

9. [Autres méthodes](seance9-autres-methodes.html)

10. <span id = "final">En attente</span>

<script>
    const date = new Date();
    if (date.toJSON().slice(0, 10) == "2025-01-17" & date.toJSON().slice(11, 13) >= 13) { 
        document.getElementById("final").innerHTML = "<a href='seance-finale--tpnote2.html'>TP noté 2</a>";
    }
</script>


<!--
- Nouveau programme :
    1. Intro Python
    2. Manipulation "à la SQL" et visualisation de données (univarié et bivarié)
    3. ACP
    4. AFC
    5. Application sur données réelles
    6. [TP noté]
    7. k-means et CAH
    8. Application sur données réelles 2
    9. DBSCAN, SOM, MDS et autre ?
    10. Application sur données réelles 3
    11. [TP noté Evaluation finale]
-->

<!--
Lien vers les plateformes de l'UFR Math-Info : 
- [JupyterHub](https://jupyter.ens.math-info.univ-paris5.fr/)
- [RStudio](https://rstudio.ens.math-info.univ-paris5.fr/)
-->

