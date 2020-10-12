#!/bin/bash
echo FILE part2ql:
tr '[:lower:]' '[:upper:]' < part2q > part2ql
cat part2ql
echo ________________________________________

echo FILE part2qu:
tr '[:upper:]' '[:lower:]' < part2q > part2qu
cat part2qu
echo ________________________________________

touch part2qr
cp part2q part2qr
echo FILE part2qr:
sed -i 's/commands/COMMANDS/g' part2qr
sed -i '/COMMANDS/ s/the/THE/' part2qr
cat part2qr
echo ________________________________________

touch part2m
cp part2q part2m
echo FILE part2m:
sed -i '1d' part2m
sed -i '$d' part2m
cat part2m
echo ________________________________________

echo FILE part2qa:
cat part2q part2ql part2qu part2qr part2m > part2qa
cat part2qa

