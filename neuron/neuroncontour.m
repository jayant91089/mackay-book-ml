function neuroncontour2d(xrng,yrng,w)
% w is column vector
xx=linspace(xrng(1),xrng(2),50);
yy=linspace(yrng(1),yrng(2),50);
zz=zeros(50,50);
for i=1:50
  for j=1:50
    a=w*[1,xx(i),yy(j)];
    zz=sigmoid(a);
  end
end
contour(xx,yy,zz);
end;
