#! /bin/bash

##################################################################################################
#
# Removes original files when there's an archived copy of these files in the same directory
#
# > ls -la
# Report1.csv
# Report1.csv.gz
# Report2.csv.gz
#
# Report1.csv - will be removed as there's an arhived file called Report1.csv.gz
#
##################################################################################################

DIR='' # Path to directory with files
FILE_NAME='' # File name format e.g. Report*.csv

echo "Checking files in $DIR. Script ran at " $(date +"%d-%m-%Y %T")

cd $DIR;
for f in *; do
    echo $f
    [ -f $f ] || continue
    if [[ $f = $FILE_NAME.gz ]]; then
        # echo added as a safety measure. Remove to execute the rm command
        echo rm ${f%???}
    fi
done

echo -e "\nDone!"
