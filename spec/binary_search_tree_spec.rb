# frozen_string_literal: true
require 'byebug'

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

class BinarySearchTree
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
      else
        if node.right.nil?
          new_node.parent = node
          node.right = new_node
          return
        else
          node = node.right
        end
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

    # node has children
    # find the biggest node and replace with the node
    biggest_node = node.left
    biggest_node = biggest_node.right until biggest_node.right.nil?

    node.value = biggest_node.value
    biggest_node.parent_node.right = nil
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

RSpec.describe BinarySearchTree do
  before(:each) do
    @bst = BinarySearchTree.new
  end

  describe '#insert' do
    it 'inserts a value into the binary search tree' do
      @bst.insert(5)
      expect(@bst.find(5)).to be_truthy
    end
  end

  describe '#find' do
    it 'finds a value in the binary search tree' do
      @bst.insert(5)
      expect(@bst.find(5)).to be_truthy
      expect(@bst.find(6)).to be_falsey
    end
  end

  describe '#delete' do
    it 'deletes a value from the binary search tree' do
      @bst.insert(5)
      @bst.delete(5)
      expect(@bst.find(5)).to be_falsey
    end
  end

  describe '#inorder' do
    it 'returns an array of all elements in the tree, in order' do
      [5, 3, 7, 1, 4, 6, 8].each { |i| @bst.insert(i) }
      expect(@bst.inorder).to eq([1, 3, 4, 5, 6, 7, 8])
    end
  end
end
