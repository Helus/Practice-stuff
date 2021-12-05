% PARTE 1
% Programa que comprueba el tipo de MLM (explícito o implícito) y la
% convergencia
function [tipo,conv,error,orden]=comprobar_MLM(alph,bet)

tol=1.e-10; % porque las comparaciones con enteros no funciona bien :(

% explicito/implicito
if bet(end)==0
    disp('El método es EXPLÍCITO');
    tipo='explicito';
else
    disp('El método es IMPLÍCITO')
    tipo='implicito';
end

% CONVERGENCIA
k=length(alph)-1;

rho_1=sum(alph);
drho_1=sum([1:k].*alph(2:k+1));
sigma_1=sum(bet);

% consistencia
if rho_1==0 && (drho_1-sigma_1)<tol
    disp('El método es CONSISTENTE')
    consist=true;
else 
    disp('El método NO es CONSISTENTE')
    consist=false;
end

% estabilidad
raices=roots(flip(alph));

estab=true;
for i=1:k
    if abs(raices(i))>1+tol
        estab=false;
        disp('NO hay ESTABILIDAD, una raiz módulo mayor que 1')
        break
    end
    if abs(raices(i))==1
        if sum(raices(i)==raices)>1+tol
            estab=false;
            disp('NO hay ESTABILIDAD, una raiz con módulo 1 no son simples')
            break
        end
    end 
end

if estab && consist 
    disp('El método es ESTABLE')
    disp('El método es CONVERGENTE')
    conv=true;
    error='none';
elseif ~estab
    conv=false;
    orden=0;
    error='estabilidad';
else
    conv=false;
    orden=0;
    error='consistencia';
end

% ORDEN DE CONVERGENCIA
if conv
    cq=0;
    n=1; % n sirve como q porque sino sobreescribe el q de BDF
    while abs(cq)<tol
        n=n+1;
        cq=1/factorial(n)*sum(([0:k].^n).*alph) - 1/factorial(n-1)*sum(([0:k].^(n-1)).*bet);
    end
    fprintf('El método es de ORDEN %i \n', n-1);
    orden=n-1;
else
    disp('El método NO es CONVERGENTE')
end
end
