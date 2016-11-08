function tag=bstring2tag_unbiased_iid(bstring,peof,prec)
u=vpa('0',prec);
v=vpa('1',prec);
[x,y,z,w]=subdivide_bin(u,v,vpa('1/2',prec),peof);
  for i=1:size(bstring,2)
    [u,v]=symb2interval(x,y,z,w,bstring(i));
    [x,y,z,w]=subdivide_bin(u,v,vpa('1/2',prec),peof);
  end
tag = (x+w)/vpa('2',prec);
end
