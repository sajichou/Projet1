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

##Classe de sixième

Topic.create(niveau_id:1, matiere:"francais",theme:"Étude de la langue", chapitre:"Grammaire")
Topic.create(niveau_id:1, matiere:"francais",theme:"Étude de la langue", chapitre:"Orthographe")
Topic.create(niveau_id:1, matiere:"francais",theme:"Étude de la langue", chapitre:"Lexique")
Topic.create(niveau_id:1, matiere:"francais",theme:"Lecture", chapitre:"Textes de l'antiquité")
Topic.create(niveau_id:1, matiere:"francais",theme:"Lecture", chapitre:"Contes et récits merveilleux")
Topic.create(niveau_id:1, matiere:"francais",theme:"Lecture", chapitre:"Initiation à la poésie")
Topic.create(niveau_id:1, matiere:"francais",theme:"Lecture", chapitre:"Étude de l'image")
Topic.create(niveau_id:1, matiere:"francais",theme:"Expression écrite")
Topic.create(niveau_id:1, matiere:"francais",theme:"Expression orale")

##Classe de cinquième

Topic.create(niveau_id:2, matiere:"francais",theme:"Étude de la langue", chapitre:"Grammaire")
Topic.create(niveau_id:2, matiere:"francais",theme:"Étude de la langue", chapitre:"Orthographe")
Topic.create(niveau_id:2, matiere:"francais",theme:"Étude de la langue", chapitre:"Lexique")
Topic.create(niveau_id:2, matiere:"francais",theme:"Lecture", chapitre:"Littérature du Moyen âge")
Topic.create(niveau_id:2, matiere:"francais",theme:"Lecture", chapitre:"Récits d'aventure")
Topic.create(niveau_id:2, matiere:"francais",theme:"Lecture", chapitre:"Poésie")
Topic.create(niveau_id:2, matiere:"francais",theme:"Lecture", chapitre:"Théâtre : la comédie")
Topic.create(niveau_id:2, matiere:"francais",theme:"Lecture", chapitre:"Étude de l'image")
Topic.create(niveau_id:2, matiere:"francais",theme:"Expression écrite")
Topic.create(niveau_id:2, matiere:"francais",theme:"Expression orale")

##Classe de 4ème

Topic.create(niveau_id:3, matiere:"francais",theme:"Étude de la langue", chapitre:"Grammaire")
Topic.create(niveau_id:3, matiere:"francais",theme:"Étude de la langue", chapitre:"Orthographe")
Topic.create(niveau_id:3, matiere:"francais",theme:"Étude de la langue", chapitre:"Lexique")
Topic.create(niveau_id:3, matiere:"francais",theme:"Lecture", chapitre:"La lettre")
Topic.create(niveau_id:3, matiere:"francais",theme:"Lecture", chapitre:"Le récit au XIXème siècle")
Topic.create(niveau_id:3, matiere:"francais",theme:"Lecture", chapitre:"Poésie : le lyrisme")
Topic.create(niveau_id:3, matiere:"francais",theme:"Lecture", chapitre:"Théâtre :  faire, rire, émouvoir, faire pleurer")
Topic.create(niveau_id:3, matiere:"francais",theme:"Lecture", chapitre:"Étude de l'image")
Topic.create(niveau_id:3, matiere:"francais",theme:"Expression écrite")
Topic.create(niveau_id:3, matiere:"francais",theme:"Expression orale")

##Classe de 3ème

Topic.create(niveau_id:4, matiere:"francais",theme:"Étude de la langue", chapitre:"Grammaire")
Topic.create(niveau_id:4, matiere:"francais",theme:"Étude de la langue", chapitre:"Orthographe")
Topic.create(niveau_id:4, matiere:"francais",theme:"Étude de la langue", chapitre:"Lexique")
Topic.create(niveau_id:4, matiere:"francais",theme:"Lecture", chapitre:"Formes du récit aux XXème siècle et XXIème siècle")
Topic.create(niveau_id:4, matiere:"francais",theme:"Lecture", chapitre:"La poésie dans le monde et dans le siècle")
Topic.create(niveau_id:4, matiere:"francais",theme:"Lecture", chapitre:"Théâtre : continuité et renouvellement")
Topic.create(niveau_id:4, matiere:"francais",theme:"Expression écrite")
Topic.create(niveau_id:4, matiere:"francais",theme:"Expression orale")
Topic.create(niveau_id:4, matiere:"francais",theme:"L'histoire des arts")

