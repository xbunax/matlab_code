clear;
alpha=[0.2980,1.242567,5.782948,38.475];
H=[];
S=[];
Q=[];
for i=1:4
    for j=1:4
        for k=1:4
            for l=1:4
                Q(i,j,k,l)=2*pi^2.5/((alpha(i)+alpha(j))*(alpha(k)+alpha(l))*(sum(alpha))^0.5);
                H(i,j)=3*alpha(1)*alpha(j)*pi()^1.5/(alpha(1)+alpha(j))^2.5;
                S(i,j)=(pi/(alpha(i)+alpha(j)))^1.5;
            end
        end
    end
end
Cp=rand(4);
Cp1=Cp(:,1);
n=(Cp1.*S.*Cp1)^0.5;
Cp1=Cp1./n;
Cp2=zeros(1,4);
F=[];
while norm(Cp1-Cp2)>10^-8
    for i=1:4
        for j=1:4
            for k=1:4
                for l=1:4
                    F(i,j)=H(i,j)+Q(i,j,k,l)*Cp1(k)*Cp1(l);
                end
            end
        end
    end
    Cp2=Cp1;
    [V,E]=eig(F);
    Cp1=V(:,4);
    n=(Cp1.*S.*Cp1)^0.5;
    Cp1=Cp1./n;
end
y=[];
o=[];
for x=0:10^-5:1
    a=(Cp1(1)*exp(-alpha(1)*x^2)+Cp1(2)*exp(-alpha(2)*x^2)+Cp1(3)*exp(-alpha(3)*x^2)+Cp1(4)*exp(-alpha(4)*x^2))^2;
    y=[y a];
    o=[o x];
end
plot(o,y)

hold on