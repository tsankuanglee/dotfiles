#!/usr/bin/bash

user="$1"
if [ $user == "root" ]
then
    userdir="/root"
else
    userdir="/home/$user"
fi
rsync -at .bashrc .bash_profile .vim* .tmux.conf .config $userdir
chown -R $user:$user $userdir

