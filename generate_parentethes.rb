def generate(n)
  res = []

  backtrack('', 0, 0, n, res)
  res
end

def backtrack(s, left, right, n, res)
  return res << s  if s.size == (2 * n)

  if left < n
    str = s + '('
    backtrack(str, left+1, right, n, res)
  end

  if left > right
    str = s + ')'
    backtrack(str, left, right+1, n, res)
  end
end

p generate(3)