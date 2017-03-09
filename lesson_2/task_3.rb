
res = [0, 1]

loop do

  tmp = res[-1] + res[-2]

  break if tmp >= 100

  res << tmp

end