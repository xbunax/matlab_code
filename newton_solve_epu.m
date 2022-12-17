clear;
y1=[];
x1=[];
for a=0:0.001:0.1
    y1=[y1 exp(a)];
    x1=[x1 a];
end
x2=0:0.1;
y2=exp(x2);
plot(x1,y1);
plot(x2,y2);
hold on

