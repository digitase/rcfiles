# Bash aliases

# Append to PATH
PATH="$HOME/bin:$PATH"

# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
#    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#    alias ls='ls --color=auto'
#    alias dir='dir --color=auto'
#    alias vdir='vdir --color=auto'
#
#    alias grep='grep --color=auto'
#    alias fgrep='fgrep --color=auto'
#    alias egrep='egrep --color=auto'
#fi

# some more ls aliases
alias l='ls -Fa'
alias ll='ls -Fal'
alias lll='ls -Faltr'

# For vimcom/vim-r-plugin
#alias vim="vim --servername VIM"

# Set pager to less
export PAGER="less"

# default editor settings
export VISUAL=vim
export EDITOR="$VISUAL"

# Force tmux to assume the terminal supports 256 colours.
alias tmux="tmux -2"

# Gets fresh environment variables for tmux
function tmux_refresh_env_vars {
    if [ -n "$TMUX"  ]; then
        export $(tmux show-environment | grep "^DISPLAY")
    fi
}

# List active tmux sockets
function tmux_get_active_sockets {
    for tmux_socket_path in $(lsof -U | grep '^tmux' | awk '{print $9}'); do
        echo "$tmux_socket_path"
        printf '\t%s\n' "$(tmux -S $tmux_socket_path ls)"
    done
}

# Therefore I wrote a little wrapper around tmux for the bash shell. This adds a
# new command tmux update-environment that updates the environment variables from
# the current session environment: 
# https://raimue.blog/2013/01/30/tmux-update-environment/
# function tmux() {
    # local tmux=$(type -fp tmux)
    # case "$1" in
        # update-environment|update-env|env-update)
            # local v
            # while read v; do
                # if [[ $v == -* ]]; then
                    # unset ${v/#-/}
                # else
                    # Add quotes around the argument
                    # v=${v/=/=\"}
                    # v=${v/%/\"}
                    # eval export $v
                # fi
            # done < <(tmux show-environment)
            # ;;
        # *)
            # $tmux "$@"
            # ;;
    # esac
# }
