%function Lenard_Jones 
e=1.5; 
T=0.1; 
h=0.01; 
n=5;
np=5*5*5;%三维
m=1;%粒子质量
vv=rand(3,np)-0.5.*ones(3,np); %
vv=sqrt(3*T).*vv; 
fv=zeros(3,np);  %全部置0
null=cell(5);%产生5*5的空单元数组
for k=1:n
    pv1(:,:,k)=null;
end
for i=1:n
    for j=1:n
        for k=1:n
            pv1{i,j,k}=e.*[i,j,k];
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
pv(3,:)=z;
VV=[]; 
figure(1) 
for k=1:15000 %计算粒子位置和速度
 pv=pv+h.*vv; 
 fv=calc_f(pv,np); 
 vv=vv+h.*fv/m; 
 avg_v=sqrt(sum(sum(vv.^2))/np); %方均根速率
 vv=vv.*sqrt(3*T)/avg_v; 
 if mod(k,5)==0 %每五步显示一次位置
 xv=pv(1,:); 
 yv=pv(2,:); 
 zv=pv(3,:);
 plot3(xv,yv,zv,'ro'); 
 disp(k);
 %axis([1,8,1,8,1,8]); %坐标轴设置
 drawnow; 
 %pause(0.01); %停0.1秒
 end 
%end 

r=[]; 
Kv=[]; 
for i=1:np 
 rv=pv-repmat(pv(:,i),1,np); %把第i列的数变为0
 r2v=sum(rv.^2);
 rv=rv(:,(r2v>0)); %去掉为0的一列
 r2v=r2v(r2v>0); 
 Kv=pv-repmat(pv(:,i),1,np);  
 r(i)=min(r2v); %最近邻原子距离
end 
avg_r=sum(r,2)/np; %最近邻原子平均距离
VV=avg_v.^2; %方均跟速率的平方
V=np*avg_r^3; %系统的体积
Pr=1/2*VV/V+1/18*sum(sum(Kv.*fv,2))/V; %压强
end 

function fv=calc_f(pv,np) %求粒子受到的力
fv=zeros(3,np); 
for i=1:np 
 rv=pv-repmat(pv(:,i),1,np); 
 r2v=sum(rv.^2); 
 rv=rv(:,(r2v>0)); 
 r2v=r2v(r2v>0); 
 u=48./r2v.^7-24./r2v.^4; %力的系数
 u=repmat(u,3,1); %变为相同的三行
 f=sum(rv.*u,2); %对行求和
 fv(:,i)=f; 
end 
end 
