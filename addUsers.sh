#! /bin/bash
# Mohamed 
# Création d'utilisateur

username=$1

if [ -z "$username" ]
 then
    echo "Il manque les noms d'utilisateur en argument - Fin du script."
    exit 1
fi
for username in $1
do
if  cat /etc/passwd | grep -q "$username:"
 then
    echo "L'utilisateur $username existe déjà."
    exit 1
fi

if id "$username" > /dev/null 2> /dev/null
 then
    echo "L'utilisateur $username existe déjà."
else
    sudo useradd -m -s /bin/bash "$username"
    echo "L'utilisateur $username a été créé avec succès."
fi
done
