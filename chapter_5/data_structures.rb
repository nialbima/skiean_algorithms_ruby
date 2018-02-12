module DataStructures
  module BinaryTrees
    class Tree
    end
  end

  module Graphing
    class Graph
      attr_accessor :edges, :degree, :directed, :num_vertices, :num_edges
      MAX_VERTICES  = 10000

      def self.read_graph(directed, num_edges, data)
        x, y = [0,0]

        # okay, so the C function is assuming that we get this from input.
        @graph = self.new(directed, data)
        puts "#{@graph.num_vertices} #{num_edges}"

        1.upto(num_edges).times do |i|
          puts "#{x} #{y}"
          @graph.insert_edge(x,y,directed)
        end

        return @graph
      end

      def initialize(directed = false, data)
        # okay, so the C function is assuming that we get this from input.
        @edges = Array.new(MAX_VERTICES + 1, nil)
        @degree = Array.new(MAX_VERTICES + 1, 0)

        @directed = directed
        @num_vertices = data.size
        @num_edges = 0
      end

      def initialize_search
        self.processed ||= Array.new(MAX_VERTICES+1, false)
        self.discovered ||= Array.new(MAX_VERTICES+1, false)
        self.parent ||= Array.new(MAX_VERTICES+1, -1)
      end

      def insert_edge(x, y, directed)
        self.edges[x] = EdgeNode.new(y = y, weight = nil, next = self.edges[x])
        self.degree[x] += 1

        return insert_edge(y, x, TRUE) if directed
        return self.num_edges += 1
      end

      def print
        1.upto(self.num_edges).do |i|
          print("#{i}: ",i);
          p = g.edges[i]
          while p do
            print(" #{p.y}")
            p = p.next
          end
          print("\n")
        end
      end

      def breadth_first_search(start)
        self.queue = []
        initialize_search
        self.queue << start
        self.discovered[start] = true

        while !self.queue.empty? do
          v = self.queue.pop
          process_vertex_early(v)
          processed[v] = true
          pointer = self.edges[v
          while (pointer) do
            y = pointer.y
            if (!processed[y] || self.directed)
              process_edge(v, y)
            end

            if !discovered[y]
              self.queue << y
              discovered[y] = true;
              parent[y] = v
            end

            pointer = pointer.next
          end

          process_vertex_late(v)
        end
      end

      def find_path(start, finish, parents = self.parent)
        if start == finish || finish == -1
          print "\n#{start}: "
        else
          find_path(start, parents[finish])
          print " #{finish}"
        end
      end

      def connected_components
        components_count = 0
        1.upto(self.num_vertices).times do |i|
          if !self.discovered[i]
            components_count += 1
            print("Component #{c}:")
            breadth_first_search(i)
            print("\n")
          end
        end
      end

      def process_vertex_early(vertex)
        return "processed vertex #{vertex}"
      end

      def process_vertex_late(vertex)
        return nil
      end

      def process_edge(vertex, y)
        return "processed edge #{vertex},#{y}"
      end
    end

    class TwoColorGraph < Graph
      def label_two_color
        self.colors = Array.new(self.num_vertices, 'UNCOLORED')
        self.bipartite = true
        1.upto(g.num_vertices).times do |i|
          if !discovered[i]
            self.colors[i] = 'WHITE';
            self.breadth_first_search(i)
          end
        end
      end

      def process_edge(int x, int y)
        if color[x] == color[y]
          self.bipartite = false;
          puts "Warning: not bipartite due to #{x} #{y}"
        end

        self.colors[y] = complement(x)
      end

      def complement(int)
        color = self.colors[int]
        return 'BLACK' if color == 'WHITE'
        return 'WHITE' if color == 'BLACK'
        'UNCOLORED'
      end
    end
  end
end
