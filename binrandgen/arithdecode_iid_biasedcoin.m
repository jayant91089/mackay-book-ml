function dseq = arithdecode_iid_biasedcoin(eseq,p0,peof,prec)
  peof=vpa(peof,prec);
  p0=vpa(p0,prec);
  tag=bstring2tag_unbiased_iid(eseq,peof,prec);
  dseq='';
  [x,y,z,w]=subdivide_bin(vpa('0',prec),vpa('1',prec),p0,peof); % current set of intervals
  intvls1=[x,y,z,w]
  dsymb='0';
  while ~(dsymb=='x')
    dsymb = nextsymb(tag,x,y,z,w);
    [u,v]=symb2interval(x,y,z,w,dsymb);
    [x,y,z,w]=subdivide_bin(u,v,p0,peof);
    intvls=[x,y,z,w]
    if x==w
      break;
    end;
    dseq = strcat(dseq,dsymb);
    dseq
  end;
end
