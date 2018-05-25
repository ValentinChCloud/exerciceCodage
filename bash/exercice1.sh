#!/bin/bash

echo "Veuillez écrire une note entre 0 et 20"
read note
echo $note

if [ $note -lt 20 ] && [ $note -ge 16 ]
then
echo "Très bien"
elif [ $note -lt 16 ] && [ $note -ge 14 ]
then
echo "Bien"
elif [ $note -lt 14 ] && [ $note -ge 12 ]
then
echo "Assez bien"
elif [ $note -lt 12 ] && [ $note -ge 10 ]
then
echo "Passable"
elif [ $note -lt 10 ] && [ $note -ge 0 ]
then
echo "Insuffisant"
else
echo "Valeur incorrecte"
fi
