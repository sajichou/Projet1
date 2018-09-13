# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Correspondance.create(niveau_id: 1, nom:"6eme")
Correspondance.create(niveau_id: 2, nom:"5eme")
Correspondance.create(niveau_id: 3, nom:"4eme")
Correspondance.create(niveau_id: 4, nom:"3eme")
Correspondance.create(niveau_id: 5, nom:"2nde")
Correspondance.create(niveau_id: 6, nom:"1ere S")
Correspondance.create(niveau_id: 7, nom:"1ere ES")
Correspondance.create(niveau_id: 8, nom:"1ere L")
Correspondance.create(niveau_id: 9, nom:"Terminale S")
Correspondance.create(niveau_id: 10, nom:"Terminale ES")
Correspondance.create(niveau_id: 11, nom:"Terminale L")

Correspondance.create(niveau_id: 13, nom:"Toutes les classes")

###### Chapitres officiels

###Mathématiques   mathematiques

##Classe de sixième

Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Proportionnalité")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Organisation et représentation de donnés")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres entiers et décimaux")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Opérations")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres en écritures fractionnaire")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Géométrie", chapitre:"Figures planes")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Géométrie", chapitre:"Symétrie orthogonale par rapport à une droite")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Géométrie", chapitre:"Parallélépipède rectangle")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Longueurs, masses, durées")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Angles")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Aires : mesure, comparaison et calcul d’aires")
Topic.create(niveau_id:1, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Volumes")

##Classe de cinquième

Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Proportionnalité")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Expressions littérales")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Activités graphiques")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Représentation et traitement de données")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres entiers et décimaux positifs : calcul, divisibilité sur les entiers")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres positifs en écriture fractionnaire : sens et calculs")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres relatifs entiers et décimaux : sens et calculs")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Initiation à la notion d’équation")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Géométrie", chapitre:"Figures planes")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Géométrie", chapitre:"Symétries")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Géométrie", chapitre:"Prismes droits, cylindres de révolution")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Longueurs, masses, durées")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Angles")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Aires : mesure, comparaison et calcul d’aires")
Topic.create(niveau_id:2, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Volumes")

##Classe de 4ème

Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Traitement des données")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Probabilités")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Proportionnalité")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Fonctions")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Calcul numérique")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Calcul littéral")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Géométrie", chapitre:"Figures planes")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Géométrie", chapitre:"Configuration dans l’espace")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Géométrie", chapitre:"Agrandissement et réductions")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Aires et volumes")
Topic.create(niveau_id:3, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Grandeurs quotients courantes")

##Classe de 3ème

Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Notion de fonction")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Fonction linéaire, fonction affine")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Statistique")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Organisation et gestion de données, fonctions", chapitre:"Notion de probabilité")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Nombres entiers et rationnels")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Nombres et calculs", chapitre:"Calcul élémentaires sur les radicaux")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Géométrie", chapitre:"Figures planes")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Géométrie", chapitre:"Configuration dans l’espace")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Aires et volumes")
Topic.create(niveau_id:4, matiere:"mathematiques",theme:"Grandeurs et mesures", chapitre:"Grandeurs composées, changement d’unités")

##Classe de 2nde

Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Statistique descriptive, analyse des données")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Echantillonnage")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Probabilité sur un ensemble fini")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Les fonctions : Image, antécédent, courbe représentative")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Etude qualitative : Fonction croissante, fonction décroissante, maximum, minimum d’une fonction sur un intervalle")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Expressions algébriques : Transformations d’expressions algébriques en vue d’une résolution de problème")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Equations : Résolution graphique et algébrique d’équations")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Fonctions linéaires et fonctions affines")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Variation de la fonction carré, de la fonction inverse")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Etudes de fonctions polynômes de degré 2")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Etude de fonctions homographiques")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Résolution graphique et algébriques d’inéquations")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Fonctions", chapitre:"Le cercle trigonométrique et définition du sinus et du cosinus d’un nombre réel")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Géométrie", chapitre:"Coordonnées d’un point du plan")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Géométrie", chapitre:"Configuration du plan : Triangles, quadrilatères, cercles")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Géométrie", chapitre:"Droites")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Géométrie", chapitre:"Vecteurs")
Topic.create(niveau_id:5, matiere:"mathematiques",theme:"Géométrie", chapitre:"Géométrie dans l’Espace")

##Classe de 1ère S

Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Second degré")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Etude de fonctions")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Dérivation")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Suites")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Géométrie", chapitre:"Géométrie plane")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Géométrie", chapitre:"Trigonométrie")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Géométrie", chapitre:"Produit scalaire dans le plan")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Statistiques descriptive, analyse de données")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Probabilités")
Topic.create(niveau_id:6, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Échantillonnage")

##Classe de 1ère ES

Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Second degré")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Etude de fonctions")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Pourcentages")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Suites")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Statistiques descriptive, analyse de données")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Probabilités")
Topic.create(niveau_id:7, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Échantillonnage")

##Classe de 1ère L

Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Second degré")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Etude de fonctions")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Pourcentages")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Algèbre et analyse", chapitre:"Suites")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Statistiques descriptive, analyse de données")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Probabilités")
Topic.create(niveau_id:8, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Échantillonnage")

##Classe de Terminale S

Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Suites")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Limites de fonctions")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Continuité sur un intervalle, théorème des valeurs intermédiaires")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Calculs de dérivées : compléments")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Fonction exponentielle")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Fonction logarithme népérien")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Analyse", chapitre:"Intégration")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Géométrie", chapitre:"Nombres complexes")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Géométrie", chapitre:"Géométrie dans l’espace")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Géométrie", chapitre:"Droites et plans")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Géométrie", chapitre:"Géométrie vectorielle")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Géométrie", chapitre:"Produit scalaire")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Conditionnement, indépendance")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Notion de loi à densité à partir d’exemples")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Intervalle de fluctuation")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Statistiques et probabilités", chapitre:"Estimation")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Algorithmique", chapitre:"Instructions élémentaires")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Algorithmique", chapitre:"Boucle et itérateur, instruction conditionnelle")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Spécialisation Mathématiques", chapitre:"Arithmétique")
Topic.create(niveau_id:9, matiere:"mathematiques",theme:"Spécialisation Mathématiques", chapitre:"Matrices et suites")


###Français   francais


###Anglais   anglais


###Espagnol   espagnol