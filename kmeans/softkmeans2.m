function [means,sigmavec,labels]=softkmeans2(data,K,maxitr,varargin)
    switch nargin
    case 4
      means=varargin{1};
      sigmavec=(max(max(data))-min(min(data)))*ones(1,K);
      weights=(1/K)*ones(1,K);
    case 5
      means=varargin{1};
      sigmavec=varargin{2};
      weights=(1/K)*ones(1,K);
    case 6
      means=varargin{1};
      sigmavec=varargin{2};
      weights=varargin{3};
    otherwise
      means=unifrnd(min(min(data)),max(max(data)),[K,size(data,2)]);
      sigmavec=max(max(data))*ones(1,K);
      weights=(1/K)*ones(1,K);
    end
    labels=ones(size(data,1),1);
    % the responsibility matrix (rows=data,cols=1..K)
    respmat=(1/K)*ones(size(data,1),K);
  	for i=1:maxitr
  		% Assignment step
  		for j=1:size(data,1)
  			for k=1:K
          respmat(j,k)=(weights(k)/(sqrt(2*pi)*sigmavec(k))^size(data,2))*e^((-1/(sigmavec(k)^2))*distance(means(k,:),data(j,:)));
  			end
        respmat(j,:)=respmat(j,:)/sum(respmat(j,:));
  		end
  		% Update step
      means=respmat'*data;
  		for k=1:K
  			means(k,:)=means(k,:)/sum(respmat(:,k));
  		end
      for k=1:K
        mk=means(k,:)(ones(1,size(data,1)),:);
        sigmavec(k)=sqrt( (respmat(:,k)'*sum((data-mk).^2,2))/ (size(data,2)*sum(respmat(:,k))) );
        weights(k)=sum(respmat(:,k))/(sum(sum(respmat)));
      end
      means,sigmavec
  	end
    respmat
    for j=1:size(data,1)
      [_,labels(j)]=max(respmat(j,:));
    end
end
