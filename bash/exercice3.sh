#!/bin/bash

Appreciation ()
{
if [ $1 -lt 20 ] && [ $1 -ge 16 ]
then
echo "Très bien"
elif [ $1 -lt 16 ] && [ $1 -ge 14 ]
then
echo "Bien"
elif [ $1 -lt 14 ] && [ $1 -ge 12 ]
then
echo "Assez bien"
elif [ $1 -lt 12 ] && [ $1 -ge 10 ]
then
echo "Passable"
elif [ $1 -lt 10 ] && [ $1 -ge 0 ]
then
echo "Insuffisant"
else
echo "Valeur incorrecte"
fi
}

if [ $# == 1 ]
then
Appreciation $1
else
echo "Veuillez écrire une note entre 0 et 20"
read note
Appreciation $note
fi

# Satané "opérateur unaire attendu". Sans lui, la méthode "classique" marche, mais en voulant remplacer les -lt et les -ge
# par des < et des >=, ça a empiré la situation ! Fluuuuuute !! (pour ne pas dire autre chose)
# Vraiment Bash, tu sais être génial, tu sais...

