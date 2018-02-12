
# Give a linear algorithm to compute the chromatic number of graphs where each
# vertex has degree at most 2. Must such graphs be bipartite?

# degree = number of edges a node touches.

# The chromatic number of a graph is the smallest number of colors needed
# to color the vertices of so that no two adjacent vertices share the same
# color (Skiena 1990, p. 210), i.e., the smallest value of possible to obtain
# a k-coloring.
def compute_coloring(graph)
  @graph = graph
  @graph.all_colors = [WHITE, BLACK, BROWN, GREEN, MANY MORE]
  @graph.active_colors = []
  @graph.colors = Array.new(@graph.num_vertices, UNCOLORED)
  @graph.bipartite = TRUE
  initialize_search(@graph)

  1.upto(@graph.num_vertices).times do |i|
    if (@graph.discovered[i] == FALSE)
      @graph.colors[i] = WHITE
      bfs(@graph,i)
    end
  end

  return @graph.colors.length
end

# # overwrites a method in initialize search
def process_edge(x, y)
  if (@graph.colors[x] == @graph.colors[y[)
    bipartite = false:
    color = @graph.all_colors.pop;
  else
    color = complement(@graph.all_colors[x])
  end

  color[y] = color;
end

def activate_color
  color = @graph.colors.pop
  @graph.active_colors << color
  return color
end

def complement(color)
  if color_in_active = @graph.active_colors.find(color)
    complement_i = color_in_active.index + 1
    complement = @graph.active_colors[complement_i]
    if !complement
      if @graph.active_colors.length == 2
        return complement = @graph.active_colors[complement_i - 1]
      elsif !colors.empty?
        return complement = activate_color
      else
        return complement = UNCOLORED
      end
    end
  else unless colors.empty?
    return complement = activate_color
  else
    return complement = UNCOLORED
  end
end
