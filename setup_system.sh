#!/usr/bin/bash

# before calling this script, run this
#pacman -Syu
#reboot

# read config
if [ ! -f config.sh ]; then
    echo "need config.sh"
    exit 1
fi


vi /etc/hostname

# swap file
fallocate -l $swapsize /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile   none    swap    defaults 0 0" >> /etc/fstab

# setup time
vim /etc/locale.gen
ln -sf /usr/share/zoneinfo/US/Eastern /etc/localtime

# packages
pacman -S --needed base-devel
pacman -S openssh vim neovim tmux rsync zip p7zip aria2 pacman-mirrorlist reflector git dnsutils most vimpager fwknop python python-pip
pip install neovim
./setup_account.sh $user

reflector --verbose --country 'United States' --threads 8 -l 200 -p http --sort rate --save /etc/pacman.d/mirrorlist

# create a super user and copy configs into user home
useradd -m $user
passwd $user
#visudo
echo "$user  ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
rsync -at .bashrc .bash_profile .vim* .nvim* .neovim* .ssh ~$user
chown -R $user:$user ~$user

# package-query
# TODO

# yaourt
cp yaourt.sh /home/$user
chown $user:$user /home/$user/yaourt.sh
chmod a+x /home/$user/yaourt.sh
su - $user -c "/home/$user/yaourt.sh"
cd /home/$user/packages/yaourt
pacman -U *xz
rm -rf /home/$user/packages/yaourt
rm -rf /home/$user/yaourt.sh

# firewall
systemctl start iptables
systemctl enable iptables
iptables -P INPUT ACCEPT
iptables -F
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp --dport 22 -j ACCEPT
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
iptables -A INPUT -p tcp --dport 443 -j ACCEPT
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT
iptables -L -v
iptables-save > /etc/iptables/iptables.rules

systemctl start ip6tables
systemctl enable ip6tables
ip6tables -P INPUT ACCEPT
ip6tables -F
ip6tables -A INPUT -i lo -j ACCEPT
ip6tables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
ip6tables -A INPUT -p tcp --dport 22 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 80 -j ACCEPT
ip6tables -A INPUT -p tcp --dport 443 -j ACCEPT
ip6tables -P INPUT DROP
ip6tables -P FORWARD DROP
ip6tables -P OUTPUT ACCEPT
ip6tables -L -v
ip6tables-save > /etc/ip6tables/ip6tables.rules

## fwknop config
## copy iptables.rules
#vim /etc/iptables/iptables.rules
## copy fwknop config files
#cd /etc/fwknop/
#systemctl restart iptables fwknopd
#systemctl enable iptables fwknopd


##################################


## python / anaconda
#pacman -S python python-pip
#yaourt -S anaconda
#sudo conda install ncurses readline
#
## mariaDB
#pacman -S mariadb nginx 
#mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
#systemd start mysqld
#mysql_secure_installation
