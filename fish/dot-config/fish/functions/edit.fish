function edit
set -l session_name "edit "(basename (pwd))

if tmux has-session -t "$session_name" >/dev/null 2>&1;
    tmux attach -t "$session_name";
else;
    tmux new-session -s "$session_name" -n "nvim" nvim \; \
    new-window -n "testing" \; \
    new-window -n "git" lazygit \; \
    select-window -t "nvim";
end
end
