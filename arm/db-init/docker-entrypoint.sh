#!/bin/sh

#WAIT_TIME
while ! curl -X GET couchdb:5984/_all_dbs ; do
    sleep 1
done


#CORS SETUP
add-cors-to-couchdb http://couchdb:5984

#MIGRATOR
/root/couchdb-setup.sh -p 5984 -h couchdb
