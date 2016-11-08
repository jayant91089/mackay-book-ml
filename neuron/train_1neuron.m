function w = train_1neuron(data,labels,L,varargin)
  switch nargin
  case 3
    eta=0.01;
    alpha=0.1;
  case 4
    eta=varargin{1};
    alpha=0.1;
  case 5
    eta=varargin{1};
    alpha=varargin{2};
  end
  w=zeros(size(data,2),1);
  for i=1:L
    a=data*w; # activation vector
    y=sigmoid(a);
    err=labels-y;
    g=-data'*err;
    w=w-eta*(g+alpha*w)
  end
end
% global x ; # x is an N * I matrix containing all the input vectors
% global t ; # t is a vector of length N containing all the targets
% for l = 1:L # loop L times
% a = x * w ; # compute all activations
% y = sigmoid(a) ; # compute outputs
% e = t - y ; # compute errors
% g = - x’ * e ; # compute the gradient vector
% w = w - eta * ( g + alpha * w ) ; # make step, using learning rate eta
% # and weight decay alpha
% endfor
