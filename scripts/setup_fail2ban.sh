#!/bin/bash

# Installation de fail2ban et du serveur FTP vsftpd
apt update
apt install -y fail2ban vsftpd

# Création de la configuration jail.local pour SSH et FTP
cat <<'EOF' > /etc/fail2ban/jail.local

[sshd]
enabled = true
port = ssh
filter = sshd
logpath = /var/log/auth.log
maxretry = 5
findtime = 300
bantime = 3600
backend = systemd

[vsftpd-tbf-ip]
enabled = true
port = ftp
filter = vsftpd
logpath = journal
maxretry = 10
findtime = 300
bantime = 3600
backend = systemd

[vsftpd-tbf-multiuser]
enabled = true
port = ftp
filter = vsftpd-multiuser
logpath = journal
maxretry = 20
findtime = 300
bantime = 3600
backend = systemd

EOF

# Création du filtre vsftpd
cat <<'EOF' > /etc/fail2ban/filter.d/vsftpd.conf
[Definition]
failregex = ^.*pam_unix\(vsftpd:auth\): authentication failure;.*rhost=<HOST>.*
ignoreregex =
EOF

# Création du filtre vsftpd-multiuser
cat <<'EOF' > /etc/fail2ban/filter.d/vsftpd-multiuser.conf
[Definition]
failregex = ^.*pam_unix\(vsftpd:auth\): authentication failure;.*rhost=<HOST>.*
ignoreregex =
EOF

# Redémarrage de fail2ban et activation au démarrage
systemctl restart fail2ban
systemctl enable fail2ban
