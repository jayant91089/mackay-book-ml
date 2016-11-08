function plotgaussian2d(mu,sigma)
  X=linspace(mu(1)-10,mu(1)+10,50);
  Y=linspace(mu(2)-10,mu(2)+10,50);
  Z=zeros(50,50);
  for i=1:50
    for j=1:50
      Z(i,j)=mvnpdf([X(i),Y(j)],mu,sigma);
    end
  end
  surf(X,Y,Z);
end
