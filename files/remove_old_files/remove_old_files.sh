#! /bin/bash

##################################################################################################
#
# Removes files older than X days optionally skipping files with specified dates
#
# ./remove_old_files.sh
#
#   File: Report-20220101.csv
#   Date: 20220101
#   Skipping...
#
#   File: Report-20220102.csv
#   Date: 20220102
#   rm -rf Report-20220102.csv
#
#   File: Report-20220103.csv
#   Date: 20220103
#   rm -rf Report-20220103.csv
#
##################################################################################################

DIR='' # Path to directory with files
FILE_NAME='' # File name format e.g. Report*.csv

echo "Checking files in $DIR. Script ran at " $(date +"%d-%m-%Y %T")

cd $DIR;
for f in $FILE_NAME; do
    echo -e "\nFile: $f"
    # Adjust the awk to match your file naming sheme
    # The below will work with files like Report-20220102.csv
    FILE_DATE=$(echo $f | awk -F '[-.]' '{print $2}')
    # Make sure below is printing out only dates
    echo "Date: $FILE_DATE"
    # Set how old the files must be to get removed. Adjust your date patterns here as well
    if  [ $(date -d '-7 days' +%Y%m%d) -gt $(date -d $FILE_DATE +%Y%m%d) ]; then
        # Optionally set dates you would like to skip. E.g. skip every 1st and 15th day of the month
        if [ $(date -d $FILE_DATE +%d) -eq 1 ] || [ $(date -d $FILE_DATE +%d) -eq 15 ]; then
            echo "Skipping..."
        else
            # echo added as a safety measure. Remove to execute the rm command
            echo rm -rf $f
        fi
    fi
done

echo -e "\nDone!"
