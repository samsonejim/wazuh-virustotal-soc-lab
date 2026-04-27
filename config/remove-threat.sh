#!/bin/bash
LOCAL=$(dirname $0)
cd $LOCAL
cd ../
PWD=$(pwd)

read INPUT_JSON

FILENAME=$(echo $INPUT_JSON | python3 -c \
  'import sys, json; \
   data = json.load(sys.stdin); \
   print(data["parameters"]["alert"]["data"]["virustotal"]["source"]["file"])')

echo "$(date) - Removing malware: $FILENAME" >> /var/ossec/logs/active-responses.log
rm -f "$FILENAME"
echo "$(date) - Successfully removed: $FILENAME" >> /var/ossec/logs/active-responses.log
