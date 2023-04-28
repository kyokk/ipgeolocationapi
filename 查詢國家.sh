#!/bin/bash
READ_FILE=$1
while read line;
do
        curl "https://api.ipgeolocation.io/ipgeo?apiKey=API KEY&ip=${line}" --insecure>$line.txt
        cat $line.txt|jq '. |[.ip, .country_name  ] | @csv'>>country.txt
done<$READ_FILE
