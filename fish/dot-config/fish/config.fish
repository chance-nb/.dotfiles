if status is-interactive
    # Commands to run in interactive sessions can go here

    # tabtab source for packages
    # uninstall by removing these lines
    [ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true

    set fish_greeting # disable fish greeting

    alias ":3"="nyancat && cli-pride-flags trans --use-flag-height && echo :3"
    alias mewo=nyancat
    alias neofetch=fastfetch

    alias l='eza -lh --icons=auto' # long list
    alias ls='eza --icons=auto' # short list
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
    alias ld='eza -lhD --icons=auto' # long list dirs
    alias lt='eza --icons=auto --tree' # list folder as tree
    alias un='yay -Rns' # uninstall package
    alias up='yay -Syu' # update system/package/aur
    alias pl='yay -Qs' # list installed package
    alias pa='yay -Ss' # list available package
    alias pc='yay -Sc' # remove unused cache
    alias po='yay -Qtdq | yay -Rns -' # remove unused packages, also try > yay -Qqd | yay -Rsu --print -

    alias ua-drop-caches='sudo paccache -rk3; yay -Sc --aur --noconfirm'
    alias update-with-mirrors='export TMPFILE="$(mktemp)"; \
        sudo true; \
        rate-mirrors --save=$TMPFILE arch \
          && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
          && sudo mv $TMPFILE /etc/pacman.d/mirrorlist \
          && ua-drop-caches \
          && yay -Syyu --noconfirm'

    alias dir='dir --color=auto -F'
    alias grep='grep --color=auto'
    alias update-grub='sudo grub2-mkconfig -o /boot/grub/grub.cfg'
    alias ua=' flatpak update --assumeyes && yay -Syu --answerclean n --answerdiff n --answeredit n --answerupgrade y'

    abbr -a c "clear && fastfetch"

    abbr -a lg lazygit
    abbr -a gs git status
    abbr -a gc --set-cursor git commit -m \'%\'
    abbr -a gco git checkout
    abbr -a ga git add
    abbr -a gap git add --patch
    abbr -a gP git push
    abbr -a gp git pull
    abbr -a gd git diff
    abbr -a gds git diff --staged
    abbr -a gb git branch
    abbr -a gl 'git log --all --graph --pretty=format:\'%C(magenta)%h %C(white) %an %ar%C(auto) %D%n%s%n\''

    abbr -a zj zellij
    abbr -a ze zellij edit
    abbr -a zr zellij run --
    abbr -a zrf zellij run --floating --
    abbr -a zrc zellij run --close-on-exit --
    abbr -a zrfc zellij run --close-on-exit --floating --

    abbr -a pfl cli-pride-flags
    abbr -a pflh cli-pride-flags --use-flag-height

    abbr -a gor go run .

    abbr -a v nvim

    abbr -a tm tmux
    abbr -a ta tmux a
    abbr -a e edit

    abbr -a ic kitty icat

    bind  --user \e\e sudope
    set fish_escape_delay_ms 200

    abbr --set-cursor -a cg "cd ~/.config/%"
    abbr --set-cursor -a ce "nvim ~/.config/%"

    set -q KITTY_PID
    and fastfetch
end
set -gx LC_ALL "en_GB.UTF-8"
set -gx EDITOR "nvim"

fish_add_path /home/astrid/.spicetify
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin
