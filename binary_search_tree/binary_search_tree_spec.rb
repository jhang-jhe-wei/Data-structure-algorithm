# frozen_string_literal: true
require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree do
  before(:each) do
    @bst = BinarySearchTree.new
  end

  describe '#insert' do
    it 'inserts multiple values into the binary search tree' do
      [5, 3, 7, 1, 4, 6, 8].each do |i|
        @bst.insert(i)
        expect(@bst.find(i)).to be_truthy
      end
    end
  end

  describe '#find' do
    it 'finds a value in the binary search tree' do
      [5, 3, 7, 1, 4, 6, 8].each do |i|
        @bst.insert(i)
        expect(@bst.find(i)).to be_truthy
      end
      expect(@bst.find(10)).to be_falsey
    end

    it 'returns false when searching an empty tree' do
      expect(@bst.find(10)).to be_falsey
    end
  end

  describe '#delete' do
    it 'deletes a value from the binary search tree' do
      [5, 3, 7, 1, 4, 6, 8, 9].each { |i| @bst.insert(i) }
      @bst.delete(8)
      expect(@bst.find(8)).to be_falsey
      [3, 7, 1, 4, 6, 9].each { |i| expect(@bst.find(i)).to be_truthy }
    end

    it 'deletes a node with two children' do
      [5, 3, 7, 1, 4, 6, 8, 9].each { |i| @bst.insert(i) }
      @bst.delete(7)
      expect(@bst.find(7)).to be_falsey
      [3, 1, 4, 6, 8, 9].each { |i| expect(@bst.find(i)).to be_truthy }
    end

    it 'deletes the root node when it has one or two children' do
      [5, 3, 7].each { |i| @bst.insert(i) }
      @bst.delete(5)
      expect(@bst.find(5)).to be_falsey
      [3, 7].each { |i| expect(@bst.find(i)).to be_truthy }
    end

    it 'does nothing when trying to delete a value that does not exist' do
      [5, 3, 7, 1, 4, 6, 8, 9].each { |i| @bst.insert(i) }
      @bst.delete(10)
      [5, 3, 7, 1, 4, 6, 8, 9].each { |i| expect(@bst.find(i)).to be_truthy }
    end
  end

  describe '#inorder' do
    it 'returns an array of all elements in the tree, in order' do
      [5, 3, 7, 1, 4, 6, 8].each { |i| @bst.insert(i) }
      expect(@bst.inorder).to eq([1, 3, 4, 5, 6, 7, 8])
      @bst.insert(2)
      expect(@bst.inorder).to eq([1, 2, 3, 4, 5, 6, 7, 8])
    end

    it 'returns an empty array when called on an empty tree' do
      expect(@bst.inorder).to eq([])
    end
  end
end
