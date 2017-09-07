#!/bin/bash

ssh-keygen

ssh-keygen -f ~/.ssh/id_rsa.pub -e -m pem>~/.ssh/id_rsa.pub.pem

cat ~/.ssh/id_rsa.pub.pem
