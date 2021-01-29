class Node
  attr_accessor :is_word, :children

  def initialize(is_word=false, children={})
    @is_word = is_word
    @children = children
  end
end

class System
  def initialize
    @tree
  end

  def build(words)
    root = Node.new(false, {})
    # construct tree
    words.each do |word|
      current = root
      word.split('').each do |char|
        unless current.children.key?(char)
          current.children[char] = Node.new(false, {})
        end
        current = current.children[char]
      end
      current.is_word = true
    end

    @tree = root
  end

  def autocomplete(word)
    current = @tree
    word.split('').each do |char|
      return [] unless current.children.key?(char)

      current = current.children[char]
    end

    suggestions = []
    dfs(current, word, suggestions)
    suggestions
  end

  def dfs(node, prefix, suggestions)
    if node.is_word
      suggestions << prefix
    end

    node.children.each do |char, val|
      dfs(node.children[char], prefix + char, suggestions)
    end
  end
end

sys = System.new
sys.build(%w[dog dark cat door dodge])
p sys.autocomplete('do').inspect
# ['dog', 'door', 'dodge']