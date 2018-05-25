#!/bin/bash


somme=0
nbNote=0
note=0

while [ $note -ge 0 ] && [ $note -le 20 ] || [ $note != "q" ]
do
	echo "Veuillez écrire une note entre 0 et 20"
	read note
	if [ $note -ge 0 ] && [ $note -le 20 ] && [ $note != "q" ]
	then
		somme=$somme+$note
		nbNote=$nbNote+1
	else
		break
	fi	
done

moyenne=$somme/$nbNote

echo $moyenne
