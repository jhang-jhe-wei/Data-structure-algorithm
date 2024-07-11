# frozen_string_literal: true

class Heap
  class Node
    attr_accessor :parent, :children, :value

    def initialize(value)
      @value = value
      @parent = nil
      @children = []
    end
  end

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
      node = parent_node
      parent_node = parent_node.parent
    end
  end

  def pop
    return nil if root.nil?

    min = root.value
    last_node = find_last_node
    last_node.parent.children.pop
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
    root&.value
  end

  def empty?
    root.nil?
  end

  private

  def find_last_node
    return root if root.children.empty?

    right = 1
    node = root.children[right]
    node = node.children[right] until node.children[right].nil?
    node
  end

  def find_insertable_node
    return root if root.children.count < 2

    # bfs
    queue = [*root.children]
    until queue.empty?
      node = queue.shift
      return node if node.children.count < 2

      queue.concat(node.children)
    end
  end
end
