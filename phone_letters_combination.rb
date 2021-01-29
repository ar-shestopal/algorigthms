PHONE = {'2' => ['a', 'b', 'c'],
         '3' => ['d', 'e', 'f'],
         '4' => ['g', 'h', 'i'],
         '5' => ['j', 'k', 'l'],
         '6' => ['m', 'n', 'o'],
         '7' => ['p', 'q', 'r', 's'],
         '8' => ['t', 'u', 'v'],
         '9' => ['w', 'x', 'y', 'z']}
# @param {String} digits
# @return {String[]}
def letter_combinations(digits)
  output = []

  dfs(output, '', digits) if digits
  output
end

def dfs(output, combination, next_digits)
  if next_digits.empty?
    output << combination unless combination.empty?
  else
    PHONE[next_digits[0]].each do |ch|
      next_combination = combination + ch
      dfs(output, next_combination, next_digits[1..-1])
    end
  end
end

p letter_combinations("23") == ["ad","ae","af","bd","be","bf","cd","ce","cf"]
p letter_combinations("") == []
p letter_combinations("2") == ['a', 'b', 'c']