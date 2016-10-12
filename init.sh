
# Symlink config files to the correct place on a new install

if [ ! -f "~/.vimrc" ]; then
    ln -s ".vimrc" "~/.vimrc"
fi

if [ ! -f "~/.bash_aliases" ]; then
    ln -s ".bash_aliases" "~/.bash_aliases"
fi

