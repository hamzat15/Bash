#!/bin/bash

dt=$(date +"%Hh%M")
echo "Ce script a été lancé a $dt."

tar -zxvf /tmp/backup.tar.gz -C /tmp/back/ 

CONFIG="/tmp/back/sites-available/*"
DATA="/tmp/back/html/*"

V_CONF ="/etc/nginx/sites-availble/*"
V_DATA ="/var/www/html/*"

CANCELED=5
ERROR_ARGV=6



if [ -e $V_CONF ] || [ -e $V_DATA ]; then
echo "attaention voulez vous ecraser les donner"
read -p "y/n: " answer
else
cp -v -r -f $CONFIG /etc/nginx/sites-available/
cp -v -r -f $DATA /var/www/html/
rm -r /tmp/back/*
fi



case $answer in y|Y) cp -v -r -f $CONFIG /etc/nginx/sites-available/
		     cp -v -r -f $DATA /var/www/html/
		     rm -r /tmp/back/*;;

  		n|N)
			cp -v -r -n $CONFIG /etc/nginx/sites-available/
			cp -v -r -n $DATA /var/www/html/
			rm -r /tmp/back/*
			echo "Operation canceled"
	                exit $CANCELED;;

                  *)   echo "Veuillez utiliser les option demande"
	             exit $ERROR_ARGV;;
esac




fn=$(date +"%Hh%M")
echo "Ce script a été finalise a $fn."
