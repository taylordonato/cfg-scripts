#!/bin/bash

if [ "$(whoami)" != "runtime" ]
then
    sudo su - "runtime"
    exit
fi

