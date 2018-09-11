#!/bin/bash

#Bulk import of *.sql files into a database

clear

# fun stuff
red='\e[0;31m'
Cyan='\e[0;36m'
LightBlue='\e[1;34m'
Orange='\e[0;33m'     
Yellow='\e[1;33m'
NC='\e[0m' # No Color

echo -e "${red}*** Spatial Table Dump restorer Start ***${NC}"

for myfile in *.sql
	do

		echo -e "${Orange} $myfile ${NC}"

		# User has to be postgres by using command sudo su postgres
		psql some_database < $myfile

done

echo -e "${red}*** Spatial Table Dump restorer end ***${NC}"
