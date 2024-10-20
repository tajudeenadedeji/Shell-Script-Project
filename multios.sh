#!/bin/bash

#Variable Declaration

URL='https://www.tooplate.com/zip-templates/2133_moso_interior.zip'
TEMPLATE='2133_moso_interior'
DIR='/tmp/webfiles'

yum --help &> /dev/null

if [ $? -eq 0 ]
then
    # set variable for Amazon Linux
    PACKAGE="httpd wget unzip"
    SVC="httpd"

    # Installing Apache Webserver and Dependencies
    echo "##################################"
    echo "Installing the Required Packages"
    echo "##################################"
    sudo yum update -y > /dev/null
    sudo yum install $PACKAGE -y > /dev/null
    echo

    # Start and Enable HTTPD Service
    echo "##################################"
    echo "Starting and Enable HTTPD Service"
    echo "##################################"
    sudo systemctl enable $SVC
    sudo systemctl start $SVC
    echo

    # Download Frontend Template to TMP Directory
    echo "##################################"
    echo "Downnloading Frontend Template"
    echo "##################################"
    mkdir -p $DIR
    cd $DIR

    wget $URL >/dev/null
    unzip $TEMPLATE.zip > /dev/null
    sudo cp -r $TEMPLATE/* /var/www/html/
    sudo systemctl restart $SVC

    cd ~
    rm -rf $DIR
else
     # set variable for Ubuntu Linux
     PACKAGE="apache2 wget unzip"
     SVC="apache2"

     # Installing Apache Webserver and Dependencies
     echo "##################################"
     echo "Installing Packages"
     echo "##################################"
     sudo apt update > /dev/null
     sudo apt install $PACKAGE -y > /dev/null
     echo


     # Download Frontend Template to TMP Directory
     echo "##################################"
     echo "Downnloading Frontend Template"
     echo "##################################"
     mkdir -p $DIR
     cd $DIR

     wget $URL > /dev/null
     unzip $TEMPLATE.zip > /dev/null
     sudo cp -r $TEMPLATE/* /var/www/html/
     sudo systemctl restart $SVC

     cd ~
     rm -rf $DIR
fi
