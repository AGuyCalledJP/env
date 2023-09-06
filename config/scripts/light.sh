#!/bin/bash
wal -i ~/.env/config/backgrounds/$(cat ~/.env/background) -n -q -l
echo 1 > ${HOME}/.env/lightordark
