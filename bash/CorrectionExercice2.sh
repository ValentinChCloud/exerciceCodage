#!/bin/bash

# Les variables bash sont des chaînes de caractères mais, suivant le contexte, 
# Bash autorise des opérations entières et des comparaisons sur ces variables, 
# le facteur décisif étant la seule présence de chiffres dans la variable. 
# https://abs.traduc.org/abs-5.0-fr/ch04s03.html

# Référence : https://abs.traduc.org/abs-5.0-fr/index.html

note=0
somme=0
nbNote=0

while true
do
	echo "Veuillez écrire une note entre 0 et 20"
	# read ne permet pas de définir le type
	# http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.htmls
	read note

	if [ $note == "q" ]
	then
		break
	fi

	if [ $note -ge 0 ] && [ $note -le 20 ] 
	then
		# Comment faire des calculs arithmétiques simples
		# https://fr.wikibooks.org/wiki/Programmation_Bash/Calculs
		somme=$(($somme + $note))
		nbNote=$(($nbNote + 1))
	else
		echo "Nombre invalide"
	fi
done

if [ $nbNote -ne 0 ]
then
	# Bash ne fonctionne pas avec les nombre flottant
	# il faut déléguer cela à un programme comme bc
	# Exemple d'utilisation de la commande expr
	moyenne=`expr $somme / $nbNote`
	moyenne=$(($somme / $nbNote))
	echo "La moyenne est de $moyenne pour $nbNote notes"
else
	echo "Division par 0 impossible"
fi