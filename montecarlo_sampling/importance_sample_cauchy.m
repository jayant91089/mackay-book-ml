function [x,w] = importance_sample_cauchy(pdist,loc,scale)
% sample from (not necessarily normalized) 1D density function whose
% function handle is pdist
% by sampling from Normal(mu,sigma)
% return the resultant sample x and associated weight w=pdist(x)/normal(x,mu,sigma)
  x=cauchy_rnd(loc,scale);
  w=pdist(x)/cauchy_pdf(x,loc,scale);
end;
