clear;
satis=readmatrix('E:\mfilesdata\医疗卫生机构数量及变动(1).xlsx');
x=satis(:,1);
y1=satis(:,3);
y2=satis(:,2);
figure;

yyaxis left
bar(x,y2)
hold on
yyaxis right
plot(x,y1)
hold on