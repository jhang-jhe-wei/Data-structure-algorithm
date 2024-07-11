# frozen_string_literal: true

class BinarySearchTree
  class Node
    attr_accessor :right, :left, :value, :parent

    def initialize(value)
      @value = value
      @parent = nil
      @right = nil
      @left = nil
    end

    def to_s
      value
    end
  end

  attr_accessor :root

  def initialize
    @root = nil
  end

  def insert(value)
    new_node = Node.new(value)
    if root.nil?
      self.root = new_node
      return
    end

    node = root
    loop do
      if new_node.value < node.value
        if node.left.nil?
          new_node.parent = node
          node.left = new_node
          return
        else
          node = node.left
        end
      elsif node.right.nil?
        new_node.parent = node
        node.right = new_node
        return
      else
        node = node.right
      end
    end
  end

  def find(value)
    !!find_node_by_value(value)
  end

  def delete(value)
    node = find_node_by_value(value)
    parent_node = node.parent

    if node.right.nil? && node.left.nil? && node == root
      self.root = nil
      return
    end

    # node has no children
    if node.right.nil? && node.left.nil?
      parent_node.right == node ? parent_node.right = nil : parent_node.left = nil
      return
    end

    if !node.right.nil? || !node.left.nil?
      no_parent_node = node.right || node.left
      no_parent_node.parent = parent_node
      if parent_node.right == node
        parent_node.right = no_parent_node
      else
        parent_node.left = no_parent_node
      end
      return
    end

    # node has children
    # find the biggest node and replace with the node
    biggest_node = node.left
    biggest_node = biggest_node.right until biggest_node.right.nil?

    node.value = biggest_node.value
    biggest_node.parent.right = nil
  end

  def inorder
    ary = []
    stack = []
    node = root

    until node.nil?
      stack.push(node)
      node = node.left
    end

    until stack.empty?
      node = stack.pop
      ary.push(node.value)
      next if node.right.nil?

      node = node.right
      until node.nil?
        stack.push(node)
        node = node.left
      end
    end
    ary
  end

  private

  def find_node_by_value(value)
    node = root
    until node.nil?
      case value <=> node.value
      when -1 # smallar
        node = node.left
      when 0 # equal
        return node
      when 1 # bigger
        node = node.right
      end
    end
    nil
  end
end
