./purge.sh
if [ $? != 0 ]; then
        echo "echec du script purge"
        exit 2
fi

./create_network.sh
if [ $? != 0 ]; then
        echo "echec du script create_network"
        exit 2
fi

./run_mysql.sh
if [ $? != 0 ]; then
	echo "echec du script run_mysql"
	exit 2
fi

sleep 30

./filldb.sh
if [ $? != 0 ]; then
        echo "echec du script filledb"
        exit 2
fi

./fillCSV.sh
