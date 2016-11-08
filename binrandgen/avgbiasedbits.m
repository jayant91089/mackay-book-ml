function n = avgbiasedbits(nub,p0,peof,prec)
  n=0;
  for i=0:2^nub-1
    ubstring=dec2bin(i,nub);
    ubstring=strcat(ubstring,'x');
    decstr=arithdecode_iid_biasedcoin(ubstring,p0,peof,prec);
    [ubstring,decstr]
    n=n+size(decstr,2)-1;
  end
  n=n/(2^nub);
end