##Classe de 2nde
Topic.create(niveau_id:5, matiere:"francais",theme:"Étude de la langue", chapitre:"La lecture")
Topic.create(niveau_id:5, matiere:"francais",theme:"Étude de la langue", chapitre:"L'écriture")
Topic.create(niveau_id:5, matiere:"francais",theme:"Étude de la langue", chapitre:"L'oral")
Topic.create(niveau_id:5, matiere:"francais",theme:"Argumentation", chapitre:"Démontrer, convaincre et persuader")
Topic.create(niveau_id:5, matiere:"francais",theme:"Argumentation", chapitre:"L'éloge et le blâme")
Topic.create(niveau_id:5, matiere:"francais",theme:"Les objets d'étude", chapitre:"le roman et la nouvelle au XIXe siècle : réalisme et naturalisme")
Topic.create(niveau_id:5, matiere:"francais",theme:"Les objets d'étude", chapitre:"La tragédie et la comédie au XVIIe siècle : le classicisme")
Topic.create(niveau_id:5, matiere:"francais",theme:"Les objets d'étude", chapitre:"La poésie du XIXe au XXe siècle : du romantisme au surréalisme")
Topic.create(niveau_id:5, matiere:"francais",theme:"Les objets d'étude", chapitre:"Genres et formes de l’argumentation : XVIIe et XVIIIe siècle")
Topic.create(niveau_id:5, matiere:"francais",theme:"Histoire littéraire et culturelle")
Topic.create(niveau_id:5, matiere:"francais",theme:"Production, diffusion et réception de textes")

##Classe de 1ère S
Topic.create(niveau_id:6, matiere:"francais",theme:"Le personnage de roman, du XVIIème siècle à nos jours")
Topic.create(niveau_id:6, matiere:"francais",theme:"Le texte théâtral et sa représentation, du XVIIème siècle à nos jours")
Topic.create(niveau_id:6, matiere:"francais",theme:"Écriture poétique et quête du sens, du Moyen Âge à nos jours")
Topic.create(niveau_id:6, matiere:"francais",theme:"La question de l’Homme dans les genres de l’argumentation du XVIème siècle à nos jours")

##Classe de 1ère ES
Topic.create(niveau_id:7, matiere:"francais",theme:"Le personnage de roman, du XVIIème siècle à nos jours")
Topic.create(niveau_id:7, matiere:"francais",theme:"Le texte théâtral et sa représentation, du XVIIème siècle à nos jours")
Topic.create(niveau_id:7, matiere:"francais",theme:"Écriture poétique et quête du sens, du Moyen Âge à nos jours")
Topic.create(niveau_id:7, matiere:"francais",theme:"La question de l’Homme dans les genres de l’argumentation du XVIème siècle à nos jours")

##Classe de 1ère L
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Figures de style ou de rhétorique")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories linguistiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories prosodiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories narratologiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories dramaturgiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories stylistiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories logiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Pratique raisonnée de la langue", chapitre:"Catégories esthétiques")
Topic.create(niveau_id:8, matiere:"francais",theme:"Exercices oraux et écrits")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"Le personnage de roman, du XVIIème siècle à nos jours")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"Le texte théâtral et sa représentation, du XVIIème siècle à nos jours")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"Ecriture poétique et quête du sens, du Moyen Âge à nos jours")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"La question de l’Homme dans les genres de l’argumentation du XVIème siècle à nos jours")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"Vers un espace culturel européen : Renaissance et humanisme")
Topic.create(niveau_id:8, matiere:"francais",theme:"Objets d'étude", chapitre:"Les réécritures, du XVIIème siècle jusqu’à nos jours")


##Classe de Terminale L
Topic.create(niveau_id:11, matiere:"francais",theme:"Littérature et langages de l’image")
Topic.create(niveau_id:11, matiere:"francais",theme:"Lire – écrire – publier : l’œuvre littéraire, un processus complexe")

###SES

##Classe de 1ère ES
Topic.create(niveau_id:7, matiere:"ses",theme:"Sciences économiques", chapitre:"Les grandes questions des économistes")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sciences économiques", chapitre:"La production dans l’entreprise")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sciences économiques", chapitre:"La coordination par le marché")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sciences économiques", chapitre:"La monnaie et le financement")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sciences économiques", chapitre:"Régulations et déséquilibres macroéconomiques")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sociologie générale et politique", chapitre:"Les processus de socialisation et la construction des identités sociales")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sociologie générale et politique", chapitre:"Groupes et réseaux sociaux")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sociologie générale et politique", chapitre:"Contrôle social et déviance")
Topic.create(niveau_id:7, matiere:"ses",theme:"Sociologie générale et politique", chapitre:"GOrdre politique et légitimation")

