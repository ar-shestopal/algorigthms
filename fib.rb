def fib(n)
  a = 0
  b = 1
  value = 0
  return a if n == 0

  return b if n == 1

  (2..n).each do |i|
    value = a + b
    a = b
    b = value
  end
  value
end


print(fib(10))
# 55
