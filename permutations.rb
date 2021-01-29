require 'pry'

def permute(s)
  str = s.split('')
  len = str.size
  result = []

  q =[[]]

  str.each do |ch|
    n = q.size
    n.times do
      curr_permute = q.shift
      (curr_permute.size + 1).times do |idx|
        new_permute = curr_permute.dup
        new_permute.insert(idx, ch)
        if new_permute.size == len
          result << new_permute
        else
          q << new_permute
        end
      end
    end
  end
  result
end


def permute_backtrack(s)
  str = s.split('')
  l = 0
  r = str.size - 1
  result = []
  backtrack(str, l, r, result)
  result
end

def backtrack(s, l, r, result)
  if l == r
    result << s.dup
  else
    (l..r).each do |idx|
      s[l], s[idx] = s[idx], s[l]
      backtrack(s, l+1, r, result)
      s[l], s[idx] = s[idx], s[l]
    end
  end
end

p permute('abc')
p permute_backtrack('abc')
