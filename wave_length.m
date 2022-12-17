%Ｌ2=48nm
%Eh=27.211eV,a0=0.0529nm,E=hv=hc/\lambda
%lambda=hc/E,hc=1240eV.nm 

clear;
N=479;
x=0.3;
Eg=1.424+1.248*x;
phi=4.07-1.1*x;
elem=0.067+0.083*x;
holem=0.62+0.14*x;
h=48/(N+1);
a=(N+1)/2-6/h;
b=(N+1)/2+6/h;
H=zeros(N+1,N+1);
for i=a+1:b-1
	H(i,i)=2;
end
for i=1:N
    H(i,i+1)=-1;
    H(i+1,i)=-1;
end
for i=1:a
	H(i,i)=2+2*h^2*elem*Eg;
end
for i=b:N+1
	H(i,i)=2+2*h^2*elem*Eg;
end
HoleH=H;
for i=1:a
	HoleH(i,i)=2+2*h^2*holem*Eg;
end
for i=b:N+1
	HoleH(i,i)=2+2*h^2*holem*Eg;
end
[V,D]=eig(H);
[holeV,holeD]=eig(HoleH);
eleE=D(1,1)*(N+1)^2/2;
holeE=holeD(1,1)*(N+1)^2/2;

disp('electron ground energy='); disp(eleE);
disp('hole ground energy='); disp(holeE);
disp('energy gap='); disp(holeE-eleE);
disp('emission wavelength=');
disp(1240/(holeE-eleE-4.07+1.1*x));