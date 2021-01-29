# frozen_string_literal: true

# @param {String} srt
# @param {String} tar
# @return {String}
def min_window(str, tar)
  return '' if tar.empty? || str.empty?

  str = str.split('')
  tar = tar.split('')

  t_map = {}
  s_map = {}
  win_start = 0
  count = 0
  tar_count = 0
  min_length = Float::INFINITY

  tar.each do |ch|
    t_map[ch] = 0 unless t_map.key?(ch)
    t_map[ch] += 1
    tar_count += 1
  end


  (0...str.size).each do |win_end|
    ch = str[win_end]
    s_map[ch] = win_end unless s_map.key?(win_end)
    s_map
  end
end

p min_window('ADOBECODEBANC', 'ABC') == 'BANC'
p min_window('a', 'a') == 'a'
p min_window('abc', '') == ''
p min_window('abc', 'tt') == ''
