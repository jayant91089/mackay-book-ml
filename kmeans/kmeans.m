function [means,labels]=kmeans(data,K,maxitr,varargin)
	if nargin>3
		means=varargin{1};
	else
		means=unifrnd(min(min(data)),max(max(data)),[K,size(data,2)]);
	end
	labels=ones(size(data,1),1);
	mindist=100000*ones(size(data,1),1);
	for i=1:maxitr
		% Assignment step
		labels_new= labels;
		for j=1:size(data,1)
			for k=1:K
				%k,mindist(j),distance(data(j,:),means(k,:))
				if distance(data(j,:),means(k,:))<mindist(j)
					mindist(j)=distance(data(j,:),means(k,:));
					labels_new(j)=k;
				end
			end
		end
		% stop if assignment doesn't change
		if all(labels_new==labels)
			break;
		else
			labels=labels_new;
		end
		% Update step
		for k=1:K
			rk=[labels==k];
			if sum(rk)>0
				means(k,:)=sum(diag(rk)*data)/sum(rk);
			end
		end
		clusterplot2d(data,means,labels)
	end
	end
