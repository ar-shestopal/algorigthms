# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = []

  s.split('').each do |ch|
    stack << ch if ch == '('
    stack << ch if ch == '['

    if ch == ')'
      from_stack = stack.pop
      return false if from_stack != '('
    elsif ch == ']'
      from_stack = stack.pop
      return false if from_stack != '['
    end
  end
  puts stack.inspect
  return false unless stack.empty?

  true
end


p is_valid('()([])') # true
p is_valid('((') # true