##Classe de Terminale ES
Topic.create(niveau_id:10, matiere:"ses",theme:"Croissance, fluctuations et crises")
Topic.create(niveau_id:10, matiere:"ses",theme:"Mondialisation, finance internationale et intégration sociale")
Topic.create(niveau_id:10, matiere:"ses",theme:"Économie du développement durable")
Topic.create(niveau_id:10, matiere:"ses",theme:"Classes, stratification et mobilité sociale")
Topic.create(niveau_id:10, matiere:"ses",theme:"Intégration, conflit, changement social")
Topic.create(niveau_id:10, matiere:"ses",theme:"Justice sociale et inégalités")
Topic.create(niveau_id:10, matiere:"ses",theme:"Travail, emploi, chômage")

###PC   

##Classe de 5ème

Topic.create(niveau_id:2, matiere:"pc",theme:"L'eau dans notre environnement", chapitre:"L’eau dans notre environnement")
Topic.create(niveau_id:2, matiere:"pc",theme:"L'eau dans notre environnement", chapitre:"Mélange aqueux")
Topic.create(niveau_id:2, matiere:"pc",theme:"L'eau dans notre environnement", chapitre:"Mélanges homogènes et corps purs")
Topic.create(niveau_id:2, matiere:"pc",theme:"L'eau dans notre environnement", chapitre:"Les changements d’état de l’eau")
Topic.create(niveau_id:2, matiere:"pc",theme:"L'eau dans notre environnement", chapitre:"L’eau solvant")
Topic.create(niveau_id:2, matiere:"pc",theme:"Les circuits électriques", chapitre:"Circuit électrique")
Topic.create(niveau_id:2, matiere:"pc",theme:"Les circuits électriques", chapitre:"Circuit électrique en série")
Topic.create(niveau_id:2, matiere:"pc",theme:"Les circuits électriques", chapitre:"Circuit électrique comportant une dérivation")
Topic.create(niveau_id:2, matiere:"pc",theme:"La lumière", chapitre:"Sources de lumière – vision d’un objet")
Topic.create(niveau_id:2, matiere:"pc",theme:"La lumière", chapitre:"Propagation de la lumière")

##Classe de 4ème

Topic.create(niveau_id:3, matiere:"pc",theme:"De l'air qui nous entoure à la molécule", chapitre:"Composition de l’air")
Topic.create(niveau_id:3, matiere:"pc",theme:"De l'air qui nous entoure à la molécule", chapitre:"Volume et masse de l’air")
Topic.create(niveau_id:3, matiere:"pc",theme:"De l'air qui nous entoure à la molécule", chapitre:"Une description moléculaire pour comprendre")
Topic.create(niveau_id:3, matiere:"pc",theme:"De l'air qui nous entoure à la molécule", chapitre:"Les combustions")
Topic.create(niveau_id:3, matiere:"pc",theme:"De l'air qui nous entoure à la molécule", chapitre:"Les atomes pour comprendre la transformation chimique")
Topic.create(niveau_id:3, matiere:"pc",theme:"Les lois du courant continu", chapitre:"Intensité et tension")
Topic.create(niveau_id:3, matiere:"pc",theme:"Les lois du courant continu", chapitre:"La résistance")
Topic.create(niveau_id:3, matiere:"pc",theme:"Les lois du courant continu", chapitre:"La loi d’Ohm")
Topic.create(niveau_id:3, matiere:"pc",theme:"La lumière", chapitre:"Lumières colorées et couleur des objets")
Topic.create(niveau_id:3, matiere:"pc",theme:"La lumière", chapitre:"Lentilles, foyers et images")
Topic.create(niveau_id:3, matiere:"pc",theme:"La lumière", chapitre:"Vitesse de la lumière")

##Classe de 3ème

Topic.create(niveau_id:4, matiere:"pc",theme:"La chimie, science de la transformation", chapitre:"Conduction électrique")
Topic.create(niveau_id:4, matiere:"pc",theme:"La chimie, science de la transformation", chapitre:"Synthèse d’espèces chimiques")
Topic.create(niveau_id:4, matiere:"pc",theme:"Énergie électrique et circuits alternatifs", chapitre:"De la centrale électrique à l’utilisateur")
Topic.create(niveau_id:4, matiere:"pc",theme:"Énergie électrique et circuits alternatifs", chapitre:"Puissance et énergie électrique")
Topic.create(niveau_id:4, matiere:"pc",theme:"Gravité et énergie mécanique", chapitre:"Interaction gravitationnelle")
Topic.create(niveau_id:4, matiere:"pc",theme:"Gravité et énergie mécanique", chapitre:"Energie cinétique et sécurité routière")

##Classe de 2nde

