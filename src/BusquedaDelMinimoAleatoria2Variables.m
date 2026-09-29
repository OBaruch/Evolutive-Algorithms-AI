%%
%%Actividad 3 OMAR BARUCH MORON LOPEZ 213605572

f=@(x,y)(x-2).^2+(y-2).^2; %%Funcion de 2 variables que se le pretende buscar el minimo
[x,y]=meshgrid(-5:0.5:5);
z=f(x,y);
xl=[-10;-10];
xu=[10;10];
fbest=inf;
xbest=[0;0];

for i=1:1000
xi=xl+(xu-xl).*rand(2,1);
fval=f(xi(1),xi(2));
if(fval<fbest)
    xbest(1)=xi(1);
    xbest(2)=xi(2);
    
    fbest=fval;
end
    
end

hold on
surf(x,y,z);
plot3(xbest(1),xbest(2),fbest,'w*','LineWidth',10)

