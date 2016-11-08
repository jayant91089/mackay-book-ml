function [x,w] = importance_sample_gaussian(pdist,mu,sigma)
% sample from (not necessarily normalized) 1D density function whose
% function handle is pdist
% by sampling from Normal(mu,sigma)
% return the resultant sample x and associated weight w=pdist(x)/normal(x,mu,sigma)
  x=normrnd(mu,sigma);
  w=pdist(x)/normpdf(x,mu,sigma);
end;
