# Ejercicio 1

# a)

x1 <- c(0,0,1,1,2,2)
x2 <-c(0,1,1,2,2,3)
prob <- c('1/8','1/8','1/4','1/4','1/8','1/8')

plot(x1,x2,pch=1,col='red',cex=1,xlab='x1',ylab = 'x2')

text(x1,x2,label=prob,pos=3)

# b)
conjunta <- cbind(c(1/8,0,0),c(1/8,1/4,0),c(0,1/4,1/8),c(0,0,1/8))
conjunta
rbind(c(1/8,1/8,0,0),c(0,1/4,1/4,0),c(0,0,1/8,1/8))
rownames(conjunta) <- c('0','1','2')
colnames(conjunta) <- c('0','1','2','3')
conjunta

# c)

marginal_x1 <- rowSums(conjunta)
marginal_x1
marginal_x2 <- colSums(conjunta)
marginal_x2

# d)

#conjunta/marginal_x1 # Forma menos clara: divide cada fila i-esima de la conjunta por el vector i-esimo de la marginal 

condicionada_x2_x1 <- diag(1/marginal_x1)%*%conjunta 
condicionada_x2_x1

condicionada_x1_x2 <- conjunta%*%diag(1/marginal_x2)
condicionada_x1_x2

# t(t(conjunta)/marginal_x2) # Forma menos clara

# Ejercicio 2

# b)
conjunta <- cbind(c(0.05, 0.3, 0.05),c(0.15, 0, 0.45))
rownames(conjunta)<-c('0','1','2')
colnames(conjunta)<-c('1','2')
conjunta

# c)
marginal_x1<-rowSums(conjunta)
marginal_x2<-colSums(conjunta)

# d) 
condicionada_x2_x1<- diag(1/marginal_x1)%*%conjunta
condicionada_x1_x2<- conjunta%*%diag(1/marginal_x2)
condicionada_x1_x2
