#!/bin/bash
wal --backend haishoku -i ${HOME}/.env/config/backgrounds/$(cat ${HOME}/.env/config/bg-image) -n -q -l
echo 1 > ${HOME}/.env/config/lightordark
