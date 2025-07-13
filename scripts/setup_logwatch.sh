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


# Ici le role de cron est de planifier les tâches de manière à enregistrer les activités de log dans un fichier.


cat <<'EOF' > /etc/cron.daily/00logwatch
#!/bin/bash

# Dossier de sortie : variable contenant le chemin du répertoire où les rapports seront sauvegardés
OUTPUT_DIR="/var/log/logwatch"
mkdir -p "$OUTPUT_DIR"

# Nom de fichier avec date
OUTPUT_FILE="$OUTPUT_DIR/logwatch-$(date +%F).log"

# Exécution de logwatch pour 1 jour, service SSH, sortie fichier
/usr/sbin/logwatch --range yesterday \
                   --service sshd \
                   --output file \
                   --format text \
                   --filename "$OUTPUT_FILE"
EOF

# Rendre le script exécutable
sudo chmod +x /etc/cron.daily/00logwatch


