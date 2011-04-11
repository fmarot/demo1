#!/bin/bash

export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=512m -XX:MaxPermSize=1024m"
AUTORIZED_PATH="scripts/dev"
export JAVA_HOME=/usr/local/jdk

PWD=$(pwd)

if [[ $PWD == *$AUTORIZED_PATH ]]
then
	cd ../../
	
	# Génération des sources des projets Maven et des fichiers de configuration Eclipse 
	echo -e "\nGeneration des sources des projets Maven et des fichiers de configuration Eclipse\n"
	/usr/local/maven/bin/mvn clean generate-sources eclipse:clean eclipse:eclipse jrebel:generate
	echo -e "\nEclipsify finished"

else
	echo -e "\nErreur - Veuillez executer ce script depuis ${AUTORIZED_PATH} !\n";
fi

cd $PWD
