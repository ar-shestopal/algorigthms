# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  n = nums.size
  k = 1
  res = Float::INFINITY

  while k < n
    (0...(n-k+1)).each do |i|
      arr = nums[i...(i+k)]
      curr_sum = arr.sum
      res = [res, arr.size].min if curr_sum == s
    end
    k += 1
  end

  if res == Float::INFINITY
    0
  else
    res
  end
end

s = 7
nums = [2,3,1,2,4,3]

p min_sub_array_len(s, nums)