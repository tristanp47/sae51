./purge.sh
if [ $? != 0 ]; then
        echo "echec du script purge"
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
if [ $? != 0 ]; then
        echo "echec du script filleCSV"
        exit 2
fi

