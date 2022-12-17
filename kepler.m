clear;
n1=0;
tl=0;
rl=0;
for M=linspace(0,2*pi(),50)
n1=n1+1;
[theta1,r]=theta(M);
tl(n1)=theta1;
rl(n1)=r;
end
plot(rl.*cos(tl),rl.*sin(tl),'ro');


function [theta,r]=theta(M)
e=0.7;
p=1.1;
e1=0;
n=1;
while abs((e1-n)/e)>0.001
    n=e1;
    e1=e*sin(n)+M;
end
theta=2*atan(((1+e)/(1-e))^(1/2)*tan(e1/2));
r=p/(1+e*cos(theta));
end
