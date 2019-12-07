# Ejercicio 1

# a)

datos=read.table('familias.txt',header=T)

# b)

medias=colMeans(datos)
medias

# c)

# NOTA: R hace cuasi-varianzas (divide entre n-1 en vez de por n)

Sc=cov(datos) # matriz de covarianzas
Sc
diag(Sc) # vector de varianzas

cov(datos[,1:2],datos[,3:4]) # covarianza entre primero y segundo
Sc[1:2,3:4]
R=cor(datos) # correlación
R

# d) Otra forma de obterner la matriz de correlaciones

dt=sqrt(diag(Sc))
R= diag(1/dt)%*%Sc%*%diag(1/dt)
R

# Ejercicio 2

datos=read.table('hipertension.txt',header=T)
datos

# a)

medias=colMeans(datos)
Sc=cov(datos)

# b)

plot(datos)  # plot(datoS$edad, datos$presion)

# c)

par(mfrow=c(2,2)) #dividir

# Datos originales
plot(datos,asp=1,main='Datos originales', xlab='Edad', ylab='Presión arterial máxima')
points(medias[1],medias[2],pch=16,col='blue')


#Datos centrados
n=nrow(datos)
M=diag(1,n)-1/n # matriz centradora
datosc=M%*%as.matrix(datos)
mediasc=colMeans(datosc)

plot(datosc,asp=1,main='Datos centrados', xlab='Edad', ylab='Presión arterial máxima')
points(mediasc[1],mediasc[2],pch=16,col='blue')

# Estand. univariante
dt=sqrt(diag(Sc))
datos_est_uni=datosc%*%diag(1/dt)

plot(datos_est_uni,asp=1,main='Datos Est. univar.', xlab='Edad', ylab='Presión arterial máxima')
points(mediasc[1],mediasc[2],pch=16,col='blue')

#Estand. multivariante
auto=eigen(Sc)
lambda=auto$values
v=auto$vectors

Sc12 = v%*%diag(1/sqrt(lambda))%*%t(v)
datos_est_multi=datosc%*%Sc12
plot(datos_est_multi,asp=1,main='Datos Est. Miltivar.',xlab='Edad', ylab='Presión arterial máxima')
points(mediasc,mediasc,pch=19,col='blue')
