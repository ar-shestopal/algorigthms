# @param {Character[][]} board
# @param {String} word
# @return {Boolean}
def exist(board, word)
  @word = word
  @sword = []
  @board = board

end

def backtrack(i, j)
  return true if @sword.size == @word.size

  (0...@board.size-1).each do |h|
    (0...@board.size-1).each do |v|
      @sword <<
    end
  end
end

