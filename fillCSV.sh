#!/usr/bin/bash
for a in $(ls -r csv/*.csv)
do
	Snchem=${a#csv/}
	name=${Snchem%.csv}
	premlgn=$(head -n 1 "$a")
	if [ "$name" != "Machines" ]; then
	  echo "Implantation de $Snchem"
	  mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
      	        -e "LOAD DATA INFILE '/srv/csv/$Snchem' INTO TABLE $name FIELDS TERMINATED BY ', '  IGNORE 1 ROWS ($premlgn);"
	fi
done

machines_csv="csv/Machines.csv"
Snchem=${machines_csv#csv/}
name=${Snchem%.csv}
premlgn=$(head -n 1 "$machines_csv")

echo "Implantation de $Snchem"
mysql -u root -p'foo' -h 127.0.0.1 --port=3307 gestion_parc_informatique \
      -e "LOAD DATA INFILE '/srv/csv/$Snchem' INTO TABLE $name FIELDS TERMINATED BY ', ' IGNORE 1 ROWS ($premlgn);"
