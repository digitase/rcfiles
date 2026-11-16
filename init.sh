
# Symlink config files to the correct place on a new install

function readlinkf {
    perl -MCwd -e 'print Cwd::abs_path shift' "$1"
}

function create_link {
    RCFILE="$1"
    LINKPATH="$2"
    
    if [ -e "$LINKPATH" ]; then
        # echo Renaming existing file "$LINKPATH" to "$LINKPATH.old"
        # mv -v "$LINKPATH" "$LINKPATH.old"
        echo SKIPPING: "$LINKPATH" already exists!
    else
        # echo Linking "$LINKPATH" to "$RCFILE"
        ln -v -s "$(readlinkf "$RCFILE")" "$LINKPATH"
    fi
}

create_link .vimrc ~/.vimrc
create_link .shell_profile ~/.shell_profile
create_link .shell_rc ~/.shell_rc
create_link .tmux.conf ~/.tmux.conf
create_link .inputrc ~/.inputrc
create_link .gitconfig ~/.gitconfig
create_link .Rprofile ~/.Rprofile

