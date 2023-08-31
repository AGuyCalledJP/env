#!/usr/bin/env bash

session_to_use=$( \
  (tmux ls && echo "new session") \
  | fzf)

selected_session=$(echo $session_to_use | cut -d ":" -f1)

if [[ $selected_session == "new session" ]]; then
    new_session_name=$(echo $selected_name)_$(echo $session_count)
    tmux new-session -A -d  -s $new_session_name -t $selected_name >> /dev/null
    tmux new-window -a -t $selected_name -c $selected
    tmux attach -t $new_session_name:$session_count || tmux switch-client -t $new_session_name >> /dev/null
    exit 0
fi

tmux attach -t $selected_session || tmux switch-client -t $selected_session >> /dev/null

