#!/bin/sh

DAT=$(date +"%D")
HEURE=$(date +"%T")
USER=$(who -q)
TIME=$(uptime)


echo date: $DAT >> aux50.temp
echo heure: $HEURE >> aux50.temp
echo $USER >> aux50.temp
echo $TIME >> aux50.temp
