%

% lo que está en código nos permite obtener los resultados del paper


clear all
global tau beta delta gamma eta theta mu nu sigma Lambda r_1 r_2

% Parámetros del modelo de refencia [1]
tau=0.0002; beta=0.0805; delta=1.6728e-5;
gamma=2.0138e-4; eta=0.4478;
theta=0.0101; mu= 0.0106;
nu=3.2084e-4; sigma=0.0668;
Lambda=0.02537; r_1=5.7341e-5; r_2=1.6728e-5;

% Parámetros mdificados del modelo de refencia [1]
% El objetivo ha sido considerar una tasa de natalidad y unos periodos de
% recuperación razonables
% Lambda=Lambda/365; beta=beta*365;
% r_1=5.7341e-5*1000; r_2=1.6728e-5*1000;

% Incremento del número básico de reproducción
% beta=beta*100;

% Situación inicial
S_0=0.5; E_0=0.2; Q_0=0.1; I_A_0=0.2; I_S_0=0.1; R_0=0;
N_0=S_0+E_0+Q_0+I_A_0+I_S_0;
disp(['La población inicial es ', num2str(N_0),' individuos'])

% Cálculo del número básico de reproducción
R0=beta*Lambda/((gamma+mu+eta+sigma)*(tau+mu));
disp(['El número básico de reproducción para los datos Tabla es ', num2str(R0),' días^(-1)'])

% Si el número de individuos es Pobl
% Pobl=1000;    
% k=Pobl/N_0;
% Lambda_k=Lambda*k;
% beta_k=beta/k;
% R0_k=beta_k*Lambda_k/((gamma+mu+eta+sigma)*(tau+mu));
% disp(['El número básico de reproducción para ', num2str(Pobl),' individuos es ', num2str(R0_k),' días^(-1)'])

% Cálculo del número de días previsto para la recuperación promedio de un asintomático
RI_A=1/r_1;
disp(['El número de días previsto para la recuperación de un asintomático es ', num2str(RI_A), ' días'])
% Cálculo del número de días previsto para la recuperación promedio de un asintomático
RI_S=1/r_2;
disp(['El número de días previsto para la recuperación de un sintomático es ', num2str(RI_S), ' días'])
% Cálculo del número de días previsto para la incubación de la enfermedad
DInc=1/(nu+sigma);
disp(['El número de días previstos de incubación es ', num2str(DInc), ' días'])
% Cálculo de la tasa de natalidad por cada mil habitantes
TNat=Lambda*365*1000;
disp(['Tasa de natalidad al año por mil habitantes ', num2str(TNat),'% al año'])
disp(['Tasa de natalidad al año por cien habitantes ', num2str(TNat/10),'% al año'])

opciones=odeset('RelTol',1e-7);
[t,y]=ode45('f',[0,100],[0.5, 0.2, 0.1, 0.2, 0.1, 0]', opciones);
% [t,y]=ode45('f',[0,100*7],[0.5, 0.2, 0.1, 0.2, 0.1, 0]', opciones);   % para Días
c='grbcy*';
titulo=['Susceptibles Expuestos Cuarentena Asintomáticos Sintomáticos Retirados'];
l=[0 12 22 33 47 60 70];
figure(1)
hold on 
for i=1:2:5
    subplot(3,2,i)
        plot(t/7,y(:,i),c(i))
        % plot(t,y(:,i),c(i))
        title(titulo(l(i)+1:l(i+1)))
    xlabel('Semanas')
    % xlabel('Días')
    subplot(3,2,i+1)
        plot(t/7,y(:,i+1),c(i+1))
        % plot(t,y(:,i+1),c(i+1))
        title(titulo(l(i+1)+1:l(i+2)))
        xlabel('Semanas')
        % xlabel('Días')
end
hold off
        




