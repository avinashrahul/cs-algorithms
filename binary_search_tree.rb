# BST - Worst case
# Access, search, insertion, deletion - O(n)

# Best case
# Access, search, insertion, deletion - O(log n)

require 'pry'
class Node
  attr_accessor :data, :left, :right

  def initialize(data = nil)
    @data  = data
    @left  = nil
    @right = nil
  end

  def insert(node)
    if data.nil?
      self.data = node.data
      return  self
    end

    if node.data < data
      self.left = Node.new if left.nil?
      self.left.insert(node)
    elsif node.data > data
      self.right = Node.new if right.nil?
      self.right.insert(node)
    end
  end

  def search(node_data)
    return nil if data.nil?
    if node_data == data
      return self
    elsif node_data < data
      left.search(node_data)
    elsif node_data > data
      right.search(node_data)
    end
  end

  def destroy(node_data)
    if node = search(node_data)
      destroy_node(node)
    end
  end

  def children
    [@left, @right].compact
  end

  protected

  def destroy_node(node)
    destroy_node(node.left) unless node.left.nil?
    destroy_node(node.right) unless node.right.nil?

    node.data = node.left = node.right = nil
  end
end

tree = Node.new
tree.insert(Node.new(5))
tree.insert(Node.new(10))
tree.insert(Node.new(4))
tree.insert(Node.new(2))
tree.insert(Node.new(12))
# puts tree.search(12).inspect
# puts tree.destroy(4).inspect
# puts tree.search(5).inspect

puts "Breadth first search"
def bfs(node)
  queue = []
  queue.push(node)

  while(queue.size != 0)
    n1 = queue.shift
    puts n1.data
    n1.children.each do |child|
      queue.push(child)
    end
  end
end

bfs(tree)

puts "$$$$$$$$$$$$$$$$"

puts "Depth first search"
def dfs(node)
  puts node.data
  node.children.each do |child|
    dfs(child)
  end
end

dfs(tree)

puts tree.inspect



  # def to_a(mode = :preorder)
  #   return nil if data.nil?

  #   method_name = 'to_a_' + (MODES.include?(mode) ? mode : :preorder).to_s
  #   send(method_name)
  # end


  # $$$$$ - Inside protected

  # Pre-order displays root node, left node and then right node
  # def to_a_preorder
  #   tree = []
  #   tree << data
  #   tree << left.to_a_preorder unless left.nil?
  #   tree << right.to_a_preorder unless right.nil?

  #   tree
  # end

  # In-order displays left node, root node and then right node
  # def to_a_inorder
  #   tree = []
  #   tree << left.to_a_inorder unless left.nil?
  #   tree << data
  #   tree << right.to_a_inorder unless right.nil?

  #   tree
  # end
  #
  # Post-order displays left node, root node and then right node
  # def to_a_postorder
  #   tree = []
  #   tree << left.to_a_postorder unless left.nil?
  #   tree << right.to_a_postorder unless right.nil?
  #   tree << data

  #   tree
  # end
