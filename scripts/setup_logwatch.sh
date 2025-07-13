#!/bin/bash
apt install -y logwatch rsyslog

# Ajout des autorisations des logs pour rsyslog
echo "auth,authpriv.* /var/log/auth.log" > /etc/rsyslog.d/20-default.conf

# Create Logwatch config for sshd
mkdir -p /etc/logwatch/conf/logfiles
cat <<EOF > /etc/logwatch/conf/logfiles/sshd.conf
LogFile = auth.log
*RemoveHeaders
EOF

# Restart rsyslog to apply changes
systemctl restart rsyslog
