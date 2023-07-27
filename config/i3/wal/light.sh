#!/bin/bash
wal -i "$(grep file ${HOME}/.config/nitrogen/bg-saved.cfg | cut -c 6-99 | head -1)" -q -n -l
echo 1 > ${HOME}/.env/config/lightordark
