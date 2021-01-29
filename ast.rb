class Expr
  attr_accessor :s, :left, :right, :index, :stack

  def initilaize(s, index, stack)
    @index = index
    @s = s
    @left = nil
    @right = nil
    @op = nil
  end

  def form_stack
  end

end

