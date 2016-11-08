function [means,labels]=softkmeans1(data,K,maxitr,sigma,varargin)
  	if nargin>4
  		means=varargin{1};
  	else
  		means=unifrnd(min(min(data)),max(max(data)),[K,size(data,2)]);
  	end
    beta=1/(sigma^2);
    labels=ones(size(data,1),1);
    % the responsibility matrix (rows=data,cols=1..K)
    respmat=(1/K)*ones(size(data,1),K);
  	mindist=100000*ones(size(data,1),1);
  	for i=1:maxitr
  		% Assignment step
  		for j=1:size(data,1)
  			for k=1:K
          respmat(j,k)=e^(-beta*distance(means(k,:),data(j,:)));
  			end
        respmat(j,:)=respmat(j,:)/sum(respmat(j,:));
  		end
  		% Update step
      means=respmat'*data;
  		for k=1:K
  			means(k,:)=means(k,:)/sum(respmat(:,k));
  		end
  	end
    for j=1:size(data,1)
      [_,labels(j)]=max(respmat(j,:));
    end
end
