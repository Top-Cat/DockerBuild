#!/bin/bash

cat <<EOT >> /etc/ssh/sshd_config
AllowGroups $1
AllowTcpForwarding no
EOT

cat <<EOT >> /etc/skel/.bashrc
PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
EOT

cat <<EOT >> /etc/pam.d/common-account
session    required   pam_mkhomedir.so skel=/etc/skel/ umask=0022
EOT

/usr/sbin/sshd -De
