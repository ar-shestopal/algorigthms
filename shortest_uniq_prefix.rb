class Node
  attr_accessor :count, :children
  def initialize
    @children = {}
    @count = 0
  end
end

class Trie
  attr_accessor :root
  def initialize
    @root = Node.new
  end

  def insert(word)
    current_node = root
    word.split('').each do |ch|
      unless current_node.children.key?(ch)
        current_node.children[ch] = Node.new
      end

      current_node = current_node.children[ch]
      current_node.count += 1
    end
  end

  def uniq_prefix(word)
    current_node = root
    prefix = ''

    word.split('').each do |ch|
      if current_node.count == 1
        return prefix
      else
        current_node = current_node.children[ch]
        prefix << ch
      end
    end

    prefix
  end
end

def shortest_unique_prefix(words)
  trie = Trie.new
  words.each do |word|
    trie.insert(word)
  end

  puts trie.inspect

  uniq_prefixes = []

  words.each do |word|
    puts trie.uniq_prefix(word)
  end

  uniq_prefixes
end


puts shortest_unique_prefix(['joma', 'john', 'jack', 'techlead'])
# ['jom', 'joh', 'ja', 't']

