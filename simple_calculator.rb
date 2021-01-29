
def calculate(s)
  eval_helper(s, 0)[0]
end

def eval_helper(s, i)
  result = 0
  op = '+'

  while i < s.size
    char = s[i]
    puts char

    if char == '+' || char == '-'
      op = char
    else
      value = 0
      if char.to_i.to_s == char
        value = char.to_i
      elsif char == '('
        value, i = eval_helper(s, i+1)
      end

      if op == '+'
        result += value
      end

      if op == '-'
        result -= value
      end
      p "value #{value}  result #{result} op #{op}"
    end
    i += 1
  end

  [result, i]
end

p calculate("(2 + (3 - 1))")



