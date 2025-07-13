### Test d'entrée LaPlateforme : Projet Firewall Linux ###



Ce repository correspond aux fichiers demandés dans le cadre du test de l'école LaPlateforme, dans le but de rentrer en deuxième année. 
Celui-ci est composé d'une partie 'scripts' avec les fichiers de configuration des différentes étapes du projet, d'un pdf correspondant à mes démarches avec les réponses aux questions, et d'un pdf où sont détaillées mes motivations pour intégrer ce cursus.


Pour tester le travail, il faudra rendre les scripts executables puis les executer dans l’ordre.
En vous remerciant pour l'attention portée à ma candidature et à mon projet.
Cordialement Teva Clairefond.

```bash

chmod +x setup_iptables.sh
chmod +x setup_logwatch.sh
chmod +x setup_fail2ban.sh

sudo bash scripts/setup_iptables.sh
sudo bash scripts/setup_logwatch.sh
sudo bash scripts/setup_fail2ban.sh

