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

