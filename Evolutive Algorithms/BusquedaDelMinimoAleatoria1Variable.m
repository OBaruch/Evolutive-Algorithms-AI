clc
clear
cla
f=@(x)(x-2).^2+(2*x-2).^2; %%Funcion de 2 variables que se le pretende buscar el minimo
x=-4:0.1:4;
y=f(x);
xl=-5;
xu=5;
fbest=inf;
xbest=0;

for i=1:1000
xi=xl+(xu-xl)*rand(1);
fval=f(xi);
if(fval<fbest)
    xbest=xi;
    fbest=fval;
end
    
end

hold on
plot(x,y);
plot(xbest,fbest,'r*')