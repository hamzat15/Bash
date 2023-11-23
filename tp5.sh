#!/bin/bash

ERROR_OPT=2
ERROR_US=3
ERROR_REP=4

echo "Taper le numero d'option demande"

echo "1.cree un utilisateur "
echo "2.changer le mdp d'un utilisateur"
echo "3.bloquer le mdp d'un utilisateur"
echo "4.sauvegarder le dossier utilisateur"

read a


case $a in
	1) echo "option num1 choisi." >> /var/log/tp5.log
           read -p "entrer le nom de l'utilisateur: " name
           if [ -n "$name" ]
           then

           if [ $(getent passwd $name) ]; then
           echo "utilisateur deja existant"
           echo "utilisateur deja existant" >> /var/log/tp5.log
           exit
           else
           echo $name
	   useradd -m $name
           passwd $name
           echo "L'utilisateur $name a etait cree"
           echo "L'utilisateur $name a etait cree" >> /var/log/tp5.log
           fi

           else
           echo "Veuillez entrer un nom d'utilisateur" >> /var/log/top.log
           exit $ERROR_US
           fi
	    ;;

	2) echo "option num2 choisi." >> /var/log/tp5.log
           read -p "entrer le nom de l'utilisateur: " name

	   if [ -n "$name" ]
	   then

           if [ $(getent passwd $name) ]; then
	   echo $name
	   passwd $name
           echo "Le mot de passe de l'utilisateur $name a etait modifie"
           echo "Le mot de passe de l'utilisateur $name a etait modifie" >> /var/log/tp5.log
           else
            echo "Utilisateur introuvable" 
	    echo "Utilisateur introuvable" >> /var/log/tp5.log
            exit $ERROR_US
           fi

	   else
           echo "Veuillez entrer un nom d'utilisateur" >> /var/log/top.log
	   exit $ERROR_US
	   fi;;

	3) echo "option num3 choisi." >> /var/log/tp5.log
	   read -p "entrer le nom de l'utilisateur: " name

           if [ -n "$name" ]
           then

           if [ $(getent passwd $name) ]; then
           echo $name
           passwd -l $name
           echo "Le mdp $name a etait bloque"
           echo "Le mdp $name a etait bloque" >> /var/log/tp5.log
	   exit
           else
            echo "Utilisateur introuvable" >> /var/log/tp5.log
            exit $ERROR_US
           fi

           else
           echo "Veuillez entrer un nom d'utilisateur" >> /var/log/top.log
           exit $ERROR_US
           fi;;

	4) echo "option num3 choisi." >> /var/log/tp5.log
	   read -p "entrer le nom de l'utilisateur: " name

           if [ -n "$name" ]
           then

	   if [ -d /home/$name ];then
	   echo ok
	   echo $(cp -v -r /home/$name /tmp/)
           cp -v -r /home/$name /tmp/ >> /var/log/tp5.log
           echo "Les fichier de l'utilisateur $name on etait sauvegarde"
           echo "Les fichier de l'utilisateur $name on etait sauvegarde" >> /var/log/tp5.log
           exit
	   else
           echo "Repertoire introuvable" >> /var/log/tp5.log
           exit $ERROR_RP
	   fi

           else
           echo "Veuillez entrer un nom d'utilisateur" >> /var/log/top.log
           exit $ERROR_US
           fi;;

	*) echo "Operation annule" >> /var/log/top.log
           exit $ERROR_OPT;;
esac
