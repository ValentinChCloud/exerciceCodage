# Correction exercices bash :

Légende
```

```


3 guillemets \`\`\` avant et après des lignes de codes.

Les corrections se feront selon le modèle suivant:
	- Un avis général sur la compréhension de l'exercice 
	- Correction des erreurs dans le scripts
	- La qualité du script, ce qu'il sous-entend, est ce qu'il est possible d'écrire un script plus rapide ou plus ergonomique.
	
## Correction exercice 1 :

Avis général : l'exercice à été compris et la solution proposée fait bien appel aux différents outils que propose le langage bash
pour résoudre ce problème 

Correction script: 
Le script ne prend pas en compte un cas de figure:
	- la note est égal à 20
Dans ce cas le message "Valeur incorrecte " sera retournée.  Alors que la note 20, est une valeur correcte.
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

le: less or equal, inclut donc la possibilité que la note soit égale à 20.


Qualité du script:
	Ce qui suit doit être pris comme un conseil de bonne pratique. Le script écrit n'est pas faux et n'est pas non plus mauvais surtout pour un premier script. Mais dans l'optique de se former, il y a certaines bonnes pratiques à apprendre pour 
rendre tes scripts : plus rapide, plus performant et plus facile à retravailler. On peut noter que plus rapide et plus performant dans ce cas ci sera très anecdotique, au vu de la taille du script et du nombre de commandes maximal, mais cela te permettra de voir la différence entre différentes qualités de scripts 


1- Forme du script.
Les bonne pratiques invitent à ce que les différents "blocs" de ton script soit visible au premier coup d’œil.
Un "bloc", est par exemple, un semble de commandes regroupées sous une condition if. Comme par exemple.

if [ $note -lt 20 ] && [ $note -ge 16 ]
then
echo "Très bien"
	
La commande `echo "Très bien"` appartient au bloc de la condition `if [ $note -lt 20 ] && [ $note -ge 16 ] then.
	
De ce fait il faut que cela apparaisse "physiquement" dans ton script.
	
De manière conventionnelle on rajoute 4 espaces (ou une tabulation ), devant les lignes sous une condition.
	
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
entre au clavier : une valeur inférieure à 0 ou supérieure à 20 , le test de "est-ce une valeur correcte", arrive après
tous les tests pour savoir si la valeur est comprise entre deux chiffres. Donc 5 tests seront réalisés pour rien, alors qu'il suffirait
de faire un premier test en amont de ton script pour déduire si c'est une valeur incorrecte.

Premier test, est-ce que la note est comprise entre 0 et 20?

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

Comme tu peux voir, ici l'amélioration concerne principalement deux choses : 
	- l’intérêt de l'indentation des différents "blocs", comme expliqué précédemment
	- si le premier test n'est pas réussi aucun autre test n'est effectué, donc nous avons optimisé le script.
	

	
	
## Correction exercice 2 :


Avis général : l'exercice est incomplet et ne remplit pas les conditions données par l'énoncé de l'exercice, ils faut faire attention
de bien lire l'énoncé, de noter les différents point à intégrer dans le script.


Correction script: 
	Premier point : L'exercice demandait "Reprenez l'exercice 1", et nous ne voyons pas le script de l'exercice 1 dans ce script.
Cela étant ce n'est pas très grave dans ce cas-ci, car c'est très facile à implémenter et je pense que c'est plus un oublie qu'autre chose

	Deuxième point : "Faites en sorte que le programme se répète tant que l'utilisateur n'aie pas saisie une note négative ou q".
Le cas de "q" est bien implémenté et marche bien . Il manque cependant le cas ou l'utilisateur rentre une valeur négative, c'est peut être
aussi un oubli. Au vu de ce que tu as fait, ça ne devrait pas être difficile à implémenter mais il faut faire très attention, car pour le moment
un oubli comme le premier point et le deuxième point est facile à rattraper, mais plus tes scripts augmenteront en complexité et plus l'intégration
de fonctionnalités deviendra complexe et sera chronophage.

Je pense ouvrir une Issue, jusqu'à temps que l'exercice soit correct?


Qualité du script:
	Comparé à l'exercice un, des blocs de codes sont bien indentés. Rien à signaler autrement.
	
	
## Correction exercice 3 :

Avis général : L'exercice à été compris et le traitement des paramètres du script est bien traité.


Correction script: 
	Même problème pour le traitement du cas ou la note est égal à 20, voir correction exercice 1
	
	La variable "$#", qui selon cette source (https://www.commentcamarche.com/faq/5444-bash-les-parametres),
"$# Le nombre de paramètres passés au script "
Plusieurs sources converges vers définition.
	
Donc question, la variable $# est elle un "string" ou un "int" ?
	
Nous savons qu'en bash, les variables ne sont pas typées, donc la question peut sembler bizarre.
	
Mais en lisant ton code dans l'état, le test de comparaison que tu effectues est :
	
```
if [ $# == 1 ]
then
    Appreciation $1
else
```

Ce qui s'interprète par : "Est ce que la variable $# est égal à la chaine de caractère '1'"
Donc bash, test si les deux élément de ton test sont des chaines de caractères équivalentes.
Et cela marche très bien et marchera très bien quelque soit le nombre de paramètre.

Ce que nous voulons souligner ici, et cela peut être assez complexe à visualiser, mais c'est très important pour certains langages
qui type leurs variables. Ici c'est un test numérique qui devrait être fait. Comme

```
if [ $# -eq 1 ]
then
    Appreciation $1
else
```

Et cela semble plus cohérent.

Si cela n'est pas très clair, n'hesite pas à le signaler, car ce ne sont pas des notions très aisées à assimiler.







# Conclusion:
	Tu as eu des problèmes avec les comparaisons arithmétiques en bash et tu as bien fait de l'écrire dans les commentaires de ton script.
A cela nous pouvons apporter un conseil. Il est possible en bash de préciser un contexte numérique. Cela se fait en encadrant
une expression par deux parenthèses. Une fois mis dans le bon contexte tu peux utiliser les symboles que tu as l'habitude d'utiliser
en mathématique.

Exemple

```
if [ $1 -lt 20 ] && [ $1 -ge 16 ]
then
echo "Très bien"
```

peut devenir


```
if (( $1 < 20 )) && (( $1 >= 16 ))
then
echo "Très bien"
```


Cela devrait t'aider pour le futur.
