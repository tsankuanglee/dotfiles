#!/usr/bin/bash

user="$1"
if [ $user -eq "root" ]
then
    userdir="/home/$user"
else
    userdir="/root"
fi
rsync -at .bashrc .bash_profile .vim* .tmux.conf .config $userdir
chown -R $user:$user $userdir

