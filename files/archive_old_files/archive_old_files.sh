#! /bin/bash

##################################################################################################
#
# Archives raw files older than X days and optionally move them to an archive directory
#
# ./archive_old_files.sh
#
#   Archived Report1.csv and moved to archive
#   Archived Report2.csv and moved to archive
#   Archived Report2.csv and moved to archive
#
#   Done!
#
##################################################################################################

DIR='' # Path to directory with files
ARCHIVE_DIR='' # Path to archive directory

echo "Checking files in $DIR. Script ran at " $(date +"%d-%m-%Y %T")

cd $DIR;
for f in *; do
    # Set how old the files must be to get archived
    if [[ $f != *.gz ]] && [[ $(find "$f" -mtime +7) ]]; then
        gzip "$f"
        # Optionally move the file to an arhive directory
        mv "$f.gz" $ARCHIVE_DIR/.
        echo "Archived $f and moved to $ARCHIVE_DIR"
    fi
done

echo -e "\nDone!"
