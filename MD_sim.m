clear;
delta=1.5;
n=5;
dn=3;
np=n^3;
inim=cell(5);
T=0.25;
h=0.01;
num_step=15000;
m=1;
for k=1:n
    pv1(:,:,k)=inim;
end
for i=1:n
    for j=1:n
        for k=1:n
            pv1{i,j,k}=delta.*[i,j,k];
        end
    end
end
position=[];
x=[];
y=[];
z=[];
pv=zeros(3,125);
for i=1:n
    for j=1:n
        for k=1:n
            position=pv1{i,j,k,1};
            x=[x position(1)];
            y=[y position(2)];
            z=[z position(3)];
        end
    end
end
pv(1,:)=x;
pv(2,:)=y;
pv(3,:)=z;%initial pv
%scatter3(x,y,z,'ro');
vv=rand(3,np)-0.5.*ones(3,np);
vv=sqrt(2*T).*vv;%inital vector

for k=1:num_step
    pv=pv+h*h.*vv;
    fv=calc_f(pv,np);
    vv=vv+h.*fv/m;
    if mod(k,5)==0
    xv=pv(1,:);
    yv=pv(2,:);
    zv=pv(3,:);
    plot3(xv,yv,zv,'ro');
    disp(k)
    pause(0.01)
    end
end


r=[]; 
Kv=[]; 
for i=1:np 
 rv=pv-repmat(pv(:,i),1,np); 
 r2v=sum(rv.^2);
 rv=rv(:,(r2v>0)); 
 r2v=r2v(r2v>0); 
 Kv=pv-repmat(pv(:,i),1,np);  
 r(i)=min(r2v); %最近邻原子距离
end 
avg_r=sum(r,2)/np; %最近邻原子平均距离
VV=avg_v.^2; %方均跟速率的平方
V=np*avg_r^3; %系统的体积
Pr=1/2*VV/V+1/18*sum(sum(Kv.*fv,2))/V; %压强

function fv=calc_f(pv,np)
fv=zeros(3,np);
for i=1:np
    rv=pv-repmat(pv(:,i),1,np);
    r2v=sum(rv.^2);
    rv=rv(:,(r2v>0));
    r2v=r2v(r2v>0);
    phi=48./r2v.^17 - 24./r2v.^4;
    phi=repmat(phi,3,1);
    f=sum(rv.*phi,2);
    fv(:,i)=f;
end
end



