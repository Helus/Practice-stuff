#-------------------------------
x=c(25,21,18,29,15,16,24,22,28,22)
media=mean(x);media
n=length(x);n
sigma=var(x);sigma
nivel=0.97
alpha=1-nivel
zalpha=qt(1-(alpha/2),df=n-1);zalpha
error_tipico=sqrt(sigma)/sqrt(n);error_tipico

intervalo=c(media-zalpha*error_tipico,media+zalpha*error_tipico)
intervalo

#otra forma

t.test(x,conf.level=nivel)

#-------------------------------
library(TeachingDemos)
stest=sigma.test(x,conf.level=nivel);stest
names(stest)
stest$estimate
stest$conf.int        #intervalo de confianza para varianza
sqrt(stest$conf.int)  #intervalo de confianza para desviacion tipica

#-------------------------------
n=500
exitos=400
phat=exitos/n

#error tipico

error_tipico=sqrt(phat*(1-phat)/n)
error_tipico

#intervalo de confianza

nivel=0.98
alfa=1-nivel
z=qnorm(1-alfa/2);z

extrinf=phat-z*error_tipico
extrsup=phat+z*error_tipico
intervalo=c(extrinf,extrsup)
intervalo

#apartado b)  

#no da lo mismo que en el apartado a por motivo de correcciones del comando prop.test
#en el apartado anterior cambiamos la p real por p gorro para que nos salga mas facil obtener una solucion
#pero va a diferir de la real. El comando prop.test, sin embargo,  implementa la solucion propuesta por Wilson (1927),
#que consiste en despejar p directamente de la expresion (abs(p-phat)/sqrt(p*(1-p)/n))<zalfa/2
# y, ademas, efectua una correccion por continuidad en la aproximacion normal

prop.test(exitos,n,conf.level = nivel)



#-------------------------------
mu0=25  #media conjeturada

x=c(25,21,18,29,15,16,24,22,28,22)

#datos muestrales

library(TeachingDemos)
t.test(x,mu=mu0,alternative = "less")


#-------------------------------
  
x=360
n=500
p0=0.7

prop.test(x,n,p0,alternative = "two.sided",correct=TRUE) #proporciona el valor del estadístico
#y del nivel crítico que resulta de de haber efectuado la corrección por continuidad.
prop.test(x,n,p0,alternative = "greater",correct=FALSE) #sin la correccion


#-------------------------------
#H0: muy<=mux
#Ha: muy>mux

#rechazo H0 si muy >> mux

x=c(7.5,4.2,5.5,6.4,5.1,5.6,3.5)   #no ejs
y=c(5.6,6.4,8.5,9.5,7.8,6.8,7.6,8.4,9.8)   #ejs
sum(x)
sum(y)
t.test(x,y,alternative="less",paired=FALSE,var.equal=TRUE)
