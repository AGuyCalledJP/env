#!/usr/bin/env bash

nvim $((find $1 -mindepth 1 -type f) | fzf --preview='cat {} | head -n 50' --preview-window=70%,border-double,top)
