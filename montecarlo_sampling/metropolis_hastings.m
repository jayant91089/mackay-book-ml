function m = metropolis_hastings(pdist_pdf,qdist_pdf,qdist_rnd,initx,param_list_in,n)
% metropolis-hastings method with identical class
% sampler at every location. Accepts vector inputs.
% pdist_pdf, qdist_pdf are function handles that allow
% one to evaluate target and sampler density respectively,
% while qdist_rnd is a handle to a function that draws samples
% from sampler density. function pdist_pdf accepts only one input x
% Functions qdist_pdf and qdist_rnd  are user defined with the only
% requirement being that both accept two arguments x and parm_list.
% The parameter list passed to these functions is cat(2,[x],param_list_in)
% allowing the sampler to vary based on location (albeit belonging to same
% class of distributions). initx is the initial location,
% param list is the list of parameters of the sampler to be
% passed to the qdist sampler as an argument to qdist_pdf
% and qdist_rnd functions. n is the number of trials.
% return value is an estimate of the expectation of pdist
x_current=initx;
xvec=[]; % rows of this are accepted x values
for i=1:n
  x_proposal = qdist_rnd(x_current,param_list);
  a = pdist_pdf(x_proposal)/pdist_pdf(x_current);
  a=a*(qdist_pdf(x_current,cat(2,[x_proposal],param_list))/qdist_pdf(x_proposal,cat(2,[x_current],param_list)));
  if a>=1
    x_current = x_proposal;
    xvec = cat(1,xvec,x_current);
  else
    if rand(1) < a % accept x_proposal with probability a
      x_current = x_proposal;
    end;
  end;
end;
m = sum(xvec,1)/size(xvec,1);
end;
