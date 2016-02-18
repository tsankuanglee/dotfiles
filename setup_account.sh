#!/usr/bin/bash

user="$1"
rsync -at .bashrc .bash_profile .vim* .tmux.conf ~/$user

