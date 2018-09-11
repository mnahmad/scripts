#!/bin/bash


	for j in {1..10}
	do
		echo -ne -e "${Yellow}"  $j "${NC}"  \\r
		sleep 1s
	done

exit 0