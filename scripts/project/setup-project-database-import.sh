#!/bin/bash

# Arguments
while getopts s: flag
do
    case "${flag}" in
        s) sql=${OPTARG};;
    esac
done

# Variables & Constants
readonly MYSQL_SQL_DATA_PATH=/app/configs/mysql/data
if [ -n "$sql" ]
  then readonly MYSQL_SQL_IMPORT_FILE=$sql
  else readonly MYSQL_SQL_IMPORT_FILE=$(find $MYSQL_SQL_DATA_PATH -maxdepth 1 -type f -name '[0-9]*' ! -name '*.zip' -printf "%f\n" | sort -V | tail -n 1)
fi
readonly MYSQL_SQL_IMPORT_FILE_FULL_PATH=$MYSQL_SQL_DATA_PATH/$MYSQL_SQL_IMPORT_FILE

# Import SQL
/helpers/sql-import.sh $MYSQL_SQL_IMPORT_FILE_FULL_PATH