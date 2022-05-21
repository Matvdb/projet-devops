# Bienvenu dans le Projet DevOps  
# Qu'est-ce que DevOps ? Objectifs ? Organisation ?  
# Tout ces différents points seront abordés tout au long de cette fiche technique, suivi d'exemples et de démonstrations.  
--------------------------------------------------------  
## Sommaire  
* Présentation du Projet
* Présentation de la structure des données
* Présentation de la structure du programme
* Présentation des fonctionnalités du programme
* Démonstration d'un exemple de fonctionnement  
--------------------------------------------------------  
# Présentation du projet  

## Le Projet DevOps est une projet programmé et développé en Dart. Celui-ci a pour but de relié les différentes compétences en réseau/développement afin de concevoir un programme permettant de gérer la gestion, la configuration, l'éxécution d'éléments systèmes et réseaux.  
## Ici, ce projet est conçu afin de gérer la gestion des services Fail2Ban et IpSet, étant des services permettant de sécuriser un/des serveur/s web, en bannissant des IP, a durée limitée selon le développeur, de bannir mannuellement une IP choisit voir un réseau choisit, et de les affichers. Le tout selon différents menus, proposant différentes redirections ainsi que différentes manipulations disponibles.  
## Ce programme s'éxécutera dans le Terminal de VSCode, ainsi que les commandes dédiées à un terminal "standards" tel que le bash, qui sera utilisée pour effectuer les différentes manipulations tout au long du programme.  

# Présentation de la structure des données  

## Sur ce programme, la structure des données ce fait sous forme de différents programmes nommés "IHM", ainsi que d'un "main" permettant d'afficher le contenu de l'ensemble du programme.  
## Le "main", contiendra simplement une méthode asynchrone comportant trois lignes, soit le menu bienvenu "IHMPrincipal.bienvenu", le menu principal "IHMPrincipal.menu" ainsi que le/les messages/s d'arrêt du programme "IHMPrincipal.quitter".  

## Concernant les fameux "IHM", ceux-ci sont regroupés selon leur sujet correspondant, soit, 1 IHM par sujet. Ici il y en aura 4 au total :  
## L'IHM Principal qui permettra d'afficher les messages d'entrer et d'arrêt du programme, ainsi que toutes les méthodes, asynchrone ou non, permettant de valider une saisie, de la confirmer, d'afficher des messages d'attentes servant comme "temps de pause" tel que "Appuyez sur entrer pour continuer ...", et le menu Principal de ce projet.  
## L'IHM Fail2Ban qui permettra d'afficher, sous différents menus, les actions à réaliser, qui aura toutes les commandes de Terminal à éxécuter en fonction de ce que l'utilisateur aura choisi, et qui aura également des liens de redirections vers d'autres IHM tel que l'IHM IpSet, un autre menu Fail2Ban et une possibilité de retourner au menu précédent.  
## L'IHM IpSet et l'IHM IP qui auront exactement les mêmes fonctionnalitées que l'IHM Fail2Ban, mais qui éxécuteront les différentes manipulations selon ce que ceux-ci pourront réaliser.  

# Présentation de la structure du programme  
##  

# Présentation des fonctionnalités du programme  
##  