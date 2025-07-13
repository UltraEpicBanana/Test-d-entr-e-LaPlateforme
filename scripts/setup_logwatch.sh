#!/bin/bash
# logwatch ne peut pas acceder à systemctl, c'est pourquoi nous avons besoin de rsyslog
apt install -y logwatch rsyslog

# Ajout des autorisations pour que rsyslog enregistre les logs dans un fichier auth.log que logwatch pourra lire
echo "auth,authpriv.* /var/log/auth.log" > /etc/rsyslog.d/20-default.conf

# Creation du fichier sshd.conf pour indiquer à logwatch d'aller lire le fichier auth.log
mkdir -p /etc/logwatch/conf/logfiles
cat <<EOF > /etc/logwatch/conf/logfiles/sshd.conf
LogFile = auth.log
*RemoveHeaders
EOF

# Restart de rsyslog pour appliquer les changements 
systemctl restart rsyslog
