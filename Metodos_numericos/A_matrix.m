clear

alfa=0.9;

A=[ones(1,5); alfa*eye(5)]

AtA=A'*A
fprintf('cond2(AtA)= %f \n',cond(AtA,2));

[Q,R]=qr(A);
fprintf('cond2(R)= %f \n',cond(R(1:5,1:5),2));

error=abs(cond(AtA,2)-(cond(R(1:5,1:5),2))^2);
fprintf('Error de |cond2(AtA)-cond2(R)^2|= %f \n', error);
