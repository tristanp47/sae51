#set -x
docker run --rm  -d \
  -p 3307:3306 \
  -v vol-sql-demo:/var/lib/mysql \
  --name sae51-sql \
  --env MYSQL\_ROOT\_PASSWORD=foo \
  --mount type=bind,source=$(pwd)/csv,target=/srv/csv \
  mysql:8.0 --local-infile=1 --secure-file-priv=''
if [ $? != 0 ]; then
        echo "echec de la commande docker run"
        exit 2
fi
