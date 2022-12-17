clear;
Ic=10^(-11);
R=10;
T=300;
a=[];
b=[];
I=0;
Ip=0;
for V=-1:0.01:1
while abs((pn(I,Ic,V)-I)/pn(I,Ic,V)) > 0.001
    Ip=I-(I-Ic*(exp((V-10*I)/0.026)-1.0))/(1.0+10*Ic*exp((V-10*I)/0.026)/0.026);
    I=Ip;
end
    a=[a log(I)];
    b=[b V];
end
plot(b,a);

function I=pn(x,y,V)
I=x-(x-y*(exp((V-10*x)/0.026)-1.0))/(1.0+10*y*exp((V-10*x)/0.026)/0.026);
end