# I rewrote the BST class in Ruby.
# It's a pretty raw implementation, I'm not sure it's as efficient as it could be.
# I'm also not sure if there's cruft in Ruby's standard object that might impact
# its performance. I'm sure there is.
class Node
  attr_accessible :left, :right, :parent, :data

  def initialize(links, data)
    @parent_node, @left_node, @right_node = links
    @data = data
  end

  def find_minimum_node
    descend_tree(self, :left)
  end

  def find_maximum_node
    descend_tree(self, :right)
  end

  def descend_tree(node, direction)
    return nil if !node

    while node.send(direction) do
      node = node.send(direction)
    end

    return node
  end
end

class BinaryTree
  # this is for building a balanced binary tree.
  # it doesn't sort anything yet, so it won't work and doesn't do much.

  def initialize(root_node)
    @root = node
  end

  #   traverse_tree(node) { |n| n.label }

  def traverse_tree(node = @root, &block)
    if node
      traverse_tree(node.left, &block)
      yield node
      traverse_tree(node.right, &block)
    end
  end

  def min(subtree_root = @root)
    subtree_root.find_minimum_node
  end

  def max(subtree_root = @root)
    subtree_root.find_maximum_node
  end

end
