#!/bin/bash

AUTORIZED_PATH="scripts/dev"
export JAVA_HOME=/usr/local/jdk

PWD=$(pwd)

if [[ $PWD == *$AUTORIZED_PATH ]]
then
	cd ../../
	
	echo -e "\nGénération des fichiers "rebel.xml"\n"
	/usr/local/maven/bin/mvn jrebel:generate
	echo -e "\nJRebelify finished"

else
	echo -e "\nErreur - Veuillez executer ce script depuis ${AUTORIZED_PATH} !\n";
fi

cd $PWD
