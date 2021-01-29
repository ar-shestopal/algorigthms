class Edge
  attr_accessor :v, :w, :weight

  def initialize(v, w, weight)
    @v = v
    @w = w
    @weight = weight
  end

  def either
    v
  end

  def other(vertex)
    return v if vertex == w

    return w if vertex == v
  end
end

class EdgeWeightedGraph
  attr_accessor :v_size, :e_size, :adj

  def initialize(v_size)
    @v_size = v_size
    @e_size = 0
    @adj = {}

    v_size.times { |i| adj[i] = [] }
  end

  def add_edge(edge)
    edge_v = edge.either
    edge_w = edge.other(edge_v)

    adj[edge_v] << edge
    adj[edge_w] << edge
    self.e_size += 1
  end
end

class Builder
  def self.run(v_size, arr)
    graph = EdgeWeightedGraph.new(v_size)

    arr.each do |(v, w, weight)|
      edge = Edge.new(v, w, weight)
      graph.add_edge(edge)
    end
  end
end
