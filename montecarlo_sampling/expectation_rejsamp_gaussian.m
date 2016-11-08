function m = expectation_rejsamp_gaussian(pdist,mu,sigma,n,c)
  xsum=0;
  for i=1:n
    [x,ntries] = rejection_sample_gaussian(pdist,mu,sigma,c);
    xsum=xsum+x;
  end;
  m = xsum/n;
end;
