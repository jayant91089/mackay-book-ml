function clusterplot2d(data,means,labels,varargin)
  switch nargin
  case 3
    figure;
    c=jet(max(labels))
    cdata=c(labels,:)
    scatter(data(:,1),data(:,2),15,cdata,'filled');hold on;
    cdata=c;
    scatter(means(:,1),means(:,2),30,cdata);hold off;
  otherwise
    sigmavec=varargin{1};
    figure;
    c=jet(max(labels))
    cdata=c(labels,:)
    scatter(data(:,1),data(:,2),15,cdata,'filled');hold on;
    cdata=c;
    scatter(means(:,1),means(:,2),30,cdata);
    for i=1:size(means,1)
      plotcircle(means(i,1),means(i,2),sigmavec(i),c(i,:))
    end
  end
end
