class Integer
    N_BYTES = [42].pack('i').size
    N_BITS = N_BYTES * 16
    MAX = 2 ** (N_BITS - 2) - 1
    MIN = -MAX - 1
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
    lo = 0
    hi = nums.size - 1

    nums.sort!

    diff = Integer::MAX
    (0...nums.size).each do |i|
        lo = i + 1
        hi = nums.size - 1

        while lo < hi
            sum = nums[i] + nums[lo] + nums[hi]

            if (target - sum).abs < diff.abs
                diff = target - sum
            end
            if sum < target
                lo += 1
            else
                hi -= 1
            end
        end
        if diff == 0
            break
        end
    end

    target - diff
end

p three_sum_closest([-1,2,1,-4], 1)
