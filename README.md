# Test-d-entree-LaPlateforme : Projet Firewall Linux

Ce dépôt contient la documentation, les fichiers de configuration et scripts utilisés pour le projet firewall.

- `scripts/` : scripts bash pour initialiser iptables, logwatch et cron.

## Installation

1. Exécuter les scripts dans l’ordre :

```bash
sudo bash scripts/setup_iptables.sh
sudo bash scripts/setup_logwatch.sh
sudo bash scripts/setup_fail2ban.sh
