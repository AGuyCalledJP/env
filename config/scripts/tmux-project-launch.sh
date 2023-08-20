#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
  selected=$( \
    (find ~/work ~/work/newlands -maxdepth 1 -mindepth 1 -type d && \
    find ~/ -name ".env" -maxdepth 1 -type d) \
    | fzf --preview='tree -C {} | head -n 50' --preview-window=70%,border-double,top)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
echo $selected_name > ~/.env/lastusedmux
echo $selected > ~/.env/lastdir
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi

if ! tmux has-session -t=$selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
    tmux attach -t $selected_name || tmux switch-client -t $selected_name >> /dev/null
    exit 0
fi


session_to_use=$( \
  (tmux ls | grep $selected_name && echo "new session") \
  | fzf)

selected_session=$(echo $session_to_use | cut -d ":" -f1)
session_count=$(tmux ls | grep $selected_name | wc -l | xargs)

if [[ $selected_session == "new session" ]]; then
    new_session_name=$(echo $selected_name)_$(echo $session_count)
    tmux new-session -A -d  -s $new_session_name -t $selected_name >> /dev/null
    tmux new-window -a -t $selected_name -c $selected
    tmux attach -t $new_session_name:$session_count || tmux switch-client -t $new_session_name >> /dev/null
    exit 0
fi

tmux attach -t $selected_session || tmux switch-client -t $selected_session >> /dev/null

