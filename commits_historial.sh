#!/bin/bash

# fecha inicial (ajústala si quieres otro mes)
start_date="2026-03-25"

# hoy
end_date=$(date +%Y-%m-%d)

file="actividad.txt"

current=$start_date

while [[ "$current" < "$end_date" ]] || [[ "$current" == "$end_date" ]]
do

# entre 15 y 20 commits
num=$((15 + RANDOM % 6))

for ((i=1;i<=num;i++))
do

hour=$((9 + RANDOM % 10))
minute=$((RANDOM % 60))
second=$((RANDOM % 60))

echo "actividad $current $i $(date +%s)" >> $file

git add .

GIT_AUTHOR_DATE="$current $hour:$minute:$second" \
GIT_COMMITTER_DATE="$current $hour:$minute:$second" \
git commit -m "update $current commit $i"

done

current=$(date -I -d "$current + 1 day")

done

git push origin main
