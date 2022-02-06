#import du set de données dans le dataset "data"
data<-read.table("IrisDataSetLinear.txt", header=TRUE)

#fonction du perceptron
process <- function() {
  #ajout de la colonne w0 pour les poids
  data$w0 <- c(1)
  #affichage de la sigmoïde si le set de données est en 2 dimensions
  if(ncol(data)==4){
    plot(data[, c(1)], data[, c(2)], xlab="x1", ylab="x2")
  }
  else{
    cat("\nPas d'affichage graphique car données en dimension supérieur à 2.")
  }
  #TODO
  
}
process()