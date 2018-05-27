Correction exercices bash :

Légende
```

```


3 Guillemet avant et après des lignes de codes.

Les corrections se feront selon le modèle suivant:
	- Un avis général sur la compréhension de l'exercice 
	- Correction des erreurs dans le scripts
	- La qualité du script, ce qui sous entend, est ce qu'il possible d'écrire un script plus rapide ou plus ergonomique.
Correction exercice 1 :

Avis général : l'exercice à été compris et la solution proposé fait bien appel aux différents outils que propose le langage bash
pour résoudre ce problème 

Correction script: 
Le script ne prend pas en compte un cas de figure:
	- la note est égal à 20
Dans ce cas le message "Valeur incorrecte " sera retourné.  Alors que la note 20, est valeur correct.
Il suffira de remplacer
```
if [ $note -lt 20 ] && [ $note -ge 16 ]
then
echo "Très bien"

```

par

```
if [ $note -le 20 ] && [ $note -ge 16 ]
then
echo "Très bien"
```

le: less or equal, inclut donc la possibilité que la note soit égal à 20.


Qualité du script:
	Ce qui suit doit être pris comme un conseil de bonne pratique. Le script écrit n'est pas faux et n'est pas non plus mauvais
surtout pour un premier script. Mais dans l'optique de se former adéquatement, il y a certaines bonnes pratique à apprendre pour 
rendre tes scripts : plus rapide, plus performant et plus facile à retravailler. On peut noter que plus rapide et plus performant
dans ce cas ci sera très anecdotique, au vu de la taille du script et du nombre de commande maximale, mais cela te permettra de voir
la différence entre différents qualité de scripts 


1- Forme du script.
Les bonne pratiques invite à ce que les différents "blocs" de ton script soient visible au premier coup d’œil.
Un "bloc", est par exemple, un semble de commande regroupé sous une condition if. Comme par exemple.

if [ $note -lt 20 ] && [ $note -ge 16 ]
then
echo "Très bien"
	
La commande `echo "Très bien"` appartient au bloc de la condition `if [ $note -lt 20 ] && [ $note -ge 16 ] then.
	
De ce fait il faut que cela apparaisse "physiquement" dans ton script.
	
De manière conventionnelle on rajoute 4 espace (ou une tabulation ), devant les lignes sous une condition.
	
Cela donne pour l'ensemble du script :

```	
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
```

Comme cela on visualise très bien que les commandes `echo ....`, ne sont pas au même niveau que les conditions, et que notamment
on ne peut accéder à ce "niveau de lecture" que si le niveau précédent le permet, comme ici une condition.


2- Optimisation
	Tu peux voir que dans ton script le message "Valeur incorrecte" apparaît à la fin de ton script. Autrement dit si l'utilisateur
entre au clavier : une valeur inférieur à 0 ou supérieur à 20 , le test de "est ce une valeur correct", arrive après
tous les tests pour savoir si la valeur est comprise entre deux chiffres. Donc 5 tests seront réalisé pour rien, alors qu'il suffirait
de faire un premier test en amont de ton script pour déduire si c'est une valeur incorrecte.

Premier test, est que la note est comprise entre 0 et 20?

```
if [ $note -le 20 ] && [ $note -ge 0 ]
then
	if [ $note -le 20 ] && [ $note -ge 16 ]
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
fi
```

Comme tu peux voir deux choses : 
	- l’intérêt de l'indentation des différents "blocs", comme expliqué précédemment
	- si le premier test n'est pas réussi aucun autre test n'est effectué, donc nous avons optimisé le script.
	