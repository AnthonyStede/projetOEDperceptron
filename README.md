# projetOEDperceptron

## Explication du programme :

### fonction percep :
* la fonction percep qui retourne weights(poids: w0,w1,w2) est une fonction qui génére dabord les poids par la fonction rnorm avec normal distributions.
* le eqm c'est le mean squared error.
* nous observons la valeur de l’erreur, il semble donc raisonnable de l’utiliser comme critère d’arrêt.
* utiliser la valeur quadratique moyenne d’erreur ( eqm ) . Lorsque l’algorithme atteint des valeurs faibles de mse, nous serons satisfaits de ses performances.
* mise à jour des poids.
* Cette fonction trouve les poids optimaux pour le modèle perceptron.
* la fonction activation c'est une fonction heaviside sera l’estimation de l’algorithme sur quelle classe l’entrée appartient.
 