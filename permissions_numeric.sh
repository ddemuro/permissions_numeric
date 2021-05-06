#!/bin/bash
rm hello.csv
echo "Permissions string, Octal" >> hello.csv

for ((i=0; i<=7777; i+=1)); do
  echo "Testing $i"
  if echo $i | grep -P '[0-7]{4}'; then
      rm hello
      touch hello
      chmod $i hello
      stat=`stat -c '%A %a %n' hello`
      echo "\"$stat\"" >> hello.csv
  else
      echo "Did not match :("
  fi
done