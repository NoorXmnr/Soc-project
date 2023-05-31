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




