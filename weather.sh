#!/bin/bash
#Script to get the weather

day=`date -d yesterday +%d`
month=`date -d yesterday +%m`
year=`date -d yesterday +%Y`

echo Day $day
echo Month $month
echo Year $year
curl "https://www.wunderground.com/history/airport/GNV/$year/$month/$day/DailyHistory.heml?&format=1" > gnv.txt

maxTemp=`awk -F',' '{print $2}' gnv.txt | sort -n | tail -n1`

echo "Yeasterday's high was: $maxTemp"

