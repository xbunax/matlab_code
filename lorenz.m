x=-7;
y1=7;
z=28;
T=100;
[t1,fai1]=ode45(@lorenz,[0 T],[x y1 z]);
y2=7+10^-6;
[t1,fai2]=ode45(@lorenz,[0 T],[x,y2,z]);
plot3(fai1(:,1),fai1(:,2),fai1(:,3),fai2(:,1),fai2(:,2),fai2(:,3));

function dfai=lorenz(t,fai)
sigema=10;
beta=8/3;
rou=28;
dfai=zeros(3,1);

dfai(1)=sigema*(fai(2)-fai(1));
dfai(2)=fai(1)*(rou-fai(3))-fai(2);
dfai(3)=fai(1)*fai(2)-beta*fai(3);
end