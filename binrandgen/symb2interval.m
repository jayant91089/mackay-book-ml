function [u,v] = symb2interval(x,y,z,w,symb)
  if symb == '0'
    u=x;
    v=y;
  end;
  if symb == '1'
    u=y;
    v=z;
  end;
  if symb == 'x'
    u=z;
    v=w;
  end;
end
