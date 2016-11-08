function [x,y,z,w] = subdivide_bin(u,v,p0,peof)
  x=u;
  w=v;
  z=x+((v-u)-(v-u)*peof);
  y=x+(z-x)*p0;
end;
