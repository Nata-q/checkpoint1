#!/bin/bash

#Création boucle pour lire les arguments 1 a 1
while true; do

#vérifier si les éléments rentrés sont valide
[ $# -eq 0 ] && { echo > Il manque les noms d'utilisateurs en argument\nFin du script. ; exit1 ; }
user=$@


#Vérification si l'utilisateur existe déjà
if
  cat /etc/passwd | grep $user
then
#le compte existe
#affichage message et sortie du script
  echo -e "l'utilisateur $user existe."
exit 1

else
#le compte n'existe pas
#affichage message et création de compte
  sudo useradd $user > /dev/null
  echo "utilisateur $user créé."
fi
done
exit 0
