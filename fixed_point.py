def helper(low, high, nums):
  if low == high:
    return None
  mid = int((low + high)/2)
  if nums[mid] == mid:
    return mid
  if nums[mid] < mid:
    return helper(mid + 1, high, nums)
  return helper(low, mid, nums)

def find_fixed_point(nums):
  return helper(0, len(nums), nums)

print find_fixed_point([-5, 1, 3, 4])
# 1