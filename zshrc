# Path to the oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Loads plugins.
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

autoload -U zmv
autoload -U promptinit && promptinit
autoload -U colors && colors

# Bell activates whenever a command is done running.
function precmd() {
    #echo -n "\a"
}

# Customizes the prompt.
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWSTASHSTATE=1
GIT_PS1_SHOWUNTRACKEDFILES=1
GIT_PS1_SHOWUPSTREAM="auto"

PROMPT='
%{$fg[gray]%}┌─[%{$fg_bold[blue]%}%~%{$reset_color$fg[gray]%}]\
    $(git_prompt_info "[$fg_bold[red]%s$reset_color$fg[gray]]")
└─╼%{$reset_color%} %'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[cyan]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[cyan]%}]%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✔"

#source /home/finiks/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Custom aliases.
alias ls="ls -Fh --color --group-directories-first"
alias tree="tree -C"
alias manv="PAGER=vimpager man"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias dir755="find ./ -type d -exec chmod 755 {} +"
alias files644="find ./ -type f -exec chmod 644 {} +"

alias pac-s="sudo pacman -Ss"
alias pac-u="echo \"HAVE THE /BOOT MOUNTED FIRST.\" && sudo pacman -Syu"
alias pac-i="sudo pacman -Sy"
alias pac-r="sudo pacman -R"

alias metasploit="/opt/metasploit/msfconsole"
alias mp="mplayer -ass -geometry 1280x720 -af scaletempo"

alias ke0="echo 0 | sudo tee /sys/class/leds/asus\:\:kbd_backlight/brightness"
alias ke2="echo 2 | sudo tee /sys/class/leds/asus\:\:kbd_backlight/brightness"
alias ton="synclient TouchpadOff=0"
alias toff="synclient TouchpadOff=1"
alias extdisp="xrandr --output VGA1 --mode 1920x1080 --left-of LDVS1"
alias extdispoff="xrandr --output VGA1 --off"
alias screenoff="xset dpms force off"

alias sd="sudo shutdown now -h"
alias key="sudo umount /dev/sdb1"
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias ducks="du -cksh * | sort -rn|head -11"

# Launch at the start of the terminal.
export SUDO_EDITOR=rvim
export GOPATH=$HOME/dev/go
export PATH=$PATH:$HOME/dotfiles/bin:$GOPATH/bin
