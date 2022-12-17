clear;
v=0.9;
p=0.9;
L=1;
N0=10^6;
position=zeros(1,3);
deltaposition=zeros(1,3);
k=zeros(1,(4-0.3)/0.1);
S=linspace(0.2,4,(4-0.2)/0.1);
for s=1:length(S)
    n=0;
    n0=0;
    while n<=N0
    theta=rand(1,3);
    r=(4*v*S(s)/pi)^(1/3);
    z=r/S(s);
    
    
    if -log(theta(3))<z/2
    n=n+1;
    position=[r/2*cos(2*pi*theta(1)) r/2*sin(2*pi*theta(2)) -log(theta(3))-z/2];
    %position=[0 0 2*v*r^-2/pi];
   
    size=[r/2 r/2 r/2*S(s)];
    if rand(1)<p
        x=rand(1,2);
    for o=1:length(x)
        phi=acos(2*(x(o)-0.5));
        Theta=2*pi*x(o);
        deltaposition=[L*sin(phi)*cos(Theta) L*sin(phi)*sin(Theta) L*cos(phi)];
        c=(deltaposition+position)<=size;
        if sum(c)==3
            n0=n0+1;
        end
    end
    end
    end
    end
    disp(n0);
    k(s)=n0/N0;

end

plot(S,k)