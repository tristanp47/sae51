#!/usr/bin/bash

mysql -u root -p'foo' -h 127.0.0.1 --port=3307 \
        -e "DROP DATABASE gestion_parc_informatique;"