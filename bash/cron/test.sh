#!/bin/bash

# This is test script generates a file every time cron job runs. 

clear

cd /home/geoinformatics/myscripts/sh/cron


current_date=$(date +"%m-%d-%y")
file_name="Workspace_"$current_date

touch  $file_name

#1. add job to cron
  # crontab /path-to-txt-file

#2. list of jobs 
  #crontab -l 

#3. delete job from cron
  # crontab -r



