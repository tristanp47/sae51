#!/bin/bash
docker run  --workdir /srv --name sae51-ub --mount type=bind,source=$(pwd)/shared,target=/srv im_ubuntu1 ./dbml2sql.sh

sleep 5

repertoire="$(pwd)/shared"

chiffre_max=$(ls -1 "$repertoire" | grep -o 'S[0-9]*.sql' | sed 's/S\([0-9]*\).sql/\1/' | sort -n | tail -n 1)

FichierChiffreMax="$repertoire/S${chiffre_max}.sql"

echo "CREATE DATABASE gestion_parc_informatique;" > temp && echo "USE gestion_parc_informatique;" >> temp && cat "$FichierChiffreMax" >> temp && mv temp "$FichierChiffreMax"

echo "suppression de l'ancienne strucutre de la bdd"

echo "copie de la denière version de la strucutre de la bdd"
cp -f "$FichierChiffreMax" "/home/user/sae51/data.sql"


