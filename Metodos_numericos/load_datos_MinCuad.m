function [A,b]=load_datos_MinCuad()
  Data=load('datos_MinCuad.txt');
  Data=Data';
  [p,q]=size(Data);
  A=[(Data(:,1:(q-1))) ones(p,1)];
  b=Data(:,q);
end
