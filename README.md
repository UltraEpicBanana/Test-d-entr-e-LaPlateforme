# Test-d-entree-LaPlateforme
# Projet Firewall Linux

Ce dépôt contient la documentation, les fichiers de configuration et scripts utilisés pour le projet firewall.

## Structure

- `config/` : fichiers de configuration Fail2ban, rsyslog, etc.
- `scripts/` : scripts bash pour initialiser iptables, logwatch et cron.
- `doc/` : documentation complète (optionnel)

## Installation rapide

1. Exécuter les scripts dans l’ordre :

```bash
sudo bash scripts/setup_iptables.sh
sudo bash scripts/setup_logwatch.sh

