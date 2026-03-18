#!/bin/bash

file="actividad.txt"

# fechas
today=$(date +%Y-%m-%d)
yesterday=$(date -d "yesterday" +%Y-%m-%d)

for day in $yesterday $today
do

# entre 5 y 8 commits
num=$((5 + RANDOM % 4))

for ((i=1;i<=num;i++))
do

hour=$((10 + RANDOM % 10))
minute=$((RANDOM % 60))
second=$((RANDOM % 60))

echo "actividad $day $i" >> $file

git add .

GIT_AUTHOR_DATE="$day $hour:$minute:$second" \
GIT_COMMITTER_DATE="$day $hour:$minute:$second" \
git commit -m "update $day commit $i"

done

done

git push origin main
