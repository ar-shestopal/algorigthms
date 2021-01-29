def group_anagram_words(strs)
  hash = {}

  strs.each do |str|
    sorted = str.split('').sort.join
    if hash.key?(sorted)
      hash[sorted] << str
    else
      hash[sorted] = [sorted]
    end
  end

  hash.values
end


p group_anagram_words(['abc', 'bcd', 'cba', 'cbd', 'efg'])
# (['abc', 'cba'], ['bcd', 'cbd'], ['efg'])
