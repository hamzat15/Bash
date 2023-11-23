#!/bin/bash

ERROR_CH=1
ERROR_ROOT=2
UID_ROOT=0

#if [ "$uid" != "$UID_ROOT" ]; then
#	echo "seul root peut executer se script"
#exit $ERROR_ROOT
#fi

CONFIG="/tmp/back/sites-available/"
DATA="/tmp/back/html/"

dt=$(date +"%Hh%M")
echo "Ce script a été lancé a $dt." > /var/log/backup.log

if [ ! -d /tmp/back ]; then
mkdir /tmp/back
fi
if [ ! -d $CONFIG ]; then
mkdir /tmp/back/sites-available
fi
if [ ! -d $DATA ]; then
mkdir /tmp/back/html
fi

if [ -n "$1" ]; then
echo "premier cp"
cp -v -r /etc/nginx/sites-available $1/
echo "second cp"
cp -v -r /var/www/html $1/
echo "cp fini"

tar -cvzf backup.tar.gz $1
rm -rf $1/*
mv backup.tar.gz /tmp/

else
cp -v -R -p /etc/nginx/sites-available/* $CONFIG
cp -v -R -p /var/www/html/* $DATA

tar -C /tmp/back/ -cvzf backup.tar.gz html sites-available
rm -r /tmp/back/*
fi


fn=$(date +"%Hh%M")
echo "Ce script a été finalise a $fn." >> /var/log/backup.log
