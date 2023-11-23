# Bash
Petit projet bash
tp1 :  script qui, lors de son exécution, donne la date et l’heure, la liste de tous les utilisateurs connectés et le temps passé depuis le lancement du système (uptime) du système. 
Enfin, le script sauvegarder cette information dans un journal.

tp2 : boucle qui compte de 0 à 10.
En partant de la boucle précédente, affiche seulement les nombres impairs.

tp3 :script qui sauvegarde le fichier de configuration du site nginx et les données de ce dernier, dans une archive nginx.tar.gz :

    afficher l’heure du début d’éxécution du script,
    afficher les copies de fichiers effectuées,
    variabiliser la destination (le dossier) de la sauvegarde,
    séparer en sous-dossier les données et les fichiers de configuration,
    afficher l’heure de fin d’éxécution du script.Sauvegardez le strict minimum, inutile de remplir notre espace de stockage avec des fichiers présent par défaut.
    Ajoutez une option dans le script pour accepter un argument qui serait la nouvelle destination du fichier de sauvegarde.

tp4 : cronjob sur la machine virtuelle pour executer le script de backup toutes les heures, attention :
    le nom du fichier de backup devra contenir la date et l’heure à laquelle il a été fait,
    un message dans /var/log/backup.log doit apparaître pour informer le démarrage et la fin du backup.script de restauration pour nginx, il doit :

    affichez l’heure du début de la restauration,
    vérifie si les fichiers à restaurer sont déjà présents,
        si oui : affiche un warning et demander si on souhaite écraser l’existant
            si oui : le faire en affichant la liste des fichiers copiés
            si non : affichez un code de sortie Operation canceled
        si non : poursuivre le script de restauration,
    récupére le fichier nginx.tar.gz dans /tmp/,
    extraire les données du site dans leur bon répertoire de destination, en affichant la liste des fichiers copiés,
    affichez l’heure de fin du script.

tp5 : cript qui, grâce à un menu interactif propose :

    de créer un utilisateur,
    de changer le mdp d’un utilisateur,
    de bloquer le mdp d’un utilisateur,
    de sauvegarder le dossier d’un utilisateur.

Prévoie une gestion des erreurs.
Le script trace les actions validées, en sortie standard mais également dans un journal.

tp6: script aleatoire50.sh qui va :
    utilise la variable d’environnement spéciale RANDOM,
    renvoyer une valeur entre 0 et 50.



    

    
