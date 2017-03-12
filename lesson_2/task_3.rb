res = [0, 1]
tmp = 0

while (tmp = res[-1] + res[-2]) <= 100
  res << tmp
end