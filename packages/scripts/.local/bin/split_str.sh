#!/bin/bash

delimiter=$1
string=$2

IFS="$delimiter" read -ra array <<< "$string"

for element in "${array[@]}"; do
  echo "$element"
done
