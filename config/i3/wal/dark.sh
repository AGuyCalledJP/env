#!/bin/bash
wal -i "$(grep file ${HOME}/.config/nitrogen/bg-saved.cfg | cut -c 6-99 | head -1)" -q -n
echo 0 > ${HOME}/.env/config/lightordark
