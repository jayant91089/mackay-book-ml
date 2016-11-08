function m = expectation_impsamp_gaussian(pdist,mu,sigma,n)
% compute expected value of a random variable with (not
% necessarily normalized) density pdist by using independence sampling
% with normal(mu,sigma) as the base distribution
wvec = zeros(1,n);
xvec = zeros(1,n);
for i=1:n
  [x,w]=importance_sample_gaussian(pdist,mu,sigma);
  wvec(i)=w;
  xvec(i)=x;
end;
[sum(wvec),xvec*wvec']
m = (xvec*wvec')/sum(wvec);
end;
