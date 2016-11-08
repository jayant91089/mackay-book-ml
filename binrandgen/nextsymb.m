function nsymb=nextsymb(tag,x,y,z,w)
  if all([tag>=x, tag <y]) % [x,y)
      nsymb = '0';
    elseif all([tag>=y, tag<z])
      nsymb = '1';
    else
      nsymb ='x';
  end
end
