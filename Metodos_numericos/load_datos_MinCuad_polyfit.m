function [A,b]=load_datos_MinCuad_polyfit()
  grado=input('grado del polinomio? '); 
  
  Data=load('datos_MinCuad_polyfit.txt');
  x=Data(1,:);
  xx=[x]; 
  for i=2:grado
    xx=[xx; x.^i];
  end
  xx=[xx;Data(2,:)];
  xx=xx';
  [p,q]=size(xx);
  A=[ones(p,1), (xx(:,1:(q-1)))];
  b=xx(:,q);
  % polyfit(x,b',grado); % devuelve los coeficientes del ajuste polinomial
                         % de forma P(x)=a_n*x^n+...+a_1*x+a0
                         % utilizar la funcion flip() para invertir
end