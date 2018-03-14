#!/bin/bash

# Options are -u for username -w for passWord and -p for port number
while getopts "u:w:p:h:" option; do
  case $option in
    u) COUCHUSER=${OPTARG};;
    w) COUCHPASSWORD=${OPTARG};;
    p) PORT=${OPTARG};;
    h) HOST=${OPTARG};;
  esac
done

if [ -z "$HOST" ]
then
  HOST=127.0.0.1
fi

# Default port for CouchDB accessed from host machine is 5984
PORT=${PORT:-5984}
if [ -z "$COUCHUSER" ]
then
  COUCHURL=http://$HOST:$PORT
else
  COUCHURL=http://$COUCHUSER:$COUCHPASSWORD@$HOST:$PORT
fi

curl -X PUT $COUCHURL/_users
curl -X PUT $COUCHURL/_replicator
curl -X PUT $COUCHURL/_global_changes

for database in /app/databases/*.js; do
      curl -X PUT $COUCHURL/${database:15:-3}
      case ${database:15:-3} in
        "communities" | "languages" | "configurations" ) ;;
        * ) /app/node_modules/.bin/couchapp push $database $COUCHURL/${database:15:-3} ;;
      esac
done

## add bare minimal required data to couchdb for launching bell-apps smoothly
for filename in /app/init_docs/languages/*.txt; do
  curl -d @$filename -H "Content-Type: application/json" -X POST $COUCHURL/languages;
done
curl -d @app/init_docs/ConfigurationsDoc-Community.txt -H "Content-Type: application/json" -X POST $COUCHURL/configurations
curl -d @app/init_docs/admin.txt -H "Content-Type: application/json" -X POST $COUCHURL/members
