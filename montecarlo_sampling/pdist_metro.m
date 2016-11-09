function p = pdist_metro(x)
  % example distribution to be sampled (eq 29.33 of MacKay)
  if any(x == 0:1:20)
    p = 1/21;
  else
    p = 0;
  end;
end;
