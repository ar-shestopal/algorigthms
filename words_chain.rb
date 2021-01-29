require 'set'
require 'pry'


def is_cycle(symbol, current_word, start_word, length, visited)
  return start_word[-1] == current_word[0] if length == 1

  visited << current_word
  chained = symbol[current_word[-1]]

  chained.each do |neighbour|
    return true if !visited.include?(neighbour) && is_cycle(symbol, neighbour, current_word, length-1, visited)
  end
  visited.delete(current_word)
  false
end

def chained_words(words)
  symbol = {}
  words.each do |word|
    symbol[word[0]] ||= []
    symbol[word[0]] << word
  end

  is_cycle(symbol, words[0], words[0], words.size, Set.new)
end

puts(chained_words(['apple', 'eggs', 'snack', 'karat', 'tuna']))
# True

# puts(chained_words(['apple', 'eggs', 'snack', 'karat', 'tunax']))
# False
