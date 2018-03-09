#!/bin/bash

declare -a arr=("auditserver" "transaction-server" "database" "WebServer" "parent")
cd "${0%/*}"
for i in "${arr[@]}"
do 
	cd "$i"
	git pull origin master
	cd ..
done