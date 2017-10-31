#!/bin/bash

if [ "$(whoami)" != "root" ]
then
    sudo su -s "$0"
    exit
fi


file="/home/runtime/.ssh/id_rsa"

if [ -f $file ] ; then
    rm $file
    rm /home/runtime/.ssh/id_rsa.pub
    rm /home/runtime/.ssh/id_rsa.pub.pem
fi

ssh-keygen

ssh-keygen -f ~/.ssh/id_rsa.pub -e -m pem>~/.ssh/id_rsa.pub.pem

cat ~/.ssh/id_rsa.pub.pem


mv /root/.ssh/id* /home/runtime/.ssh/

chown runtime:runtime /home/runtime/.ssh/id*

echo
echo Paste the PRODUCTION WALL UID below and hit ENTER
read -p 'PRODUCTION WALL UID: ' prod_uid

echo
echo
echo Paste the STAGING WALL UID below and hit ENTER

read -p 'STAGING WALL UID: ' stg_uid

sudo sed -i "1s/.*/$prod_uid/" /home/runtime/.tsx/auth/production_instance_wall_uid
sudo sed -i "1s/.*/$stg_uid/" /home/runtime/.tsx/auth/staging_instance_wall_uid

