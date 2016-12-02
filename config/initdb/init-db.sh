#!/bin/bash
set -e

for i in $(set); do
    if [[ "$i" == *_DB_NAME=* ]] ;
    then
        dbgrp=`echo $i | awk -F'[_&]' '{print $1}'`
        dbname=`echo $i | awk -F'[=&]' '{print $2}'`
        dbuser=`printenv "${dbgrp}_DB_USER"`
        dbpass=`printenv "${dbgrp}_DB_PASS"`
        psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
            CREATE USER $dbuser WITH PASSWORD '$dbpass';
            CREATE DATABASE $dbname WITH ENCODING 'UNICODE' LC_COLLATE 'C' LC_CTYPE 'C' TEMPLATE template0;
            GRANT ALL PRIVILEGES ON DATABASE $dbname TO $dbuser;
EOSQL
    fi
done