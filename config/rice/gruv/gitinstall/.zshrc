export ZSH="$HOME/.oh-my-zsh"
export perzsh="$HOME/.config/zsh"
source $perzsh/envvar

ZSH_THEME="$zshtheme"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


#aliases
#system
alias p="sudo pacman -S"
alias y="yay -S"
alias v="nvim"

#ssh
alias sark="ssh sark@192.168.0.41"
alias sarkftp="sftp sark@192.168.0.41"
alias aries="ssh aries@192.168.0.31"
alias ariesftp="sftp aries@192.168.0.31"
alias ts="~/shellscripts/sersync.sh"

#zsh edits
alias zshc="cd ~/.config/zsh"
alias edit="nvim ~/.zshrc"
alias vva="nvim ~/.config/zsh/envvar"

#git
alias commit="git commit -a"
alias push="git push"

#rice
alias riced="cd ~/.config/rice/$theme"
alias rice="~/shellscripts/rice.sh"
alias vh="nvim ~/.config/hypr/hyprland.conf"
alias vha="nvim ~/.config/hypr/core/appearance.conf"
alias vdu="nvim ~/.config/dunst/dunstrc"
alias rofi="nvim ~/.config/rofi"
alias hypr="nvim ~/.config/hypr"
alias way="nvim ~/.config/waybar"
alias wallp="pkill linux-wallpaper; nohup ~/shellscripts/wallp.sh > ~/shellscripts/wallp.out"
alias f="fastfetch"


#420 xx hackerman
alias pipes="~/shellscripts/pipes.sh -c 3,4,5,6 -p 3 -r 4000"
alias rain="~/shellscripts/rain.sh"
alias clock="tty-clock -ctB -C6"

#fixes
alias gtkfix="xhost si:localuser:root"
alias sffix="sudo sysctl kernel.split_lock_mitigate=0"

#ipod
alias alac="~/shellscripts/convertalac.sh"
alias ipod="~/shellscripts/ipod.sh"

#misc
alias upc="sudo ~/shellscripts/updatecleanup.sh"
alias reshade="~/shellscripts/reshade-linux.sh"
alias whf="cd ~/projects/games/thewharf/; git pull"

#ssh
eval "$(ssh-agent -s)" > /dev/null
#ssh-add ~/.ssh/gitkey 2>/dev/null
#ssh-add ~/.ssh/id_rsa 2>/dev/null
ssh-add ~/.ssh/id_ed25519 2>/dev/null

#spicetify
export PATH=$PATH:/home/bailey/.spicetify
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_TYPE=wayland

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

###this is what executes your Hyprland, do not remove :) 
if [[ "$(tty)" == "/dev/tty1" ]]; then
    exec start-hyprland &>/dev/null
fi
