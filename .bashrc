source /usr/share/defaults/etc/profile

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

neofetch

# Add Rust to $PATH
export PATH="$HOME/.cargo/bin:$PATH"
PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
PATH="/home/solus/.local/bin:$PATH"

source $HOME/.config/broot/launcher/bash/br
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias ll='ls -ahl'
alias open='xdg-open'
bind -x '"\C-b":"br -h"'

##using curl
transfer() { if [ $# -eq 0 ]; then echo -e "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"; return 1; fi
	tmpfile=$( mktemp -t transferXXX ); if tty -s; then basefile=$(basename "$1" | sed -e 's/[^a-zA-Z0-9._-]/-/g'); curl --progress-bar --upload-file "$1" "https://transfer.sh/$basefile" >> $tmpfile; else curl --progress-bar --upload-file "-" "https://transfer.sh/$1" >> $tmpfile ; fi; cat $tmpfile; rm -f $tmpfile; }

# deep fuzzy cd
function dcd {
	    br -h --only-folders --cmd "$1 :cd"
    }
