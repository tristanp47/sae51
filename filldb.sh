mysql -u root -p'foo' -h 127.0.0.1 --port=3307 < data.sql

if [ $? != 0 ]; then
        echo "echec de la commande mysql fill"
        exit 2
fi
