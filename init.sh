
# Symlink config files to the correct place on a new install

function create_link {

    RCFILE="$1"
    LINKPATH="$2"
    
    if [ ! -e "$LINKPATH" ]; then
        echo Linking "$LINKPATH" to "$RCFILE"
        ln -s "$(readlink -f "$RCFILE")" "$LINKPATH"
    fi

}

create_link .vimrc ~/.vimrc
create_link .bash_aliases ~/.bash_aliases
create_link .tmux.conf ~/.tmux.conf
create_link .inputrc ~/.inputrc

