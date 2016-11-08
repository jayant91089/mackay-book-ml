function [means,sigmas,labels]=softkmeans3(data,K,maxitr,varargin)
    switch nargin
    case 4
      means=varargin{1};
      sigmas=(max(max(data))-min(min(data)))*ones(K,2);
      weights=(1/K)*ones(1,K);
    case 5
      means=varargin{1};
      sigmas=varargin{2};
      weights=(1/K)*ones(1,K);
    case 6
      means=varargin{1};
      sigmas=varargin{2};
      weights=varargin{3};
    otherwise
      means=unifrnd(min(min(data)),max(max(data)),[K,size(data,2)]);
      sigmas=(max(max(data))-min(min(data)))*ones(K,2);
      weights=(1/K)*ones(1,K);
    end
    labels=ones(size(data,1),1);
    % the responsibility matrix (rows=data,cols=1..K)
    respmat=(1/K)*ones(size(data,1),K);
  	for i=1:maxitr
  		% Assignment step
  		for j=1:size(data,1)
  			for k=1:K
          respmat(j,k)=(weights(k)/prod( sigmas(k,:).*(sqrt(2*pi)*ones(1,size(data,2))) ))*e^(-sum( ((means(k,:)-data(j,:)).^2)./(2*sigmas(k,:).^2) ));
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
        sigmas(k,:)=sqrt( (respmat(:,k)'*(data-mk).^2)/ sum(respmat(:,k)) );
        weights(k)=sum(respmat(:,k))/(sum(sum(respmat)));
      end
      means,sigmas
  	end
    for j=1:size(data,1)
      [_,labels(j)]=max(respmat(j,:));
    end
end
