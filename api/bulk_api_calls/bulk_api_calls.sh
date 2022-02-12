#! /bin/bash

##################################################################################################
#
# ./bulk_api_calls.sh data_file.csv
#
#   curl -X POST -H Content-Type: application/json --data {"body":{"col1":"test1","col2":"test1a","col3":"test1b"}}
#   curl -X POST -H Content-Type: application/json --data {"body":{"col1":"test2","col2":"test2a","col3":"test2b"}}
#   curl -X POST -H Content-Type: application/json --data {"body":{"col1":"test3","col2":"test3a","col3":"test3b"}}
#
#   Done!
#
##################################################################################################

WEBHOOK_LINK=""

while IFS=, read -r col1 col2 col3; do

  curl -X POST -H "Content-Type: application/json" $WEBHOOK_LINK \
  --data '{"body":{"col1":"'$col1'","col2":"'$col2'","col3":"'$col3'"}}'

done < $1

echo -e "\nDone!"
