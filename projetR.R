#setwd("/home/yanisdev/R/devoir/projetOEDperceptron/")      # Change working directory
args = commandArgs(trailingOnly=TRUE)

if (length(args)==0) {
  stop("Erreur : passez un fichier en argument de script.n", call.=FALSE)
} else if (length(args)==1) {
  file_name <- args[1]
  file_name
}

#import du set de donn?es dans le dataset "data"
data<-read.table(file_name, header=TRUE, stringsAsFactors = FALSE)
uni <- unique(data[ , ncol(data), drop = FALSE] )

#fonction du perceptron
process <- function() {
  
  data[data == uni[1,1]] <- "0"
  data[data == uni[2,1]] <- "1"
  
  perceptron = percep(data, eta = 0.1, threshold = 1e-5 ) 
  print(perceptron)
  
  # Définir les nouvelles valeurs de colonne aux couleurs appropriées
  data$Colour[data$Species==0]="red"
  data$Colour[data$Species==1]="blue"
  # Tracer tous les points en même temps, en utilisant les couleurs nouvellement générées
  
  plot(data[, c(1)], data[, c(2)], xlab="x1", ylab="x2", col=data$Colour )
  #print(data)
  abline(a = -1.0*perceptron[3]/perceptron[2], b = -1.0*perceptron[1]/perceptron[2], col='dark green', lwd=3, lty=2)
  
  
  
}
# fonction heaviside sera l’estimation de l’algorithme sur quelle classe l’entrée appartient
fonction_activation <-function(z) {
  if( z > 0 )
    return( 1 )
  return( 0 )
}

#
percep <- function( data, eta = 0.1, threshold = 1e-5 ){
  dt = as.matrix(sapply(data, as.numeric))
  num.features = ncol( dt ) - 1
  target = ncol( dt )
  
  # Initialisation des Poids aléatoires avec la fonction rnorm: Normal distributions
  weights = rnorm( mean = 0, sd = 0.1, n = ncol( dt ) )
  
  # le eqm c'est le mean squared error
  eqm = threshold * 2
  
  # Cette boucle doit avoir un critère d’arrêt qui définira quand le processus d’apprentissage doit s’arrêter
  # Pour mesurer la performance de l’algorithme dans la tâche de classification, nous observons la valeur de l’erreur, il semble donc raisonnable de l’utiliser comme critère d’arrêt
  # utiliser la valeur quadratique moyenne d’erreur ( eqm ) . Lorsque l’algorithme atteint des valeurs faibles de mse, nous serons satisfaits de ses performances.
  while( eqm > threshold ){
    eqm = 0
    for( i in 1:nrow( dt ) ){
      # ajouter le bias et calculer la multiplication
      z = c( dt[ i, 1:num.features ], 1 ) %*% weights
      
      # fonction d'activation
      a = fonction_activation( z )
      
      # calculer eqm
      error = ( a - dt[ i, target ] )
      eqm = eqm + error^2
      cat( paste( "Mean square error = ", eqm, "\n" ) )
      
      # mise à jour des poids
      weights = weights - eta * error * c( dt[i, 1:num.features ], 1 )
    }
  }
  return( weights )
}


process()