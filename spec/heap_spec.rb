# frozen_string_literal: true

class Node
  attr_accessor :parent, :children, :value

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
end

class Heap
  attr_accessor :root

  def initialize
    @root = nil
  end

  def push(value)
    new_node = Node.new(value)
    if root.nil?
      self.root = new_node
      return
    end

    # insert
    insertable_node = find_insertable_node
    new_node.parent = insertable_node
    insertable_node.children.push(new_node)

    # check
    node = new_node
    parent_node = node.parent
    while node && parent_node && (node.value < parent_node.value)
      node.value, parent_node.value = parent_node.value, node.value
      node, parent_node = parent_node, parent_node.parent
    end
  end

  def pop
    return nil if root.nil?

    min = root.value
    last_node = find_last_node
    last_node.parent.children.unshift # because #push makes the first value in the end of array
    root.value = last_node.value

    node = root
    smallar_child = node.children.reverse.find { |child| node.value > child.value }
    until smallar_child.nil?
      smallar_child.value, node.value = node.value, smallar_child.value
      node = smallar_child
      smallar_child = node.children.reverse.find { |child| node.value > child.value }
    end
    min
  end

  def peek
    root.value
  end

  def empty?
    root.nil?
  end

  private

  def find_last_node
    return root if root.children.empty?

    node = root.children[0]
    node = node.children[0] until node.children.empty?
    node
  end

  def find_insertable_node
    return root if root.children.count < 2

    queue = [*root.children.reverse]
    until queue.empty?
      node = queue.shift
      return node if node.children.count < 2

      queue.concat(node.children.reverse)
    end
  end
end

RSpec.describe Heap do
  let(:heap) { Heap.new }

  describe '#push' do
    it 'adds elements to the heap and maintains the heap property' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
    end
  end

  describe '#pop' do
    it 'removes and returns the smallest element from the heap' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.pop).to eq(1)
      expect(heap.peek).to eq(3)
    end
  end

  describe '#peek' do
    it 'returns the smallest element from the heap without removing it' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.peek).to eq(1)
      heap.push(0)
      expect(heap.peek).to eq(0)
    end
  end

  describe '#empty?' do
    it 'returns true if the heap is empty' do
      expect(heap.empty?).to be true
    end

    it 'returns false if the heap is not empty' do
      [5, 3, 7, 1, 6, 9].each { |num| heap.push(num) }
      expect(heap.empty?).to be false
    end
  end
end
