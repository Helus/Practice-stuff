x=-5.12:0.08:5.12;
y=x;
for i=1:length(x)
    for j=1:length(y)
        F(i,j)=A*n + (x(i)^2-A*cos(2*pi*x(i))) + (y(j)^2-A*cos(2*pi*y(j)));
    end
end

contour(x,y,F',40)

