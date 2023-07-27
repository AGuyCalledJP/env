#!/bin/bash
wal -i "$(grep file ${HOME}/.config/nitrogen/bg-saved.cfg | cut -c 6-99)" -q -b 000000 -l
echo 1 > ${HOME}/.env/config/lightordark
