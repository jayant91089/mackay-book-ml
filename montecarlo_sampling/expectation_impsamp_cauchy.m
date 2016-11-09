function m = expectation_impsamp_cauchy(pdist,loc,scale,n)
% compute expected value of a random variable with (not
% necessarily normalized) density pdist by using independence sampling
% with cauchy(loc,sigma) as the base/sampler distribution
wvec = zeros(1,n);
xvec = zeros(1,n);
for i=1:n
  [x,w]=importance_sample_cauchy(pdist,loc,scale);
  wvec(i)=w;
  xvec(i)=x;
end;
%[sum(wvec),xvec*wvec']
m = (xvec*wvec')/sum(wvec);
end;
