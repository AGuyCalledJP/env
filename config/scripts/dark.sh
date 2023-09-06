#!/bin/bash
wal -i ~/.env/config/backgrounds/$(cat ~/.env/background) -n -q 
echo 0 > ${HOME}/.env/lightordark
