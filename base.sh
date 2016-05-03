#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	echo "doIt..."
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "*.sh"  --exclude "oh-my-zsh"\
        --exclude ".tmux" --exclude "README.md" --exclude "LICENSE" -avh --no-perms . ~;
    rsync .tmux/.tmux.conf* ~;
    #source ~/.bash_profile;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
    doIt;
else
    read -p "执行这个脚本可能会覆盖home目录下已经存在的文件，确定要执行么？ (y/n) " -n 1;
    echo "";
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        doIt;
    fi;
fi;
unset doIt;