Topic.create(niveau_id:5, matiere:"pc",theme:"Chimie", chapitre:"Chimique ou naturel ?")
Topic.create(niveau_id:5, matiere:"pc",theme:"Chimie", chapitre:"Constitution et transformation de la matière")
Topic.create(niveau_id:5, matiere:"pc",theme:"Chimie", chapitre:"Solution : solvant, soluté, dissolution")
Topic.create(niveau_id:5, matiere:"pc",theme:"Physique", chapitre:"Exploration de l'espace")
Topic.create(niveau_id:5, matiere:"pc",theme:"Physique", chapitre:"L'Univers en mouvements et le temps")
Topic.create(niveau_id:5, matiere:"pc",theme:"Physique", chapitre:"L'air qui nous entoure")

##Classe de 1S

Topic.create(niveau_id:6, matiere:"pc",theme:"Observer : couleurs et images", chapitre:"Couleur, vision et image")
Topic.create(niveau_id:6, matiere:"pc",theme:"Observer : couleurs et images", chapitre:"Sources de lumière colorée")
Topic.create(niveau_id:6, matiere:"pc",theme:"Observer : couleurs et images", chapitre:"Matières colorées")
Topic.create(niveau_id:6, matiere:"pc",theme:"Comprendre : lois et modèles", chapitre:"Cohésion et transformations de la matière")
Topic.create(niveau_id:6, matiere:"pc",theme:"Comprendre : lois et modèles", chapitre:"Champs et forces")
Topic.create(niveau_id:6, matiere:"pc",theme:"Comprendre : lois et modèles", chapitre:"Formes et principes de conversion de l’énergie")
Topic.create(niveau_id:6, matiere:"pc",theme:"Agir : défis du XXIème siècle", chapitre:"Convertir l’énergie")
Topic.create(niveau_id:6, matiere:"pc",theme:"Agir : défis du XXIème siècle", chapitre:"Synthétiser des molécules")
Topic.create(niveau_id:6, matiere:"pc",theme:"Agir : défis du XXIème siècle", chapitre:"Créer et innover")


##Classe de TS

Topic.create(niveau_id:9, matiere:"pc",theme:"Ondes et matières", chapitre:"Ondes et particules")
Topic.create(niveau_id:9, matiere:"pc",theme:"Ondes et matières", chapitre:"Analyse spectrale")
Topic.create(niveau_id:9, matiere:"pc",theme:"Lois et modèles", chapitre:"Temps, mouvement et évolution")
Topic.create(niveau_id:9, matiere:"pc",theme:"Lois et modèles", chapitre:"Structure et transformation de la matière")
Topic.create(niveau_id:9, matiere:"pc",theme:"Lois et modèles", chapitre:"Énergie, matière et rayonnement")
Topic.create(niveau_id:9, matiere:"pc",theme:"Défis du XXIème siècle", chapitre:"Économiser les ressources")
Topic.create(niveau_id:9, matiere:"pc",theme:"Défis du XXIème siècle", chapitre:"Synthétiser des molécules")
Topic.create(niveau_id:9, matiere:"pc",theme:"Défis du XXIème siècle", chapitre:"Créer et innover")



###Anglais   
Topic.create(niveau_id:13, matiere:"anglais",theme:"Compréhension orale")
Topic.create(niveau_id:13, matiere:"anglais",theme:"Compréhension écrite")
Topic.create(niveau_id:13, matiere:"anglais",theme:"Expression écrite")
Topic.create(niveau_id:13, matiere:"anglais",theme:"Expression orale")


###Espagnol   
Topic.create(niveau_id:13, matiere:"espagnol",theme:"Compréhension orale")
Topic.create(niveau_id:13, matiere:"espagnol",theme:"Compréhension écrite")
Topic.create(niveau_id:13, matiere:"espagnol",theme:"Expression écrite")
Topic.create(niveau_id:13, matiere:"espagnol",theme:"Expression orale")

###Russe   
Topic.create(niveau_id:13, matiere:"russe",theme:"Compréhension orale")
Topic.create(niveau_id:13, matiere:"russe",theme:"Compréhension écrite")
Topic.create(niveau_id:13, matiere:"russe",theme:"Expression écrite")
Topic.create(niveau_id:13, matiere:"russe",theme:"Expression orale")

###Allemand   
Topic.create(niveau_id:13, matiere:"allemand",theme:"Compréhension orale")
Topic.create(niveau_id:13, matiere:"allemand",theme:"Compréhension écrite")
Topic.create(niveau_id:13, matiere:"allemand",theme:"Expression écrite")
Topic.create(niveau_id:13, matiere:"allemand",theme:"Expression orale")




