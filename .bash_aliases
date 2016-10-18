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
alias lll='ls -Falt | tac'

# For vimcom/vim-r-plugin
#alias vim="vim --servername VIM"

# Set pager to less
export PAGER="less"

# default editor settings
export VISUAL=vim
export EDITOR="$VISUAL"

