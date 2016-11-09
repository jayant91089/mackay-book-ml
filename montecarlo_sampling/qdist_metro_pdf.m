function p = qdist_metro_pdf(x,param_list)
  m = param_list(1);
  if x==m+1 || x==m-1
    p=1/2;
  else
    p=0;
  end;
end;
