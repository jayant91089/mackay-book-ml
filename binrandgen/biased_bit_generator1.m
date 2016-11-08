function b=biased_bit_generator1(p0)
  for i=1:32
    bin_array(i)=unbiased_bit_generator();
  end;
  str=num2str(bin_array);
  str=str(str~=' ');
  if bin2dec(str)/2^32<p0
    b=0;
  else
    b=1;
  end;
end;
