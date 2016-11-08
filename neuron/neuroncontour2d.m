function neuroncontour2d(data,labels,xrng,yrng,w)
% w is column vector
% data is N X I matrix where first entry of each row is 1
% labels are 0 or 1
figure; hold on;
for i=1:size(data,1)
  if labels(i)==0
    scatter(data(i,2),data(i,3),15,[1,0,0],'filled');hold on;
  else
    scatter(data(i,2),data(i,3),15,[0,0,1],'filled');hold on;
  end
end
xlim(xrng);
ylim(yrng);
xx=linspace(xrng(1),xrng(2),50);
yy=linspace(yrng(1),yrng(2),50);
zz=zeros(50,50);
for i=1:50
  for j=1:50
    a=[1,xx(i),yy(j)]*w;
    zz(i,j)=sigmoid(a);
  end
end
contour(xx,yy,zz);hold off;
end;
