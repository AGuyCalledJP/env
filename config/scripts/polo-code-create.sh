selected_name=$(cat ~/.env/lastusedmux)
session_count=$(tmux ls | grep $selected_name | wc -l | xargs)
new_session_name=$(echo $selected_name)_$(echo $session_count)
tmux new-session -A -d  -s $new_session_name -t $selected_name >> /dev/null
tmux new-window -a -t $selected_name -c $(cat ~/.env/lastdir)
tmux attach -t $new_session_name:$session_count 
