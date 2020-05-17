# pro


Projet de fin d’année

PRESENTATION DU PROJET
Nous allons dans ce projet créer une plateforme qui permettra au personnel soignant de pouvoir faire un recensement des personnes atteintes de COVID-19 en Belgique. De ce fait nous disposerons d’une base de données contenant la table des patients vide et à remplir via un formulaire, celle des hôpitaux préalablement remplie et celle des villes où se trouve les hôpitaux concernés.
De plus, nous disposerons aussi des fichiers Js contenant des requêtes AJAX, des fichiers HTML et CSS.


NOMS DES PARTICIPANTS
KOUETCHEU KAKMENI BRICE RONALD
HAKIZIMANA Aymar Davy
DONHOUNGO AWOUNTSA Aurelle Tilly
ARSLAN Ninos 


BESOINS DU CLIENT
Le client ici est l’un des membres du personnel soignant assit devant son pc et qui doit communiquer à l’Etat le nombre de cas infecté au total, par villes, par hôpitaux, par tranche d’âge, de savoir si les personnes infectées présentaient tous ou non des symptômes de la maladie afin de prendre des mesures pour réduire le risque de contamination et de savoir à quel période il y a on a eu un pic.


FONCTIONNALITES PRINCIPALES
	Formulaire pour pouvoir se loguer ou pour ajouter un hôpital dans la base de données
	Formulaire qui permet de prendre les données du patient testé préalablement positif et de les enregistrés dans la base de données
	Des boutons répondant aux éventuelles requêtes dont aura besoin 


IMPLEMANTATION
Afin de mener à bien notre projet il sera indispensable pour nous de définir les éléments qui constitueront le BACKEND et le FRONTEND

	BACKEND : Une base de données qui permettra les contenir les différentes informations sur les sur les patients enregistrés, les différents  hôpitaux qui les prennent en charge et les différentes villes. Ainsi nous aurons donc comme tables :

	Patients avec pour attributs : id du Patient (numéro de CNI) de type chaines de caractères, nom du patient et prénom du patient tous deux de type chaines de caractères,  le sexe de type chaine de caractère , date de naissance et la date d’admission tous les deux de type de DATE , ville du patient ( code postal) de type chaine de caractère, numéro de Gsm du patient de type chaine , symptôme(oui/non) également de type chaine,  l’id de l’hôpital où se trouve le patient 

	Hôpital avec pour attributs l’identifiant de l’hôpital de type chaine de caractère, le nom de l’hôpital également de type chaine et l’id de la ville où se trouve l’hôpital et le mot de passe de l’hôpital  quand il va se loguer

	Villes avec pour attributs  l’id de la ville (code postal) et le nom de la ville. 

	BACKEND : Un serveur web capable de fournir les pages html, js, css, ainsi que de proposer des web services
	BACKEND : des Web services
•	Les web services Page, Js, Css tous de type RAW ayant respectivement les procédures Http_getPage, Http_getJs, http_getCss en paramètres qui permettront au serveur de pouvoir fournir les différents fichiers HTML, JS et CSS
•	Le web service INSERTION de type JSON associé à la procédure INSERTION qui permettra de stocker les différentes informations rentrées via le formulaire dans la base de données
•	Le web service INSERER de type JSON associé à la procédure recupLogin qui permet de récupérer les id et les mots de passe de tous les hôpitaux au moment du login
•	Le web service TESTID de type JSON associé à la procédure recupId qui récupère tous les id des patients déjà crées afin d’éviter des doublons dans la base de données lors de l’insertion d’un nouveau patient
•	Les web services Tri Villes, Tri Hôpitaux, NombreTotal.

	FRONTEND: Une page web (html, js, css) permettant d'appeler les web services et de traiter les réponses, qui propose une interface utilisateur pour:
•	Enregistrer les patients
•	Afficher les  résultats des différents besoin de l’utilisateur






 


Modele relationnel 
