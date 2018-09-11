#!/bin/bash

# File deletion (in this case xml) for a specific case (GeoServer Geo Web Cache xml files).

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Note: Sudo is required. ***${NC}"


cd /usr/share/geoserver/data/gwc-layers/

INPUT=layer_names.csv
OLDIFS=$IFS
IFS=,
[ ! -f $INPUT ] && { echo "$INPUT file not found"; exit 99; }

while read Layer_name
do

        echo "---" $Layer_name "---"
        grep -w $Layer_name *.xml |cut -d ':' -f 1 | xargs echo
        grep $Layer_name *.xml |cut -d ':' -f 1 | xargs sudo rm


done < $INPUT
IFS=$OLDIFS


#ref:
#1) http://www.cyberciti.biz/faq/unix-linux-bash-read-comma-separated-cvsfile/
#2) http://stackoverflow.com/questions/11191475/command-line-piping-find-results-to-rm
#3) http://unix.stackexchange.com/questions/206903/match-exact-string-using-grep

