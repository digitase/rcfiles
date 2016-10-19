
# Symlink config files to the correct place on a new install

function readlinkf {
    perl -MCwd -e 'print Cwd::abs_path shift' "$1"
}

function create_link {
    RCFILE="$1"
    LINKPATH="$2"
    
    if [ ! -e "$LINKPATH" ]; then
        echo Linking "$LINKPATH" to "$RCFILE"
        ln -s "$(readlinkf "$RCFILE")" "$LINKPATH"
    fi
}

create_link .vimrc ~/.vimrc
create_link .bash_aliases ~/.bash_aliases
create_link .tmux.conf ~/.tmux.conf
create_link .inputrc ~/.inputrc
create_link .gitconfig ~/.gitconfig

