#!/bin/bash

#Double-check you're ready to rock and roll with an update
#read -r -p "Are you sure you want to update all specified directories? [y/N] " response

#if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then

#For each item in array, run the commands

echo ""
echo "*****************************************************"
echo "START SCRIPT TO BUILD PROJECT LARAVEL TEST ENVIRONMENT"
echo "*****************************************************"
echo ""

echo "*****************************************************"
echo "#Build docker image"
echo "*****************************************************"
docker-compose build
echo ''
echo "*****************************************************"
echo "#Run up the enviroment"
echo "*****************************************************"
make start
echo ''
echo "*****************************************************"
echo "#Install dependencies with composer"
echo "*****************************************************"
make composer-install
echo ''
echo "*****************************************************"
echo "#Create env file"
echo "*****************************************************"
make env-dev
echo ''
echo "*****************************************************"
echo "#Change permission"
echo "*****************************************************"
make permission
make permission-log
echo ''
echo "*****************************************************"
echo "#Install dependencies NPM"
echo "*****************************************************"
npm i
npm run watch

echo ''
echo "*****************************************************"
echo "SCRIPT DONE!"
echo "*****************************************************"
echo ''

#fi
