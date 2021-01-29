require 'pry'

# @param {Integer[]} nums
# @return {Integer}
def missing_number(nums)
  n_sum = (0..nums.size).sum
  has_zero = false
  nums.each do |num|
    has_zero == true if num == 0
    n_sum -= num
  end

  n_sum
end

p missing_number([0]) == 1
p missing_number([1]) == 0
p missing_number([1,2,3]) == 0
p missing_number([0, 2, 3]) == 2
