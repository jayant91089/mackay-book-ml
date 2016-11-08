function [x ntries]= rejection_sample_gaussian(pdist,mu,sigma,c)
accept = 0;
ntries = 0;
while accept==0
  x = normrnd(mu,sigma);
  y = unifrnd(0,c*normpdf(x,mu,sigma));
  ntries = ntries+1;
  if pdist(x) > y
    accept = 1;
  end;
end;
end;
