#!/bin/bash

start="2024-01-01"
end=$(date +%Y-%m-%d)

file="actividad.txt"

current=$start

while [[ "$current" < "$end" ]] || [[ "$current" == "$end" ]]
do

# numero aleatorio de commits por dia
num=$((1 + RANDOM % 8))

for ((i=1;i<=num;i++))
do

echo "actividad $current $i" >> $file

git add .

GIT_AUTHOR_DATE="$current $((10 + RANDOM % 10)):$(($RANDOM % 60)):$(($RANDOM % 60))" \
GIT_COMMITTER_DATE="$current $((10 + RANDOM % 10)):$(($RANDOM % 60)):$(($RANDOM % 60))" \
git commit -m "update $current commit $i"

done

current=$(date -I -d "$current + 1 day")

done

git push origin main
