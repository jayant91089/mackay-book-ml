function plotcircle(centerx,centery,r,varargin)
  if nargin > 3
    c=varargin{1};
  else
    c=[0,0,1];
  end
  t = linspace(0,2*pi,100)';
  circsx = r.*cos(t) + centerx;
  circsy = r.*sin(t) + centery;
  plot(circsx,circsy,'color',c);
end
