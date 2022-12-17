%function Lenard_Jones 
e=1.5; 
T=0.1; 
h=0.01; 
n=5;
np=5*5*5;%��ά
m=1;%��������
vv=rand(3,np)-0.5.*ones(3,np); %
vv=sqrt(3*T).*vv; 
fv=zeros(3,np);  %ȫ����0
null=cell(5);%����5*5�Ŀյ�Ԫ����
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
for k=1:15000 %��������λ�ú��ٶ�
 pv=pv+h.*vv; 
 fv=calc_f(pv,np); 
 vv=vv+h.*fv/m; 
 avg_v=sqrt(sum(sum(vv.^2))/np); %����������
 vv=vv.*sqrt(3*T)/avg_v; 
 if mod(k,5)==0 %ÿ�岽��ʾһ��λ��
 xv=pv(1,:); 
 yv=pv(2,:); 
 zv=pv(3,:);
 plot3(xv,yv,zv,'ro'); 
 disp(k);
 %axis([1,8,1,8,1,8]); %����������
 drawnow; 
 %pause(0.01); %ͣ0.1��
 end 
%end 

r=[]; 
Kv=[]; 
for i=1:np 
 rv=pv-repmat(pv(:,i),1,np); %�ѵ�i�е�����Ϊ0
 r2v=sum(rv.^2);
 rv=rv(:,(r2v>0)); %ȥ��Ϊ0��һ��
 r2v=r2v(r2v>0); 
 Kv=pv-repmat(pv(:,i),1,np);  
 r(i)=min(r2v); %�����ԭ�Ӿ���
end 
avg_r=sum(r,2)/np; %�����ԭ��ƽ������
VV=avg_v.^2; %���������ʵ�ƽ��
V=np*avg_r^3; %ϵͳ�����
Pr=1/2*VV/V+1/18*sum(sum(Kv.*fv,2))/V; %ѹǿ
end 

function fv=calc_f(pv,np) %�������ܵ�����
fv=zeros(3,np); 
for i=1:np 
 rv=pv-repmat(pv(:,i),1,np); 
 r2v=sum(rv.^2); 
 rv=rv(:,(r2v>0)); 
 r2v=r2v(r2v>0); 
 u=48./r2v.^7-24./r2v.^4; %����ϵ��
 u=repmat(u,3,1); %��Ϊ��ͬ������
 f=sum(rv.*u,2); %�������
 fv(:,i)=f; 
end 
end 
