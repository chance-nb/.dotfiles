if status is-interactive
    # Commands to run in interactive sessions can go here
    set fish_greeting

    alias v=nvim
    alias vi=nvim
    alias vim=nvim
    alias prflag=cli-pride-flags
    alias ":3"="nyancat && cli-pride-flags trans --use-flag-height && echo :3"
    alias mewo=nyancat
    alias neofetch=fastfetch

    alias c='clear' # clear terminal
    alias l='eza -lh --icons=auto' # long list
    alias ls='eza --icons=auto' # short list
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
    alias ld='eza -lhD --icons=auto' # long list dirs
    alias lt='eza --icons=auto --tree' # list folder as tree
    alias zj='zellij'
    alias ze='zellij edit'
    alias zr='zellij run --'
    alias zrf='zellij run --floating --'
    alias zrc='zellij run --close-on-exit --'
    alias zrfc='zellij run --close-on-exit --floating --'
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
    alias vdir='vdir --color=auto -F'
    alias grep='grep --color=auto'
    alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias ua=' flatpak update --assumeyes && yay -Syu --answerclean n --answerdiff n --answeredit n --answerupgrade y'
    alias gs="git status"
    alias lg='lazygit'

    alias gor="go run ."

    alias ls='eza --icons=auto' # short list
    alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
    alias ld='eza -lhD --icons=auto' # long list dirs
    alias lt='eza --icons=auto --tree' # list folder as tree
    alias zj='zellij'
    alias ze='zellij edit'
    alias zr='zellij run --'
    alias zrf='zellij run --floating --'
    alias zrc='zellij run --close-on-exit --'
    alias zrfc='zellij run --close-on-exit --floating --'
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
    alias vdir='vdir --color=auto -F'
    alias grep='grep --color=auto'
    alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
    alias ua=' flatpak update --assumeyes && yay -Syu --answerclean n --answerdiff n --answeredit n --answerupgrade y'
    alias gs="git status"
    alias lg='lazygit'

    alias gor="go run ."

    set -q KITTY_PID
    and fastfetch
end

# tabtab source for packages
# uninstall by removing these lines
[ -f ~/.config/tabtab/__tabtab.fish ]; and . ~/.config/tabtab/__tabtab.fish; or true
