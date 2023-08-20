#!/bin/bash
wal --backend haishoku -i ${HOME}/.env/config/backgrounds/$(cat ${HOME}/.env/config/bg-image) -n -q 
echo 0 > ${HOME}/.env/config/lightordark
