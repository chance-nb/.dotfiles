function edit
set -l session_name "edit "(basename (pwd))

if tmux has-session -t "$session_name" >/dev/null 2>&1;
    tmux attach -t "$session_name";
else;
    tmux new-session -d -s "$session_name" -n "nvim" 'printf \'\033]2;nvim\033\'; nvim'
    tmux new-window -t "$session_name:" -n "testing"
    tmux new-window -t "$session_name:" -n "git" 'printf \'\033]2;lazygit\033\'; lazygit'
    tmux attach -t "$session_name:nvim" >/dev/null 2>&1; or tmux switch -t "$session_name:nvim"
end
end
