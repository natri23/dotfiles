source /usr/share/defaults/etc/profile

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

neofetch

# Add Rust to $PATH
export PATH="/home/solus/.cargo/bin:$PATH"

source /home/solus/.config/broot/launcher/bash/br
alias config='/usr/bin/git --git-dir=/home/solus/.cfg/ --work-tree=/home/solus'
