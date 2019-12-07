#Ejercicio 1

# a) Representar Normales

sop_max=c(0-3*2,0+3*2) # media_max=0, sd_max=2
r=seq(sop_max[1],sop_max[2],by=0.1)

n1= dnorm(r) #N(0,1)
n2= dnorm(r,0,2) #N(0,2^2)
n3= dnorm(r,2,1) #N(2,1)
n4= dnorm(r,-3,0.5) #N(-3,0.5^2)

R=cbind(n1,n2,n3,n4)
matplot(r,R,type='l',lwd=2,
        main=expression('Densidad'*~N(mu,sigma^2)))
legend('topright',legend = c('N(0,1)','N(0,4)',
        'N(2,1)','N(-3,0.5)'),col=1:4,lty=1:4,lwd=2)

abline(v=0,col=1,lty=1)
abline(v=0,col=2,lty=2)
abline(v=2,col=3,lty=3)
abline(v=-3,col=4,lty=4)

# b)

# P(Z<1.52)
pnorm(1.52)
#P(Z>2)
1-pnorm(2,0,1) # o bien 1-pnorm(2,mean=0,sd=1) o bien 1-pnorm(2)

# P(-1<Z<2)
pnorm(2,0,1)-pnorm(-1)

# P(-0.5<Z<3.2) Z=N(2,1.2^2)
pnorm(3.2,2,1.2)-pnorm(-0.5,2,1.2)

# c)

# P(z<=z0)=0.87
qnorm(0.87)

# P(z>z0)=0.05
qnorm(0.95,0,1)

# P(|Z|>z0)=0.01 => P(Z<-z0)+P(Z>z0)=0.01 => P(Z>z0)=0.005 => P(Z<z0)=1-0.005=0.995
qnorm(0.995)

# P(z>z0)=0.02 Z=N(1.5,0.6^2)
qnorm(0.98,1.5,0.6)

# Ejercicio 2

# a)
sop_max=c(0,0+3*8) # df_max=8
r=seq(sop_max[1],sop_max[2],by=0.1)

chi1= dchisq(r,df=3) #Chi_3
chi2= dchisq(r,df=5) #Chi_5
chi3= dchisq(r,df=8) #Chi_8

R=cbind(chi1,chi2,chi3)
matplot(r,R,type='l',lwd=2,main=expression('Densidad'*~chi^2))
legend('topright',legend = c('df=3','df=5','df=8'),col=1:3,lty=1:3,lwd=2)

abline(v=3,col=1,lty=1)
abline(v=5,col=2,lty=2)
abline(v=8,col=3,lty=3)

# b)

# P(chi<6)
pchisq(6,df=5)

# P(chi>2)
1-pchisq(2,df=5)

# P(1<chi<7)
pchisq(7,df=5)-pchisq(1,5)

# c)

# P(chi<=x0)=0.87
qchisq(0.87,df=5)

# P(chi>x0)=0.05
qchisq(0.95,df=5)

