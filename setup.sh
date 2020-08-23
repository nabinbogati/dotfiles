#!/bin/bash


check_availablity() {
    args="$@"

    for arg in $args
    do
        which $arg
        if [ $? -ne 0 ];then
            sudo apt-get install $1 -yq
            echo "$arg installed successfully"
        fi
    done
}


get_from_git() {
    git clone https://github.com/nabinbogati/dotfiles.git ~/dotfiless
    if [ $? -ne 0 ];then
        echo $line
        echo 'Failed to fetch remote repository'
        echo $line
    fi
}


make_symbolic_links() {
    fname=$(basename $1)
    ln $1 ~/test/.$fname
}


main() {
    # check_availablity git nvim tmux zsh starship && get_from_git && cd ~/dotfiless
    for file in ~/dotfiles/*.*
    do
        make_symbolic_links $file
    done
}


main
