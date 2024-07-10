# frozen_string_literal: true

class BinarySearchTree
  def initialize; end
  def insert(_); end
  def find(_); end
  def delete(_); end
  def inorder; end
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
