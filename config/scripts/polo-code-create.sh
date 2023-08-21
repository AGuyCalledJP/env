#!/usr/bin/env bash

yabai -m window --focus west
yabai -m window --stack next
selected_name=$(cat ~/.env/lastusedmux)

session_count=$(tmux ls | grep $selected_name | wc -l | xargs)
attached_session_count=$(tmux ls | grep $selected_name | grep attached | wc -l | xargs)

min_count=$(( session_count < attached_session_count ? session_count : attached_session_count ))

new_session_name=$(echo $selected_name)_$(echo $min_count)
tmux new-session -A -d  -s $new_session_name -t $selected_name >> /dev/null
if [[ $min_count -ge $attached_session_count ]]; then
  tmux new-window -a -t $selected_name -c $(cat ~/.env/lastdir)
fi 
tmux attach -t $new_session_name:$min_count
