#!/bin/bash

export MAVEN_OPTS="-Xms512m -Xmx1024m -XX:PermSize=512m -XX:MaxPermSize=1024m"
AUTORIZED_PATH="scripts/dev"
export JAVA_HOME=/usr/local/jdk

PWD=$(pwd)

if [[ $PWD == *$AUTORIZED_PATH ]]
then
	cd ../../
	
	# Génération des sources des projets Maven et des fichiers de configuration Eclipse 
	echo -e "\nInstallation des projets Maven\n"
	/usr/local/maven/bin/mvn clean install eclipse:clean eclipse:eclipse jrebel:generate -Dmaven.test.skip=true
	echo -e "\nInstall.sh finished"

else
	echo -e "\nErreur - Veuillez executer ce script depuis ${AUTORIZED_PATH} !\n";
fi

cd $PWD
