function x = qdist_metro_rnd(param_list)
% param list contains only one parameter, the current location (i.e the mean of qdist)
  m = param_list(1);
  if m==0
    if rand(1) < 1/2
      x = 1; % move right
    else
      x = 0; % stay
    end;
  elseif m==20
    if rand(1) < 1/2
      x = 19; % move left
    else
      x = 20; % stay
    end;
  else
    if rand(1) < 1/2
      x = m+1; % move left
    else
      x = m-1; % move right
    end;
  end;
end;
