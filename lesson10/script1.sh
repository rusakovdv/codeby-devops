#!/bin/bash

WORK_DIR=~/myfolder

if [ ! -d "$WORK_DIR" ]; then
  mkdir $WORK_DIR
fi 
 cd $WORK_DIR

timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
echo "Hello
$timestamp" >> file1.txt

touch file2.txt
chmod 777 file2.txt

cat /dev/urandom | tr -dc 'a-zA-Z0-9' | head -c 20 >> file3.txt

touch file4.txt
touch file5.txt
