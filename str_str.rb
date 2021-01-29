# @param {String} haystack
# @param {String} needle
# @return {Integer}
def str_str(haystack, needle)
  return 0 if haystack.empty? && needle.empty?

  return 0 if needle.empty?

  haystack = haystack.split('')
  needle = needle.split('')

  res = -1
  (0...haystack.size).each do |idx|
    next unless haystack[idx] == needle[0]

    lo = idx
    hi = idx + needle.size - 1

    break if hi > (haystack.size - 1)

    i = 0
    match = true
    (lo..hi).each do |k|
      unless haystack[k] == needle[i]
        match = false
        break
      end
      i += 1
    end

    if match && res == -1
      res = lo
    else
      res = [res, lo].min
    end
  end
  res
end

p str_str('hello', 'll') == 2
p str_str('aaaaa', 'bb') == -1
p str_str('', '').zero?
